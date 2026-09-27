//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Hair)_SF_Clip" {
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

_alphaClipPower ("Alpha强度(Alpha Clip)", Range(0.001, 3)) = 1.0

_alphaBlendPower ("Alpha强度(Alpha Blend)", Range(0.001, 3)) = 1.0

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_anisotropicMap ("异性扰动贴图", 2D) = "white" { }

[Toggle] _anisoUse2U ("异性使用2U", Float) = 0.0

_sunShift ("各向异性扭曲", Float) = 1.0

_sunShiftOffset ("各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("各项异性强度", Range(0, 1)) = 1.0

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_UseShadowMask ("启用补光遮罩", Float) = 0.0

_UseRenderInfo01Mask ("启用RenderInfo补光1遮罩", Float) = 0.0

_UseRenderInfo02Mask ("启用RenderInfo补光2遮罩", Float) = 0.0

_UseAO2U ("AO使用2U", Float) = 0.0

_darkMask ("AO暗部表现贴图", 2D) = "white" { }

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

[Tex] _shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_ShadeDetailTex ("暗部细节贴图", 2D) = "white" { }

_ShadeDetailMask ("暗部细节遮罩(R:绘制; G:擦除;)", 2D) = "black" { }

_DetailRange ("细节范围", Float) = 0.0

_ShadeRange ("暗部范围", Float) = 0.0

_ShadeDetail ("暗部细节显隐", Range(0, 1)) = 1.0

_UseAdjustColor ("启用调色", Float) = 0.0

_PostExposure ("亮度", Float) = 0.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_Saturation ("饱和度", Range(0, 3)) = 1.0

_SansheSaturation ("光源饱和度", Range(0, 3)) = 1.0

_HueShift ("色相", Range(0, 1)) = 0.0

_ExposureCompensate ("亮度补偿", Range(-5, 5)) = 0.0

_UseSansheMask ("启用补光遮罩", Float) = 0.0

_SansheMask ("补光遮罩贴图(R:补光1;G:补光2;B:平行光)", 2D) = "white" { }

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0.001, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_color ("补光2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("补光2范围", Range(0.001, 10)) = 1.0

_Sanshe2_Power ("补光2强度", Float) = 0.0

_Sanshe2_X ("补光2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("补光2Y轴偏移", Range(-1, 1)) = 0.0

_UseDirectionalMask ("启用平行光遮罩", Float) = 0.0

_DirectionalColor ("平行光颜色", Color) = (1,1,1,1)

_DirectionalIntensity ("平行光强度", Float) = 0.0

_DirectionalDir ("平行光方向", Vector) = (1,1,1,1)

_HairCardCompensation ("开启暗部补偿", Float) = 0.0

_MainLightCompensateStart ("主光补偿起始", Range(0, 1)) = 0.75

_MainLightCompensateStrength ("主光补偿强度", Range(0, 1)) = 0.15000000596046448

_MainLightCompensatePow ("主光补偿速率", Range(1, 4)) = 2.0

_AdditionalLightCompensateStart ("辅光补偿起始", Range(0, 1)) = 0.75

_AdditionalLightCompensateStrength ("辅光补偿强度", Range(0, 1)) = 1.0

_AdditionalLightCompensatePow ("辅光补偿速率", Range(1, 4)) = 2.0

_HairCustomPointLight ("开启自定义点光源", Float) = 0.0

_HairCustomAdditionalLightColor ("自定义光源颜色", Color) = (0,0,0,0)

_HairCustomAdditionalLightPosition ("自定义光源位置", Vector) = (0,0,0,0)

_HairCustomAdditionalLightRange ("光源范围", Float) = 1.0

_HairCustomAdditionalLightIntensity ("光源强度", Float) = 1.0

}
SubShader {
 Pass {
 Name "PBR (PrePass AlphaClip SF)"
  Tags { "LIGHTMODE" = "FORWARDBASE" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 33356
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
bvec3 u_xlatb19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat29;
mediump vec2 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_34;
mediump vec3 u_xlat16_35;
float u_xlat40;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
mediump vec3 u_xlat16_51;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat83;
mediump float u_xlat16_83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
float u_xlat93;
mediump float u_xlat16_93;
bool u_xlatb93;
float u_xlat94;
float u_xlat95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_28 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_28 = (-u_xlat16_28) * u_xlat16_28 + 1.0;
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_55 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_28 * u_xlat16_55;
    u_xlat16_28 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_28));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_28);
#endif
    u_xlat16_4.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_1.x, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_4.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy + u_xlat16_4.xzw;
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_3.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_31.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_31.x, u_xlat16_4.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_4.x;
    u_xlat16_4.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_84 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_84 = log2(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _alphaClipPower;
    u_xlat16_30.z = exp2(u_xlat16_84);
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_6.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_54.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat54.xy = (-u_xlat16_54.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).zxy;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat2.xyz);
    u_xlat83 = (-_ShadeRange) + _DetailRange;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat90 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat90 = max(u_xlat90, 1.17549435e-38);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat11.xyz = vec3(u_xlat90) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat13.x = u_xlat11.x;
    u_xlat13.y = u_xlat12.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat13.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat90 = max(u_xlat90, 1.17549435e-38);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat12.xyz = vec3(u_xlat90) * u_xlat9.xyz;
    u_xlat92 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat93 = u_xlat92 + (-_ShadeRange);
    u_xlat13.x = min(u_xlat92, 1.0);
    u_xlat83 = u_xlat83 * u_xlat93;
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat83 * -2.0 + 3.0;
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat83 * u_xlat92;
    u_xlat16_85 = min(u_xlat54.x, u_xlat83);
    u_xlat16_85 = u_xlat16_85 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_85) * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat54.yyy * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_85 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_85) * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_7.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat2.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + u_xlat16_3.xyz;
    u_xlat83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat2.xyz = vec3(u_xlat83) * u_xlat2.xyz;
    u_xlat16_86 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat83 * u_xlat83;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat92 = (-u_xlat16_86) * u_xlat83 + 1.0;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat14.xyz = u_xlat16_6.xyz * vec3(u_xlat92);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_86) + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb83 = !!(0.5<_anisoUse2U);
#else
    u_xlatb83 = 0.5<_anisoUse2U;
#endif
    u_xlat15.xy = (bool(u_xlatb83)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat15.xy = u_xlat15.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_83 = texture(_anisotropicMap, u_xlat15.xy).x;
    u_xlat83 = u_xlat16_83 * 2.0 + -1.0;
    u_xlat83 = u_xlat83 * _sunShift + _sunShiftOffset;
    u_xlat83 = u_xlat83 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
    u_xlat93 = dot(u_xlat11.zxy, u_xlat12.xyz);
    u_xlat11.xyz = (-u_xlat12.yzx) * vec3(u_xlat93) + u_xlat11.xyz;
    u_xlat93 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat93);
    u_xlat15.xyz = u_xlat11.yzx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat12.zxy * u_xlat11.zxy + (-u_xlat15.xyz);
    u_xlat15.xyz = vec3(u_xlat92) * u_xlat15.xyz;
    u_xlat16.xyz = vec3(u_xlat83) * u_xlat12.xyz + u_xlat15.zxy;
    u_xlat92 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat16.xyz = vec3(u_xlat92) * u_xlat16.xyz;
    u_xlat92 = dot(u_xlat16.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb93 = !!(_UseAO2U>=0.5);
#else
    u_xlatb93 = _UseAO2U>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb93)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_8.xy = (bool(u_xlatb93)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_34.xy = u_xlat16_34.xy + u_xlat16_8.xy;
    u_xlat16_93 = texture(_materialParamsMap, u_xlat16_34.xy).z;
    u_xlat16_86 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_93));
    u_xlat16_87 = u_xlat16_86 + -1.0;
    u_xlat94 = (-u_xlat16_87) + 1.0;
    u_xlat16_34.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat94 = u_xlat94 * u_xlat16_34.x;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat17.z = u_xlat92 * u_xlat94;
    u_xlat16_61.x = dot(u_xlat11.zxy, u_xlat16_3.xyz);
    u_xlat17.x = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat16_86 * u_xlat16_34.x;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat17.y = u_xlat16_61.x * u_xlat92;
    u_xlat95 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat17.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16_3.xyz = u_xlat27.xyz * vec3(u_xlat16_85);
    u_xlat96 = dot(u_xlat16.xyz, u_xlat16_3.xyz);
    u_xlat18.z = u_xlat94 * u_xlat96;
    u_xlat96 = dot(u_xlat11.zxy, u_xlat16_3.xyz);
    u_xlat18.y = u_xlat92 * u_xlat96;
    u_xlat18.x = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat96 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat97 = u_xlat96 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat95 = u_xlat97 * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat44.x = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat19.y = u_xlat92 * u_xlat44.x;
    u_xlat16_86 = dot(u_xlat11.zxy, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat16_86 * u_xlat94;
    u_xlat29.x = u_xlat94 * u_xlat92;
    u_xlat19.z = u_xlat2.x * u_xlat29.x;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat56 = u_xlat29.x * 0.318309873;
    u_xlat2.x = u_xlat56 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat95 * u_xlat2.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat17.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat16_44.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb19.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : float(1.0);
    u_xlat16_61.xy = (u_xlatb19.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat44.xy = u_xlat16_44.xy * u_xlat16_1.xz + u_xlat16_1.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xy = min(max(u_xlat44.xy, 0.0), 1.0);
#else
    u_xlat44.xy = clamp(u_xlat44.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * u_xlat44.xxx;
    u_xlat19.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat2.x * u_xlat92;
    u_xlat16_86 = dot(u_xlat11.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat16_86 * u_xlat94;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat95 = (-u_xlat16_86) + 1.0;
    u_xlat20.z = u_xlat2.x * u_xlat29.x;
    u_xlat2.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat56 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat98 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat94 * u_xlat98;
    u_xlat16_86 = dot(u_xlat11.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat16_86 * u_xlat92;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat13.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat97 * u_xlat40 + 6.10351563e-05;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat2.x = u_xlat2.x * u_xlat40;
    u_xlat16_86 = u_xlat95 * u_xlat95;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat40 = (-u_xlat16_86) * u_xlat95 + 1.0;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat19.xyz = u_xlat16_6.xyz * vec3(u_xlat40);
    u_xlat19.xyz = u_xlat0.xxx * vec3(u_xlat16_86) + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.zxy;
    u_xlat19.xyz = u_xlat13.xxx * u_xlat19.xyz;
    u_xlat16_8.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_86);
    u_xlat16_10.xyz = vec3(u_xlat16_89) * u_xlat14.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat14.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + u_xlat16_10.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat14.xyz);
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16_10.xyz);
    u_xlat16.z = u_xlat2.x * u_xlat94;
    u_xlat19.y = u_xlat81 * u_xlat92;
    u_xlat16_89 = dot(u_xlat11.zxy, u_xlat14.xyz);
    u_xlat19.x = u_xlat16_89 * u_xlat94;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_89) + 1.0;
    u_xlat19.z = u_xlat81 * u_xlat29.x;
    u_xlat81 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat29.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat56 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_89 = dot(u_xlat11.zxy, u_xlat16_10.xyz);
    u_xlat16.y = u_xlat16_89 * u_xlat92;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat29.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat16.x;
    u_xlat29.x = u_xlat29.x + 6.10351563e-05;
    u_xlat29.x = u_xlat97 * u_xlat29.x + 6.10351563e-05;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat81 = u_xlat81 * u_xlat29.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat29.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat29.xxx;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_10.xxx + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_10.x = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_86 = float(1.0) / float(u_xlat16_86);
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_86 = u_xlat16_86 * u_xlat16_10.x;
    u_xlat16_86 = max(u_xlat16_21.x, u_xlat16_86);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_10.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_10.x);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_89;
    u_xlat16_10.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat44.yyy + u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat44.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_86 = u_xlat17.x + (-_AdditionalLightCompensateStart);
    u_xlat16_86 = (-u_xlat16_86);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat13.xxx + u_xlat16_21.xyz;
    u_xlat16_89 = u_xlat13.x + (-_MainLightCompensateStart);
    u_xlat16_89 = (-u_xlat16_89);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat44.yyy * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat16.xxx + u_xlat16_21.xyz;
    u_xlat16_91 = u_xlat16.x + (-_AdditionalLightCompensateStart);
    u_xlat16_91 = (-u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_8.xyz + u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = (-u_xlat9.xyz) * vec3(u_xlat90) + vs_TEXCOORD4.xyz;
    u_xlat16_23.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_23.xyz + u_xlat12.xyz;
    u_xlat16_102 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_23.xyz = vec3(u_xlat16_102) * u_xlat16_23.xyz;
    u_xlat16_102 = dot(u_xlat16_23.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_104 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_51.z = _occlusionScale * u_xlat16_104 + 1.0;
    u_xlat16_102 = u_xlat16_51.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_51.z * u_xlat16_102;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_103;
    u_xlat0.x = min(u_xlat16_102, 1.0);
    u_xlat81 = min(u_xlat0.x, u_xlat16_93);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat81) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat81) * u_xlat16_25.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_25.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_23.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_23.xz);
    u_xlat16_25.y = u_xlat16_23.y;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_25.xyz = vec3(u_xlat16_103) * u_xlat16_26.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlati81 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati2.x = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_25.xyw;
    u_xlat16_26.xyz = u_xlat16_25.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_102 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_25.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_22.xyz + u_xlat16_21.xyz;
    u_xlat16_22.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat83) * u_xlat16_22.xyz + u_xlat15.xyz;
    u_xlat81 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb81 = u_xlat16_87>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb81)) ? u_xlat2.xyz : u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.zxy * u_xlat16_3.yzx + (-u_xlat11.xyz);
    u_xlat13.xyz = u_xlat2.xyz * u_xlat11.xyz;
    u_xlat2.xyz = u_xlat11.zxy * u_xlat2.yzx + (-u_xlat13.xyz);
    u_xlat2.xyz = (-u_xlat9.xyz) * vec3(u_xlat90) + u_xlat2.xyz;
    u_xlat16_22.x = u_xlat16_34.x * 8.0;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_34.x;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = abs(u_xlat16_87) * u_xlat16_22.x;
    u_xlat2.xyz = u_xlat16_22.xxx * u_xlat2.xyz + u_xlat12.xyz;
    u_xlat81 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
    u_xlat16_22.x = dot((-u_xlat16_3.xyz), u_xlat2.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_22.xxx + (-u_xlat16_3.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat90) + (-u_xlat2.xyz);
    u_xlat9.xyz = u_xlat16_34.xxx * u_xlat9.xyz + u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_87)) * u_xlat11.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat81 = dot(u_xlat16_23.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat16_23.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_51.y = u_xlat81 * 0.5;
    u_xlat16_22.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat16_22.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat22.y = u_xlat9.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat22.xyz, u_xlat16_3.x);
    u_xlat16_23.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat29.xyz = u_xlat16_23.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_23.xyz = u_xlat29.xyz * u_xlat29.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_102) * u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb81 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_23.xyz = (bool(u_xlatb81)) ? u_xlat16_25.xyz : u_xlat16_23.xyz;
    u_xlat18.y = u_xlat16_7.x;
    u_xlat16_51.x = u_xlat16_7.x * 1.09769487;
    u_xlat16_24.xyz = u_xlat16_51.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
    u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_29.xxx + u_xlat16_29.yyy;
    u_xlat16_6.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_1.yzw = u_xlat16_24.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_1.w);
    u_xlat16_30.x = u_xlat16_3.x + 1.0;
    u_xlat16_30.xz = min(u_xlat16_30.xz, vec2(15.0, 1.0));
    u_xlat16_1.x = u_xlat16_30.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_3.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_24.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_30.x = u_xlat16_81 + (-u_xlat16_29.x);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30.x + u_xlat16_29.x;
    u_xlat16_3.x = u_xlat16_103 * u_xlat16_3.x;
    u_xlat81 = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_30.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat81 * u_xlat16_30.x + u_xlat16_3.x;
    u_xlat16_30.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_87 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_87 + u_xlat16_30.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_93);
    u_xlat16_6.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
    u_xlat16_23.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz + u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.yzx * u_xlat16_23.yzx + u_xlat16_8.yzx;
    u_xlat16_3.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_30.z;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_21.xyz;
    u_xlat16_7.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_89 / u_xlat16_7.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _MainLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_87 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_87 = u_xlat16_87 / u_xlat16_7.y;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_7.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.yyy + u_xlat16_8.xyz;
    u_xlat16_8.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_86 / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_86 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_86 = u_xlat16_86 / u_xlat16_8.y;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_86;
    u_xlat16_35.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_35.xyz;
    u_xlat16_4.xyz = u_xlat44.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_7.yyy + u_xlat16_4.xyz;
    u_xlat16_30.x = u_xlat16_91 / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_86 * u_xlat16_30.x;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat44.yyy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.yyy + u_xlat16_6.xyz;
    u_xlat16_30.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_30.x = float(1.0) / u_xlat16_30.x;
    u_xlat16_6.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_87 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_87 = float(1.0) / float(u_xlat16_87);
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_35.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_35.xyz = u_xlat16_30.xxx * u_xlat16_35.xyz;
    u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_35.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_30.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_30.x = (-u_xlat16_30.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_86 * u_xlat16_30.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_5.xyz = u_xlat16_35.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.yyy + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xxx * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.yyy + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat12.xyz;
    u_xlat9.x = u_xlat27.x * u_xlat16_85 + _Sanshe_X;
    u_xlat9.y = u_xlat27.y * u_xlat16_85 + _Sanshe_Y;
    u_xlat9.z = u_xlat16_3.z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb81 = _UseSansheMask>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xy = u_xlat16_11.xy * u_xlat16_30.xx + u_xlat16_30.yy;
    u_xlat16_5.x = u_xlat16_11.z * u_xlat16_61.x + u_xlat16_61.y;
    u_xlat9.x = u_xlat27.x * u_xlat16_85 + _Sanshe2_X;
    u_xlat9.y = u_xlat27.y * u_xlat16_85 + _Sanshe2_Y;
    u_xlat27.x = dot(u_xlat2.xyz, u_xlat9.xyz);
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat27.x = max(u_xlat27.x, 0.00048828125);
    u_xlat27.x = log2(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _Sanshe2_Fw;
    u_xlat27.x = exp2(u_xlat27.x);
    u_xlat0.y = u_xlat27.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xy;
    u_xlat2.xyz = u_xlat0.yyy * _Sanshe2_color.zxy;
    u_xlat27.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = u_xlat0.xxx * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_30.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_30.x = inversesqrt(u_xlat16_30.x);
    u_xlat16_6.xyz = u_xlat16_30.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.zxy;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
    u_xlat16_5.xyz = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat16_32.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_4.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_54.x = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_5.xyz = u_xlat16_54.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * u_xlat16_54.xxx + _FogCol.zxy;
    u_xlat16_4.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat54.x = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat81 = u_xlat2.x * 15.0 + (-u_xlat54.x);
    u_xlat1.x = u_xlat54.x * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat9.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat9.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_2.xyz) + u_xlat16_9.xyz;
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat9.xyz + u_xlat16_2.xyz;
    u_xlat16_30.x = _PostExposure + _ExposureCompensate;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat9.xyz = u_xlat2.xyz * u_xlat16_30.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat9.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat9.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat54.x = dot(u_xlat9.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat9.xyz = (-u_xlat54.xxx) + u_xlat9.xyz;
    u_xlat81 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat81;
    u_xlat0.x = max(u_xlat0.x, u_xlat27.x);
    u_xlat16_30.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_30.x = u_xlat0.x * u_xlat16_30.x + _Saturation;
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat9.xyz + u_xlat54.xxx;
    u_xlat16_30.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb81 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_4.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_4.xx * u_xlat16_30.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_30.x = float(1.0);
    u_xlat16_30.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_4.xx * u_xlat16_30.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_5.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb27 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_30.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_57 = u_xlat16_30.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_30.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_30.x = min(u_xlat16_57, u_xlat16_4.y);
    u_xlat16_57 = u_xlat16_57 + (-u_xlat16_4.y);
    u_xlat16_30.x = (-u_xlat16_30.x) + u_xlat16_4.x;
    u_xlat16_31.x = u_xlat16_30.x * 6.0 + 9.99999975e-05;
    u_xlat16_57 = u_xlat16_57 / u_xlat16_31.x;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_4.z;
    u_xlat16_57 = abs(u_xlat16_57) + _HueShift;
    u_xlat16_31.xyz = vec3(u_xlat16_57) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_31.xyz = fract(u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_31.xyz = abs(u_xlat16_31.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_31.xyz = u_xlat16_31.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_57 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_57;
    u_xlat16_31.xyz = u_xlat16_30.xxx * u_xlat16_31.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_31.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_30.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_30.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_30.z;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
bvec3 u_xlatb19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat29;
mediump vec2 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_34;
mediump vec3 u_xlat16_35;
float u_xlat40;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
mediump vec3 u_xlat16_51;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat83;
mediump float u_xlat16_83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
float u_xlat93;
mediump float u_xlat16_93;
bool u_xlatb93;
float u_xlat94;
float u_xlat95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_28 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_28 = (-u_xlat16_28) * u_xlat16_28 + 1.0;
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_55 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_28 * u_xlat16_55;
    u_xlat16_28 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_28));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_28);
#endif
    u_xlat16_4.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_1.x, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_4.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy + u_xlat16_4.xzw;
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_3.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_31.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_31.x, u_xlat16_4.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_4.x;
    u_xlat16_4.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_84 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_84 = log2(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _alphaClipPower;
    u_xlat16_30.z = exp2(u_xlat16_84);
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_6.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_54.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat54.xy = (-u_xlat16_54.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).zxy;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat2.xyz);
    u_xlat83 = (-_ShadeRange) + _DetailRange;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat90 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat90 = max(u_xlat90, 1.17549435e-38);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat11.xyz = vec3(u_xlat90) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat13.x = u_xlat11.x;
    u_xlat13.y = u_xlat12.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat13.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat90 = max(u_xlat90, 1.17549435e-38);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat12.xyz = vec3(u_xlat90) * u_xlat9.xyz;
    u_xlat92 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat93 = u_xlat92 + (-_ShadeRange);
    u_xlat13.x = min(u_xlat92, 1.0);
    u_xlat83 = u_xlat83 * u_xlat93;
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat83 * -2.0 + 3.0;
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat83 * u_xlat92;
    u_xlat16_85 = min(u_xlat54.x, u_xlat83);
    u_xlat16_85 = u_xlat16_85 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_85) * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat54.yyy * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_85 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_85) * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_7.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat2.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + u_xlat16_3.xyz;
    u_xlat83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat2.xyz = vec3(u_xlat83) * u_xlat2.xyz;
    u_xlat16_86 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat83 * u_xlat83;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat92 = (-u_xlat16_86) * u_xlat83 + 1.0;
    u_xlat16_86 = u_xlat83 * u_xlat16_86;
    u_xlat14.xyz = u_xlat16_6.xyz * vec3(u_xlat92);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_86) + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb83 = !!(0.5<_anisoUse2U);
#else
    u_xlatb83 = 0.5<_anisoUse2U;
#endif
    u_xlat15.xy = (bool(u_xlatb83)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat15.xy = u_xlat15.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_83 = texture(_anisotropicMap, u_xlat15.xy).x;
    u_xlat83 = u_xlat16_83 * 2.0 + -1.0;
    u_xlat83 = u_xlat83 * _sunShift + _sunShiftOffset;
    u_xlat83 = u_xlat83 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
    u_xlat93 = dot(u_xlat11.zxy, u_xlat12.xyz);
    u_xlat11.xyz = (-u_xlat12.yzx) * vec3(u_xlat93) + u_xlat11.xyz;
    u_xlat93 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat93);
    u_xlat15.xyz = u_xlat11.yzx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat12.zxy * u_xlat11.zxy + (-u_xlat15.xyz);
    u_xlat15.xyz = vec3(u_xlat92) * u_xlat15.xyz;
    u_xlat16.xyz = vec3(u_xlat83) * u_xlat12.xyz + u_xlat15.zxy;
    u_xlat92 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat16.xyz = vec3(u_xlat92) * u_xlat16.xyz;
    u_xlat92 = dot(u_xlat16.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb93 = !!(_UseAO2U>=0.5);
#else
    u_xlatb93 = _UseAO2U>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb93)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_8.xy = (bool(u_xlatb93)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_34.xy = u_xlat16_34.xy + u_xlat16_8.xy;
    u_xlat16_93 = texture(_materialParamsMap, u_xlat16_34.xy).z;
    u_xlat16_86 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_93));
    u_xlat16_87 = u_xlat16_86 + -1.0;
    u_xlat94 = (-u_xlat16_87) + 1.0;
    u_xlat16_34.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat94 = u_xlat94 * u_xlat16_34.x;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat17.z = u_xlat92 * u_xlat94;
    u_xlat16_61.x = dot(u_xlat11.zxy, u_xlat16_3.xyz);
    u_xlat17.x = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat16_86 * u_xlat16_34.x;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat17.y = u_xlat16_61.x * u_xlat92;
    u_xlat95 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat17.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16_3.xyz = u_xlat27.xyz * vec3(u_xlat16_85);
    u_xlat96 = dot(u_xlat16.xyz, u_xlat16_3.xyz);
    u_xlat18.z = u_xlat94 * u_xlat96;
    u_xlat96 = dot(u_xlat11.zxy, u_xlat16_3.xyz);
    u_xlat18.y = u_xlat92 * u_xlat96;
    u_xlat18.x = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat96 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat97 = u_xlat96 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat95 = u_xlat97 * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat44.x = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat19.y = u_xlat92 * u_xlat44.x;
    u_xlat16_86 = dot(u_xlat11.zxy, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat16_86 * u_xlat94;
    u_xlat29.x = u_xlat94 * u_xlat92;
    u_xlat19.z = u_xlat2.x * u_xlat29.x;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat56 = u_xlat29.x * 0.318309873;
    u_xlat2.x = u_xlat56 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat95 * u_xlat2.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat17.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat16_44.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb19.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : float(1.0);
    u_xlat16_61.xy = (u_xlatb19.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat44.xy = u_xlat16_44.xy * u_xlat16_1.xz + u_xlat16_1.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xy = min(max(u_xlat44.xy, 0.0), 1.0);
#else
    u_xlat44.xy = clamp(u_xlat44.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * u_xlat44.xxx;
    u_xlat19.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat2.x * u_xlat92;
    u_xlat16_86 = dot(u_xlat11.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat16_86 * u_xlat94;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat95 = (-u_xlat16_86) + 1.0;
    u_xlat20.z = u_xlat2.x * u_xlat29.x;
    u_xlat2.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat56 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat98 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat94 * u_xlat98;
    u_xlat16_86 = dot(u_xlat11.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat16_86 * u_xlat92;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat13.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat97 * u_xlat40 + 6.10351563e-05;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat2.x = u_xlat2.x * u_xlat40;
    u_xlat16_86 = u_xlat95 * u_xlat95;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat40 = (-u_xlat16_86) * u_xlat95 + 1.0;
    u_xlat16_86 = u_xlat95 * u_xlat16_86;
    u_xlat19.xyz = u_xlat16_6.xyz * vec3(u_xlat40);
    u_xlat19.xyz = u_xlat0.xxx * vec3(u_xlat16_86) + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.zxy;
    u_xlat19.xyz = u_xlat13.xxx * u_xlat19.xyz;
    u_xlat16_8.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_86);
    u_xlat16_10.xyz = vec3(u_xlat16_89) * u_xlat14.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat14.xyz = u_xlat27.xyz * vec3(u_xlat16_85) + u_xlat16_10.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat14.xyz);
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16_10.xyz);
    u_xlat16.z = u_xlat2.x * u_xlat94;
    u_xlat19.y = u_xlat81 * u_xlat92;
    u_xlat16_89 = dot(u_xlat11.zxy, u_xlat14.xyz);
    u_xlat19.x = u_xlat16_89 * u_xlat94;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_89) + 1.0;
    u_xlat19.z = u_xlat81 * u_xlat29.x;
    u_xlat81 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat29.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat56 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_89 = dot(u_xlat11.zxy, u_xlat16_10.xyz);
    u_xlat16.y = u_xlat16_89 * u_xlat92;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat29.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat16.x;
    u_xlat29.x = u_xlat29.x + 6.10351563e-05;
    u_xlat29.x = u_xlat97 * u_xlat29.x + 6.10351563e-05;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat81 = u_xlat81 * u_xlat29.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat29.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat29.xxx;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_10.xxx + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_10.x = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_86 = float(1.0) / float(u_xlat16_86);
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_86 = u_xlat16_86 * u_xlat16_10.x;
    u_xlat16_86 = max(u_xlat16_21.x, u_xlat16_86);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_10.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_10.x);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_89;
    u_xlat16_10.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat44.yyy + u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat44.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_86 = u_xlat17.x + (-_AdditionalLightCompensateStart);
    u_xlat16_86 = (-u_xlat16_86);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat13.xxx + u_xlat16_21.xyz;
    u_xlat16_89 = u_xlat13.x + (-_MainLightCompensateStart);
    u_xlat16_89 = (-u_xlat16_89);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat44.yyy * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat16.xxx + u_xlat16_21.xyz;
    u_xlat16_91 = u_xlat16.x + (-_AdditionalLightCompensateStart);
    u_xlat16_91 = (-u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_8.xyz + u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = (-u_xlat9.xyz) * vec3(u_xlat90) + vs_TEXCOORD4.xyz;
    u_xlat16_23.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_23.xyz + u_xlat12.xyz;
    u_xlat16_102 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_23.xyz = vec3(u_xlat16_102) * u_xlat16_23.xyz;
    u_xlat16_102 = dot(u_xlat16_23.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_104 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_51.z = _occlusionScale * u_xlat16_104 + 1.0;
    u_xlat16_102 = u_xlat16_51.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_51.z * u_xlat16_102;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_103;
    u_xlat0.x = min(u_xlat16_102, 1.0);
    u_xlat81 = min(u_xlat0.x, u_xlat16_93);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat81) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat81) * u_xlat16_25.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_25.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_23.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_23.xz);
    u_xlat16_25.y = u_xlat16_23.y;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_25.xyz = vec3(u_xlat16_103) * u_xlat16_26.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlati81 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati2.x = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_25.xyw;
    u_xlat16_26.xyz = u_xlat16_25.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_102 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_25.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_22.xyz + u_xlat16_21.xyz;
    u_xlat16_22.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat83) * u_xlat16_22.xyz + u_xlat15.xyz;
    u_xlat81 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb81 = u_xlat16_87>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb81)) ? u_xlat2.xyz : u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.zxy * u_xlat16_3.yzx + (-u_xlat11.xyz);
    u_xlat13.xyz = u_xlat2.xyz * u_xlat11.xyz;
    u_xlat2.xyz = u_xlat11.zxy * u_xlat2.yzx + (-u_xlat13.xyz);
    u_xlat2.xyz = (-u_xlat9.xyz) * vec3(u_xlat90) + u_xlat2.xyz;
    u_xlat16_22.x = u_xlat16_34.x * 8.0;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_34.x;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = abs(u_xlat16_87) * u_xlat16_22.x;
    u_xlat2.xyz = u_xlat16_22.xxx * u_xlat2.xyz + u_xlat12.xyz;
    u_xlat81 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat2.xyz;
    u_xlat16_22.x = dot((-u_xlat16_3.xyz), u_xlat2.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_22.xxx + (-u_xlat16_3.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat90) + (-u_xlat2.xyz);
    u_xlat9.xyz = u_xlat16_34.xxx * u_xlat9.xyz + u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_87)) * u_xlat11.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat81 = dot(u_xlat16_23.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat16_23.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_51.y = u_xlat81 * 0.5;
    u_xlat16_22.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat16_22.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat22.y = u_xlat9.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat22.xyz, u_xlat16_3.x);
    u_xlat16_23.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat29.xyz = u_xlat16_23.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_23.xyz = u_xlat29.xyz * u_xlat29.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_102) * u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb81 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_23.xyz = (bool(u_xlatb81)) ? u_xlat16_25.xyz : u_xlat16_23.xyz;
    u_xlat18.y = u_xlat16_7.x;
    u_xlat16_51.x = u_xlat16_7.x * 1.09769487;
    u_xlat16_24.xyz = u_xlat16_51.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
    u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_29.xxx + u_xlat16_29.yyy;
    u_xlat16_6.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_1.yzw = u_xlat16_24.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_1.w);
    u_xlat16_30.x = u_xlat16_3.x + 1.0;
    u_xlat16_30.xz = min(u_xlat16_30.xz, vec2(15.0, 1.0));
    u_xlat16_1.x = u_xlat16_30.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_3.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_24.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_30.x = u_xlat16_81 + (-u_xlat16_29.x);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30.x + u_xlat16_29.x;
    u_xlat16_3.x = u_xlat16_103 * u_xlat16_3.x;
    u_xlat81 = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_30.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat81 * u_xlat16_30.x + u_xlat16_3.x;
    u_xlat16_30.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_87 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_87 + u_xlat16_30.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_93);
    u_xlat16_6.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
    u_xlat16_23.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz + u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.yzx * u_xlat16_23.yzx + u_xlat16_8.yzx;
    u_xlat16_3.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_30.z;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_21.xyz;
    u_xlat16_7.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_89 / u_xlat16_7.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _MainLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_87 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_87 = u_xlat16_87 / u_xlat16_7.y;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_7.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.yyy + u_xlat16_8.xyz;
    u_xlat16_8.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_86 / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_86 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_86 = u_xlat16_86 / u_xlat16_8.y;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_86;
    u_xlat16_35.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_35.xyz;
    u_xlat16_4.xyz = u_xlat44.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_7.yyy + u_xlat16_4.xyz;
    u_xlat16_30.x = u_xlat16_91 / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_86 * u_xlat16_30.x;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat44.yyy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.yyy + u_xlat16_6.xyz;
    u_xlat16_30.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_30.x = float(1.0) / u_xlat16_30.x;
    u_xlat16_6.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_87 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_87 = float(1.0) / float(u_xlat16_87);
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_87;
    u_xlat16_35.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_35.xyz = u_xlat16_30.xxx * u_xlat16_35.xyz;
    u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_35.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_30.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_30.x = (-u_xlat16_30.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_8.x;
    u_xlat16_30.x = log2(abs(u_xlat16_30.x));
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightCompensatePow;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_86 * u_xlat16_30.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.xxx;
    u_xlat16_5.xyz = u_xlat16_35.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.yyy + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xxx * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.yyy + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat12.xyz;
    u_xlat9.x = u_xlat27.x * u_xlat16_85 + _Sanshe_X;
    u_xlat9.y = u_xlat27.y * u_xlat16_85 + _Sanshe_Y;
    u_xlat9.z = u_xlat16_3.z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb81 = _UseSansheMask>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xy = u_xlat16_11.xy * u_xlat16_30.xx + u_xlat16_30.yy;
    u_xlat16_5.x = u_xlat16_11.z * u_xlat16_61.x + u_xlat16_61.y;
    u_xlat9.x = u_xlat27.x * u_xlat16_85 + _Sanshe2_X;
    u_xlat9.y = u_xlat27.y * u_xlat16_85 + _Sanshe2_Y;
    u_xlat27.x = dot(u_xlat2.xyz, u_xlat9.xyz);
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat27.x = max(u_xlat27.x, 0.00048828125);
    u_xlat27.x = log2(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _Sanshe2_Fw;
    u_xlat27.x = exp2(u_xlat27.x);
    u_xlat0.y = u_xlat27.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xy;
    u_xlat2.xyz = u_xlat0.yyy * _Sanshe2_color.zxy;
    u_xlat27.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = u_xlat0.xxx * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_30.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_30.x = inversesqrt(u_xlat16_30.x);
    u_xlat16_6.xyz = u_xlat16_30.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.zxy;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
    u_xlat16_5.xyz = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat16_32.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_4.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_54.x = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_5.xyz = u_xlat16_54.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * u_xlat16_54.xxx + _FogCol.zxy;
    u_xlat16_4.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat54.x = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat81 = u_xlat2.x * 15.0 + (-u_xlat54.x);
    u_xlat1.x = u_xlat54.x * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat9.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat9.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_2.xyz) + u_xlat16_9.xyz;
    u_xlat2.xyz = vec3(u_xlat81) * u_xlat9.xyz + u_xlat16_2.xyz;
    u_xlat16_30.x = _PostExposure + _ExposureCompensate;
    u_xlat16_30.x = exp2(u_xlat16_30.x);
    u_xlat9.xyz = u_xlat2.xyz * u_xlat16_30.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat9.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat9.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat54.x = dot(u_xlat9.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat9.xyz = (-u_xlat54.xxx) + u_xlat9.xyz;
    u_xlat81 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat81;
    u_xlat0.x = max(u_xlat0.x, u_xlat27.x);
    u_xlat16_30.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_30.x = u_xlat0.x * u_xlat16_30.x + _Saturation;
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat9.xyz + u_xlat54.xxx;
    u_xlat16_30.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb81 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_4.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_4.xx * u_xlat16_30.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_30.x = float(1.0);
    u_xlat16_30.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_4.xx * u_xlat16_30.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_5.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb27 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_30.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_57 = u_xlat16_30.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_30.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_30.x = min(u_xlat16_57, u_xlat16_4.y);
    u_xlat16_57 = u_xlat16_57 + (-u_xlat16_4.y);
    u_xlat16_30.x = (-u_xlat16_30.x) + u_xlat16_4.x;
    u_xlat16_31.x = u_xlat16_30.x * 6.0 + 9.99999975e-05;
    u_xlat16_57 = u_xlat16_57 / u_xlat16_31.x;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_4.z;
    u_xlat16_57 = abs(u_xlat16_57) + _HueShift;
    u_xlat16_31.xyz = vec3(u_xlat16_57) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_31.xyz = fract(u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_31.xyz = abs(u_xlat16_31.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_31.xyz = u_xlat16_31.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_57 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_57;
    u_xlat16_31.xyz = u_xlat16_30.xxx * u_xlat16_31.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_31.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_30.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_30.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_30.z;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
bool u_xlatb29;
float u_xlat31;
mediump vec3 u_xlat16_31;
vec3 u_xlat33;
bool u_xlatb33;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
float u_xlat40;
mediump vec2 u_xlat16_41;
mediump vec3 u_xlat16_43;
vec3 u_xlat44;
mediump float u_xlat16_45;
mediump vec3 u_xlat16_54;
float u_xlat58;
mediump float u_xlat16_58;
int u_xlati58;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_66;
vec2 u_xlat67;
mediump float u_xlat16_70;
mediump vec2 u_xlat16_72;
float u_xlat75;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat89;
bool u_xlatb89;
float u_xlat92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
mediump float u_xlat16_101;
mediump float u_xlat16_103;
mediump float u_xlat16_107;
mediump float u_xlat16_108;
mediump float u_xlat16_109;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb89 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat93 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat6.xyz = vec3(u_xlat93) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat93 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat9.xyz = vec3(u_xlat93) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat93 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat10.xyz = vec3(u_xlat93) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb89)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat89 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat89 = u_xlat1.z + (-u_xlat89);
    u_xlat3.x = max((-u_xlat1.w), u_xlat89);
    u_xlat3.x = (-u_xlat89) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat89;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat31 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_31.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_31.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat31 = u_xlat16_31.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat60 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz + _shadowColor.zxy;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_95 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_95 = max(u_xlat16_95, 6.10351563e-05);
    u_xlat16_12.x = u_xlat16_95 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_95);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_95);
    u_xlat16_95 = u_xlat16_12.x * u_xlat16_41.x;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_95 = max(u_xlat16_95, u_xlat16_12.x);
    u_xlat16_12.xzw = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.yyy + u_xlat16_12.xzw;
    u_xlat16_99 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_99 = u_xlat16_99 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 * u_xlat16_99;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_13.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_13.x);
    u_xlat16_95 = u_xlat16_95 * u_xlat16_99;
    u_xlat16_13.xyz = vec3(u_xlat16_95) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_anisoUse2U);
#else
    u_xlatb4 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_4.x = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat4.x = u_xlat4.x * _sunShift + _sunShiftOffset;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb33 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat33.x = (u_xlatb33) ? 1.0 : -1.0;
    u_xlat33.x = u_xlat33.x * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat62) + u_xlat9.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat33.xyz = u_xlat33.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat10.xyz + u_xlat33.zxy;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat6.xyz = vec3(u_xlat92) * u_xlat6.xyz;
    u_xlat94 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_UseAO2U>=0.5);
#else
    u_xlatb9 = _UseAO2U>=0.5;
#endif
    u_xlat16_14.xy = (bool(u_xlatb9)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_72.xy = (bool(u_xlatb9)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_14.xy = u_xlat16_72.xy + u_xlat16_14.xy;
    u_xlat16_9 = texture(_materialParamsMap, u_xlat16_14.xy).z;
    u_xlat16_95 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_9));
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat38.x = (-u_xlat16_99) + 1.0;
    u_xlat16_11.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_14.xy = u_xlat16_11.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_100 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat38.x = u_xlat38.x * u_xlat16_100;
    u_xlat38.x = max(u_xlat38.x, 0.00100000005);
    u_xlat15.z = u_xlat94 * u_xlat38.x;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat94 = u_xlat16_95 * u_xlat16_100;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat15.y = u_xlat16_72.x * u_xlat94;
    u_xlat15.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat67.x = sqrt(u_xlat67.x);
    u_xlat67.x = u_xlat67.x + u_xlat15.x;
    u_xlat44.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_95 = dot(u_xlat44.xyz, u_xlat44.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_16.xyz = vec3(u_xlat16_95) * u_xlat44.xyz;
    u_xlat96 = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat17.z = u_xlat96 * u_xlat38.x;
    u_xlat96 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat17.y = u_xlat94 * u_xlat96;
    u_xlat17.x = dot(u_xlat10.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat96 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat67.y = u_xlat96 + u_xlat17.x;
    u_xlat67.xy = u_xlat67.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat67.x = u_xlat67.y * u_xlat67.x + 6.10351563e-05;
    u_xlat67.x = float(1.0) / u_xlat67.x;
    u_xlat18.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + u_xlat16_12.xyz;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = inversesqrt(u_xlat97);
    u_xlat18.xyz = vec3(u_xlat97) * u_xlat18.xyz;
    u_xlat97 = dot(u_xlat6.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat94 * u_xlat97;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat38.x * u_xlat16_72.x;
    u_xlat97 = dot(u_xlat10.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat97 = min(max(u_xlat97, 0.0), 1.0);
#else
    u_xlat97 = clamp(u_xlat97, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_12.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_12.x) + 1.0;
    u_xlat98 = u_xlat38.x * u_xlat94;
    u_xlat19.z = u_xlat97 * u_xlat98;
    u_xlat97 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat97 = max(u_xlat97, 6.10351563e-05);
    u_xlat97 = u_xlat98 / u_xlat97;
    u_xlat97 = u_xlat97 * u_xlat97;
    u_xlat75 = u_xlat98 * 0.318309873;
    u_xlat97 = u_xlat97 * u_xlat75;
    u_xlat97 = min(u_xlat97, 16.0);
    u_xlat67.x = u_xlat67.x * u_xlat97;
    u_xlat16_12.x = u_xlat11.x * u_xlat11.x;
    u_xlat16_12.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat16_41.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat97 = (-u_xlat16_12.x) * u_xlat11.x + 1.0;
    u_xlat16_20.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_0.zxy * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_0.zxy * u_xlat16_20.xyz;
    u_xlat16_12.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_12.x = log2(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _alphaClipPower;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_21.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_11.zzz * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_70 = (-u_xlat16_11.y) * _metallicMultiplier + 1.0;
    u_xlat16_22.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat0.xyz);
    u_xlat87 = (-_ShadeRange) + _DetailRange;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat11.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.x = max(u_xlat11.x, 0.0);
    u_xlat40 = u_xlat11.x + (-_ShadeRange);
    u_xlat18.x = min(u_xlat11.x, 1.0);
    u_xlat87 = u_xlat87 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat87 * -2.0 + 3.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat11.x;
    u_xlat16_11.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat11.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
    u_xlat16_72.x = min(u_xlat87, u_xlat11.x);
    u_xlat16_72.x = u_xlat16_72.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72.x = min(max(u_xlat16_72.x, 0.0), 1.0);
#else
    u_xlat16_72.x = clamp(u_xlat16_72.x, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_72.xxx * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_20.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlat16_43.xyz = u_xlat16_14.yyy * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat97) * u_xlat16_43.xyz;
    u_xlat87 = u_xlat16_43.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat16_41.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat67.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat11.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat67.x = inversesqrt(u_xlat67.x);
    u_xlat11.xyz = u_xlat67.xxx * u_xlat11.xyz;
    u_xlat67.x = dot(u_xlat6.xyz, u_xlat11.xyz);
    u_xlat19.y = u_xlat94 * u_xlat67.x;
    u_xlat16_41.x = dot(u_xlat5.zxy, u_xlat11.xyz);
    u_xlat19.x = u_xlat38.x * u_xlat16_41.x;
    u_xlat67.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67.x = min(max(u_xlat67.x, 0.0), 1.0);
#else
    u_xlat67.x = clamp(u_xlat67.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_41.x) + 1.0;
    u_xlat19.z = u_xlat67.x * u_xlat98;
    u_xlat67.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat67.x = max(u_xlat67.x, 6.10351563e-05);
    u_xlat67.x = u_xlat98 / u_xlat67.x;
    u_xlat67.x = u_xlat67.x * u_xlat67.x;
    u_xlat67.x = u_xlat75 * u_xlat67.x;
    u_xlat67.x = min(u_xlat67.x, 16.0);
    u_xlat11.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat38.x * u_xlat11.x;
    u_xlat16_41.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat94 * u_xlat16_41.x;
    u_xlat11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat18.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat67.y * u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat67.x = u_xlat67.x * u_xlat11.x;
    u_xlat16_41.x = u_xlat97 * u_xlat97;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat11.x = (-u_xlat16_41.x) * u_xlat97 + 1.0;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat11.xyz = u_xlat16_43.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat87) * u_xlat16_41.xxx + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat67.xxx * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat11.xyz * u_xlat16_8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_41.x = max(u_xlat16_41.x, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_41.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat0.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + u_xlat16_22.xyz;
    u_xlat67.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat67.x = inversesqrt(u_xlat67.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat67.xxx;
    u_xlat67.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_22.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat38.x;
    u_xlat11.y = u_xlat94 * u_xlat67.x;
    u_xlat16_70 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat11.x = u_xlat38.x * u_xlat16_70;
    u_xlat38.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_70) + 1.0;
    u_xlat11.z = u_xlat38.x * u_xlat98;
    u_xlat29.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat29.x = max(u_xlat29.x, 6.10351563e-05);
    u_xlat29.x = u_xlat98 / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat75 * u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat16_70 = dot(u_xlat5.zxy, u_xlat16_22.xyz);
    u_xlat6.y = u_xlat94 * u_xlat16_70;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat67.y * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat29.x = u_xlat58 * u_xlat29.x;
    u_xlat16_103 = u_xlat0.x * u_xlat0.x;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat58 = (-u_xlat16_103) * u_xlat0.x + 1.0;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat38.xyz = u_xlat16_43.xyz * vec3(u_xlat58);
    u_xlat0.xzw = vec3(u_xlat87) * vec3(u_xlat16_103) + u_xlat38.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_103 = u_xlat16_41.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_41.x);
    u_xlat16_103 = (-u_xlat16_103) * u_xlat16_103 + 1.0;
    u_xlat16_103 = max(u_xlat16_103, 0.0);
    u_xlat16_103 = u_xlat16_103 * u_xlat16_103;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_41.x = max(u_xlat16_23.x, u_xlat16_41.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_103 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_103);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_22.xyz = u_xlat16_41.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat31) + u_xlat16_21.xyz;
    u_xlat16_23.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_23.xyz = u_xlat16_8.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat60) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat15.xxx * u_xlat16_24.xyz;
    u_xlat16_41.x = u_xlat15.x + (-_AdditionalLightCompensateStart);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_41.y = u_xlat18.x + (-_MainLightCompensateStart);
    u_xlat16_41.xy = (-u_xlat16_41.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.xy = min(max(u_xlat16_41.xy, 0.0), 1.0);
#else
    u_xlat16_41.xy = clamp(u_xlat16_41.xy, 0.0, 1.0);
#endif
    u_xlat16_24.xyz = u_xlat16_20.xyz * u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat31) * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat6.xxx + u_xlat16_23.xyz;
    u_xlat16_103 = u_xlat6.x + (-_AdditionalLightCompensateStart);
    u_xlat16_103 = (-u_xlat16_103);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_24.xyz = (-u_xlat7.xyz) * vec3(u_xlat93) + vs_TEXCOORD4.xyz;
    u_xlat16_24.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_24.xyz + u_xlat10.xyz;
    u_xlat16_107 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat16_107 = inversesqrt(u_xlat16_107);
    u_xlat16_24.xyz = vec3(u_xlat16_107) * u_xlat16_24.xyz;
    u_xlat16_107 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_107 = min(max(u_xlat16_107, 0.0), 1.0);
#else
    u_xlat16_107 = clamp(u_xlat16_107, 0.0, 1.0);
#endif
    u_xlat16_108 = u_xlat16_107 * 0.5 + 0.5;
    u_xlat16_108 = (-u_xlat16_107) + u_xlat16_108;
    u_xlat16_109 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_54.z = _occlusionScale * u_xlat16_109 + 1.0;
    u_xlat16_107 = u_xlat16_54.z * u_xlat16_108 + u_xlat16_107;
    u_xlat16_107 = u_xlat16_54.z * u_xlat16_107;
    u_xlat16_108 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_108 = min(max(u_xlat16_108, 0.0), 1.0);
#else
    u_xlat16_108 = clamp(u_xlat16_108, 0.0, 1.0);
#endif
    u_xlat16_108 = u_xlat16_108 + -1.0;
    u_xlat16_108 = _occlusionScale * u_xlat16_108 + 1.0;
    u_xlat16_107 = u_xlat16_107 * u_xlat16_108;
    u_xlat0.xy = min(u_xlat2.xw, vec2(u_xlat16_107));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9);
    u_xlat16_26.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.zxy;
    u_xlat16_27.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_24.xz);
    u_xlat16_27.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_24.xz);
    u_xlat16_27.y = u_xlat16_24.y;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_27.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_27.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_27.xyz = vec3(u_xlat16_108) * u_xlat16_28.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_28.xyz = u_xlat16_27.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati58 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_27.xyw = u_xlat16_27.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_27.xyw;
    u_xlat16_28.xyz = u_xlat16_27.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_107 = dot(u_xlat16_27.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_27.xyz = u_xlat16_20.xyz * u_xlat16_28.xyz;
    u_xlat16_23.xyz = u_xlat16_27.xyz * u_xlat16_26.xyz + u_xlat16_23.xyz;
    u_xlat16_109 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_109 = inversesqrt(u_xlat16_109);
    u_xlat16_26.xyz = vec3(u_xlat16_109) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat4.xxx * u_xlat16_26.xyz + u_xlat33.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_99>=0.0);
#else
    u_xlatb2 = u_xlat16_99>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat4.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat0.xzw * u_xlat4.xyz;
    u_xlat0.xzw = u_xlat4.zxy * u_xlat0.zwx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat93) + u_xlat0.xzw;
    u_xlat16_109 = u_xlat16_100 * 8.0;
    u_xlat16_100 = u_xlat16_100 * u_xlat16_100;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_109 = min(u_xlat16_109, 1.0);
    u_xlat16_109 = abs(u_xlat16_99) * u_xlat16_109;
    u_xlat0.xzw = vec3(u_xlat16_109) * u_xlat0.xzw + u_xlat10.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
    u_xlat16_109 = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_109 = u_xlat16_109 + u_xlat16_109;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_109) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat93) + (-u_xlat0.xzw);
    u_xlat4.xyz = vec3(u_xlat16_100) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat6.xyz = u_xlat0.xzw + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_99)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_99 = -abs(u_xlat16_99) * 0.800000012 + 1.0;
    u_xlat16_99 = u_xlat16_14.x * u_xlat16_99;
    u_xlat16_99 = u_xlat16_99 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_99);
    u_xlat0.x = dot(u_xlat16_24.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_54.y = u_xlat0.x * 0.5;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat24.y = u_xlat4.y;
    u_xlat24.xz = u_xlat16_24.xz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_99);
    u_xlat16_26.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = vec3(u_xlat16_107) * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26.xyz = (bool(u_xlatb0)) ? u_xlat16_27.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_54.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_25.xyz = u_xlat16_54.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_43.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_14.xyz = u_xlat16_26.xyz * u_xlat16_14.xyz;
    u_xlat16_99 = u_xlat0.y * 0.5;
    u_xlat16_101 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_3.yzw = u_xlat16_25.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_16.x = floor(u_xlat16_3.w);
    u_xlat16_45 = u_xlat16_16.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_3.x = u_xlat16_45 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_3.x = u_xlat16_16.x * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_16.x = u_xlat16_25.z * 15.0 + (-u_xlat16_16.x);
    u_xlat16_45 = (-u_xlat16_87) + u_xlat16_0.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_45 + u_xlat16_87;
    u_xlat16_16.x = u_xlat16_108 * u_xlat16_16.x;
    u_xlat0.x = u_xlat58 * u_xlat16_16.x;
    u_xlat16_99 = u_xlat0.x * u_xlat16_101 + u_xlat16_99;
    u_xlat16_101 = u_xlat16_99 + u_xlat16_99;
    u_xlat16_16.x = (-u_xlat16_99) * 2.0 + 1.0;
    u_xlat16_99 = u_xlat16_99 * u_xlat16_16.x + u_xlat16_101;
    u_xlat16_99 = u_xlat0.y * u_xlat16_99;
    u_xlat16_99 = min(u_xlat16_9, u_xlat16_99);
    u_xlat16_14.xyz = vec3(u_xlat16_99) * u_xlat16_14.xyz;
    u_xlat16_25.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_25.yzx + u_xlat16_21.yzx;
    u_xlat16_99 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 + u_xlat16_12.x;
    u_xlat16_99 = min(u_xlat16_99, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_41.y / u_xlat16_16.x;
    u_xlat16_70 = log2(abs(u_xlat16_70));
    u_xlat16_70 = u_xlat16_70 * _MainLightCompensatePow;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_101 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_101 = u_xlat16_101 / u_xlat16_16.y;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_101;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(u_xlat16_70);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_21.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_8.xyz;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_41.x / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_70 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_70 = u_xlat16_70 / u_xlat16_14.y;
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_43.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_43.xyz = u_xlat16_13.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = vec3(u_xlat60) * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_16.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_43.xyz;
    u_xlat16_41.x = u_xlat16_103 / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_43.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_43.xyz = u_xlat16_22.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = vec3(u_xlat31) * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_16.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_43.xyz;
    u_xlat16_41.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_41.x = float(1.0) / u_xlat16_41.x;
    u_xlat16_43.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_103 = dot(u_xlat16_43.xyz, u_xlat16_43.xyz);
    u_xlat16_103 = max(u_xlat16_103, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_103 = float(1.0) / float(u_xlat16_103);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_21.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_21.xyz = u_xlat16_41.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_43.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_43.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_43.zzz + u_xlat0.xyz;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat87 = max(u_xlat87, 1.17549435e-38);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_41.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_41.x = (-u_xlat16_41.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_41.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_41.yyy + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xxx * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_14.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat44.x * u_xlat16_95 + _Sanshe_X;
    u_xlat2.y = u_xlat44.y * u_xlat16_95 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_16.z;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = (-u_xlat87) + 1.0;
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = max(u_xlat87, 0.00048828125);
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _Sanshe_Fw;
    u_xlat87 = exp2(u_xlat87);
    u_xlat0.w = u_xlat87 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb89 = _UseSansheMask>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb89)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_41.xy = u_xlat16_4.xy * u_xlat16_41.xx + u_xlat16_41.yy;
    u_xlat16_14.x = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat44.x * u_xlat16_95 + _Sanshe2_X;
    u_xlat2.y = u_xlat44.y * u_xlat16_95 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_41.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_95 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_16.xyz = vec3(u_xlat16_95) * _DirectionalDir.xyz;
    u_xlat29.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 0.0);
    u_xlat29.xyz = u_xlat29.xxx * _DirectionalColor.zxy;
    u_xlat29.xyz = u_xlat29.xyz * vec3(_DirectionalIntensity);
    u_xlat16_14.xyz = u_xlat29.xyz * u_xlat16_14.xxx + u_xlat16_43.xyz;
    u_xlat16_14.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat29.x = dot(u_xlat16_8.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat29.x = u_xlat29.x + -0.25;
    u_xlat29.x = u_xlat29.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_58 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_58) + _FogCol.zxy;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat87 = u_xlat2.x * 15.0 + (-u_xlat58);
    u_xlat1.x = u_xlat58 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = vec3(u_xlat87) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat58)) + u_xlat4.xyz;
    u_xlat87 = u_xlat29.x * -2.0 + 3.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat87;
    u_xlat0.x = max(u_xlat29.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(u_xlat58);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb87 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_66 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_66) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_66) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb29 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_8.x = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_37.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_41.x = min(u_xlat16_8.z, u_xlat16_37.x);
    u_xlat16_37.x = (-u_xlat16_8.z) + u_xlat16_37.x;
    u_xlat16_66 = u_xlat16_8.x + (-u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_66 * 6.0 + 9.99999975e-05;
    u_xlat16_37.x = u_xlat16_37.x / u_xlat16_41.x;
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_8.w;
    u_xlat16_37.x = abs(u_xlat16_37.x) + _HueShift;
    u_xlat16_14.xyz = u_xlat16_37.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_37.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_37.x = u_xlat16_66 / u_xlat16_37.x;
    u_xlat16_37.xyz = u_xlat16_37.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_37.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_41.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_41.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_99 : u_xlat16_12.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
bool u_xlatb29;
float u_xlat31;
mediump vec3 u_xlat16_31;
vec3 u_xlat33;
bool u_xlatb33;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
float u_xlat40;
mediump vec2 u_xlat16_41;
mediump vec3 u_xlat16_43;
vec3 u_xlat44;
mediump float u_xlat16_45;
mediump vec3 u_xlat16_54;
float u_xlat58;
mediump float u_xlat16_58;
int u_xlati58;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_66;
vec2 u_xlat67;
mediump float u_xlat16_70;
mediump vec2 u_xlat16_72;
float u_xlat75;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat89;
bool u_xlatb89;
float u_xlat92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
mediump float u_xlat16_101;
mediump float u_xlat16_103;
mediump float u_xlat16_107;
mediump float u_xlat16_108;
mediump float u_xlat16_109;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb89 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat93 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat6.xyz = vec3(u_xlat93) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat93 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat9.xyz = vec3(u_xlat93) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat93 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat10.xyz = vec3(u_xlat93) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb89)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat89 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat89 = u_xlat1.z + (-u_xlat89);
    u_xlat3.x = max((-u_xlat1.w), u_xlat89);
    u_xlat3.x = (-u_xlat89) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat89;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat31 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_31.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_31.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat31 = u_xlat16_31.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat60 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz + _shadowColor.zxy;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_95 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_95 = max(u_xlat16_95, 6.10351563e-05);
    u_xlat16_12.x = u_xlat16_95 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_95);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_95);
    u_xlat16_95 = u_xlat16_12.x * u_xlat16_41.x;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_95 = max(u_xlat16_95, u_xlat16_12.x);
    u_xlat16_12.xzw = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.yyy + u_xlat16_12.xzw;
    u_xlat16_99 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_99 = u_xlat16_99 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 * u_xlat16_99;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_13.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_13.x);
    u_xlat16_95 = u_xlat16_95 * u_xlat16_99;
    u_xlat16_13.xyz = vec3(u_xlat16_95) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_anisoUse2U);
#else
    u_xlatb4 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_4.x = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat4.x = u_xlat4.x * _sunShift + _sunShiftOffset;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb33 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat33.x = (u_xlatb33) ? 1.0 : -1.0;
    u_xlat33.x = u_xlat33.x * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat62) + u_xlat9.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat33.xyz = u_xlat33.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat10.xyz + u_xlat33.zxy;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat6.xyz = vec3(u_xlat92) * u_xlat6.xyz;
    u_xlat94 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_UseAO2U>=0.5);
#else
    u_xlatb9 = _UseAO2U>=0.5;
#endif
    u_xlat16_14.xy = (bool(u_xlatb9)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_72.xy = (bool(u_xlatb9)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_14.xy = u_xlat16_72.xy + u_xlat16_14.xy;
    u_xlat16_9 = texture(_materialParamsMap, u_xlat16_14.xy).z;
    u_xlat16_95 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_9));
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat38.x = (-u_xlat16_99) + 1.0;
    u_xlat16_11.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_14.xy = u_xlat16_11.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_100 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat38.x = u_xlat38.x * u_xlat16_100;
    u_xlat38.x = max(u_xlat38.x, 0.00100000005);
    u_xlat15.z = u_xlat94 * u_xlat38.x;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat94 = u_xlat16_95 * u_xlat16_100;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat15.y = u_xlat16_72.x * u_xlat94;
    u_xlat15.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat67.x = sqrt(u_xlat67.x);
    u_xlat67.x = u_xlat67.x + u_xlat15.x;
    u_xlat44.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_95 = dot(u_xlat44.xyz, u_xlat44.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_16.xyz = vec3(u_xlat16_95) * u_xlat44.xyz;
    u_xlat96 = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat17.z = u_xlat96 * u_xlat38.x;
    u_xlat96 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat17.y = u_xlat94 * u_xlat96;
    u_xlat17.x = dot(u_xlat10.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat96 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat67.y = u_xlat96 + u_xlat17.x;
    u_xlat67.xy = u_xlat67.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat67.x = u_xlat67.y * u_xlat67.x + 6.10351563e-05;
    u_xlat67.x = float(1.0) / u_xlat67.x;
    u_xlat18.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + u_xlat16_12.xyz;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = inversesqrt(u_xlat97);
    u_xlat18.xyz = vec3(u_xlat97) * u_xlat18.xyz;
    u_xlat97 = dot(u_xlat6.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat94 * u_xlat97;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat38.x * u_xlat16_72.x;
    u_xlat97 = dot(u_xlat10.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat97 = min(max(u_xlat97, 0.0), 1.0);
#else
    u_xlat97 = clamp(u_xlat97, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_12.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_12.x) + 1.0;
    u_xlat98 = u_xlat38.x * u_xlat94;
    u_xlat19.z = u_xlat97 * u_xlat98;
    u_xlat97 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat97 = max(u_xlat97, 6.10351563e-05);
    u_xlat97 = u_xlat98 / u_xlat97;
    u_xlat97 = u_xlat97 * u_xlat97;
    u_xlat75 = u_xlat98 * 0.318309873;
    u_xlat97 = u_xlat97 * u_xlat75;
    u_xlat97 = min(u_xlat97, 16.0);
    u_xlat67.x = u_xlat67.x * u_xlat97;
    u_xlat16_12.x = u_xlat11.x * u_xlat11.x;
    u_xlat16_12.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat16_41.x = u_xlat11.x * u_xlat16_12.x;
    u_xlat97 = (-u_xlat16_12.x) * u_xlat11.x + 1.0;
    u_xlat16_20.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_0.zxy * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_0.zxy * u_xlat16_20.xyz;
    u_xlat16_12.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_12.x = log2(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _alphaClipPower;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_21.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_11.zzz * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_70 = (-u_xlat16_11.y) * _metallicMultiplier + 1.0;
    u_xlat16_22.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat0.xyz);
    u_xlat87 = (-_ShadeRange) + _DetailRange;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat11.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.x = max(u_xlat11.x, 0.0);
    u_xlat40 = u_xlat11.x + (-_ShadeRange);
    u_xlat18.x = min(u_xlat11.x, 1.0);
    u_xlat87 = u_xlat87 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat87 * -2.0 + 3.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat11.x;
    u_xlat16_11.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat11.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
    u_xlat16_72.x = min(u_xlat87, u_xlat11.x);
    u_xlat16_72.x = u_xlat16_72.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72.x = min(max(u_xlat16_72.x, 0.0), 1.0);
#else
    u_xlat16_72.x = clamp(u_xlat16_72.x, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_72.xxx * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_20.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlat16_43.xyz = u_xlat16_14.yyy * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat97) * u_xlat16_43.xyz;
    u_xlat87 = u_xlat16_43.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat16_41.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat67.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat11.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat67.x = inversesqrt(u_xlat67.x);
    u_xlat11.xyz = u_xlat67.xxx * u_xlat11.xyz;
    u_xlat67.x = dot(u_xlat6.xyz, u_xlat11.xyz);
    u_xlat19.y = u_xlat94 * u_xlat67.x;
    u_xlat16_41.x = dot(u_xlat5.zxy, u_xlat11.xyz);
    u_xlat19.x = u_xlat38.x * u_xlat16_41.x;
    u_xlat67.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67.x = min(max(u_xlat67.x, 0.0), 1.0);
#else
    u_xlat67.x = clamp(u_xlat67.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_41.x) + 1.0;
    u_xlat19.z = u_xlat67.x * u_xlat98;
    u_xlat67.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat67.x = max(u_xlat67.x, 6.10351563e-05);
    u_xlat67.x = u_xlat98 / u_xlat67.x;
    u_xlat67.x = u_xlat67.x * u_xlat67.x;
    u_xlat67.x = u_xlat75 * u_xlat67.x;
    u_xlat67.x = min(u_xlat67.x, 16.0);
    u_xlat11.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat38.x * u_xlat11.x;
    u_xlat16_41.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat94 * u_xlat16_41.x;
    u_xlat11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat18.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat67.y * u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat67.x = u_xlat67.x * u_xlat11.x;
    u_xlat16_41.x = u_xlat97 * u_xlat97;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat11.x = (-u_xlat16_41.x) * u_xlat97 + 1.0;
    u_xlat16_41.x = u_xlat97 * u_xlat16_41.x;
    u_xlat11.xyz = u_xlat16_43.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat87) * u_xlat16_41.xxx + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat67.xxx * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat11.xyz * u_xlat16_8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_41.x = max(u_xlat16_41.x, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_41.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat0.xyz = u_xlat44.xyz * vec3(u_xlat16_95) + u_xlat16_22.xyz;
    u_xlat67.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat67.x = inversesqrt(u_xlat67.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat67.xxx;
    u_xlat67.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_22.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat38.x;
    u_xlat11.y = u_xlat94 * u_xlat67.x;
    u_xlat16_70 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat11.x = u_xlat38.x * u_xlat16_70;
    u_xlat38.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_70) + 1.0;
    u_xlat11.z = u_xlat38.x * u_xlat98;
    u_xlat29.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat29.x = max(u_xlat29.x, 6.10351563e-05);
    u_xlat29.x = u_xlat98 / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat75 * u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat16_70 = dot(u_xlat5.zxy, u_xlat16_22.xyz);
    u_xlat6.y = u_xlat94 * u_xlat16_70;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat67.y * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat29.x = u_xlat58 * u_xlat29.x;
    u_xlat16_103 = u_xlat0.x * u_xlat0.x;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat58 = (-u_xlat16_103) * u_xlat0.x + 1.0;
    u_xlat16_103 = u_xlat0.x * u_xlat16_103;
    u_xlat38.xyz = u_xlat16_43.xyz * vec3(u_xlat58);
    u_xlat0.xzw = vec3(u_xlat87) * vec3(u_xlat16_103) + u_xlat38.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_103 = u_xlat16_41.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_41.x);
    u_xlat16_103 = (-u_xlat16_103) * u_xlat16_103 + 1.0;
    u_xlat16_103 = max(u_xlat16_103, 0.0);
    u_xlat16_103 = u_xlat16_103 * u_xlat16_103;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_41.x = max(u_xlat16_23.x, u_xlat16_41.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_103 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_103);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_22.xyz = u_xlat16_41.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat31) + u_xlat16_21.xyz;
    u_xlat16_23.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_23.xyz = u_xlat16_8.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat60) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat15.xxx * u_xlat16_24.xyz;
    u_xlat16_41.x = u_xlat15.x + (-_AdditionalLightCompensateStart);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_41.y = u_xlat18.x + (-_MainLightCompensateStart);
    u_xlat16_41.xy = (-u_xlat16_41.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.xy = min(max(u_xlat16_41.xy, 0.0), 1.0);
#else
    u_xlat16_41.xy = clamp(u_xlat16_41.xy, 0.0, 1.0);
#endif
    u_xlat16_24.xyz = u_xlat16_20.xyz * u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat31) * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat6.xxx + u_xlat16_23.xyz;
    u_xlat16_103 = u_xlat6.x + (-_AdditionalLightCompensateStart);
    u_xlat16_103 = (-u_xlat16_103);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_24.xyz = (-u_xlat7.xyz) * vec3(u_xlat93) + vs_TEXCOORD4.xyz;
    u_xlat16_24.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_24.xyz + u_xlat10.xyz;
    u_xlat16_107 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat16_107 = inversesqrt(u_xlat16_107);
    u_xlat16_24.xyz = vec3(u_xlat16_107) * u_xlat16_24.xyz;
    u_xlat16_107 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_107 = min(max(u_xlat16_107, 0.0), 1.0);
#else
    u_xlat16_107 = clamp(u_xlat16_107, 0.0, 1.0);
#endif
    u_xlat16_108 = u_xlat16_107 * 0.5 + 0.5;
    u_xlat16_108 = (-u_xlat16_107) + u_xlat16_108;
    u_xlat16_109 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_54.z = _occlusionScale * u_xlat16_109 + 1.0;
    u_xlat16_107 = u_xlat16_54.z * u_xlat16_108 + u_xlat16_107;
    u_xlat16_107 = u_xlat16_54.z * u_xlat16_107;
    u_xlat16_108 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_108 = min(max(u_xlat16_108, 0.0), 1.0);
#else
    u_xlat16_108 = clamp(u_xlat16_108, 0.0, 1.0);
#endif
    u_xlat16_108 = u_xlat16_108 + -1.0;
    u_xlat16_108 = _occlusionScale * u_xlat16_108 + 1.0;
    u_xlat16_107 = u_xlat16_107 * u_xlat16_108;
    u_xlat0.xy = min(u_xlat2.xw, vec2(u_xlat16_107));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9);
    u_xlat16_26.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.zxy;
    u_xlat16_27.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_24.xz);
    u_xlat16_27.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_24.xz);
    u_xlat16_27.y = u_xlat16_24.y;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_27.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_27.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_27.xyz = vec3(u_xlat16_108) * u_xlat16_28.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_28.xyz = u_xlat16_27.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati58 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_27.xyw = u_xlat16_27.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_27.xyw;
    u_xlat16_28.xyz = u_xlat16_27.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_107 = dot(u_xlat16_27.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_27.xyz = u_xlat16_20.xyz * u_xlat16_28.xyz;
    u_xlat16_23.xyz = u_xlat16_27.xyz * u_xlat16_26.xyz + u_xlat16_23.xyz;
    u_xlat16_109 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_109 = inversesqrt(u_xlat16_109);
    u_xlat16_26.xyz = vec3(u_xlat16_109) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat4.xxx * u_xlat16_26.xyz + u_xlat33.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_99>=0.0);
#else
    u_xlatb2 = u_xlat16_99>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat4.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat0.xzw * u_xlat4.xyz;
    u_xlat0.xzw = u_xlat4.zxy * u_xlat0.zwx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat93) + u_xlat0.xzw;
    u_xlat16_109 = u_xlat16_100 * 8.0;
    u_xlat16_100 = u_xlat16_100 * u_xlat16_100;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_109 = min(u_xlat16_109, 1.0);
    u_xlat16_109 = abs(u_xlat16_99) * u_xlat16_109;
    u_xlat0.xzw = vec3(u_xlat16_109) * u_xlat0.xzw + u_xlat10.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
    u_xlat16_109 = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_109 = u_xlat16_109 + u_xlat16_109;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_109) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat93) + (-u_xlat0.xzw);
    u_xlat4.xyz = vec3(u_xlat16_100) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat6.xyz = u_xlat0.xzw + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_99)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_99 = -abs(u_xlat16_99) * 0.800000012 + 1.0;
    u_xlat16_99 = u_xlat16_14.x * u_xlat16_99;
    u_xlat16_99 = u_xlat16_99 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_99);
    u_xlat0.x = dot(u_xlat16_24.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_54.y = u_xlat0.x * 0.5;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat24.y = u_xlat4.y;
    u_xlat24.xz = u_xlat16_24.xz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_99);
    u_xlat16_26.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = vec3(u_xlat16_107) * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26.xyz = (bool(u_xlatb0)) ? u_xlat16_27.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_54.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_25.xyz = u_xlat16_54.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_43.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_14.xyz = u_xlat16_26.xyz * u_xlat16_14.xyz;
    u_xlat16_99 = u_xlat0.y * 0.5;
    u_xlat16_101 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_3.yzw = u_xlat16_25.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_16.x = floor(u_xlat16_3.w);
    u_xlat16_45 = u_xlat16_16.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_3.x = u_xlat16_45 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_3.x = u_xlat16_16.x * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_16.x = u_xlat16_25.z * 15.0 + (-u_xlat16_16.x);
    u_xlat16_45 = (-u_xlat16_87) + u_xlat16_0.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_45 + u_xlat16_87;
    u_xlat16_16.x = u_xlat16_108 * u_xlat16_16.x;
    u_xlat0.x = u_xlat58 * u_xlat16_16.x;
    u_xlat16_99 = u_xlat0.x * u_xlat16_101 + u_xlat16_99;
    u_xlat16_101 = u_xlat16_99 + u_xlat16_99;
    u_xlat16_16.x = (-u_xlat16_99) * 2.0 + 1.0;
    u_xlat16_99 = u_xlat16_99 * u_xlat16_16.x + u_xlat16_101;
    u_xlat16_99 = u_xlat0.y * u_xlat16_99;
    u_xlat16_99 = min(u_xlat16_9, u_xlat16_99);
    u_xlat16_14.xyz = vec3(u_xlat16_99) * u_xlat16_14.xyz;
    u_xlat16_25.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_25.yzx + u_xlat16_21.yzx;
    u_xlat16_99 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 + u_xlat16_12.x;
    u_xlat16_99 = min(u_xlat16_99, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_41.y / u_xlat16_16.x;
    u_xlat16_70 = log2(abs(u_xlat16_70));
    u_xlat16_70 = u_xlat16_70 * _MainLightCompensatePow;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_101 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_101 = u_xlat16_101 / u_xlat16_16.y;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_101;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(u_xlat16_70);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_21.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_8.xyz;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_41.x / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_70 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_70 = u_xlat16_70 / u_xlat16_14.y;
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_43.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_43.xyz = u_xlat16_13.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = vec3(u_xlat60) * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_16.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_43.xyz;
    u_xlat16_41.x = u_xlat16_103 / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_43.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_43.xyz = u_xlat16_22.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = vec3(u_xlat31) * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_16.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_43.xyz;
    u_xlat16_41.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_41.x = float(1.0) / u_xlat16_41.x;
    u_xlat16_43.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_103 = dot(u_xlat16_43.xyz, u_xlat16_43.xyz);
    u_xlat16_103 = max(u_xlat16_103, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_103 = float(1.0) / float(u_xlat16_103);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_103;
    u_xlat16_21.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_21.xyz = u_xlat16_41.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_43.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_43.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_43.zzz + u_xlat0.xyz;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat87 = max(u_xlat87, 1.17549435e-38);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_41.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_41.x = (-u_xlat16_41.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x / u_xlat16_14.x;
    u_xlat16_41.x = log2(abs(u_xlat16_41.x));
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightCompensatePow;
    u_xlat16_41.x = exp2(u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_70 * u_xlat16_41.x;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_41.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_41.yyy + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xxx * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.yyy + u_xlat16_14.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat44.x * u_xlat16_95 + _Sanshe_X;
    u_xlat2.y = u_xlat44.y * u_xlat16_95 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_16.z;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = (-u_xlat87) + 1.0;
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = max(u_xlat87, 0.00048828125);
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _Sanshe_Fw;
    u_xlat87 = exp2(u_xlat87);
    u_xlat0.w = u_xlat87 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb89 = _UseSansheMask>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb89)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_41.xy = u_xlat16_4.xy * u_xlat16_41.xx + u_xlat16_41.yy;
    u_xlat16_14.x = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat44.x * u_xlat16_95 + _Sanshe2_X;
    u_xlat2.y = u_xlat44.y * u_xlat16_95 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_41.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_95 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_16.xyz = vec3(u_xlat16_95) * _DirectionalDir.xyz;
    u_xlat29.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 0.0);
    u_xlat29.xyz = u_xlat29.xxx * _DirectionalColor.zxy;
    u_xlat29.xyz = u_xlat29.xyz * vec3(_DirectionalIntensity);
    u_xlat16_14.xyz = u_xlat29.xyz * u_xlat16_14.xxx + u_xlat16_43.xyz;
    u_xlat16_14.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat29.x = dot(u_xlat16_8.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat29.x = u_xlat29.x + -0.25;
    u_xlat29.x = u_xlat29.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_58 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_58) + _FogCol.zxy;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat87 = u_xlat2.x * 15.0 + (-u_xlat58);
    u_xlat1.x = u_xlat58 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = vec3(u_xlat87) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat58)) + u_xlat4.xyz;
    u_xlat87 = u_xlat29.x * -2.0 + 3.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat87;
    u_xlat0.x = max(u_xlat29.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(u_xlat58);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb87 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_66 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_66) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_66) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb29 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_8.x = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_37.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_41.x = min(u_xlat16_8.z, u_xlat16_37.x);
    u_xlat16_37.x = (-u_xlat16_8.z) + u_xlat16_37.x;
    u_xlat16_66 = u_xlat16_8.x + (-u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_66 * 6.0 + 9.99999975e-05;
    u_xlat16_37.x = u_xlat16_37.x / u_xlat16_41.x;
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_8.w;
    u_xlat16_37.x = abs(u_xlat16_37.x) + _HueShift;
    u_xlat16_14.xyz = u_xlat16_37.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_37.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_37.x = u_xlat16_66 / u_xlat16_37.x;
    u_xlat16_37.xyz = u_xlat16_37.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_37.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_41.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_41.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_99 : u_xlat16_12.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec2 u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_33;
float u_xlat38;
vec2 u_xlat42;
mediump vec2 u_xlat16_42;
mediump vec3 u_xlat16_49;
vec2 u_xlat52;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
float u_xlat54;
mediump vec2 u_xlat16_58;
float u_xlat78;
mediump float u_xlat16_78;
int u_xlati78;
bool u_xlatb78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
mediump float u_xlat16_89;
bool u_xlatb89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_53.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_27.x * u_xlat16_53.x;
    u_xlat16_27.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_27.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_27.x);
#endif
    u_xlat16_27.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_27.x, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_27.xyz = u_xlat16_3.xyz * u_xlat16_27.yyy + u_xlat16_4.xyz;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_27.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_29, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _alphaClipPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_5.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_5.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_52.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat52.xy = (-u_xlat16_52.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat2.xyz);
    u_xlat80 = (-_ShadeRange) + _DetailRange;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_81 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_81) + vs_TEXCOORD2.yzx;
    u_xlat86 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat86 = max(u_xlat86, 1.17549435e-38);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat10.xyz = vec3(u_xlat86) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat86 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat86 = max(u_xlat86, 1.17549435e-38);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat11.xyz = vec3(u_xlat86) * u_xlat8.xyz;
    u_xlat88 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat89 = u_xlat88 + (-_ShadeRange);
    u_xlat12.x = min(u_xlat88, 1.0);
    u_xlat80 = u_xlat80 * u_xlat89;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat88 = u_xlat80 * -2.0 + 3.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat88;
    u_xlat16_81 = min(u_xlat52.x, u_xlat80);
    u_xlat16_81 = u_xlat16_81 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz + u_xlat2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_4.xyz = u_xlat52.yyy * u_xlat16_4.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_81 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_81) * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_6.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + u_xlat16_27.xyz;
    u_xlat80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_82) + 1.0;
    u_xlat16_82 = u_xlat80 * u_xlat80;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat88 = (-u_xlat16_82) * u_xlat80 + 1.0;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat88);
    u_xlat13.xyz = u_xlat0.xxx * vec3(u_xlat16_82) + u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat14.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat14.xy = u_xlat14.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat14.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb88 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat88 = (u_xlatb88) ? 1.0 : -1.0;
    u_xlat88 = u_xlat88 * vs_TEXCOORD2.w;
    u_xlat89 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat89) + u_xlat10.xyz;
    u_xlat89 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat89);
    u_xlat14.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat14.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat88) * u_xlat14.xyz;
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat14.zxy;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat15.xyz = vec3(u_xlat88) * u_xlat15.xyz;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseAO2U>=0.5);
#else
    u_xlatb89 = _UseAO2U>=0.5;
#endif
    u_xlat16_32.xy = (bool(u_xlatb89)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_7.xy = (bool(u_xlatb89)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_32.xy = u_xlat16_32.xy + u_xlat16_7.xy;
    u_xlat16_89 = texture(_materialParamsMap, u_xlat16_32.xy).z;
    u_xlat16_82 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_89));
    u_xlat16_83 = u_xlat16_82 + -1.0;
    u_xlat90 = (-u_xlat16_83) + 1.0;
    u_xlat16_32.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat90 = u_xlat90 * u_xlat16_32.x;
    u_xlat90 = max(u_xlat90, 0.00100000005);
    u_xlat16.z = u_xlat88 * u_xlat90;
    u_xlat16_58.x = dot(u_xlat10.zxy, u_xlat16_27.xyz);
    u_xlat16.x = dot(u_xlat11.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat88 = u_xlat16_82 * u_xlat16_32.x;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat16.y = u_xlat16_58.x * u_xlat88;
    u_xlat91 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat16.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat16_27.xyz = u_xlat26.xyz * vec3(u_xlat16_81);
    u_xlat92 = dot(u_xlat15.xyz, u_xlat16_27.xyz);
    u_xlat17.z = u_xlat90 * u_xlat92;
    u_xlat92 = dot(u_xlat10.zxy, u_xlat16_27.xyz);
    u_xlat17.y = u_xlat88 * u_xlat92;
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat92 = sqrt(u_xlat92);
    u_xlat92 = u_xlat92 + u_xlat17.x;
    u_xlat92 = u_xlat92 + 6.10351563e-05;
    u_xlat91 = u_xlat92 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat93 = dot(u_xlat15.xyz, u_xlat2.xyz);
    u_xlat18.y = u_xlat88 * u_xlat93;
    u_xlat16_82 = dot(u_xlat10.zxy, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_82 * u_xlat90;
    u_xlat28.x = u_xlat90 * u_xlat88;
    u_xlat18.z = u_xlat2.x * u_xlat28.x;
    u_xlat2.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat54 = u_xlat28.x * 0.318309873;
    u_xlat2.x = u_xlat54 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat91 * u_xlat2.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat16.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_3.xyz * u_xlat13.xyz;
    u_xlat16_42.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_7.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_7.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_7.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_7.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_58.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat42.xy = u_xlat16_42.xy * u_xlat16_7.xz + u_xlat16_7.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xy = min(max(u_xlat42.xy, 0.0), 1.0);
#else
    u_xlat42.xy = clamp(u_xlat42.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat42.xxx;
    u_xlat18.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
    u_xlat2.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat2.x * u_xlat88;
    u_xlat16_82 = dot(u_xlat10.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_82 * u_xlat90;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_82 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat91 = (-u_xlat16_82) + 1.0;
    u_xlat19.z = u_xlat2.x * u_xlat28.x;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat54 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat93 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat90 * u_xlat93;
    u_xlat16_82 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_82 * u_xlat88;
    u_xlat38 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat12.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat92 * u_xlat38 + 6.10351563e-05;
    u_xlat38 = float(1.0) / u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat16_82 = u_xlat91 * u_xlat91;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat38 = (-u_xlat16_82) * u_xlat91 + 1.0;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat18.xyz = u_xlat16_5.xyz * vec3(u_xlat38);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_82) + u_xlat18.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat12.xxx * u_xlat18.xyz;
    u_xlat16_7.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_82 = max(u_xlat16_82, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_82);
    u_xlat16_9.xyz = vec3(u_xlat16_85) * u_xlat13.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat13.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + u_xlat16_9.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat2.x = dot(u_xlat15.xyz, u_xlat16_9.xyz);
    u_xlat15.z = u_xlat2.x * u_xlat90;
    u_xlat18.y = u_xlat78 * u_xlat88;
    u_xlat16_85 = dot(u_xlat10.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat16_85 * u_xlat90;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat78 * u_xlat28.x;
    u_xlat78 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat28.x / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat54 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat16_85 = dot(u_xlat10.zxy, u_xlat16_9.xyz);
    u_xlat15.y = u_xlat16_85 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat28.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat15.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat92 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat78 = u_xlat78 * u_xlat28.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat28.x = (-u_xlat16_9.x) * u_xlat2.x + 1.0;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat28.xxx;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_9.xxx + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat15.xxx * u_xlat2.xyz;
    u_xlat16_9.x = u_xlat16_82 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_82 = float(1.0) / float(u_xlat16_82);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_82 = u_xlat16_82 * u_xlat16_9.x;
    u_xlat16_82 = max(u_xlat16_20.x, u_xlat16_82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_9.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_9.x);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_85;
    u_xlat16_9.xyz = vec3(u_xlat16_82) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz * u_xlat42.yyy + u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat42.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_82 = u_xlat16.x + (-_AdditionalLightCompensateStart);
    u_xlat16_82 = (-u_xlat16_82);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_20.xyz;
    u_xlat16_85 = u_xlat12.x + (-_MainLightCompensateStart);
    u_xlat16_85 = (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat42.yyy * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat15.xxx + u_xlat16_20.xyz;
    u_xlat16_87 = u_xlat15.x + (-_AdditionalLightCompensateStart);
    u_xlat16_87 = (-u_xlat16_87);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat8.xyz) * vec3(u_xlat86) + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat11.xyz;
    u_xlat16_98 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_22.xyz = vec3(u_xlat16_98) * u_xlat16_22.xyz;
    u_xlat16_98 = dot(u_xlat16_22.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_98 * 0.5 + 0.5;
    u_xlat16_99 = (-u_xlat16_98) + u_xlat16_99;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_98 = u_xlat16_49.z * u_xlat16_99 + u_xlat16_98;
    u_xlat16_98 = u_xlat16_49.z * u_xlat16_98;
    u_xlat16_99 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 + -1.0;
    u_xlat16_99 = _occlusionScale * u_xlat16_99 + 1.0;
    u_xlat16_98 = u_xlat16_98 * u_xlat16_99;
    u_xlat0.x = min(u_xlat16_98, 1.0);
    u_xlat78 = min(u_xlat0.x, u_xlat16_89);
    u_xlat16_21.xyz = vec3(u_xlat78) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat78) * u_xlat16_21.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat78) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat78) * u_xlat16_24.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat78) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_24.xyz * vec3(u_xlat78) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_99) * u_xlat16_25.xyz;
    u_xlati78 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati78].xyz;
    u_xlati78 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati2.x = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati78].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_98 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_20.xyz = u_xlat16_24.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_21.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_21.x = inversesqrt(u_xlat16_21.x);
    u_xlat16_21.xyz = u_xlat16_21.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_21.xyz + u_xlat14.xyz;
    u_xlat78 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb78 = u_xlat16_83>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb78)) ? u_xlat2.xyz : u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_27.xyz * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.zxy * u_xlat16_27.yzx + (-u_xlat10.xyz);
    u_xlat12.xyz = u_xlat2.xyz * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat10.zxy * u_xlat2.yzx + (-u_xlat12.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat86) + u_xlat2.xyz;
    u_xlat16_21.x = u_xlat16_32.x * 8.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.x = abs(u_xlat16_83) * u_xlat16_21.x;
    u_xlat2.xyz = u_xlat16_21.xxx * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat78 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
    u_xlat16_21.x = dot((-u_xlat16_27.xyz), u_xlat2.xyz);
    u_xlat16_21.x = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_21.xxx + (-u_xlat16_27.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat86) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat16_32.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.xyz + (-u_xlat8.xyz);
    u_xlat8.xyz = abs(vec3(u_xlat16_83)) * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat16_27.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_27.x = u_xlat16_6.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_27.x);
    u_xlat78 = dot(u_xlat16_22.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat16_22.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_49.y = u_xlat78 * 0.5;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat21.xyz, u_xlat16_27.x);
    u_xlat16_22.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat28.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_98) * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb78 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb78)) ? u_xlat16_24.xyz : u_xlat16_22.xyz;
    u_xlat17.y = u_xlat16_6.x;
    u_xlat16_49.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_23.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xxx + u_xlat16_28.yyy;
    u_xlat16_5.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz;
    u_xlat16_8.yzw = u_xlat16_23.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_27.x = floor(u_xlat16_8.w);
    u_xlat16_1.z = u_xlat16_27.x + 1.0;
    u_xlat16_1.xz = min(u_xlat16_1.xz, vec2(1.0, 15.0));
    u_xlat16_8.x = u_xlat16_1.z * 16.0 + u_xlat16_8.z;
    u_xlat16_6.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_8.x = u_xlat16_27.x * 16.0 + u_xlat16_8.z;
    u_xlat16_6.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_27.x = u_xlat16_23.z * 15.0 + (-u_xlat16_27.x);
    u_xlat16_53.x = u_xlat16_78 + (-u_xlat16_28.x);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_53.x + u_xlat16_28.x;
    u_xlat16_27.x = u_xlat16_99 * u_xlat16_27.x;
    u_xlat78 = u_xlat2.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat0.x * 0.5;
    u_xlat16_53.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_27.x = u_xlat78 * u_xlat16_53.x + u_xlat16_27.x;
    u_xlat16_53.x = u_xlat16_27.x + u_xlat16_27.x;
    u_xlat16_83 = (-u_xlat16_27.x) * 2.0 + 1.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_83 + u_xlat16_53.x;
    u_xlat16_27.x = u_xlat0.x * u_xlat16_27.x;
    u_xlat16_27.x = min(u_xlat16_27.x, u_xlat16_89);
    u_xlat16_5.xyz = u_xlat16_27.xxx * u_xlat16_5.xyz;
    u_xlat16_22.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_27.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_6.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_85 / u_xlat16_6.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _MainLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_83 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_83 = u_xlat16_83 / u_xlat16_6.y;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_6.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_82 / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_82 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_82 = u_xlat16_82 / u_xlat16_7.y;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_82;
    u_xlat16_33.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_33.xyz;
    u_xlat16_3.xyz = u_xlat42.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_6.yyy + u_xlat16_3.xyz;
    u_xlat16_53.x = u_xlat16_87 / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_53.x = u_xlat16_82 * u_xlat16_53.x;
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat42.yyy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.yyy + u_xlat16_5.xyz;
    u_xlat16_53.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_53.x = float(1.0) / u_xlat16_53.x;
    u_xlat16_5.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_83 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_53.x = (-u_xlat16_53.x) * u_xlat16_53.x + 1.0;
    u_xlat16_53.x = max(u_xlat16_53.x, 0.0);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_33.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_33.xyz = u_xlat16_53.xxx * u_xlat16_33.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_33.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_5.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_53.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_53.x = (-u_xlat16_53.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53.x = min(max(u_xlat16_53.x, 0.0), 1.0);
#else
    u_xlat16_53.x = clamp(u_xlat16_53.x, 0.0, 1.0);
#endif
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_53.x = u_xlat16_82 * u_xlat16_53.x;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_4.xyz = u_xlat16_33.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_7.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_7.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.yyy + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xxx * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.yyy + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat10.x = u_xlat26.x * u_xlat16_81 + _Sanshe_X;
    u_xlat10.y = u_xlat26.y * u_xlat16_81 + _Sanshe_Y;
    u_xlat10.z = u_xlat16_27.z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb78 = _UseSansheMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_53.xy = u_xlat16_12.xy * u_xlat16_53.xx + u_xlat16_53.yy;
    u_xlat16_4.x = u_xlat16_12.z * u_xlat16_58.x + u_xlat16_58.y;
    u_xlat10.x = u_xlat26.x * u_xlat16_81 + _Sanshe2_X;
    u_xlat10.y = u_xlat26.y * u_xlat16_81 + _Sanshe2_Y;
    u_xlat26.x = dot(u_xlat2.xyz, u_xlat10.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = max(u_xlat26.x, 0.00048828125);
    u_xlat26.x = log2(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _Sanshe2_Fw;
    u_xlat26.x = exp2(u_xlat26.x);
    u_xlat0.y = u_xlat26.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_53.xy;
    u_xlat2.xyz = u_xlat0.yyy * _Sanshe2_color.xyz;
    u_xlat26.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = u_xlat0.xxx * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_53.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_53.x = inversesqrt(u_xlat16_53.x);
    u_xlat16_5.xyz = u_xlat16_53.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.xyz;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
    u_xlat16_4.xyz = u_xlat0.xzw * u_xlat16_4.xxx + u_xlat16_30.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_52.x = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_4.xyz = u_xlat16_52.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) * u_xlat16_52.xxx + _FogCol.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_53.x = _PostExposure + _ExposureCompensate;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_53.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat52.x = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-u_xlat52.xxx) + u_xlat2.xyz;
    u_xlat78 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat78;
    u_xlat0.x = max(u_xlat0.x, u_xlat26.x);
    u_xlat16_53.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x + _Saturation;
    u_xlat0.xyz = u_xlat16_53.xxx * u_xlat2.xyz + u_xlat52.xxx;
    u_xlat16_53.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb78 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_81 = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_2.xy = vec2(u_xlat16_81) * u_xlat16_53.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_53.x = float(1.0);
    u_xlat16_53.y = float(-1.0);
    u_xlat16_2.zw = vec2(u_xlat16_81) * u_xlat16_53.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_2.xyw);
    u_xlat16_5.yzw = u_xlat16_2.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb26 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_53.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16_79 = u_xlat16_53.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_53.xxx * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_53.x = min(u_xlat16_79, u_xlat16_4.y);
    u_xlat16_79 = u_xlat16_79 + (-u_xlat16_4.y);
    u_xlat16_53.x = (-u_xlat16_53.x) + u_xlat16_4.x;
    u_xlat16_81 = u_xlat16_53.x * 6.0 + 9.99999975e-05;
    u_xlat16_79 = u_xlat16_79 / u_xlat16_81;
    u_xlat16_79 = u_xlat16_79 + u_xlat16_4.z;
    u_xlat16_79 = abs(u_xlat16_79) + _HueShift;
    u_xlat16_30.xyz = vec3(u_xlat16_79) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_30.xyz = fract(u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_30.xyz = abs(u_xlat16_30.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_79 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_79;
    u_xlat16_30.xyz = u_xlat16_53.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_30.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_53.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_53.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_27.x : u_xlat16_1.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec2 u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_33;
float u_xlat38;
vec2 u_xlat42;
mediump vec2 u_xlat16_42;
mediump vec3 u_xlat16_49;
vec2 u_xlat52;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
float u_xlat54;
mediump vec2 u_xlat16_58;
float u_xlat78;
mediump float u_xlat16_78;
int u_xlati78;
bool u_xlatb78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
mediump float u_xlat16_89;
bool u_xlatb89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_53.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_27.x * u_xlat16_53.x;
    u_xlat16_27.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_27.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_27.x);
#endif
    u_xlat16_27.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_27.x, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_27.xyz = u_xlat16_3.xyz * u_xlat16_27.yyy + u_xlat16_4.xyz;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_27.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_29, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _alphaClipPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_5.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_5.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_52.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat52.xy = (-u_xlat16_52.xy) + vec2(1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat2.xyz);
    u_xlat80 = (-_ShadeRange) + _DetailRange;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_81 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_81) + vs_TEXCOORD2.yzx;
    u_xlat86 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat86 = max(u_xlat86, 1.17549435e-38);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat10.xyz = vec3(u_xlat86) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat86 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat86 = max(u_xlat86, 1.17549435e-38);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat11.xyz = vec3(u_xlat86) * u_xlat8.xyz;
    u_xlat88 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat89 = u_xlat88 + (-_ShadeRange);
    u_xlat12.x = min(u_xlat88, 1.0);
    u_xlat80 = u_xlat80 * u_xlat89;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat88 = u_xlat80 * -2.0 + 3.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat88;
    u_xlat16_81 = min(u_xlat52.x, u_xlat80);
    u_xlat16_81 = u_xlat16_81 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz + u_xlat2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_4.xyz = u_xlat52.yyy * u_xlat16_4.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_81 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_81) * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_6.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + u_xlat16_27.xyz;
    u_xlat80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_82) + 1.0;
    u_xlat16_82 = u_xlat80 * u_xlat80;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat88 = (-u_xlat16_82) * u_xlat80 + 1.0;
    u_xlat16_82 = u_xlat80 * u_xlat16_82;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat88);
    u_xlat13.xyz = u_xlat0.xxx * vec3(u_xlat16_82) + u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat14.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat14.xy = u_xlat14.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat14.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb88 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat88 = (u_xlatb88) ? 1.0 : -1.0;
    u_xlat88 = u_xlat88 * vs_TEXCOORD2.w;
    u_xlat89 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat89) + u_xlat10.xyz;
    u_xlat89 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat89);
    u_xlat14.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat14.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat88) * u_xlat14.xyz;
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat14.zxy;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat15.xyz = vec3(u_xlat88) * u_xlat15.xyz;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseAO2U>=0.5);
#else
    u_xlatb89 = _UseAO2U>=0.5;
#endif
    u_xlat16_32.xy = (bool(u_xlatb89)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_7.xy = (bool(u_xlatb89)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_32.xy = u_xlat16_32.xy + u_xlat16_7.xy;
    u_xlat16_89 = texture(_materialParamsMap, u_xlat16_32.xy).z;
    u_xlat16_82 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_89));
    u_xlat16_83 = u_xlat16_82 + -1.0;
    u_xlat90 = (-u_xlat16_83) + 1.0;
    u_xlat16_32.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat90 = u_xlat90 * u_xlat16_32.x;
    u_xlat90 = max(u_xlat90, 0.00100000005);
    u_xlat16.z = u_xlat88 * u_xlat90;
    u_xlat16_58.x = dot(u_xlat10.zxy, u_xlat16_27.xyz);
    u_xlat16.x = dot(u_xlat11.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat88 = u_xlat16_82 * u_xlat16_32.x;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat16.y = u_xlat16_58.x * u_xlat88;
    u_xlat91 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat16.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat16_27.xyz = u_xlat26.xyz * vec3(u_xlat16_81);
    u_xlat92 = dot(u_xlat15.xyz, u_xlat16_27.xyz);
    u_xlat17.z = u_xlat90 * u_xlat92;
    u_xlat92 = dot(u_xlat10.zxy, u_xlat16_27.xyz);
    u_xlat17.y = u_xlat88 * u_xlat92;
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat92 = sqrt(u_xlat92);
    u_xlat92 = u_xlat92 + u_xlat17.x;
    u_xlat92 = u_xlat92 + 6.10351563e-05;
    u_xlat91 = u_xlat92 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat93 = dot(u_xlat15.xyz, u_xlat2.xyz);
    u_xlat18.y = u_xlat88 * u_xlat93;
    u_xlat16_82 = dot(u_xlat10.zxy, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_82 * u_xlat90;
    u_xlat28.x = u_xlat90 * u_xlat88;
    u_xlat18.z = u_xlat2.x * u_xlat28.x;
    u_xlat2.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat54 = u_xlat28.x * 0.318309873;
    u_xlat2.x = u_xlat54 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat91 * u_xlat2.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat16.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_3.xyz * u_xlat13.xyz;
    u_xlat16_42.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_7.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_7.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_7.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_7.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_58.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat42.xy = u_xlat16_42.xy * u_xlat16_7.xz + u_xlat16_7.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xy = min(max(u_xlat42.xy, 0.0), 1.0);
#else
    u_xlat42.xy = clamp(u_xlat42.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat42.xxx;
    u_xlat18.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
    u_xlat2.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat2.x * u_xlat88;
    u_xlat16_82 = dot(u_xlat10.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_82 * u_xlat90;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_82 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat91 = (-u_xlat16_82) + 1.0;
    u_xlat19.z = u_xlat2.x * u_xlat28.x;
    u_xlat2.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat54 * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat93 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat90 * u_xlat93;
    u_xlat16_82 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_82 * u_xlat88;
    u_xlat38 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat12.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat92 * u_xlat38 + 6.10351563e-05;
    u_xlat38 = float(1.0) / u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat16_82 = u_xlat91 * u_xlat91;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat38 = (-u_xlat16_82) * u_xlat91 + 1.0;
    u_xlat16_82 = u_xlat91 * u_xlat16_82;
    u_xlat18.xyz = u_xlat16_5.xyz * vec3(u_xlat38);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_82) + u_xlat18.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat12.xxx * u_xlat18.xyz;
    u_xlat16_7.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_82 = max(u_xlat16_82, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_82);
    u_xlat16_9.xyz = vec3(u_xlat16_85) * u_xlat13.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat13.xyz = u_xlat26.xyz * vec3(u_xlat16_81) + u_xlat16_9.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat2.x = dot(u_xlat15.xyz, u_xlat16_9.xyz);
    u_xlat15.z = u_xlat2.x * u_xlat90;
    u_xlat18.y = u_xlat78 * u_xlat88;
    u_xlat16_85 = dot(u_xlat10.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat16_85 * u_xlat90;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat78 * u_xlat28.x;
    u_xlat78 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat28.x / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat54 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat16_85 = dot(u_xlat10.zxy, u_xlat16_9.xyz);
    u_xlat15.y = u_xlat16_85 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat28.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat15.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat92 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat78 = u_xlat78 * u_xlat28.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat28.x = (-u_xlat16_9.x) * u_xlat2.x + 1.0;
    u_xlat16_9.x = u_xlat2.x * u_xlat16_9.x;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat28.xxx;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_9.xxx + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat15.xxx * u_xlat2.xyz;
    u_xlat16_9.x = u_xlat16_82 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_82 = float(1.0) / float(u_xlat16_82);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_82 = u_xlat16_82 * u_xlat16_9.x;
    u_xlat16_82 = max(u_xlat16_20.x, u_xlat16_82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_9.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_9.x);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_85;
    u_xlat16_9.xyz = vec3(u_xlat16_82) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz * u_xlat42.yyy + u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat42.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_82 = u_xlat16.x + (-_AdditionalLightCompensateStart);
    u_xlat16_82 = (-u_xlat16_82);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_20.xyz;
    u_xlat16_85 = u_xlat12.x + (-_MainLightCompensateStart);
    u_xlat16_85 = (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat42.yyy * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat15.xxx + u_xlat16_20.xyz;
    u_xlat16_87 = u_xlat15.x + (-_AdditionalLightCompensateStart);
    u_xlat16_87 = (-u_xlat16_87);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat8.xyz) * vec3(u_xlat86) + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat11.xyz;
    u_xlat16_98 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_22.xyz = vec3(u_xlat16_98) * u_xlat16_22.xyz;
    u_xlat16_98 = dot(u_xlat16_22.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_98 * 0.5 + 0.5;
    u_xlat16_99 = (-u_xlat16_98) + u_xlat16_99;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_98 = u_xlat16_49.z * u_xlat16_99 + u_xlat16_98;
    u_xlat16_98 = u_xlat16_49.z * u_xlat16_98;
    u_xlat16_99 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 + -1.0;
    u_xlat16_99 = _occlusionScale * u_xlat16_99 + 1.0;
    u_xlat16_98 = u_xlat16_98 * u_xlat16_99;
    u_xlat0.x = min(u_xlat16_98, 1.0);
    u_xlat78 = min(u_xlat0.x, u_xlat16_89);
    u_xlat16_21.xyz = vec3(u_xlat78) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat78) * u_xlat16_21.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat78) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat78) * u_xlat16_24.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat78) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_24.xyz * vec3(u_xlat78) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_99) * u_xlat16_25.xyz;
    u_xlati78 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati78].xyz;
    u_xlati78 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati2.x = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati78].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_98 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_20.xyz = u_xlat16_24.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_21.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_21.x = inversesqrt(u_xlat16_21.x);
    u_xlat16_21.xyz = u_xlat16_21.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_21.xyz + u_xlat14.xyz;
    u_xlat78 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb78 = u_xlat16_83>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb78)) ? u_xlat2.xyz : u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_27.xyz * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.zxy * u_xlat16_27.yzx + (-u_xlat10.xyz);
    u_xlat12.xyz = u_xlat2.xyz * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat10.zxy * u_xlat2.yzx + (-u_xlat12.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat86) + u_xlat2.xyz;
    u_xlat16_21.x = u_xlat16_32.x * 8.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.x = abs(u_xlat16_83) * u_xlat16_21.x;
    u_xlat2.xyz = u_xlat16_21.xxx * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat78 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xyz = vec3(u_xlat78) * u_xlat2.xyz;
    u_xlat16_21.x = dot((-u_xlat16_27.xyz), u_xlat2.xyz);
    u_xlat16_21.x = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_21.xxx + (-u_xlat16_27.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat86) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat16_32.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.xyz + (-u_xlat8.xyz);
    u_xlat8.xyz = abs(vec3(u_xlat16_83)) * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat16_27.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_27.x = u_xlat16_6.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_27.x);
    u_xlat78 = dot(u_xlat16_22.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat16_22.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_49.y = u_xlat78 * 0.5;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat21.xyz, u_xlat16_27.x);
    u_xlat16_22.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat28.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_98) * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb78 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb78)) ? u_xlat16_24.xyz : u_xlat16_22.xyz;
    u_xlat17.y = u_xlat16_6.x;
    u_xlat16_49.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_23.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xxx + u_xlat16_28.yyy;
    u_xlat16_5.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz;
    u_xlat16_8.yzw = u_xlat16_23.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_27.x = floor(u_xlat16_8.w);
    u_xlat16_1.z = u_xlat16_27.x + 1.0;
    u_xlat16_1.xz = min(u_xlat16_1.xz, vec2(1.0, 15.0));
    u_xlat16_8.x = u_xlat16_1.z * 16.0 + u_xlat16_8.z;
    u_xlat16_6.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_8.x = u_xlat16_27.x * 16.0 + u_xlat16_8.z;
    u_xlat16_6.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_27.x = u_xlat16_23.z * 15.0 + (-u_xlat16_27.x);
    u_xlat16_53.x = u_xlat16_78 + (-u_xlat16_28.x);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_53.x + u_xlat16_28.x;
    u_xlat16_27.x = u_xlat16_99 * u_xlat16_27.x;
    u_xlat78 = u_xlat2.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat0.x * 0.5;
    u_xlat16_53.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_27.x = u_xlat78 * u_xlat16_53.x + u_xlat16_27.x;
    u_xlat16_53.x = u_xlat16_27.x + u_xlat16_27.x;
    u_xlat16_83 = (-u_xlat16_27.x) * 2.0 + 1.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_83 + u_xlat16_53.x;
    u_xlat16_27.x = u_xlat0.x * u_xlat16_27.x;
    u_xlat16_27.x = min(u_xlat16_27.x, u_xlat16_89);
    u_xlat16_5.xyz = u_xlat16_27.xxx * u_xlat16_5.xyz;
    u_xlat16_22.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_27.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_6.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_85 / u_xlat16_6.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _MainLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_83 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_83 = u_xlat16_83 / u_xlat16_6.y;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_6.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_82 / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_82 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_82 = u_xlat16_82 / u_xlat16_7.y;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_82;
    u_xlat16_33.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_33.xyz;
    u_xlat16_3.xyz = u_xlat42.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_6.yyy + u_xlat16_3.xyz;
    u_xlat16_53.x = u_xlat16_87 / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_53.x = u_xlat16_82 * u_xlat16_53.x;
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat42.yyy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.yyy + u_xlat16_5.xyz;
    u_xlat16_53.x = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_53.x = float(1.0) / u_xlat16_53.x;
    u_xlat16_5.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_83 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_53.x = (-u_xlat16_53.x) * u_xlat16_53.x + 1.0;
    u_xlat16_53.x = max(u_xlat16_53.x, 0.0);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_83;
    u_xlat16_33.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_33.xyz = u_xlat16_53.xxx * u_xlat16_33.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_33.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_5.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_53.x = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_53.x = (-u_xlat16_53.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53.x = min(max(u_xlat16_53.x, 0.0), 1.0);
#else
    u_xlat16_53.x = clamp(u_xlat16_53.x, 0.0, 1.0);
#endif
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_7.x;
    u_xlat16_53.x = log2(abs(u_xlat16_53.x));
    u_xlat16_53.x = u_xlat16_53.x * _AdditionalLightCompensatePow;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat16_53.x = u_xlat16_82 * u_xlat16_53.x;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_53.xxx;
    u_xlat16_4.xyz = u_xlat16_33.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_7.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_7.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.yyy + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xxx * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.yyy + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat10.x = u_xlat26.x * u_xlat16_81 + _Sanshe_X;
    u_xlat10.y = u_xlat26.y * u_xlat16_81 + _Sanshe_Y;
    u_xlat10.z = u_xlat16_27.z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb78 = _UseSansheMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_53.xy = u_xlat16_12.xy * u_xlat16_53.xx + u_xlat16_53.yy;
    u_xlat16_4.x = u_xlat16_12.z * u_xlat16_58.x + u_xlat16_58.y;
    u_xlat10.x = u_xlat26.x * u_xlat16_81 + _Sanshe2_X;
    u_xlat10.y = u_xlat26.y * u_xlat16_81 + _Sanshe2_Y;
    u_xlat26.x = dot(u_xlat2.xyz, u_xlat10.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = max(u_xlat26.x, 0.00048828125);
    u_xlat26.x = log2(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _Sanshe2_Fw;
    u_xlat26.x = exp2(u_xlat26.x);
    u_xlat0.y = u_xlat26.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_53.xy;
    u_xlat2.xyz = u_xlat0.yyy * _Sanshe2_color.xyz;
    u_xlat26.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = u_xlat0.xxx * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_53.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_53.x = inversesqrt(u_xlat16_53.x);
    u_xlat16_5.xyz = u_xlat16_53.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.xyz;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
    u_xlat16_4.xyz = u_xlat0.xzw * u_xlat16_4.xxx + u_xlat16_30.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_52.x = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_4.xyz = u_xlat16_52.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) * u_xlat16_52.xxx + _FogCol.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_53.x = _PostExposure + _ExposureCompensate;
    u_xlat16_53.x = exp2(u_xlat16_53.x);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_53.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat52.x = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-u_xlat52.xxx) + u_xlat2.xyz;
    u_xlat78 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat78;
    u_xlat0.x = max(u_xlat0.x, u_xlat26.x);
    u_xlat16_53.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x + _Saturation;
    u_xlat0.xyz = u_xlat16_53.xxx * u_xlat2.xyz + u_xlat52.xxx;
    u_xlat16_53.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb78 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_81 = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_2.xy = vec2(u_xlat16_81) * u_xlat16_53.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_53.x = float(1.0);
    u_xlat16_53.y = float(-1.0);
    u_xlat16_2.zw = vec2(u_xlat16_81) * u_xlat16_53.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_2.xyw);
    u_xlat16_5.yzw = u_xlat16_2.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb26 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_53.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16_79 = u_xlat16_53.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_53.xxx * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_53.x = min(u_xlat16_79, u_xlat16_4.y);
    u_xlat16_79 = u_xlat16_79 + (-u_xlat16_4.y);
    u_xlat16_53.x = (-u_xlat16_53.x) + u_xlat16_4.x;
    u_xlat16_81 = u_xlat16_53.x * 6.0 + 9.99999975e-05;
    u_xlat16_79 = u_xlat16_79 / u_xlat16_81;
    u_xlat16_79 = u_xlat16_79 + u_xlat16_4.z;
    u_xlat16_79 = abs(u_xlat16_79) + _HueShift;
    u_xlat16_30.xyz = vec3(u_xlat16_79) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_30.xyz = fract(u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_30.xyz = abs(u_xlat16_30.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_79 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_79;
    u_xlat16_30.xyz = u_xlat16_53.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_30.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_53.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_53.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_27.x : u_xlat16_1.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
bool u_xlatb29;
float u_xlat31;
mediump vec3 u_xlat16_31;
vec3 u_xlat33;
bool u_xlatb33;
vec3 u_xlat38;
mediump vec3 u_xlat16_38;
vec3 u_xlat40;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_44;
float u_xlat46;
vec3 u_xlat47;
mediump vec3 u_xlat16_54;
float u_xlat58;
mediump float u_xlat16_58;
int u_xlati58;
float u_xlat60;
float u_xlat62;
vec2 u_xlat67;
mediump vec2 u_xlat16_67;
mediump float u_xlat16_70;
mediump vec2 u_xlat16_72;
float u_xlat74;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat89;
bool u_xlatb89;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
bool u_xlatb94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat103;
mediump float u_xlat16_106;
mediump float u_xlat16_107;
mediump float u_xlat16_108;
mediump float u_xlat16_109;
mediump float u_xlat16_111;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb89 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat93 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat6.xyz = vec3(u_xlat93) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat93 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat9.xyz = vec3(u_xlat93) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat93 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat10.xyz = vec3(u_xlat93) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb89)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat89 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat89 = u_xlat1.z + (-u_xlat89);
    u_xlat3.x = max((-u_xlat1.w), u_xlat89);
    u_xlat3.x = (-u_xlat89) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat89;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat31 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_31.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_31.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat31 = u_xlat16_31.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat60 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz + _shadowColor.xyz;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_95 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_95 = max(u_xlat16_95, 6.10351563e-05);
    u_xlat16_12.x = u_xlat16_95 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_41 = float(1.0) / float(u_xlat16_95);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_95);
    u_xlat16_95 = u_xlat16_12.x * u_xlat16_41;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_95 = max(u_xlat16_95, u_xlat16_12.x);
    u_xlat16_12.xzw = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.yyy + u_xlat16_12.xzw;
    u_xlat16_99 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_99 = u_xlat16_99 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 * u_xlat16_99;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_13.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_13.x);
    u_xlat16_95 = u_xlat16_95 * u_xlat16_99;
    u_xlat16_13.xyz = vec3(u_xlat16_95) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_anisoUse2U);
#else
    u_xlatb4 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_4.x = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat4.x = u_xlat4.x * _sunShift + _sunShiftOffset;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb33 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat33.x = (u_xlatb33) ? 1.0 : -1.0;
    u_xlat33.x = u_xlat33.x * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat62) + u_xlat9.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat33.xyz = u_xlat33.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat10.xyz + u_xlat33.zxy;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat6.xyz = vec3(u_xlat92) * u_xlat6.xyz;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb94 = !!(_UseAO2U>=0.5);
#else
    u_xlatb94 = _UseAO2U>=0.5;
#endif
    u_xlat16_14.xy = (bool(u_xlatb94)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_72.xy = (bool(u_xlatb94)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_14.xy = u_xlat16_72.xy + u_xlat16_14.xy;
    u_xlat16_94 = texture(_materialParamsMap, u_xlat16_14.xy).z;
    u_xlat16_95 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_94));
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat9.x = (-u_xlat16_99) + 1.0;
    u_xlat16_38.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_14.xy = u_xlat16_38.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_100 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat9.x = u_xlat9.x * u_xlat16_100;
    u_xlat9.x = max(u_xlat9.x, 0.00100000005);
    u_xlat11.z = u_xlat92 * u_xlat9.x;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat92 = u_xlat16_95 * u_xlat16_100;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat11.y = u_xlat16_72.x * u_xlat92;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat38.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat38.x = sqrt(u_xlat38.x);
    u_xlat38.x = u_xlat38.x + u_xlat11.x;
    u_xlat38.x = u_xlat38.x + 6.10351563e-05;
    u_xlat40.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_95 = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_15.xyz = vec3(u_xlat16_95) * u_xlat40.xyz;
    u_xlat97 = dot(u_xlat6.xyz, u_xlat16_15.xyz);
    u_xlat16.z = u_xlat9.x * u_xlat97;
    u_xlat97 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat16.y = u_xlat92 * u_xlat97;
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat16.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat38.x = u_xlat97 * u_xlat38.x + 6.10351563e-05;
    u_xlat38.x = float(1.0) / u_xlat38.x;
    u_xlat17.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + u_xlat16_12.xyz;
    u_xlat74 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat17.xyz = vec3(u_xlat74) * u_xlat17.xyz;
    u_xlat74 = dot(u_xlat6.xyz, u_xlat17.xyz);
    u_xlat18.y = u_xlat92 * u_xlat74;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat17.xyz);
    u_xlat18.x = u_xlat9.x * u_xlat16_72.x;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_12.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat103 = (-u_xlat16_12.x) + 1.0;
    u_xlat17.x = u_xlat9.x * u_xlat92;
    u_xlat18.z = u_xlat74 * u_xlat17.x;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat17.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat46 = u_xlat17.x * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat46;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat38.x = u_xlat38.x * u_xlat74;
    u_xlat16_12.x = u_xlat103 * u_xlat103;
    u_xlat16_12.x = u_xlat103 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat103 * u_xlat16_12.x;
    u_xlat16_41 = u_xlat103 * u_xlat16_12.x;
    u_xlat74 = (-u_xlat16_12.x) * u_xlat103 + 1.0;
    u_xlat16_19.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_12.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_12.x = log2(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _alphaClipPower;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_20.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = u_xlat16_38.zzz * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_70 = (-u_xlat16_38.y) * _metallicMultiplier + 1.0;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz + (-u_xlat0.xyz);
    u_xlat87 = (-_ShadeRange) + _DetailRange;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat67.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat67.x = max(u_xlat67.x, 0.0);
    u_xlat96 = u_xlat67.x + (-_ShadeRange);
    u_xlat18.x = min(u_xlat67.x, 1.0);
    u_xlat87 = u_xlat87 * u_xlat96;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat67.x = u_xlat87 * -2.0 + 3.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat67.x;
    u_xlat16_67.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat67.xy = (-u_xlat16_67.xy) + vec2(1.0, 1.0);
    u_xlat16_72.x = min(u_xlat87, u_xlat67.x);
    u_xlat16_72.x = u_xlat16_72.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72.x = min(max(u_xlat16_72.x, 0.0), 1.0);
#else
    u_xlat16_72.x = clamp(u_xlat16_72.x, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_72.xxx * u_xlat16_22.xyz + u_xlat0.xyz;
    u_xlat16_19.xyz = (-u_xlat16_19.xyz) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat67.yyy * u_xlat16_19.xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = vec3(u_xlat16_70) * u_xlat16_19.xyz;
    u_xlat16_43.xyz = u_xlat16_14.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = u_xlat16_43.xyz * vec3(u_xlat74);
    u_xlat87 = u_xlat16_43.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat87) * vec3(u_xlat16_41) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat38.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat11.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat38.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat74 = dot(u_xlat38.xyz, u_xlat38.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
    u_xlat74 = dot(u_xlat6.xyz, u_xlat38.xyz);
    u_xlat23.y = u_xlat92 * u_xlat74;
    u_xlat16_41 = dot(u_xlat5.zxy, u_xlat38.xyz);
    u_xlat23.x = u_xlat9.x * u_xlat16_41;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat38.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat38.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat38.x = (-u_xlat16_41) + 1.0;
    u_xlat23.z = u_xlat74 * u_xlat17.x;
    u_xlat67.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat67.x = max(u_xlat67.x, 6.10351563e-05);
    u_xlat67.x = u_xlat17.x / u_xlat67.x;
    u_xlat67.x = u_xlat67.x * u_xlat67.x;
    u_xlat67.x = u_xlat46 * u_xlat67.x;
    u_xlat67.x = min(u_xlat67.x, 16.0);
    u_xlat96 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat96 * u_xlat9.x;
    u_xlat16_102 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat92 * u_xlat16_102;
    u_xlat96 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat18.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat96 = u_xlat97 * u_xlat96 + 6.10351563e-05;
    u_xlat96 = float(1.0) / u_xlat96;
    u_xlat67.x = u_xlat96 * u_xlat67.x;
    u_xlat16_102 = u_xlat38.x * u_xlat38.x;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat96 = (-u_xlat16_102) * u_xlat38.x + 1.0;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat47.xyz = u_xlat16_43.xyz * vec3(u_xlat96);
    u_xlat47.xyz = vec3(u_xlat87) * vec3(u_xlat16_102) + u_xlat47.xyz;
    u_xlat38.xyz = u_xlat67.xxx * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat38.xyz * _directSpecularColor.xyz;
    u_xlat38.xyz = u_xlat18.xxx * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat38.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat16_8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_106 = inversesqrt(u_xlat16_102);
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat16_106);
    u_xlat16_106 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_106));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_106);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_24.xyz;
    u_xlat0.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + u_xlat16_21.xyz;
    u_xlat38.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat38.x = inversesqrt(u_xlat38.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat38.xxx;
    u_xlat38.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat9.x;
    u_xlat23.y = u_xlat92 * u_xlat38.x;
    u_xlat16_106 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat23.x = u_xlat9.x * u_xlat16_106;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_106 = dot(u_xlat16_21.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_106) + 1.0;
    u_xlat23.z = u_xlat9.x * u_xlat17.x;
    u_xlat29.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat29.x = max(u_xlat29.x, 6.10351563e-05);
    u_xlat29.x = u_xlat17.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat46 * u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat16_106 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat6.y = u_xlat92 * u_xlat16_106;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat97 * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat29.x = u_xlat58 * u_xlat29.x;
    u_xlat16_107 = u_xlat0.x * u_xlat0.x;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat58 = (-u_xlat16_107) * u_xlat0.x + 1.0;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat9.xyz = u_xlat16_43.xyz * vec3(u_xlat58);
    u_xlat0.xzw = vec3(u_xlat87) * vec3(u_xlat16_107) + u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_107 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = float(1.0) / float(u_xlat16_102);
    u_xlat16_107 = (-u_xlat16_107) * u_xlat16_107 + 1.0;
    u_xlat16_107 = max(u_xlat16_107, 0.0);
    u_xlat16_107 = u_xlat16_107 * u_xlat16_107;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_107;
    u_xlat16_102 = max(u_xlat16_22.x, u_xlat16_102);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_107 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_106 = max(u_xlat16_106, u_xlat16_107);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_106;
    u_xlat16_21.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * vec3(u_xlat31) + u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_8.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat60) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_102 = u_xlat11.x + (-_AdditionalLightCompensateStart);
    u_xlat16_102 = (-u_xlat16_102);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_106 = u_xlat18.x + (-_MainLightCompensateStart);
    u_xlat16_106 = (-u_xlat16_106);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_24.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat31) * u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_24.xyz * u_xlat6.xxx + u_xlat16_22.xyz;
    u_xlat16_107 = u_xlat6.x + (-_AdditionalLightCompensateStart);
    u_xlat16_107 = (-u_xlat16_107);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_107 = min(max(u_xlat16_107, 0.0), 1.0);
#else
    u_xlat16_107 = clamp(u_xlat16_107, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = (-u_xlat7.xyz) * vec3(u_xlat93) + vs_TEXCOORD4.xyz;
    u_xlat16_24.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_24.xyz + u_xlat10.xyz;
    u_xlat16_108 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat16_108 = inversesqrt(u_xlat16_108);
    u_xlat16_24.xyz = vec3(u_xlat16_108) * u_xlat16_24.xyz;
    u_xlat16_108 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_108 = min(max(u_xlat16_108, 0.0), 1.0);
#else
    u_xlat16_108 = clamp(u_xlat16_108, 0.0, 1.0);
#endif
    u_xlat16_109 = u_xlat16_108 * 0.5 + 0.5;
    u_xlat16_109 = (-u_xlat16_108) + u_xlat16_109;
    u_xlat16_111 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_54.z = _occlusionScale * u_xlat16_111 + 1.0;
    u_xlat16_108 = u_xlat16_54.z * u_xlat16_109 + u_xlat16_108;
    u_xlat16_108 = u_xlat16_54.z * u_xlat16_108;
    u_xlat16_109 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_109 = min(max(u_xlat16_109, 0.0), 1.0);
#else
    u_xlat16_109 = clamp(u_xlat16_109, 0.0, 1.0);
#endif
    u_xlat16_109 = u_xlat16_109 + -1.0;
    u_xlat16_109 = _occlusionScale * u_xlat16_109 + 1.0;
    u_xlat16_108 = u_xlat16_108 * u_xlat16_109;
    u_xlat0.xy = min(u_xlat2.xw, vec2(u_xlat16_108));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_94);
    u_xlat16_26.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_27.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_24.xz);
    u_xlat16_27.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_24.xz);
    u_xlat16_27.y = u_xlat16_24.y;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_27.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_27.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_27.xyz = vec3(u_xlat16_109) * u_xlat16_28.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_28.xyz = u_xlat16_27.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati58 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_27.xyw = u_xlat16_27.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_27.xyw;
    u_xlat16_28.xyz = u_xlat16_27.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_108 = dot(u_xlat16_27.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_27.xyz = u_xlat16_19.xyz * u_xlat16_28.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_111 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_111 = inversesqrt(u_xlat16_111);
    u_xlat16_26.xyz = vec3(u_xlat16_111) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat4.xxx * u_xlat16_26.xyz + u_xlat33.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_99>=0.0);
#else
    u_xlatb2 = u_xlat16_99>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat4.xyz = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.xzw * u_xlat4.xyz;
    u_xlat0.xzw = u_xlat4.zxy * u_xlat0.zwx + (-u_xlat5.xyz);
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat93) + u_xlat0.xzw;
    u_xlat16_111 = u_xlat16_100 * 8.0;
    u_xlat16_100 = u_xlat16_100 * u_xlat16_100;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_111 = min(u_xlat16_111, 1.0);
    u_xlat16_111 = abs(u_xlat16_99) * u_xlat16_111;
    u_xlat0.xzw = vec3(u_xlat16_111) * u_xlat0.xzw + u_xlat10.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
    u_xlat16_111 = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_111 = u_xlat16_111 + u_xlat16_111;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_111) + (-u_xlat16_15.xyz);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat93) + (-u_xlat0.xzw);
    u_xlat4.xyz = vec3(u_xlat16_100) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat5.xyz = u_xlat0.xzw + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_99)) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_15.x = -abs(u_xlat16_99) * 0.800000012 + 1.0;
    u_xlat16_15.x = u_xlat16_14.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_15.x);
    u_xlat0.x = dot(u_xlat16_24.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_54.y = u_xlat0.x * 0.5;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat24.y = u_xlat4.y;
    u_xlat24.xz = u_xlat16_24.xz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_15.x);
    u_xlat16_26.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = vec3(u_xlat16_108) * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26.xyz = (bool(u_xlatb0)) ? u_xlat16_27.xyz : u_xlat16_26.xyz;
    u_xlat16.y = u_xlat16_14.x;
    u_xlat16_54.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_25.xyz = u_xlat16_54.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_14.xyz = u_xlat16_43.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_14.xyz = u_xlat16_26.xyz * u_xlat16_14.xyz;
    u_xlat16_101 = u_xlat0.y * 0.5;
    u_xlat16_15.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_3.yzw = u_xlat16_25.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_44 = floor(u_xlat16_3.w);
    u_xlat16_108 = u_xlat16_44 + 1.0;
    u_xlat16_108 = min(u_xlat16_108, 15.0);
    u_xlat16_3.x = u_xlat16_108 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_44 = u_xlat16_25.z * 15.0 + (-u_xlat16_44);
    u_xlat16_108 = (-u_xlat16_87) + u_xlat16_0.x;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_108 + u_xlat16_87;
    u_xlat16_44 = u_xlat16_109 * u_xlat16_44;
    u_xlat0.x = u_xlat58 * u_xlat16_44;
    u_xlat16_101 = u_xlat0.x * u_xlat16_15.x + u_xlat16_101;
    u_xlat16_15.x = u_xlat16_101 + u_xlat16_101;
    u_xlat16_44 = (-u_xlat16_101) * 2.0 + 1.0;
    u_xlat16_101 = u_xlat16_101 * u_xlat16_44 + u_xlat16_15.x;
    u_xlat16_101 = u_xlat0.y * u_xlat16_101;
    u_xlat16_101 = min(u_xlat16_94, u_xlat16_101);
    u_xlat16_14.xyz = vec3(u_xlat16_101) * u_xlat16_14.xyz;
    u_xlat16_25.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_20.xyz;
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_12.x + u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_43.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_20.xyz = u_xlat16_43.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_43.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_15.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_15.x = u_xlat16_106 / u_xlat16_15.x;
    u_xlat16_15.x = log2(abs(u_xlat16_15.x));
    u_xlat16_15.x = u_xlat16_15.x * _MainLightCompensatePow;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat16_106 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_44 = u_xlat16_106 / u_xlat16_15.y;
    u_xlat16_15.x = u_xlat16_44 * u_xlat16_15.x;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_15.xxx;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_15.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.xxx;
    u_xlat16_8.xyz = u_xlat16_43.xyz * u_xlat16_15.yyy + u_xlat16_8.xyz;
    u_xlat16_43.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_101 = u_xlat16_102 / u_xlat16_43.x;
    u_xlat16_101 = log2(abs(u_xlat16_101));
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightCompensatePow;
    u_xlat16_101 = exp2(u_xlat16_101);
    u_xlat16_102 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_72.x = u_xlat16_102 / u_xlat16_43.y;
    u_xlat16_101 = u_xlat16_72.x * u_xlat16_101;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(u_xlat16_101);
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat60) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_101 = u_xlat16_107 / u_xlat16_43.x;
    u_xlat16_101 = log2(abs(u_xlat16_101));
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightCompensatePow;
    u_xlat16_101 = exp2(u_xlat16_101);
    u_xlat16_101 = u_xlat16_72.x * u_xlat16_101;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(u_xlat16_101);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat31) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_101 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_101 = float(1.0) / u_xlat16_101;
    u_xlat16_20.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_102 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_101 = u_xlat16_101 * u_xlat16_102;
    u_xlat16_102 = float(1.0) / float(u_xlat16_102);
    u_xlat16_101 = (-u_xlat16_101) * u_xlat16_101 + 1.0;
    u_xlat16_101 = max(u_xlat16_101, 0.0);
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_101 = u_xlat16_101 * u_xlat16_102;
    u_xlat16_21.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_20.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_20.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_20.zzz + u_xlat0.xyz;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat87 = max(u_xlat87, 1.17549435e-38);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_101 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_101 = (-u_xlat16_101);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_43.x = u_xlat16_101 / u_xlat16_43.x;
    u_xlat16_43.x = log2(abs(u_xlat16_43.x));
    u_xlat16_43.x = u_xlat16_43.x * _AdditionalLightCompensatePow;
    u_xlat16_43.x = exp2(u_xlat16_43.x);
    u_xlat16_43.x = u_xlat16_72.x * u_xlat16_43.x;
    u_xlat16_43.xyz = u_xlat16_19.xyz * u_xlat16_43.xxx;
    u_xlat16_43.xyz = u_xlat16_21.xyz * u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_15.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_43.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat40.x * u_xlat16_95 + _Sanshe_X;
    u_xlat2.y = u_xlat40.y * u_xlat16_95 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_15.z;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = (-u_xlat87) + 1.0;
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = max(u_xlat87, 0.00048828125);
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _Sanshe_Fw;
    u_xlat87 = exp2(u_xlat87);
    u_xlat0.w = u_xlat87 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb89 = _UseSansheMask>=0.5;
#endif
    u_xlat16_43.xy = (bool(u_xlatb89)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_43.xy = u_xlat16_4.xy * u_xlat16_43.xx + u_xlat16_43.yy;
    u_xlat16_101 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat40.x * u_xlat16_95 + _Sanshe2_X;
    u_xlat2.y = u_xlat40.y * u_xlat16_95 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_43.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_95 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_19.xyz = vec3(u_xlat16_95) * _DirectionalDir.xyz;
    u_xlat29.x = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 0.0);
    u_xlat29.xyz = u_xlat29.xxx * _DirectionalColor.xyz;
    u_xlat29.xyz = u_xlat29.xyz * vec3(_DirectionalIntensity);
    u_xlat16_43.xyz = u_xlat29.xyz * vec3(u_xlat16_101) + u_xlat16_15.xyz;
    u_xlat16_43.xyz = u_xlat16_8.xyz + u_xlat16_43.xyz;
    u_xlat29.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat29.x = u_xlat29.x + -0.25;
    u_xlat29.x = u_xlat29.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_43.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_58 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_43.xyz = vec3(u_xlat16_58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_58) + _FogCol.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_43.xyz;
    u_xlat16_95 = _PostExposure + _ExposureCompensate;
    u_xlat16_95 = exp2(u_xlat16_95);
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_95) + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat58)) + u_xlat2.xyz;
    u_xlat87 = u_xlat29.x * -2.0 + 3.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat87;
    u_xlat0.x = max(u_xlat29.x, u_xlat0.x);
    u_xlat16_95 = (-_Saturation) + _SansheSaturation;
    u_xlat16_95 = u_xlat0.x * u_xlat16_95 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_95) * u_xlat2.xyz + vec3(u_xlat58);
    u_xlat16_43.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb87 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_95 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_95) * u_xlat16_43.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_43.x = float(1.0);
    u_xlat16_43.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_95) * u_xlat16_43.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb29 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_95 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_43.x = u_xlat16_95 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_15.xyz = vec3(u_xlat16_95) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_95 = min(u_xlat16_43.x, u_xlat16_15.y);
    u_xlat16_43.x = u_xlat16_43.x + (-u_xlat16_15.y);
    u_xlat16_95 = (-u_xlat16_95) + u_xlat16_15.x;
    u_xlat16_72.x = u_xlat16_95 * 6.0 + 9.99999975e-05;
    u_xlat16_43.x = u_xlat16_43.x / u_xlat16_72.x;
    u_xlat16_43.x = u_xlat16_43.x + u_xlat16_15.z;
    u_xlat16_43.x = abs(u_xlat16_43.x) + _HueShift;
    u_xlat16_43.xyz = u_xlat16_43.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_43.xyz = fract(u_xlat16_43.xyz);
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_43.xyz = abs(u_xlat16_43.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43.xyz = min(max(u_xlat16_43.xyz, 0.0), 1.0);
#else
    u_xlat16_43.xyz = clamp(u_xlat16_43.xyz, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat16_43.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_44 = u_xlat16_15.x + 9.99999975e-05;
    u_xlat16_95 = u_xlat16_95 / u_xlat16_44;
    u_xlat16_43.xyz = vec3(u_xlat16_95) * u_xlat16_43.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_15.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_15.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_15.xxx;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_14.x : u_xlat16_12.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
bool u_xlatb29;
float u_xlat31;
mediump vec3 u_xlat16_31;
vec3 u_xlat33;
bool u_xlatb33;
vec3 u_xlat38;
mediump vec3 u_xlat16_38;
vec3 u_xlat40;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_44;
float u_xlat46;
vec3 u_xlat47;
mediump vec3 u_xlat16_54;
float u_xlat58;
mediump float u_xlat16_58;
int u_xlati58;
float u_xlat60;
float u_xlat62;
vec2 u_xlat67;
mediump vec2 u_xlat16_67;
mediump float u_xlat16_70;
mediump vec2 u_xlat16_72;
float u_xlat74;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat89;
bool u_xlatb89;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
bool u_xlatb94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat103;
mediump float u_xlat16_106;
mediump float u_xlat16_107;
mediump float u_xlat16_108;
mediump float u_xlat16_109;
mediump float u_xlat16_111;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb89 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat93 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat6.xyz = vec3(u_xlat93) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat93 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat9.xyz = vec3(u_xlat93) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat93 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat93 = max(u_xlat93, 1.17549435e-38);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat10.xyz = vec3(u_xlat93) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb89)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat89 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat89 = u_xlat1.z + (-u_xlat89);
    u_xlat3.x = max((-u_xlat1.w), u_xlat89);
    u_xlat3.x = (-u_xlat89) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat89;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat31 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_31.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_31.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat31 = u_xlat16_31.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat60 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz + _shadowColor.xyz;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_95 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_95 = max(u_xlat16_95, 6.10351563e-05);
    u_xlat16_12.x = u_xlat16_95 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_41 = float(1.0) / float(u_xlat16_95);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_95);
    u_xlat16_95 = u_xlat16_12.x * u_xlat16_41;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_95 = max(u_xlat16_95, u_xlat16_12.x);
    u_xlat16_12.xzw = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.yyy + u_xlat16_12.xzw;
    u_xlat16_99 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_99 = u_xlat16_99 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_99 = min(max(u_xlat16_99, 0.0), 1.0);
#else
    u_xlat16_99 = clamp(u_xlat16_99, 0.0, 1.0);
#endif
    u_xlat16_99 = u_xlat16_99 * u_xlat16_99;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_13.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_13.x);
    u_xlat16_95 = u_xlat16_95 * u_xlat16_99;
    u_xlat16_13.xyz = vec3(u_xlat16_95) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_anisoUse2U);
#else
    u_xlatb4 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_4.x = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat4.x = u_xlat4.x * _sunShift + _sunShiftOffset;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb33 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat33.x = (u_xlatb33) ? 1.0 : -1.0;
    u_xlat33.x = u_xlat33.x * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat62) + u_xlat9.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat33.xyz = u_xlat33.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat10.xyz + u_xlat33.zxy;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat6.xyz = vec3(u_xlat92) * u_xlat6.xyz;
    u_xlat92 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb94 = !!(_UseAO2U>=0.5);
#else
    u_xlatb94 = _UseAO2U>=0.5;
#endif
    u_xlat16_14.xy = (bool(u_xlatb94)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_72.xy = (bool(u_xlatb94)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_14.xy = u_xlat16_72.xy + u_xlat16_14.xy;
    u_xlat16_94 = texture(_materialParamsMap, u_xlat16_14.xy).z;
    u_xlat16_95 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_94));
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat9.x = (-u_xlat16_99) + 1.0;
    u_xlat16_38.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_14.xy = u_xlat16_38.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_100 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat9.x = u_xlat9.x * u_xlat16_100;
    u_xlat9.x = max(u_xlat9.x, 0.00100000005);
    u_xlat11.z = u_xlat92 * u_xlat9.x;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat92 = u_xlat16_95 * u_xlat16_100;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat11.y = u_xlat16_72.x * u_xlat92;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat38.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat38.x = sqrt(u_xlat38.x);
    u_xlat38.x = u_xlat38.x + u_xlat11.x;
    u_xlat38.x = u_xlat38.x + 6.10351563e-05;
    u_xlat40.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_95 = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_15.xyz = vec3(u_xlat16_95) * u_xlat40.xyz;
    u_xlat97 = dot(u_xlat6.xyz, u_xlat16_15.xyz);
    u_xlat16.z = u_xlat9.x * u_xlat97;
    u_xlat97 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat16.y = u_xlat92 * u_xlat97;
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat16.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat38.x = u_xlat97 * u_xlat38.x + 6.10351563e-05;
    u_xlat38.x = float(1.0) / u_xlat38.x;
    u_xlat17.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + u_xlat16_12.xyz;
    u_xlat74 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat17.xyz = vec3(u_xlat74) * u_xlat17.xyz;
    u_xlat74 = dot(u_xlat6.xyz, u_xlat17.xyz);
    u_xlat18.y = u_xlat92 * u_xlat74;
    u_xlat16_72.x = dot(u_xlat5.zxy, u_xlat17.xyz);
    u_xlat18.x = u_xlat9.x * u_xlat16_72.x;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_12.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat103 = (-u_xlat16_12.x) + 1.0;
    u_xlat17.x = u_xlat9.x * u_xlat92;
    u_xlat18.z = u_xlat74 * u_xlat17.x;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat17.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat46 = u_xlat17.x * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat46;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat38.x = u_xlat38.x * u_xlat74;
    u_xlat16_12.x = u_xlat103 * u_xlat103;
    u_xlat16_12.x = u_xlat103 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat103 * u_xlat16_12.x;
    u_xlat16_41 = u_xlat103 * u_xlat16_12.x;
    u_xlat74 = (-u_xlat16_12.x) * u_xlat103 + 1.0;
    u_xlat16_19.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_12.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_12.x = log2(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _alphaClipPower;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_20.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = u_xlat16_38.zzz * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_70 = (-u_xlat16_38.y) * _metallicMultiplier + 1.0;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz + (-u_xlat0.xyz);
    u_xlat87 = (-_ShadeRange) + _DetailRange;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat67.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat67.x = max(u_xlat67.x, 0.0);
    u_xlat96 = u_xlat67.x + (-_ShadeRange);
    u_xlat18.x = min(u_xlat67.x, 1.0);
    u_xlat87 = u_xlat87 * u_xlat96;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat67.x = u_xlat87 * -2.0 + 3.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat67.x;
    u_xlat16_67.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat67.xy = (-u_xlat16_67.xy) + vec2(1.0, 1.0);
    u_xlat16_72.x = min(u_xlat87, u_xlat67.x);
    u_xlat16_72.x = u_xlat16_72.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72.x = min(max(u_xlat16_72.x, 0.0), 1.0);
#else
    u_xlat16_72.x = clamp(u_xlat16_72.x, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_72.xxx * u_xlat16_22.xyz + u_xlat0.xyz;
    u_xlat16_19.xyz = (-u_xlat16_19.xyz) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat67.yyy * u_xlat16_19.xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = vec3(u_xlat16_70) * u_xlat16_19.xyz;
    u_xlat16_43.xyz = u_xlat16_14.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = u_xlat16_43.xyz * vec3(u_xlat74);
    u_xlat87 = u_xlat16_43.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat87) * vec3(u_xlat16_41) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat38.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat11.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat38.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat74 = dot(u_xlat38.xyz, u_xlat38.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
    u_xlat74 = dot(u_xlat6.xyz, u_xlat38.xyz);
    u_xlat23.y = u_xlat92 * u_xlat74;
    u_xlat16_41 = dot(u_xlat5.zxy, u_xlat38.xyz);
    u_xlat23.x = u_xlat9.x * u_xlat16_41;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat38.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat38.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat38.x = (-u_xlat16_41) + 1.0;
    u_xlat23.z = u_xlat74 * u_xlat17.x;
    u_xlat67.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat67.x = max(u_xlat67.x, 6.10351563e-05);
    u_xlat67.x = u_xlat17.x / u_xlat67.x;
    u_xlat67.x = u_xlat67.x * u_xlat67.x;
    u_xlat67.x = u_xlat46 * u_xlat67.x;
    u_xlat67.x = min(u_xlat67.x, 16.0);
    u_xlat96 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat96 * u_xlat9.x;
    u_xlat16_102 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat92 * u_xlat16_102;
    u_xlat96 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat18.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat96 = u_xlat97 * u_xlat96 + 6.10351563e-05;
    u_xlat96 = float(1.0) / u_xlat96;
    u_xlat67.x = u_xlat96 * u_xlat67.x;
    u_xlat16_102 = u_xlat38.x * u_xlat38.x;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat96 = (-u_xlat16_102) * u_xlat38.x + 1.0;
    u_xlat16_102 = u_xlat38.x * u_xlat16_102;
    u_xlat47.xyz = u_xlat16_43.xyz * vec3(u_xlat96);
    u_xlat47.xyz = vec3(u_xlat87) * vec3(u_xlat16_102) + u_xlat47.xyz;
    u_xlat38.xyz = u_xlat67.xxx * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat38.xyz * _directSpecularColor.xyz;
    u_xlat38.xyz = u_xlat18.xxx * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat38.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat16_8.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_106 = inversesqrt(u_xlat16_102);
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat16_106);
    u_xlat16_106 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_106));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_106);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_24.xyz;
    u_xlat0.xyz = u_xlat40.xyz * vec3(u_xlat16_95) + u_xlat16_21.xyz;
    u_xlat38.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat38.x = inversesqrt(u_xlat38.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat38.xxx;
    u_xlat38.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat9.x;
    u_xlat23.y = u_xlat92 * u_xlat38.x;
    u_xlat16_106 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat23.x = u_xlat9.x * u_xlat16_106;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_106 = dot(u_xlat16_21.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_106) + 1.0;
    u_xlat23.z = u_xlat9.x * u_xlat17.x;
    u_xlat29.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat29.x = max(u_xlat29.x, 6.10351563e-05);
    u_xlat29.x = u_xlat17.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat46 * u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat16_106 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat6.y = u_xlat92 * u_xlat16_106;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat97 * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat29.x = u_xlat58 * u_xlat29.x;
    u_xlat16_107 = u_xlat0.x * u_xlat0.x;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat58 = (-u_xlat16_107) * u_xlat0.x + 1.0;
    u_xlat16_107 = u_xlat0.x * u_xlat16_107;
    u_xlat9.xyz = u_xlat16_43.xyz * vec3(u_xlat58);
    u_xlat0.xzw = vec3(u_xlat87) * vec3(u_xlat16_107) + u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_107 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = float(1.0) / float(u_xlat16_102);
    u_xlat16_107 = (-u_xlat16_107) * u_xlat16_107 + 1.0;
    u_xlat16_107 = max(u_xlat16_107, 0.0);
    u_xlat16_107 = u_xlat16_107 * u_xlat16_107;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_107;
    u_xlat16_102 = max(u_xlat16_22.x, u_xlat16_102);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_107 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_106 = max(u_xlat16_106, u_xlat16_107);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_106;
    u_xlat16_21.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * vec3(u_xlat31) + u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_8.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat60) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_102 = u_xlat11.x + (-_AdditionalLightCompensateStart);
    u_xlat16_102 = (-u_xlat16_102);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_106 = u_xlat18.x + (-_MainLightCompensateStart);
    u_xlat16_106 = (-u_xlat16_106);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_24.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = vec3(u_xlat31) * u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_24.xyz * u_xlat6.xxx + u_xlat16_22.xyz;
    u_xlat16_107 = u_xlat6.x + (-_AdditionalLightCompensateStart);
    u_xlat16_107 = (-u_xlat16_107);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_107 = min(max(u_xlat16_107, 0.0), 1.0);
#else
    u_xlat16_107 = clamp(u_xlat16_107, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = (-u_xlat7.xyz) * vec3(u_xlat93) + vs_TEXCOORD4.xyz;
    u_xlat16_24.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_24.xyz + u_xlat10.xyz;
    u_xlat16_108 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat16_108 = inversesqrt(u_xlat16_108);
    u_xlat16_24.xyz = vec3(u_xlat16_108) * u_xlat16_24.xyz;
    u_xlat16_108 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_108 = min(max(u_xlat16_108, 0.0), 1.0);
#else
    u_xlat16_108 = clamp(u_xlat16_108, 0.0, 1.0);
#endif
    u_xlat16_109 = u_xlat16_108 * 0.5 + 0.5;
    u_xlat16_109 = (-u_xlat16_108) + u_xlat16_109;
    u_xlat16_111 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_54.z = _occlusionScale * u_xlat16_111 + 1.0;
    u_xlat16_108 = u_xlat16_54.z * u_xlat16_109 + u_xlat16_108;
    u_xlat16_108 = u_xlat16_54.z * u_xlat16_108;
    u_xlat16_109 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_109 = min(max(u_xlat16_109, 0.0), 1.0);
#else
    u_xlat16_109 = clamp(u_xlat16_109, 0.0, 1.0);
#endif
    u_xlat16_109 = u_xlat16_109 + -1.0;
    u_xlat16_109 = _occlusionScale * u_xlat16_109 + 1.0;
    u_xlat16_108 = u_xlat16_108 * u_xlat16_109;
    u_xlat0.xy = min(u_xlat2.xw, vec2(u_xlat16_108));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_94);
    u_xlat16_26.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_27.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_24.xz);
    u_xlat16_27.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_24.xz);
    u_xlat16_27.y = u_xlat16_24.y;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_27.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_27.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_27.xyz = vec3(u_xlat16_109) * u_xlat16_28.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_28.xyz = u_xlat16_27.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati58 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_27.xyw = u_xlat16_27.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_27.xyw;
    u_xlat16_28.xyz = u_xlat16_27.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_108 = dot(u_xlat16_27.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_27.xyz = u_xlat16_19.xyz * u_xlat16_28.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_111 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_111 = inversesqrt(u_xlat16_111);
    u_xlat16_26.xyz = vec3(u_xlat16_111) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat4.xxx * u_xlat16_26.xyz + u_xlat33.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_99>=0.0);
#else
    u_xlatb2 = u_xlat16_99>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat4.xyz = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.xzw * u_xlat4.xyz;
    u_xlat0.xzw = u_xlat4.zxy * u_xlat0.zwx + (-u_xlat5.xyz);
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat93) + u_xlat0.xzw;
    u_xlat16_111 = u_xlat16_100 * 8.0;
    u_xlat16_100 = u_xlat16_100 * u_xlat16_100;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_111 = min(u_xlat16_111, 1.0);
    u_xlat16_111 = abs(u_xlat16_99) * u_xlat16_111;
    u_xlat0.xzw = vec3(u_xlat16_111) * u_xlat0.xzw + u_xlat10.xyz;
    u_xlat2.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat2.xxx;
    u_xlat16_111 = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_111 = u_xlat16_111 + u_xlat16_111;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_111) + (-u_xlat16_15.xyz);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat93) + (-u_xlat0.xzw);
    u_xlat4.xyz = vec3(u_xlat16_100) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat5.xyz = u_xlat0.xzw + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_99)) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_15.x = -abs(u_xlat16_99) * 0.800000012 + 1.0;
    u_xlat16_15.x = u_xlat16_14.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_15.x);
    u_xlat0.x = dot(u_xlat16_24.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_24.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_54.y = u_xlat0.x * 0.5;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat24.y = u_xlat4.y;
    u_xlat24.xz = u_xlat16_24.xz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_15.x);
    u_xlat16_26.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = vec3(u_xlat16_108) * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26.xyz = (bool(u_xlatb0)) ? u_xlat16_27.xyz : u_xlat16_26.xyz;
    u_xlat16.y = u_xlat16_14.x;
    u_xlat16_54.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_25.xyz = u_xlat16_54.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_14.xyz = u_xlat16_43.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_14.xyz = u_xlat16_26.xyz * u_xlat16_14.xyz;
    u_xlat16_101 = u_xlat0.y * 0.5;
    u_xlat16_15.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_3.yzw = u_xlat16_25.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_44 = floor(u_xlat16_3.w);
    u_xlat16_108 = u_xlat16_44 + 1.0;
    u_xlat16_108 = min(u_xlat16_108, 15.0);
    u_xlat16_3.x = u_xlat16_108 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_25.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_44 = u_xlat16_25.z * 15.0 + (-u_xlat16_44);
    u_xlat16_108 = (-u_xlat16_87) + u_xlat16_0.x;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_108 + u_xlat16_87;
    u_xlat16_44 = u_xlat16_109 * u_xlat16_44;
    u_xlat0.x = u_xlat58 * u_xlat16_44;
    u_xlat16_101 = u_xlat0.x * u_xlat16_15.x + u_xlat16_101;
    u_xlat16_15.x = u_xlat16_101 + u_xlat16_101;
    u_xlat16_44 = (-u_xlat16_101) * 2.0 + 1.0;
    u_xlat16_101 = u_xlat16_101 * u_xlat16_44 + u_xlat16_15.x;
    u_xlat16_101 = u_xlat0.y * u_xlat16_101;
    u_xlat16_101 = min(u_xlat16_94, u_xlat16_101);
    u_xlat16_14.xyz = vec3(u_xlat16_101) * u_xlat16_14.xyz;
    u_xlat16_25.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz + u_xlat16_20.xyz;
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_12.x + u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_43.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_20.xyz = u_xlat16_43.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_43.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_15.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_15.x = u_xlat16_106 / u_xlat16_15.x;
    u_xlat16_15.x = log2(abs(u_xlat16_15.x));
    u_xlat16_15.x = u_xlat16_15.x * _MainLightCompensatePow;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat16_106 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_44 = u_xlat16_106 / u_xlat16_15.y;
    u_xlat16_15.x = u_xlat16_44 * u_xlat16_15.x;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_15.xxx;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_15.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.xxx;
    u_xlat16_8.xyz = u_xlat16_43.xyz * u_xlat16_15.yyy + u_xlat16_8.xyz;
    u_xlat16_43.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_101 = u_xlat16_102 / u_xlat16_43.x;
    u_xlat16_101 = log2(abs(u_xlat16_101));
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightCompensatePow;
    u_xlat16_101 = exp2(u_xlat16_101);
    u_xlat16_102 = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_72.x = u_xlat16_102 / u_xlat16_43.y;
    u_xlat16_101 = u_xlat16_72.x * u_xlat16_101;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(u_xlat16_101);
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat60) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_101 = u_xlat16_107 / u_xlat16_43.x;
    u_xlat16_101 = log2(abs(u_xlat16_101));
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightCompensatePow;
    u_xlat16_101 = exp2(u_xlat16_101);
    u_xlat16_101 = u_xlat16_72.x * u_xlat16_101;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(u_xlat16_101);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat31) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_101 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_101 = float(1.0) / u_xlat16_101;
    u_xlat16_20.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_102 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_101 = u_xlat16_101 * u_xlat16_102;
    u_xlat16_102 = float(1.0) / float(u_xlat16_102);
    u_xlat16_101 = (-u_xlat16_101) * u_xlat16_101 + 1.0;
    u_xlat16_101 = max(u_xlat16_101, 0.0);
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_101 = u_xlat16_101 * u_xlat16_102;
    u_xlat16_21.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_20.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_20.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_20.zzz + u_xlat0.xyz;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat87 = max(u_xlat87, 1.17549435e-38);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xyz = vec3(u_xlat87) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_101 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_101 = (-u_xlat16_101);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_43.x = u_xlat16_101 / u_xlat16_43.x;
    u_xlat16_43.x = log2(abs(u_xlat16_43.x));
    u_xlat16_43.x = u_xlat16_43.x * _AdditionalLightCompensatePow;
    u_xlat16_43.x = exp2(u_xlat16_43.x);
    u_xlat16_43.x = u_xlat16_72.x * u_xlat16_43.x;
    u_xlat16_43.xyz = u_xlat16_19.xyz * u_xlat16_43.xxx;
    u_xlat16_43.xyz = u_xlat16_21.xyz * u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_20.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_43.xyz = u_xlat16_15.xxx * u_xlat16_43.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_43.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat40.x * u_xlat16_95 + _Sanshe_X;
    u_xlat2.y = u_xlat40.y * u_xlat16_95 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_15.z;
    u_xlat87 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = (-u_xlat87) + 1.0;
    u_xlat87 = max(u_xlat87, 0.0);
    u_xlat87 = max(u_xlat87, 0.00048828125);
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _Sanshe_Fw;
    u_xlat87 = exp2(u_xlat87);
    u_xlat0.w = u_xlat87 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb89 = _UseSansheMask>=0.5;
#endif
    u_xlat16_43.xy = (bool(u_xlatb89)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_43.xy = u_xlat16_4.xy * u_xlat16_43.xx + u_xlat16_43.yy;
    u_xlat16_101 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat40.x * u_xlat16_95 + _Sanshe2_X;
    u_xlat2.y = u_xlat40.y * u_xlat16_95 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_43.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_95 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_95 = inversesqrt(u_xlat16_95);
    u_xlat16_19.xyz = vec3(u_xlat16_95) * _DirectionalDir.xyz;
    u_xlat29.x = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 0.0);
    u_xlat29.xyz = u_xlat29.xxx * _DirectionalColor.xyz;
    u_xlat29.xyz = u_xlat29.xyz * vec3(_DirectionalIntensity);
    u_xlat16_43.xyz = u_xlat29.xyz * vec3(u_xlat16_101) + u_xlat16_15.xyz;
    u_xlat16_43.xyz = u_xlat16_8.xyz + u_xlat16_43.xyz;
    u_xlat29.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat29.x = u_xlat29.x + -0.25;
    u_xlat29.x = u_xlat29.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_43.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_58 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_43.xyz = vec3(u_xlat16_58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_58) + _FogCol.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_43.xyz;
    u_xlat16_95 = _PostExposure + _ExposureCompensate;
    u_xlat16_95 = exp2(u_xlat16_95);
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_95) + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat58)) + u_xlat2.xyz;
    u_xlat87 = u_xlat29.x * -2.0 + 3.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat87;
    u_xlat0.x = max(u_xlat29.x, u_xlat0.x);
    u_xlat16_95 = (-_Saturation) + _SansheSaturation;
    u_xlat16_95 = u_xlat0.x * u_xlat16_95 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_95) * u_xlat2.xyz + vec3(u_xlat58);
    u_xlat16_43.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb87 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_95 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_95) * u_xlat16_43.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_43.x = float(1.0);
    u_xlat16_43.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_95) * u_xlat16_43.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb29 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_95 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_43.x = u_xlat16_95 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_15.xyz = vec3(u_xlat16_95) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_95 = min(u_xlat16_43.x, u_xlat16_15.y);
    u_xlat16_43.x = u_xlat16_43.x + (-u_xlat16_15.y);
    u_xlat16_95 = (-u_xlat16_95) + u_xlat16_15.x;
    u_xlat16_72.x = u_xlat16_95 * 6.0 + 9.99999975e-05;
    u_xlat16_43.x = u_xlat16_43.x / u_xlat16_72.x;
    u_xlat16_43.x = u_xlat16_43.x + u_xlat16_15.z;
    u_xlat16_43.x = abs(u_xlat16_43.x) + _HueShift;
    u_xlat16_43.xyz = u_xlat16_43.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_43.xyz = fract(u_xlat16_43.xyz);
    u_xlat16_43.xyz = u_xlat16_43.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_43.xyz = abs(u_xlat16_43.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43.xyz = min(max(u_xlat16_43.xyz, 0.0), 1.0);
#else
    u_xlat16_43.xyz = clamp(u_xlat16_43.xyz, 0.0, 1.0);
#endif
    u_xlat16_43.xyz = u_xlat16_43.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_44 = u_xlat16_15.x + 9.99999975e-05;
    u_xlat16_95 = u_xlat16_95 / u_xlat16_44;
    u_xlat16_43.xyz = vec3(u_xlat16_95) * u_xlat16_43.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_15.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_15.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_43.xyz = u_xlat16_43.xyz * u_xlat16_15.xxx;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_15.yyy + u_xlat16_43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_14.x : u_xlat16_12.x;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec2 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_36;
float u_xlat38;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
float u_xlat40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_46;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_UseAO2U>=0.5);
#else
    u_xlatb60 = _UseAO2U>=0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb60)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_60 = texture(_materialParamsMap, u_xlat16_1.xy).z;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_60));
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb4 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb4)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat6.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = u_xlat9.zxy * u_xlat6.yzx + (-u_xlat10.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_9.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_58 = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_65 = u_xlat16_58 * 8.0;
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = abs(u_xlat16_20.x) * u_xlat16_65;
    u_xlat6.xyz = vec3(u_xlat16_65) * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_65 = dot((-u_xlat16_8.xyz), u_xlat6.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat6.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_65) + (-u_xlat16_8.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_65 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_65) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat16_58 * u_xlat2.x;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_58;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_1.xyw = u_xlat16_10.www * u_xlat16_10.zxy;
    u_xlat10.xyz = u_xlat16_1.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_1.xyw = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_65 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_14.xyw;
    u_xlat16_49 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_1.xyw * vec3(u_xlat16_49);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_1.xyw;
    u_xlat16_15.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_0.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_0.zxy * u_xlat16_15.xyz;
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_49 = log2(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _alphaClipPower;
    u_xlat16_30.y = exp2(u_xlat16_49);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat19.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat38 = u_xlat19.x + (-_ShadeRange);
    u_xlat10.x = min(u_xlat19.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_19.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat19.xy = (-u_xlat16_19.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat19.x, u_xlat0.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_9.zzz * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat0.xyw);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz + u_xlat0.xyw;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat19.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_11.x;
    u_xlat16_36.x = u_xlat16_11.x * 1.09769487;
    u_xlat9.x = dot(u_xlat23.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_19.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_11.xyw = u_xlat16_16.xyz * u_xlat16_19.xxx + u_xlat16_19.yyy;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_11.xyw;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_36.y = u_xlat19.x * 0.5;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_11.xyw = u_xlat16_36.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_11.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.xy = min(u_xlat16_30.xy, vec2(15.0, 1.0));
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_6.x = u_xlat16_11.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_38) + u_xlat16_19.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_38;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_30.x) + u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_11.x;
    u_xlat38 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat38 * 0.5;
    u_xlat16_11.x = (-u_xlat38) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat19.x * u_xlat16_11.x + u_xlat16_65;
    u_xlat16_11.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_65 = u_xlat38 * u_xlat16_65;
    u_xlat19.x = min(u_xlat38, u_xlat16_60);
    u_xlat16_65 = min(u_xlat16_60, u_xlat16_65);
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(u_xlat16_65);
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat13.xyz);
    u_xlat18.y = u_xlat38 * u_xlat2.y;
    u_xlat16_65 = dot(u_xlat3.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat2.x * u_xlat16_65;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat57 = dot(u_xlat23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat18.z = u_xlat57 * u_xlat38;
    u_xlat57 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat38 / u_xlat57;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat38 = u_xlat38 * u_xlat57;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat57 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat9.z = u_xlat59 * u_xlat2.x;
    u_xlat10.z = u_xlat57 * u_xlat2.x;
    u_xlat16_65 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = dot(u_xlat3.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat57 * u_xlat2.y;
    u_xlat10.y = u_xlat2.y * u_xlat16_65;
    u_xlat57 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat0.w = u_xlat57 + u_xlat10.x;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat0.x = u_xlat0.x + u_xlat2.x;
    u_xlat0.xw = u_xlat0.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.w + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat38;
    u_xlat38 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat40 * u_xlat40;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat57 = (-u_xlat16_8.x) * u_xlat40 + 1.0;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat10.xxx * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_27.x);
    u_xlat16_11.xyw = u_xlat2.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.yyy + u_xlat16_16.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyw);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_8.x = max(u_xlat16_8.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_27.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_27.x = u_xlat16_65 * u_xlat16_27.x;
    u_xlat16_27.x = max(u_xlat16_12.x, u_xlat16_27.x);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_27.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb3.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_5.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb3.x) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb3.y) ? float(0.0) : float(1.0);
    u_xlat16_11.xy = (u_xlatb3.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat21.xy = u_xlat16_21.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat21.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat2.xxx * u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat10.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat10.x + (-_MainLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_31 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_31 = max(u_xlat16_31, 6.10351563e-05);
    u_xlat16_50.x = inversesqrt(u_xlat16_31);
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat16_50.xxx;
    u_xlat16_50.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_50.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_50.x);
#endif
    u_xlat16_50.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_50.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_50.yyy + u_xlat16_17.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_69);
    u_xlat16_69 = u_xlat16_31 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_31 = float(1.0) / float(u_xlat16_31);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_31 = u_xlat16_69 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_50.x, u_xlat16_31);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_31;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.yyy * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat19.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_14.xyz * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz;
    u_xlat16_1.xyw = u_xlat0.zwx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.ywx;
    u_xlat16_1.x = dot(u_xlat16_1.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_30.y;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyw;
    u_xlat16_20.xz = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_68 / u_xlat16_20.x;
    u_xlat16_20.x = log2(abs(u_xlat16_20.x));
    u_xlat16_20.x = u_xlat16_20.x * _MainLightCompensatePow;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_68 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_58 = u_xlat16_68 / u_xlat16_20.z;
    u_xlat16_20.x = u_xlat16_58 * u_xlat16_20.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * u_xlat16_20.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat16_68 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_12.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_69 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_14.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_12.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_12.zzz + u_xlat0.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_16.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 / u_xlat16_12.x;
    u_xlat16_68 = log2(abs(u_xlat16_68));
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightCompensatePow;
    u_xlat16_68 = exp2(u_xlat16_68);
    u_xlat16_12.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_12.x = u_xlat16_12.x / u_xlat16_12.y;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(u_xlat16_68);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_8.z;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = max(u_xlat57, 0.00048828125);
    u_xlat57 = log2(u_xlat57);
    u_xlat57 = u_xlat57 * _Sanshe_Fw;
    u_xlat57 = exp2(u_xlat57);
    u_xlat0.w = u_xlat57 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb59 = _UseSansheMask>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xz = u_xlat16_3.xy * u_xlat16_20.xx + u_xlat16_20.zz;
    u_xlat16_46 = u_xlat16_3.z * u_xlat16_11.x + u_xlat16_11.y;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe2_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_20.zx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_11.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyw = u_xlat16_11.xxx * _DirectionalDir.xyz;
    u_xlat19.x = dot(u_xlat16_11.xyw, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat19.xyz = u_xlat19.xxx * _DirectionalColor.zxy;
    u_xlat19.xyz = u_xlat19.xyz * vec3(_DirectionalIntensity);
    u_xlat16_20.xyz = u_xlat19.xyz * vec3(u_xlat16_46) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_8.xyw;
    u_xlat19.x = dot(u_xlat16_8.ywx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat19.x = u_xlat19.x + -0.25;
    u_xlat19.x = u_xlat19.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_38 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_8.xyz = vec3(u_xlat16_38) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * vec3(u_xlat16_38) + _FogCol.zxy;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_8.xyz;
    u_xlat2.xyz = u_xlat16_20.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat38 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat57 = u_xlat2.x * 15.0 + (-u_xlat38);
    u_xlat3.x = u_xlat38 * 0.0625 + u_xlat3.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_20.x = _PostExposure + _ExposureCompensate;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat16_20.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = (-vec3(u_xlat38)) + u_xlat3.xyz;
    u_xlat57 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat57;
    u_xlat0.x = max(u_xlat19.x, u_xlat0.x);
    u_xlat16_20.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_20.x = u_xlat0.x * u_xlat16_20.x + _Saturation;
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat3.xyz + vec3(u_xlat38);
    u_xlat16_20.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb57 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_58) * u_xlat16_20.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_20.x = float(1.0);
    u_xlat16_20.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_58) * u_xlat16_20.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb19 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_20.x = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_39.x = u_xlat16_20.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_8.xyz = u_xlat16_20.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_20.x = min(u_xlat16_39.x, u_xlat16_8.y);
    u_xlat16_39.x = u_xlat16_39.x + (-u_xlat16_8.y);
    u_xlat16_20.x = (-u_xlat16_20.x) + u_xlat16_8.x;
    u_xlat16_58 = u_xlat16_20.x * 6.0 + 9.99999975e-05;
    u_xlat16_39.x = u_xlat16_39.x / u_xlat16_58;
    u_xlat16_39.x = u_xlat16_39.x + u_xlat16_8.z;
    u_xlat16_39.x = abs(u_xlat16_39.x) + _HueShift;
    u_xlat16_27.xyz = u_xlat16_39.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_27.xyz = fract(u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_27.xyz = abs(u_xlat16_27.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.xyz = min(max(u_xlat16_27.xyz, 0.0), 1.0);
#else
    u_xlat16_27.xyz = clamp(u_xlat16_27.xyz, 0.0, 1.0);
#endif
    u_xlat16_27.xyz = u_xlat16_27.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_20.x = u_xlat16_20.x / u_xlat16_39.x;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_27.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_8.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_30.y;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec2 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_36;
float u_xlat38;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
float u_xlat40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_46;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_UseAO2U>=0.5);
#else
    u_xlatb60 = _UseAO2U>=0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb60)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_60 = texture(_materialParamsMap, u_xlat16_1.xy).z;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_60));
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb4 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb4)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat6.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = u_xlat9.zxy * u_xlat6.yzx + (-u_xlat10.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_9.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_58 = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_65 = u_xlat16_58 * 8.0;
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = abs(u_xlat16_20.x) * u_xlat16_65;
    u_xlat6.xyz = vec3(u_xlat16_65) * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_65 = dot((-u_xlat16_8.xyz), u_xlat6.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat6.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_65) + (-u_xlat16_8.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_65 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_65) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat16_58 * u_xlat2.x;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_58;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_1.xyw = u_xlat16_10.www * u_xlat16_10.zxy;
    u_xlat10.xyz = u_xlat16_1.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_1.xyw = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_65 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_14.xyw;
    u_xlat16_49 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_1.xyw * vec3(u_xlat16_49);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_1.xyw;
    u_xlat16_15.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_0.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_0.zxy * u_xlat16_15.xyz;
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_49 = log2(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _alphaClipPower;
    u_xlat16_30.y = exp2(u_xlat16_49);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat19.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat38 = u_xlat19.x + (-_ShadeRange);
    u_xlat10.x = min(u_xlat19.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_19.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat19.xy = (-u_xlat16_19.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat19.x, u_xlat0.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_9.zzz * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat0.xyw);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz + u_xlat0.xyw;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat19.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_11.x;
    u_xlat16_36.x = u_xlat16_11.x * 1.09769487;
    u_xlat9.x = dot(u_xlat23.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_19.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_11.xyw = u_xlat16_16.xyz * u_xlat16_19.xxx + u_xlat16_19.yyy;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_11.xyw;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_36.y = u_xlat19.x * 0.5;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_11.xyw = u_xlat16_36.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_11.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.xy = min(u_xlat16_30.xy, vec2(15.0, 1.0));
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_6.x = u_xlat16_11.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_38) + u_xlat16_19.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_38;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_30.x) + u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_11.x;
    u_xlat38 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat38 * 0.5;
    u_xlat16_11.x = (-u_xlat38) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat19.x * u_xlat16_11.x + u_xlat16_65;
    u_xlat16_11.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_65 = u_xlat38 * u_xlat16_65;
    u_xlat19.x = min(u_xlat38, u_xlat16_60);
    u_xlat16_65 = min(u_xlat16_60, u_xlat16_65);
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(u_xlat16_65);
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat13.xyz);
    u_xlat18.y = u_xlat38 * u_xlat2.y;
    u_xlat16_65 = dot(u_xlat3.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat2.x * u_xlat16_65;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat57 = dot(u_xlat23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat18.z = u_xlat57 * u_xlat38;
    u_xlat57 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat38 / u_xlat57;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat38 = u_xlat38 * u_xlat57;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat57 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat9.z = u_xlat59 * u_xlat2.x;
    u_xlat10.z = u_xlat57 * u_xlat2.x;
    u_xlat16_65 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = dot(u_xlat3.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat57 * u_xlat2.y;
    u_xlat10.y = u_xlat2.y * u_xlat16_65;
    u_xlat57 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat0.w = u_xlat57 + u_xlat10.x;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat0.x = u_xlat0.x + u_xlat2.x;
    u_xlat0.xw = u_xlat0.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.w + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat38;
    u_xlat38 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat40 * u_xlat40;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat57 = (-u_xlat16_8.x) * u_xlat40 + 1.0;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat10.xxx * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_27.x);
    u_xlat16_11.xyw = u_xlat2.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.yyy + u_xlat16_16.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyw);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_8.x = max(u_xlat16_8.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_27.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_27.x = u_xlat16_65 * u_xlat16_27.x;
    u_xlat16_27.x = max(u_xlat16_12.x, u_xlat16_27.x);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_27.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb3.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_5.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb3.x) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb3.y) ? float(0.0) : float(1.0);
    u_xlat16_11.xy = (u_xlatb3.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat21.xy = u_xlat16_21.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat21.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat2.xxx * u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat10.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat10.x + (-_MainLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_31 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_31 = max(u_xlat16_31, 6.10351563e-05);
    u_xlat16_50.x = inversesqrt(u_xlat16_31);
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat16_50.xxx;
    u_xlat16_50.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_50.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_50.x);
#endif
    u_xlat16_50.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_50.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_50.yyy + u_xlat16_17.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_69);
    u_xlat16_69 = u_xlat16_31 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_31 = float(1.0) / float(u_xlat16_31);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_31 = u_xlat16_69 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_50.x, u_xlat16_31);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_31;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.yyy * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat19.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_14.xyz * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz;
    u_xlat16_1.xyw = u_xlat0.zwx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.ywx;
    u_xlat16_1.x = dot(u_xlat16_1.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_30.y;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyw;
    u_xlat16_20.xz = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_68 / u_xlat16_20.x;
    u_xlat16_20.x = log2(abs(u_xlat16_20.x));
    u_xlat16_20.x = u_xlat16_20.x * _MainLightCompensatePow;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_68 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_58 = u_xlat16_68 / u_xlat16_20.z;
    u_xlat16_20.x = u_xlat16_58 * u_xlat16_20.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * u_xlat16_20.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat16_68 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_12.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_69 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_14.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_12.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_12.zzz + u_xlat0.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_16.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 / u_xlat16_12.x;
    u_xlat16_68 = log2(abs(u_xlat16_68));
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightCompensatePow;
    u_xlat16_68 = exp2(u_xlat16_68);
    u_xlat16_12.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_12.x = u_xlat16_12.x / u_xlat16_12.y;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(u_xlat16_68);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_8.z;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = max(u_xlat57, 0.00048828125);
    u_xlat57 = log2(u_xlat57);
    u_xlat57 = u_xlat57 * _Sanshe_Fw;
    u_xlat57 = exp2(u_xlat57);
    u_xlat0.w = u_xlat57 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb59 = _UseSansheMask>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xz = u_xlat16_3.xy * u_xlat16_20.xx + u_xlat16_20.zz;
    u_xlat16_46 = u_xlat16_3.z * u_xlat16_11.x + u_xlat16_11.y;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe2_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_20.zx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_11.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyw = u_xlat16_11.xxx * _DirectionalDir.xyz;
    u_xlat19.x = dot(u_xlat16_11.xyw, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat19.xyz = u_xlat19.xxx * _DirectionalColor.zxy;
    u_xlat19.xyz = u_xlat19.xyz * vec3(_DirectionalIntensity);
    u_xlat16_20.xyz = u_xlat19.xyz * vec3(u_xlat16_46) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_8.xyw;
    u_xlat19.x = dot(u_xlat16_8.ywx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat19.x = u_xlat19.x + -0.25;
    u_xlat19.x = u_xlat19.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_38 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_8.xyz = vec3(u_xlat16_38) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * vec3(u_xlat16_38) + _FogCol.zxy;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_8.xyz;
    u_xlat2.xyz = u_xlat16_20.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat38 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat57 = u_xlat2.x * 15.0 + (-u_xlat38);
    u_xlat3.x = u_xlat38 * 0.0625 + u_xlat3.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_20.x = _PostExposure + _ExposureCompensate;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat16_20.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = (-vec3(u_xlat38)) + u_xlat3.xyz;
    u_xlat57 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat57;
    u_xlat0.x = max(u_xlat19.x, u_xlat0.x);
    u_xlat16_20.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_20.x = u_xlat0.x * u_xlat16_20.x + _Saturation;
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat3.xyz + vec3(u_xlat38);
    u_xlat16_20.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb57 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_58) * u_xlat16_20.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_20.x = float(1.0);
    u_xlat16_20.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_58) * u_xlat16_20.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb19 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_20.x = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_39.x = u_xlat16_20.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_8.xyz = u_xlat16_20.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_20.x = min(u_xlat16_39.x, u_xlat16_8.y);
    u_xlat16_39.x = u_xlat16_39.x + (-u_xlat16_8.y);
    u_xlat16_20.x = (-u_xlat16_20.x) + u_xlat16_8.x;
    u_xlat16_58 = u_xlat16_20.x * 6.0 + 9.99999975e-05;
    u_xlat16_39.x = u_xlat16_39.x / u_xlat16_58;
    u_xlat16_39.x = u_xlat16_39.x + u_xlat16_8.z;
    u_xlat16_39.x = abs(u_xlat16_39.x) + _HueShift;
    u_xlat16_27.xyz = u_xlat16_39.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_27.xyz = fract(u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_27.xyz = abs(u_xlat16_27.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.xyz = min(max(u_xlat16_27.xyz, 0.0), 1.0);
#else
    u_xlat16_27.xyz = clamp(u_xlat16_27.xyz, 0.0, 1.0);
#endif
    u_xlat16_27.xyz = u_xlat16_27.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_20.x = u_xlat16_20.x / u_xlat16_39.x;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_27.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_8.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_30.y;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
float u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
vec2 u_xlat48;
mediump float u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_52;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_74;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb68 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = vec3(u_xlat72) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb68)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat68 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat68 = u_xlat1.z + (-u_xlat68);
    u_xlat3.x = max((-u_xlat1.w), u_xlat68);
    u_xlat3.x = (-u_xlat68) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat68;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat24 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat24 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_24.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat24 = u_xlat16_24.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat46 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat68 = u_xlat2.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat68) + vec2(1.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat10.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_74) + u_xlat16_12.x;
    u_xlat16_34.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_34.x + 1.0;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_74;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_74));
    u_xlat16_74 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.5<_anisoUse2U);
#else
    u_xlatb68 = 0.5<_anisoUse2U;
#endif
    u_xlat48.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat48.xy = u_xlat48.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_68 = texture(_anisotropicMap, u_xlat48.xy).x;
    u_xlat68 = u_xlat16_68 * 2.0 + -1.0;
    u_xlat68 = u_xlat68 * _sunShift + _sunShiftOffset;
    u_xlat68 = u_xlat68 + vs_TEXCOORD5;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_35.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb48 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat48.x = (u_xlatb48) ? 1.0 : -1.0;
    u_xlat48.x = u_xlat48.x * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat70) + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat16_35.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat10.xyz + u_xlat6.zxy;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseAO2U>=0.5);
#else
    u_xlatb68 = _UseAO2U>=0.5;
#endif
    u_xlat16_35.xy = (bool(u_xlatb68)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_35.xy = u_xlat16_35.xy + u_xlat16_14.xy;
    u_xlat16_68 = texture(_materialParamsMap, u_xlat16_35.xy).z;
    u_xlat16_35.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_57 = u_xlat16_35.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_57>=0.0);
#else
    u_xlatb48 = u_xlat16_57>=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb48)) ? u_xlat9.xyz : u_xlat5.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat11.xyz * vec3(u_xlat16_79);
    u_xlat15.xyz = u_xlat9.xyz * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat9.zxy * u_xlat16_14.yzx + (-u_xlat15.xyz);
    u_xlat16.xyz = u_xlat9.xyz * u_xlat15.xyz;
    u_xlat9.xyz = u_xlat15.zxy * u_xlat9.yzx + (-u_xlat16.xyz);
    u_xlat9.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat9.xyz;
    u_xlat16_15.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_17.xy = u_xlat16_15.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_61.x = u_xlat16_80 * 8.0;
    u_xlat16_61.x = min(u_xlat16_61.x, 1.0);
    u_xlat16_61.x = abs(u_xlat16_57) * u_xlat16_61.x;
    u_xlat9.xyz = u_xlat16_61.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat48.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat9.xyz = u_xlat48.xxx * u_xlat9.xyz;
    u_xlat16_61.x = dot((-u_xlat16_14.xyz), u_xlat9.xyz);
    u_xlat16_61.x = u_xlat16_61.x + u_xlat16_61.x;
    u_xlat9.xyz = (-u_xlat9.xyz) * u_xlat16_61.xxx + (-u_xlat16_14.xyz);
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat16_34.y = u_xlat48.x * 0.5;
    u_xlat16_34.x = u_xlat16_17.x * 1.09769487;
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_34.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34.x = floor(u_xlat16_3.w);
    u_xlat16_56 = u_xlat16_34.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_34.x = u_xlat16_34.z * 15.0 + (-u_xlat16_34.x);
    u_xlat16_56 = (-u_xlat16_70) + u_xlat16_48;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_56 + u_xlat16_70;
    u_xlat16_34.x = u_xlat16_12.x * u_xlat16_34.x;
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48.x = min(max(u_xlat48.x, 0.0), 1.0);
#else
    u_xlat48.x = clamp(u_xlat48.x, 0.0, 1.0);
#endif
    u_xlat48.x = u_xlat48.x * u_xlat16_34.x;
    u_xlat16_74 = u_xlat48.x * u_xlat16_13.x + u_xlat16_74;
    u_xlat16_34.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_56 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_74 = u_xlat4.y * u_xlat16_74;
    u_xlat4.x = min(u_xlat4.x, u_xlat16_68);
    u_xlat16_74 = min(u_xlat16_68, u_xlat16_74);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_18.y = u_xlat16_8.y;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat16_8.xyz;
    u_xlati68 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_12.xyz = u_xlat16_8.yyy * _IrradianceACCoeffs[u_xlati68].xyz;
    u_xlati68 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_8.xxx * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_12.xyz;
    u_xlat16_8.xyz = u_xlat16_8.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat26.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat9.xyz);
    u_xlat16_34.x = u_xlat16_80 * u_xlat16_80;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat26.xyz = u_xlat16_34.xxx * u_xlat26.xyz + u_xlat9.xyz;
    u_xlat7.xyz = (-u_xlat26.xyz) + u_xlat9.xyz;
    u_xlat26.xyz = abs(vec3(u_xlat16_57)) * u_xlat7.xyz + u_xlat26.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat18.y = u_xlat26.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_34.x = -abs(u_xlat16_57) * 0.800000012 + 1.0;
    u_xlat68 = (-u_xlat16_57) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_80;
    u_xlat26.x = u_xlat16_35.x * u_xlat16_80;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat16_34.x = u_xlat16_17.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_34.x);
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_34.x);
    u_xlat16_34.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat7.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_34.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = u_xlat16_12.xxx * u_xlat16_34.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb48)) ? u_xlat16_13.xyz : u_xlat16_34.xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_13.xyz;
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_78 = log2(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _alphaClipPower;
    u_xlat16_78 = exp2(u_xlat16_78);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.x = u_xlat0.x + (-_ShadeRange);
    u_xlat7.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
    u_xlat16_22.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat22.xy = (-u_xlat16_22.xy) + vec2(1.0, 1.0);
    u_xlat16_80 = min(u_xlat22.x, u_xlat0.x);
    u_xlat16_80 = u_xlat16_80 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_15.zzz * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_61.x = (-u_xlat16_15.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + (-u_xlat0.xyw);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz + u_xlat0.xyw;
    u_xlat16_20.xyz = (-u_xlat16_13.xyz) * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_13.xyz = u_xlat22.yyy * u_xlat16_20.xyz + u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_61.xxx * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_17.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_17.x;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_19.xyz = u_xlat16_39.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat48.x = dot(u_xlat22.xyz, u_xlat6.xyz);
    u_xlat15.y = u_xlat48.x * u_xlat26.x;
    u_xlat16_74 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat15.x = u_xlat68 * u_xlat16_74;
    u_xlat48.x = u_xlat68 * u_xlat26.x;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_74) + 1.0;
    u_xlat15.z = u_xlat70 * u_xlat48.x;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat48.x / u_xlat70;
    u_xlat48.x = u_xlat48.x * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat48.x = u_xlat48.x * u_xlat70;
    u_xlat48.x = min(u_xlat48.x, 16.0);
    u_xlat70 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat22.x * u_xlat68;
    u_xlat7.z = u_xlat68 * u_xlat70;
    u_xlat16_74 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat22.x * u_xlat26.x;
    u_xlat7.y = u_xlat26.x * u_xlat16_74;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat0.y = u_xlat22.x + u_xlat7.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat0.x = u_xlat44 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.y + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat48.x;
    u_xlat22.x = u_xlat16_39.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat71 * u_xlat71;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat44 = (-u_xlat16_74) * u_xlat71 + 1.0;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat26.xyz = u_xlat16_39.xyz * vec3(u_xlat44);
    u_xlat22.xyz = u_xlat22.xxx * vec3(u_xlat16_74) + u_xlat26.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_17.xyz = u_xlat26.xyz * u_xlat16_36.xxx;
    u_xlat16_36.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_36.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_36.x);
#endif
    u_xlat16_36.xz = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_36.zzz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_80);
    u_xlat16_80 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_80 = (-u_xlat16_80) * u_xlat16_80 + 1.0;
    u_xlat16_80 = max(u_xlat16_80, 0.0);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_36.x, u_xlat16_14.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_14.xyw = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyw = u_xlat16_13.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = vec3(u_xlat46) * u_xlat16_14.xyw;
    u_xlat16_14.xyw = vec3(u_xlat66) * u_xlat16_14.xyw;
    u_xlat16_17.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz + _shadowColor.zxy;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat7.xxx + u_xlat16_14.xyw;
    u_xlat16_74 = u_xlat7.x + (-_MainLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_83 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_41.xyz = u_xlat2.xzw * u_xlat16_41.xxx;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_41.xyz = u_xlat16_41.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_42 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_41.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_42 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19.x = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_19.x = u_xlat16_41.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_20.x, u_xlat16_19.x);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_19.x;
    u_xlat16_19.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = vec3(u_xlat24) * u_xlat16_19.xyz;
    u_xlat16_14.xyw = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_14.xyw;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat4.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz + u_xlat16_14.xyw;
    u_xlat16_14.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyw = min(max(u_xlat16_14.xyw, 0.0), 1.0);
#else
    u_xlat16_14.xyw = clamp(u_xlat16_14.xyw, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw + u_xlat16_8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw;
    u_xlat16_12.xyz = u_xlat0.yzx * u_xlat16_17.yzx + u_xlat16_12.yzx;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_78;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyw = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_19.xyz = u_xlat16_14.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + u_xlat16_8.xyz;
    u_xlat16_34.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _MainLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_34.x = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_34.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_34.x;
    u_xlat16_14.xyw = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_14.xyw = u_xlat16_14.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyw = u_xlat16_17.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_34.xxx * u_xlat16_14.xyw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_14.xyw;
    u_xlat16_74 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_74 = float(1.0) / u_xlat16_74;
    u_xlat16_14.xyw = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_17.x = dot(u_xlat16_14.xyw, u_xlat16_14.xyw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_14.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_14.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_14.www + u_xlat0.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_74 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_14.xyw * u_xlat16_19.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_14.xyw;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_14.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_14.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_14.x = u_xlat16_14.x / u_xlat16_14.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_14.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb68 = _UseSansheMask>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xy = u_xlat16_4.xy * u_xlat16_34.xx + u_xlat16_34.yy;
    u_xlat16_74 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe2_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_34.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_34.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_14.xyz = u_xlat16_34.xxx * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.zxy;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
    u_xlat16_13.xyz = u_xlat22.xyz * vec3(u_xlat16_74) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat22.x = dot(u_xlat16_8.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_44 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_13.xyz = vec3(u_xlat16_44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_44) + _FogCol.zxy;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat44 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat66 = u_xlat2.x * 15.0 + (-u_xlat44);
    u_xlat1.x = u_xlat44 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_52 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_52) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_52) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_8.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_34.x = min(u_xlat16_8.z, u_xlat16_30.x);
    u_xlat16_30.x = (-u_xlat16_8.z) + u_xlat16_30.x;
    u_xlat16_52 = u_xlat16_8.x + (-u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_52 * 6.0 + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_34.x;
    u_xlat16_30.x = u_xlat16_30.x + u_xlat16_8.w;
    u_xlat16_30.x = abs(u_xlat16_30.x) + _HueShift;
    u_xlat16_13.xyz = u_xlat16_30.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_13.xyz = fract(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_13.xyz = abs(u_xlat16_13.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_52 / u_xlat16_30.x;
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_30.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_34.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_78;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
float u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
vec2 u_xlat48;
mediump float u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_52;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_74;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb68 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = vec3(u_xlat72) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb68)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat68 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat68 = u_xlat1.z + (-u_xlat68);
    u_xlat3.x = max((-u_xlat1.w), u_xlat68);
    u_xlat3.x = (-u_xlat68) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat68;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat24 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat24 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_24.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat24 = u_xlat16_24.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat46 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat68 = u_xlat2.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat68) + vec2(1.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat10.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_74) + u_xlat16_12.x;
    u_xlat16_34.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_34.x + 1.0;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_74;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_74));
    u_xlat16_74 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.5<_anisoUse2U);
#else
    u_xlatb68 = 0.5<_anisoUse2U;
#endif
    u_xlat48.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat48.xy = u_xlat48.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_68 = texture(_anisotropicMap, u_xlat48.xy).x;
    u_xlat68 = u_xlat16_68 * 2.0 + -1.0;
    u_xlat68 = u_xlat68 * _sunShift + _sunShiftOffset;
    u_xlat68 = u_xlat68 + vs_TEXCOORD5;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_35.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb48 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat48.x = (u_xlatb48) ? 1.0 : -1.0;
    u_xlat48.x = u_xlat48.x * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat70) + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat16_35.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat10.xyz + u_xlat6.zxy;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseAO2U>=0.5);
#else
    u_xlatb68 = _UseAO2U>=0.5;
#endif
    u_xlat16_35.xy = (bool(u_xlatb68)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_35.xy = u_xlat16_35.xy + u_xlat16_14.xy;
    u_xlat16_68 = texture(_materialParamsMap, u_xlat16_35.xy).z;
    u_xlat16_35.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_57 = u_xlat16_35.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_57>=0.0);
#else
    u_xlatb48 = u_xlat16_57>=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb48)) ? u_xlat9.xyz : u_xlat5.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat11.xyz * vec3(u_xlat16_79);
    u_xlat15.xyz = u_xlat9.xyz * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat9.zxy * u_xlat16_14.yzx + (-u_xlat15.xyz);
    u_xlat16.xyz = u_xlat9.xyz * u_xlat15.xyz;
    u_xlat9.xyz = u_xlat15.zxy * u_xlat9.yzx + (-u_xlat16.xyz);
    u_xlat9.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat9.xyz;
    u_xlat16_15.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_17.xy = u_xlat16_15.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_61.x = u_xlat16_80 * 8.0;
    u_xlat16_61.x = min(u_xlat16_61.x, 1.0);
    u_xlat16_61.x = abs(u_xlat16_57) * u_xlat16_61.x;
    u_xlat9.xyz = u_xlat16_61.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat48.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat9.xyz = u_xlat48.xxx * u_xlat9.xyz;
    u_xlat16_61.x = dot((-u_xlat16_14.xyz), u_xlat9.xyz);
    u_xlat16_61.x = u_xlat16_61.x + u_xlat16_61.x;
    u_xlat9.xyz = (-u_xlat9.xyz) * u_xlat16_61.xxx + (-u_xlat16_14.xyz);
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat16_34.y = u_xlat48.x * 0.5;
    u_xlat16_34.x = u_xlat16_17.x * 1.09769487;
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_34.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34.x = floor(u_xlat16_3.w);
    u_xlat16_56 = u_xlat16_34.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_34.x = u_xlat16_34.z * 15.0 + (-u_xlat16_34.x);
    u_xlat16_56 = (-u_xlat16_70) + u_xlat16_48;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_56 + u_xlat16_70;
    u_xlat16_34.x = u_xlat16_12.x * u_xlat16_34.x;
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48.x = min(max(u_xlat48.x, 0.0), 1.0);
#else
    u_xlat48.x = clamp(u_xlat48.x, 0.0, 1.0);
#endif
    u_xlat48.x = u_xlat48.x * u_xlat16_34.x;
    u_xlat16_74 = u_xlat48.x * u_xlat16_13.x + u_xlat16_74;
    u_xlat16_34.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_56 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_74 = u_xlat4.y * u_xlat16_74;
    u_xlat4.x = min(u_xlat4.x, u_xlat16_68);
    u_xlat16_74 = min(u_xlat16_68, u_xlat16_74);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_18.y = u_xlat16_8.y;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat16_8.xyz;
    u_xlati68 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_12.xyz = u_xlat16_8.yyy * _IrradianceACCoeffs[u_xlati68].xyz;
    u_xlati68 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_8.xxx * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_12.xyz;
    u_xlat16_8.xyz = u_xlat16_8.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat26.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat9.xyz);
    u_xlat16_34.x = u_xlat16_80 * u_xlat16_80;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat26.xyz = u_xlat16_34.xxx * u_xlat26.xyz + u_xlat9.xyz;
    u_xlat7.xyz = (-u_xlat26.xyz) + u_xlat9.xyz;
    u_xlat26.xyz = abs(vec3(u_xlat16_57)) * u_xlat7.xyz + u_xlat26.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat18.y = u_xlat26.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_34.x = -abs(u_xlat16_57) * 0.800000012 + 1.0;
    u_xlat68 = (-u_xlat16_57) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_80;
    u_xlat26.x = u_xlat16_35.x * u_xlat16_80;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat16_34.x = u_xlat16_17.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_34.x);
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_34.x);
    u_xlat16_34.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat7.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_34.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = u_xlat16_12.xxx * u_xlat16_34.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb48)) ? u_xlat16_13.xyz : u_xlat16_34.xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_13.xyz;
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_78 = log2(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _alphaClipPower;
    u_xlat16_78 = exp2(u_xlat16_78);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.x = u_xlat0.x + (-_ShadeRange);
    u_xlat7.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
    u_xlat16_22.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat22.xy = (-u_xlat16_22.xy) + vec2(1.0, 1.0);
    u_xlat16_80 = min(u_xlat22.x, u_xlat0.x);
    u_xlat16_80 = u_xlat16_80 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_15.zzz * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_61.x = (-u_xlat16_15.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + (-u_xlat0.xyw);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz + u_xlat0.xyw;
    u_xlat16_20.xyz = (-u_xlat16_13.xyz) * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_13.xyz = u_xlat22.yyy * u_xlat16_20.xyz + u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_61.xxx * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_17.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_17.x;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_19.xyz = u_xlat16_39.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat48.x = dot(u_xlat22.xyz, u_xlat6.xyz);
    u_xlat15.y = u_xlat48.x * u_xlat26.x;
    u_xlat16_74 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat15.x = u_xlat68 * u_xlat16_74;
    u_xlat48.x = u_xlat68 * u_xlat26.x;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_74) + 1.0;
    u_xlat15.z = u_xlat70 * u_xlat48.x;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat48.x / u_xlat70;
    u_xlat48.x = u_xlat48.x * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat48.x = u_xlat48.x * u_xlat70;
    u_xlat48.x = min(u_xlat48.x, 16.0);
    u_xlat70 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat22.x * u_xlat68;
    u_xlat7.z = u_xlat68 * u_xlat70;
    u_xlat16_74 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat22.x * u_xlat26.x;
    u_xlat7.y = u_xlat26.x * u_xlat16_74;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat0.y = u_xlat22.x + u_xlat7.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat0.x = u_xlat44 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.y + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat48.x;
    u_xlat22.x = u_xlat16_39.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat71 * u_xlat71;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat44 = (-u_xlat16_74) * u_xlat71 + 1.0;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat26.xyz = u_xlat16_39.xyz * vec3(u_xlat44);
    u_xlat22.xyz = u_xlat22.xxx * vec3(u_xlat16_74) + u_xlat26.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_17.xyz = u_xlat26.xyz * u_xlat16_36.xxx;
    u_xlat16_36.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_36.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_36.x);
#endif
    u_xlat16_36.xz = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_36.zzz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_80);
    u_xlat16_80 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_80 = (-u_xlat16_80) * u_xlat16_80 + 1.0;
    u_xlat16_80 = max(u_xlat16_80, 0.0);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_36.x, u_xlat16_14.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_14.xyw = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyw = u_xlat16_13.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = vec3(u_xlat46) * u_xlat16_14.xyw;
    u_xlat16_14.xyw = vec3(u_xlat66) * u_xlat16_14.xyw;
    u_xlat16_17.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz + _shadowColor.zxy;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat7.xxx + u_xlat16_14.xyw;
    u_xlat16_74 = u_xlat7.x + (-_MainLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_83 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_41.xyz = u_xlat2.xzw * u_xlat16_41.xxx;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_41.xyz = u_xlat16_41.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_42 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_41.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_42 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19.x = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_19.x = u_xlat16_41.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_20.x, u_xlat16_19.x);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_19.x;
    u_xlat16_19.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = vec3(u_xlat24) * u_xlat16_19.xyz;
    u_xlat16_14.xyw = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_14.xyw;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat4.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz + u_xlat16_14.xyw;
    u_xlat16_14.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyw = min(max(u_xlat16_14.xyw, 0.0), 1.0);
#else
    u_xlat16_14.xyw = clamp(u_xlat16_14.xyw, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw + u_xlat16_8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw;
    u_xlat16_12.xyz = u_xlat0.yzx * u_xlat16_17.yzx + u_xlat16_12.yzx;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_78;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyw = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_19.xyz = u_xlat16_14.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + u_xlat16_8.xyz;
    u_xlat16_34.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _MainLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_34.x = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_34.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_34.x;
    u_xlat16_14.xyw = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_14.xyw = u_xlat16_14.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyw = u_xlat16_17.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_34.xxx * u_xlat16_14.xyw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_14.xyw;
    u_xlat16_74 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_74 = float(1.0) / u_xlat16_74;
    u_xlat16_14.xyw = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_17.x = dot(u_xlat16_14.xyw, u_xlat16_14.xyw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.xyz = _HairCustomAdditionalLightColor.zxy * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_14.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_14.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_14.www + u_xlat0.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_74 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_14.xyw * u_xlat16_19.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_14.xyw;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_14.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_14.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_14.x = u_xlat16_14.x / u_xlat16_14.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_14.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb68 = _UseSansheMask>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xy = u_xlat16_4.xy * u_xlat16_34.xx + u_xlat16_34.yy;
    u_xlat16_74 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe2_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_34.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_34.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_14.xyz = u_xlat16_34.xxx * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.zxy;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
    u_xlat16_13.xyz = u_xlat22.xyz * vec3(u_xlat16_74) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat22.x = dot(u_xlat16_8.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_44 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_13.xyz = vec3(u_xlat16_44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_44) + _FogCol.zxy;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat44 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat66 = u_xlat2.x * 15.0 + (-u_xlat44);
    u_xlat1.x = u_xlat44 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_52 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_52) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_52) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_8.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_34.x = min(u_xlat16_8.z, u_xlat16_30.x);
    u_xlat16_30.x = (-u_xlat16_8.z) + u_xlat16_30.x;
    u_xlat16_52 = u_xlat16_8.x + (-u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_52 * 6.0 + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_30.x / u_xlat16_34.x;
    u_xlat16_30.x = u_xlat16_30.x + u_xlat16_8.w;
    u_xlat16_30.x = abs(u_xlat16_30.x) + _HueShift;
    u_xlat16_13.xyz = u_xlat16_30.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_13.xyz = fract(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_13.xyz = abs(u_xlat16_13.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_30.x = u_xlat16_52 / u_xlat16_30.x;
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_30.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.xxx;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_34.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_78;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec2 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_36;
float u_xlat38;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
float u_xlat40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_46;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_UseAO2U>=0.5);
#else
    u_xlatb60 = _UseAO2U>=0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb60)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_60 = texture(_materialParamsMap, u_xlat16_1.xy).z;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_60));
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb4 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb4)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat6.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = u_xlat9.zxy * u_xlat6.yzx + (-u_xlat10.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_9.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_58 = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_65 = u_xlat16_58 * 8.0;
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = abs(u_xlat16_20.x) * u_xlat16_65;
    u_xlat6.xyz = vec3(u_xlat16_65) * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_65 = dot((-u_xlat16_8.xyz), u_xlat6.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat6.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_65) + (-u_xlat16_8.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_65 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_65) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat16_58 * u_xlat2.x;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_58;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_1.xyw = u_xlat16_10.www * u_xlat16_10.xyz;
    u_xlat10.xyz = u_xlat16_1.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_1.xyw = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_65 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_14.xyw;
    u_xlat16_49 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_1.xyw * vec3(u_xlat16_49);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_1.xyw;
    u_xlat16_15.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_0.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_0.xyz * u_xlat16_15.xyz;
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_49 = log2(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _alphaClipPower;
    u_xlat16_30.y = exp2(u_xlat16_49);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat19.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat38 = u_xlat19.x + (-_ShadeRange);
    u_xlat10.x = min(u_xlat19.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_19.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat19.xy = (-u_xlat16_19.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat19.x, u_xlat0.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_9.zzz * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat0.xyw);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz + u_xlat0.xyw;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat19.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_11.x;
    u_xlat16_36.x = u_xlat16_11.x * 1.09769487;
    u_xlat9.x = dot(u_xlat23.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_19.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_11.xyw = u_xlat16_16.xyz * u_xlat16_19.xxx + u_xlat16_19.yyy;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_11.xyw;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_36.y = u_xlat19.x * 0.5;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_11.xyw = u_xlat16_36.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_11.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.xy = min(u_xlat16_30.xy, vec2(15.0, 1.0));
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_6.x = u_xlat16_11.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_38) + u_xlat16_19.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_38;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_30.x) + u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_11.x;
    u_xlat38 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat38 * 0.5;
    u_xlat16_11.x = (-u_xlat38) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat19.x * u_xlat16_11.x + u_xlat16_65;
    u_xlat16_11.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_65 = u_xlat38 * u_xlat16_65;
    u_xlat19.x = min(u_xlat38, u_xlat16_60);
    u_xlat16_65 = min(u_xlat16_60, u_xlat16_65);
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(u_xlat16_65);
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat13.xyz);
    u_xlat18.y = u_xlat38 * u_xlat2.y;
    u_xlat16_65 = dot(u_xlat3.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat2.x * u_xlat16_65;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat57 = dot(u_xlat23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat18.z = u_xlat57 * u_xlat38;
    u_xlat57 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat38 / u_xlat57;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat38 = u_xlat38 * u_xlat57;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat57 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat9.z = u_xlat59 * u_xlat2.x;
    u_xlat10.z = u_xlat57 * u_xlat2.x;
    u_xlat16_65 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = dot(u_xlat3.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat57 * u_xlat2.y;
    u_xlat10.y = u_xlat2.y * u_xlat16_65;
    u_xlat57 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat0.w = u_xlat57 + u_xlat10.x;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat0.x = u_xlat0.x + u_xlat2.x;
    u_xlat0.xw = u_xlat0.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.w + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat38;
    u_xlat38 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat40 * u_xlat40;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat57 = (-u_xlat16_8.x) * u_xlat40 + 1.0;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat10.xxx * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_27.x);
    u_xlat16_11.xyw = u_xlat2.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.yyy + u_xlat16_16.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyw);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_8.x = max(u_xlat16_8.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_27.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_27.x = u_xlat16_65 * u_xlat16_27.x;
    u_xlat16_27.x = max(u_xlat16_12.x, u_xlat16_27.x);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_27.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb3.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_5.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb3.x) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb3.y) ? float(0.0) : float(1.0);
    u_xlat16_11.xy = (u_xlatb3.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat21.xy = u_xlat16_21.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat21.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat2.xxx * u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat10.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat10.x + (-_MainLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_31 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_31 = max(u_xlat16_31, 6.10351563e-05);
    u_xlat16_50.x = inversesqrt(u_xlat16_31);
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat16_50.xxx;
    u_xlat16_50.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_50.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_50.x);
#endif
    u_xlat16_50.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_50.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_50.yyy + u_xlat16_17.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_69);
    u_xlat16_69 = u_xlat16_31 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_31 = float(1.0) / float(u_xlat16_31);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_31 = u_xlat16_69 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_50.x, u_xlat16_31);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_31;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.yyy * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat19.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_14.xyz * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz;
    u_xlat16_1.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyw;
    u_xlat16_1.x = dot(u_xlat16_1.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_30.y;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyw;
    u_xlat16_20.xz = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_68 / u_xlat16_20.x;
    u_xlat16_20.x = log2(abs(u_xlat16_20.x));
    u_xlat16_20.x = u_xlat16_20.x * _MainLightCompensatePow;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_68 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_58 = u_xlat16_68 / u_xlat16_20.z;
    u_xlat16_20.x = u_xlat16_58 * u_xlat16_20.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * u_xlat16_20.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat16_68 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_12.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_69 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_14.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_12.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_12.zzz + u_xlat0.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_16.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 / u_xlat16_12.x;
    u_xlat16_68 = log2(abs(u_xlat16_68));
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightCompensatePow;
    u_xlat16_68 = exp2(u_xlat16_68);
    u_xlat16_12.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_12.x = u_xlat16_12.x / u_xlat16_12.y;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(u_xlat16_68);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_8.z;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = max(u_xlat57, 0.00048828125);
    u_xlat57 = log2(u_xlat57);
    u_xlat57 = u_xlat57 * _Sanshe_Fw;
    u_xlat57 = exp2(u_xlat57);
    u_xlat0.w = u_xlat57 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb59 = _UseSansheMask>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xz = u_xlat16_3.xy * u_xlat16_20.xx + u_xlat16_20.zz;
    u_xlat16_46 = u_xlat16_3.z * u_xlat16_11.x + u_xlat16_11.y;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe2_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_20.zx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_11.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyw = u_xlat16_11.xxx * _DirectionalDir.xyz;
    u_xlat19.x = dot(u_xlat16_11.xyw, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat19.xyz = u_xlat19.xxx * _DirectionalColor.xyz;
    u_xlat19.xyz = u_xlat19.xyz * vec3(_DirectionalIntensity);
    u_xlat16_20.xyz = u_xlat19.xyz * vec3(u_xlat16_46) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_8.xyw;
    u_xlat19.x = dot(u_xlat16_8.xyw, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat19.x = u_xlat19.x + -0.25;
    u_xlat19.x = u_xlat19.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_38 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_8.xyz = vec3(u_xlat16_38) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * vec3(u_xlat16_38) + _FogCol.xyz;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat2.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat38)) + u_xlat2.xyz;
    u_xlat57 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat57;
    u_xlat0.x = max(u_xlat19.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat2.xyz + vec3(u_xlat38);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb57 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_46 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_2.xy = vec2(u_xlat16_46) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_2.zw = vec2(u_xlat16_46) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_2.xyw);
    u_xlat16_4.yzw = u_xlat16_2.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb19 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_8.x = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_27.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_2.xyw;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_27.x);
    u_xlat16_27.x = (-u_xlat16_8.z) + u_xlat16_27.x;
    u_xlat16_46 = u_xlat16_8.x + (-u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_46 * 6.0 + 9.99999975e-05;
    u_xlat16_27.x = u_xlat16_27.x / u_xlat16_11.x;
    u_xlat16_27.x = u_xlat16_27.x + u_xlat16_8.w;
    u_xlat16_27.x = abs(u_xlat16_27.x) + _HueShift;
    u_xlat16_11.xyw = u_xlat16_27.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_11.xyw = fract(u_xlat16_11.xyw);
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_11.xyw = abs(u_xlat16_11.xyw) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_11.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat16_27.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_27.x = u_xlat16_46 / u_xlat16_27.x;
    u_xlat16_27.xyz = u_xlat16_27.xxx * u_xlat16_11.xyw + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_27.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xxx;
    SV_Target0.xyz = u_xlat16_20.xyz * u_xlat16_11.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_30.y;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec2 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_36;
float u_xlat38;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
float u_xlat40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_46;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_UseAO2U>=0.5);
#else
    u_xlatb60 = _UseAO2U>=0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb60)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_60 = texture(_materialParamsMap, u_xlat16_1.xy).z;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_60));
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb4 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb4)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat6.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = u_xlat9.zxy * u_xlat6.yzx + (-u_xlat10.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_9.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_58 = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_65 = u_xlat16_58 * 8.0;
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = abs(u_xlat16_20.x) * u_xlat16_65;
    u_xlat6.xyz = vec3(u_xlat16_65) * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_65 = dot((-u_xlat16_8.xyz), u_xlat6.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat6.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_65) + (-u_xlat16_8.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_65 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_65) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat16_58 * u_xlat2.x;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_58;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_1.xyw = u_xlat16_10.www * u_xlat16_10.xyz;
    u_xlat10.xyz = u_xlat16_1.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_1.xyw = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_65 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_14.xyw;
    u_xlat16_49 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_1.xyw * vec3(u_xlat16_49);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_1.xyw;
    u_xlat16_15.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_0.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_0.xyz * u_xlat16_15.xyz;
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_49 = log2(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _alphaClipPower;
    u_xlat16_30.y = exp2(u_xlat16_49);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat19.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat38 = u_xlat19.x + (-_ShadeRange);
    u_xlat10.x = min(u_xlat19.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_19.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat19.xy = (-u_xlat16_19.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat19.x, u_xlat0.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_9.zzz * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat0.xyw);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz + u_xlat0.xyw;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat19.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_11.x;
    u_xlat16_36.x = u_xlat16_11.x * 1.09769487;
    u_xlat9.x = dot(u_xlat23.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_19.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_11.xyw = u_xlat16_16.xyz * u_xlat16_19.xxx + u_xlat16_19.yyy;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_11.xyw;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_36.y = u_xlat19.x * 0.5;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_11.xyw = u_xlat16_36.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_11.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.xy = min(u_xlat16_30.xy, vec2(15.0, 1.0));
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_6.x = u_xlat16_11.x * 16.0 + u_xlat16_6.z;
    u_xlat16_17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_38) + u_xlat16_19.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_38;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat19.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_30.x) + u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat16_36.z * u_xlat16_11.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_11.x;
    u_xlat38 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat38 * 0.5;
    u_xlat16_11.x = (-u_xlat38) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat19.x * u_xlat16_11.x + u_xlat16_65;
    u_xlat16_11.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_65 = u_xlat38 * u_xlat16_65;
    u_xlat19.x = min(u_xlat38, u_xlat16_60);
    u_xlat16_65 = min(u_xlat16_60, u_xlat16_65);
    u_xlat16_1.xyw = u_xlat16_1.xyw * vec3(u_xlat16_65);
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat13.xyz);
    u_xlat18.y = u_xlat38 * u_xlat2.y;
    u_xlat16_65 = dot(u_xlat3.zxy, u_xlat13.xyz);
    u_xlat18.x = u_xlat2.x * u_xlat16_65;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat57 = dot(u_xlat23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat18.z = u_xlat57 * u_xlat38;
    u_xlat57 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat38 / u_xlat57;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat38 = u_xlat38 * u_xlat57;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat57 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat9.z = u_xlat59 * u_xlat2.x;
    u_xlat10.z = u_xlat57 * u_xlat2.x;
    u_xlat16_65 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = dot(u_xlat3.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat57 * u_xlat2.y;
    u_xlat10.y = u_xlat2.y * u_xlat16_65;
    u_xlat57 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat0.w = u_xlat57 + u_xlat10.x;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat0.x = u_xlat0.x + u_xlat2.x;
    u_xlat0.xw = u_xlat0.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.w + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat38;
    u_xlat38 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat40 * u_xlat40;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat57 = (-u_xlat16_8.x) * u_xlat40 + 1.0;
    u_xlat16_8.x = u_xlat40 * u_xlat16_8.x;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat10.xxx * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_27.x);
    u_xlat16_11.xyw = u_xlat2.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.yyy + u_xlat16_16.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyw);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_8.x = max(u_xlat16_8.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_27.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_27.x = u_xlat16_65 * u_xlat16_27.x;
    u_xlat16_27.x = max(u_xlat16_12.x, u_xlat16_27.x);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_27.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlatb3.xyz = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask, _UseRenderInfo01Mask), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_5.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb3.x) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb3.y) ? float(0.0) : float(1.0);
    u_xlat16_11.xy = (u_xlatb3.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat21.xy = u_xlat16_21.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat21.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat2.xxx * u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat10.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat10.x + (-_MainLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_31 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_31 = max(u_xlat16_31, 6.10351563e-05);
    u_xlat16_50.x = inversesqrt(u_xlat16_31);
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat16_50.xxx;
    u_xlat16_50.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_50.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_50.x);
#endif
    u_xlat16_50.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_50.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_50.yyy + u_xlat16_17.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_69);
    u_xlat16_69 = u_xlat16_31 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_31 = float(1.0) / float(u_xlat16_31);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_31 = u_xlat16_69 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_50.x, u_xlat16_31);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_31;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.yyy * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat19.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat19.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_8.xyw = u_xlat16_14.xyz * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz + u_xlat16_8.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_12.xyz;
    u_xlat16_1.xyw = u_xlat0.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyw;
    u_xlat16_1.x = dot(u_xlat16_1.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_30.y;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyw = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyw;
    u_xlat16_20.xz = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_68 / u_xlat16_20.x;
    u_xlat16_20.x = log2(abs(u_xlat16_20.x));
    u_xlat16_20.x = u_xlat16_20.x * _MainLightCompensatePow;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_68 = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_58 = u_xlat16_68 / u_xlat16_20.z;
    u_xlat16_20.x = u_xlat16_58 * u_xlat16_20.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * u_xlat16_20.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat16_68 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_12.xyz = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_69 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_14.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_12.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_12.zzz + u_xlat0.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_8.xyw;
    u_xlat16_68 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_68 = (-u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xxx;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_16.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_68 / u_xlat16_12.x;
    u_xlat16_68 = log2(abs(u_xlat16_68));
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightCompensatePow;
    u_xlat16_68 = exp2(u_xlat16_68);
    u_xlat16_12.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_12.x = u_xlat16_12.x / u_xlat16_12.y;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_15.xyz * vec3(u_xlat16_68);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyw;
    u_xlat16_12.xyz = u_xlat16_20.xxx * u_xlat16_12.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_20.zzz + u_xlat16_12.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_8.z;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat57 = max(u_xlat57, 0.0);
    u_xlat57 = max(u_xlat57, 0.00048828125);
    u_xlat57 = log2(u_xlat57);
    u_xlat57 = u_xlat57 * _Sanshe_Fw;
    u_xlat57 = exp2(u_xlat57);
    u_xlat0.w = u_xlat57 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb59 = _UseSansheMask>=0.5;
#endif
    u_xlat16_20.xz = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xz = u_xlat16_3.xy * u_xlat16_20.xx + u_xlat16_20.zz;
    u_xlat16_46 = u_xlat16_3.z * u_xlat16_11.x + u_xlat16_11.y;
    u_xlat2.x = u_xlat7.x * u_xlat16_39.x + _Sanshe2_X;
    u_xlat2.y = u_xlat7.y * u_xlat16_39.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_20.zx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_11.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyw = u_xlat16_11.xxx * _DirectionalDir.xyz;
    u_xlat19.x = dot(u_xlat16_11.xyw, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat19.xyz = u_xlat19.xxx * _DirectionalColor.xyz;
    u_xlat19.xyz = u_xlat19.xyz * vec3(_DirectionalIntensity);
    u_xlat16_20.xyz = u_xlat19.xyz * vec3(u_xlat16_46) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_8.xyw;
    u_xlat19.x = dot(u_xlat16_8.xyw, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat19.x = u_xlat19.x + -0.25;
    u_xlat19.x = u_xlat19.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_38 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_8.xyz = vec3(u_xlat16_38) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_20.xyz) * vec3(u_xlat16_38) + _FogCol.xyz;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = _PostExposure + _ExposureCompensate;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat2.xyz = u_xlat16_20.xyz * u_xlat16_8.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat38)) + u_xlat2.xyz;
    u_xlat57 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat57;
    u_xlat0.x = max(u_xlat19.x, u_xlat0.x);
    u_xlat16_8.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x + _Saturation;
    u_xlat0.xyz = u_xlat16_8.xxx * u_xlat2.xyz + vec3(u_xlat38);
    u_xlat16_8.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb57 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_46 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_2.xy = vec2(u_xlat16_46) * u_xlat16_8.xy + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_8.x = float(1.0);
    u_xlat16_8.y = float(-1.0);
    u_xlat16_2.zw = vec2(u_xlat16_46) * u_xlat16_8.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_2.xyw);
    u_xlat16_4.yzw = u_xlat16_2.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb19 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_8.x = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_27.x = u_xlat16_8.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_8.xzw = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_2.xyw;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_27.x);
    u_xlat16_27.x = (-u_xlat16_8.z) + u_xlat16_27.x;
    u_xlat16_46 = u_xlat16_8.x + (-u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_46 * 6.0 + 9.99999975e-05;
    u_xlat16_27.x = u_xlat16_27.x / u_xlat16_11.x;
    u_xlat16_27.x = u_xlat16_27.x + u_xlat16_8.w;
    u_xlat16_27.x = abs(u_xlat16_27.x) + _HueShift;
    u_xlat16_11.xyw = u_xlat16_27.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_11.xyw = fract(u_xlat16_11.xyw);
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_11.xyw = abs(u_xlat16_11.xyw) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyw = min(max(u_xlat16_11.xyw, 0.0), 1.0);
#else
    u_xlat16_11.xyw = clamp(u_xlat16_11.xyw, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_11.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat16_27.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_27.x = u_xlat16_46 / u_xlat16_27.x;
    u_xlat16_27.xyz = u_xlat16_27.xxx * u_xlat16_11.xyw + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_27.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xxx;
    SV_Target0.xyz = u_xlat16_20.xyz * u_xlat16_11.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_30.y;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
float u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
vec2 u_xlat48;
mediump float u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_74;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb68 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = vec3(u_xlat72) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb68)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat68 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat68 = u_xlat1.z + (-u_xlat68);
    u_xlat3.x = max((-u_xlat1.w), u_xlat68);
    u_xlat3.x = (-u_xlat68) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat68;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat24 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat24 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_24.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat24 = u_xlat16_24.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat46 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat68 = u_xlat2.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat68) + vec2(1.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat10.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_74) + u_xlat16_12.x;
    u_xlat16_34.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_34.x + 1.0;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_74;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_74));
    u_xlat16_74 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.5<_anisoUse2U);
#else
    u_xlatb68 = 0.5<_anisoUse2U;
#endif
    u_xlat48.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat48.xy = u_xlat48.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_68 = texture(_anisotropicMap, u_xlat48.xy).x;
    u_xlat68 = u_xlat16_68 * 2.0 + -1.0;
    u_xlat68 = u_xlat68 * _sunShift + _sunShiftOffset;
    u_xlat68 = u_xlat68 + vs_TEXCOORD5;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_35.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb48 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat48.x = (u_xlatb48) ? 1.0 : -1.0;
    u_xlat48.x = u_xlat48.x * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat70) + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat16_35.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat10.xyz + u_xlat6.zxy;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseAO2U>=0.5);
#else
    u_xlatb68 = _UseAO2U>=0.5;
#endif
    u_xlat16_35.xy = (bool(u_xlatb68)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_35.xy = u_xlat16_35.xy + u_xlat16_14.xy;
    u_xlat16_68 = texture(_materialParamsMap, u_xlat16_35.xy).z;
    u_xlat16_35.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_57 = u_xlat16_35.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_57>=0.0);
#else
    u_xlatb48 = u_xlat16_57>=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb48)) ? u_xlat9.xyz : u_xlat5.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat11.xyz * vec3(u_xlat16_79);
    u_xlat15.xyz = u_xlat9.xyz * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat9.zxy * u_xlat16_14.yzx + (-u_xlat15.xyz);
    u_xlat16.xyz = u_xlat9.xyz * u_xlat15.xyz;
    u_xlat9.xyz = u_xlat15.zxy * u_xlat9.yzx + (-u_xlat16.xyz);
    u_xlat9.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat9.xyz;
    u_xlat16_15.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_17.xy = u_xlat16_15.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_61.x = u_xlat16_80 * 8.0;
    u_xlat16_61.x = min(u_xlat16_61.x, 1.0);
    u_xlat16_61.x = abs(u_xlat16_57) * u_xlat16_61.x;
    u_xlat9.xyz = u_xlat16_61.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat48.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat9.xyz = u_xlat48.xxx * u_xlat9.xyz;
    u_xlat16_61.x = dot((-u_xlat16_14.xyz), u_xlat9.xyz);
    u_xlat16_61.x = u_xlat16_61.x + u_xlat16_61.x;
    u_xlat9.xyz = (-u_xlat9.xyz) * u_xlat16_61.xxx + (-u_xlat16_14.xyz);
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat16_34.y = u_xlat48.x * 0.5;
    u_xlat16_34.x = u_xlat16_17.x * 1.09769487;
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_34.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34.x = floor(u_xlat16_3.w);
    u_xlat16_56 = u_xlat16_34.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_34.x = u_xlat16_34.z * 15.0 + (-u_xlat16_34.x);
    u_xlat16_56 = (-u_xlat16_70) + u_xlat16_48;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_56 + u_xlat16_70;
    u_xlat16_34.x = u_xlat16_12.x * u_xlat16_34.x;
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48.x = min(max(u_xlat48.x, 0.0), 1.0);
#else
    u_xlat48.x = clamp(u_xlat48.x, 0.0, 1.0);
#endif
    u_xlat48.x = u_xlat48.x * u_xlat16_34.x;
    u_xlat16_74 = u_xlat48.x * u_xlat16_13.x + u_xlat16_74;
    u_xlat16_34.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_56 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_74 = u_xlat4.y * u_xlat16_74;
    u_xlat4.x = min(u_xlat4.x, u_xlat16_68);
    u_xlat16_74 = min(u_xlat16_68, u_xlat16_74);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_18.y = u_xlat16_8.y;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat16_8.xyz;
    u_xlati68 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_12.xyz = u_xlat16_8.yyy * _IrradianceACCoeffs[u_xlati68].xyz;
    u_xlati68 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_8.xxx * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_12.xyz;
    u_xlat16_8.xyz = u_xlat16_8.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat26.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat9.xyz);
    u_xlat16_34.x = u_xlat16_80 * u_xlat16_80;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat26.xyz = u_xlat16_34.xxx * u_xlat26.xyz + u_xlat9.xyz;
    u_xlat7.xyz = (-u_xlat26.xyz) + u_xlat9.xyz;
    u_xlat26.xyz = abs(vec3(u_xlat16_57)) * u_xlat7.xyz + u_xlat26.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat18.y = u_xlat26.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_34.x = -abs(u_xlat16_57) * 0.800000012 + 1.0;
    u_xlat68 = (-u_xlat16_57) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_80;
    u_xlat26.x = u_xlat16_35.x * u_xlat16_80;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat16_34.x = u_xlat16_17.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_34.x);
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_34.x);
    u_xlat16_34.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_34.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = u_xlat16_12.xxx * u_xlat16_34.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb48)) ? u_xlat16_13.xyz : u_xlat16_34.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_13.xyz;
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_78 = log2(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _alphaClipPower;
    u_xlat16_78 = exp2(u_xlat16_78);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.x = u_xlat0.x + (-_ShadeRange);
    u_xlat7.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
    u_xlat16_22.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat22.xy = (-u_xlat16_22.xy) + vec2(1.0, 1.0);
    u_xlat16_80 = min(u_xlat22.x, u_xlat0.x);
    u_xlat16_80 = u_xlat16_80 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_15.zzz * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_61.x = (-u_xlat16_15.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + (-u_xlat0.xyw);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz + u_xlat0.xyw;
    u_xlat16_20.xyz = (-u_xlat16_13.xyz) * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_13.xyz = u_xlat22.yyy * u_xlat16_20.xyz + u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_61.xxx * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_17.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_17.x;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_19.xyz = u_xlat16_39.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat48.x = dot(u_xlat22.xyz, u_xlat6.xyz);
    u_xlat15.y = u_xlat48.x * u_xlat26.x;
    u_xlat16_74 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat15.x = u_xlat68 * u_xlat16_74;
    u_xlat48.x = u_xlat68 * u_xlat26.x;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_74) + 1.0;
    u_xlat15.z = u_xlat70 * u_xlat48.x;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat48.x / u_xlat70;
    u_xlat48.x = u_xlat48.x * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat48.x = u_xlat48.x * u_xlat70;
    u_xlat48.x = min(u_xlat48.x, 16.0);
    u_xlat70 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat22.x * u_xlat68;
    u_xlat7.z = u_xlat68 * u_xlat70;
    u_xlat16_74 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat22.x * u_xlat26.x;
    u_xlat7.y = u_xlat26.x * u_xlat16_74;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat0.y = u_xlat22.x + u_xlat7.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat0.x = u_xlat44 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.y + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat48.x;
    u_xlat22.x = u_xlat16_39.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat71 * u_xlat71;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat44 = (-u_xlat16_74) * u_xlat71 + 1.0;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat26.xyz = u_xlat16_39.xyz * vec3(u_xlat44);
    u_xlat22.xyz = u_xlat22.xxx * vec3(u_xlat16_74) + u_xlat26.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_17.xyz = u_xlat26.xyz * u_xlat16_36.xxx;
    u_xlat16_36.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_36.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_36.x);
#endif
    u_xlat16_36.xz = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_36.zzz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_80);
    u_xlat16_80 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_80 = (-u_xlat16_80) * u_xlat16_80 + 1.0;
    u_xlat16_80 = max(u_xlat16_80, 0.0);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_36.x, u_xlat16_14.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_14.xyw = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyw = u_xlat16_13.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = vec3(u_xlat46) * u_xlat16_14.xyw;
    u_xlat16_14.xyw = vec3(u_xlat66) * u_xlat16_14.xyw;
    u_xlat16_17.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat7.xxx + u_xlat16_14.xyw;
    u_xlat16_74 = u_xlat7.x + (-_MainLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_83 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_41.xyz = u_xlat2.xzw * u_xlat16_41.xxx;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_41.xyz = u_xlat16_41.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_42 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_41.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_42 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19.x = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_19.x = u_xlat16_41.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_20.x, u_xlat16_19.x);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_19.x;
    u_xlat16_19.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = vec3(u_xlat24) * u_xlat16_19.xyz;
    u_xlat16_14.xyw = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_14.xyw;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat4.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz + u_xlat16_14.xyw;
    u_xlat16_14.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyw = min(max(u_xlat16_14.xyw, 0.0), 1.0);
#else
    u_xlat16_14.xyw = clamp(u_xlat16_14.xyw, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw + u_xlat16_8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_78;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + u_xlat16_8.xyz;
    u_xlat16_34.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _MainLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_34.x = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_34.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_34.x;
    u_xlat16_14.xyw = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_14.xyw = u_xlat16_14.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyw = u_xlat16_17.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_34.xxx * u_xlat16_14.xyw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_14.xyw;
    u_xlat16_74 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_74 = float(1.0) / u_xlat16_74;
    u_xlat16_14.xyw = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_17.x = dot(u_xlat16_14.xyw, u_xlat16_14.xyw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_14.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_14.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_14.www + u_xlat0.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_74 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_14.xyw * u_xlat16_19.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_14.xyw;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_14.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_14.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_14.x = u_xlat16_14.x / u_xlat16_14.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_14.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb68 = _UseSansheMask>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xy = u_xlat16_4.xy * u_xlat16_34.xx + u_xlat16_34.yy;
    u_xlat16_74 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe2_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_34.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_34.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_14.xyz = u_xlat16_34.xxx * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
    u_xlat16_13.xyz = u_xlat22.xyz * vec3(u_xlat16_74) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat22.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_44 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_13.xyz = vec3(u_xlat16_44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_44) + _FogCol.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat16_74 = _PostExposure + _ExposureCompensate;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_74) + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat44)) + u_xlat2.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_74 = (-_Saturation) + _SansheSaturation;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_74) * u_xlat2.xyz + vec3(u_xlat44);
    u_xlat16_34.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_74) * u_xlat16_34.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_34.x = float(1.0);
    u_xlat16_34.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_74) * u_xlat16_34.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_74 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_34.x = u_xlat16_74 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_74 = min(u_xlat16_34.x, u_xlat16_13.y);
    u_xlat16_34.x = u_xlat16_34.x + (-u_xlat16_13.y);
    u_xlat16_74 = (-u_xlat16_74) + u_xlat16_13.x;
    u_xlat16_56 = u_xlat16_74 * 6.0 + 9.99999975e-05;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_56;
    u_xlat16_34.x = u_xlat16_34.x + u_xlat16_13.z;
    u_xlat16_34.x = abs(u_xlat16_34.x) + _HueShift;
    u_xlat16_35.xyz = u_xlat16_34.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_35.xyz = fract(u_xlat16_35.xyz);
    u_xlat16_35.xyz = u_xlat16_35.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_35.xyz = abs(u_xlat16_35.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.xyz = min(max(u_xlat16_35.xyz, 0.0), 1.0);
#else
    u_xlat16_35.xyz = clamp(u_xlat16_35.xyz, 0.0, 1.0);
#endif
    u_xlat16_35.xyz = u_xlat16_35.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_34.x = u_xlat16_13.x + 9.99999975e-05;
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_35.xyz = vec3(u_xlat16_74) * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_78;
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
out mediump vec3 vs_TEXCOORD9;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD9.xyz = in_POSITION0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _UseAO2U;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _alphaClipPower;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _ExposureCompensate;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
uniform 	mediump float _HairCardCompensation;
uniform 	mediump float _MainLightCompensateStart;
uniform 	mediump float _MainLightCompensateStrength;
uniform 	mediump float _MainLightCompensatePow;
uniform 	mediump float _AdditionalLightCompensateStart;
uniform 	mediump float _AdditionalLightCompensateStrength;
uniform 	mediump float _AdditionalLightCompensatePow;
uniform 	mediump float _HairCustomPointLight;
uniform 	mediump vec3 _HairCustomAdditionalLightColor;
uniform 	mediump vec3 _HairCustomAdditionalLightPosition;
uniform 	mediump float _HairCustomAdditionalLightRange;
uniform 	mediump float _HairCustomAdditionalLightIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD9;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
float u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
vec2 u_xlat48;
mediump float u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_61;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_74;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb68 = _ShadowBias.z!=0.0;
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = vec3(u_xlat72) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_8.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_8.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat10.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb68)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat1 = u_xlat1 + u_xlat3;
    u_xlat68 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat68 = u_xlat1.z + (-u_xlat68);
    u_xlat3.x = max((-u_xlat1.w), u_xlat68);
    u_xlat3.x = (-u_xlat68) + u_xlat3.x;
    u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat68;
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat24 = (-u_xlat16_8.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat24 + u_xlat16_8.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlatb1 = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseDirectionalMask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_3.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb1.x) ? float(0.0) : float(1.0);
    u_xlat16_3.z = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb1.y) ? float(0.0) : float(1.0);
    u_xlat16_1.x = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.z) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(0.0) : float(1.0);
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_24.xy * u_xlat16_3.xz + u_xlat16_3.yw;
    u_xlat24 = u_xlat16_24.z * u_xlat16_1.x + u_xlat16_1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * _shadowStrength;
    u_xlat46 = u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_8.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat68 = u_xlat2.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat68) + vec2(1.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat10.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_74) + u_xlat16_12.x;
    u_xlat16_34.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_34.x + 1.0;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_74 = u_xlat16_34.z * u_xlat16_74;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_74));
    u_xlat16_74 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.5<_anisoUse2U);
#else
    u_xlatb68 = 0.5<_anisoUse2U;
#endif
    u_xlat48.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat48.xy = u_xlat48.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_68 = texture(_anisotropicMap, u_xlat48.xy).x;
    u_xlat68 = u_xlat16_68 * 2.0 + -1.0;
    u_xlat68 = u_xlat68 * _sunShift + _sunShiftOffset;
    u_xlat68 = u_xlat68 + vs_TEXCOORD5;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_35.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb48 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat48.x = (u_xlatb48) ? 1.0 : -1.0;
    u_xlat48.x = u_xlat48.x * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat9.zxy, u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat10.yzx) * vec3(u_xlat70) + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat16_35.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat10.xyz + u_xlat6.zxy;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat9.xyz = vec3(u_xlat68) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseAO2U>=0.5);
#else
    u_xlatb68 = _UseAO2U>=0.5;
#endif
    u_xlat16_35.xy = (bool(u_xlatb68)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb68)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_35.xy = u_xlat16_35.xy + u_xlat16_14.xy;
    u_xlat16_68 = texture(_materialParamsMap, u_xlat16_35.xy).z;
    u_xlat16_35.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_57 = u_xlat16_35.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_57>=0.0);
#else
    u_xlatb48 = u_xlat16_57>=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb48)) ? u_xlat9.xyz : u_xlat5.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat11.xyz * vec3(u_xlat16_79);
    u_xlat15.xyz = u_xlat9.xyz * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat9.zxy * u_xlat16_14.yzx + (-u_xlat15.xyz);
    u_xlat16.xyz = u_xlat9.xyz * u_xlat15.xyz;
    u_xlat9.xyz = u_xlat15.zxy * u_xlat9.yzx + (-u_xlat16.xyz);
    u_xlat9.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat9.xyz;
    u_xlat16_15.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
    u_xlat16_17.xy = u_xlat16_15.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_61.x = u_xlat16_80 * 8.0;
    u_xlat16_61.x = min(u_xlat16_61.x, 1.0);
    u_xlat16_61.x = abs(u_xlat16_57) * u_xlat16_61.x;
    u_xlat9.xyz = u_xlat16_61.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat48.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat9.xyz = u_xlat48.xxx * u_xlat9.xyz;
    u_xlat16_61.x = dot((-u_xlat16_14.xyz), u_xlat9.xyz);
    u_xlat16_61.x = u_xlat16_61.x + u_xlat16_61.x;
    u_xlat9.xyz = (-u_xlat9.xyz) * u_xlat16_61.xxx + (-u_xlat16_14.xyz);
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat16_34.y = u_xlat48.x * 0.5;
    u_xlat16_34.x = u_xlat16_17.x * 1.09769487;
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_34.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34.x = floor(u_xlat16_3.w);
    u_xlat16_56 = u_xlat16_34.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_61.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_61.xy = u_xlat16_61.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_61.xy).x;
    u_xlat16_34.x = u_xlat16_34.z * 15.0 + (-u_xlat16_34.x);
    u_xlat16_56 = (-u_xlat16_70) + u_xlat16_48;
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_56 + u_xlat16_70;
    u_xlat16_34.x = u_xlat16_12.x * u_xlat16_34.x;
    u_xlat48.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48.x = min(max(u_xlat48.x, 0.0), 1.0);
#else
    u_xlat48.x = clamp(u_xlat48.x, 0.0, 1.0);
#endif
    u_xlat48.x = u_xlat48.x * u_xlat16_34.x;
    u_xlat16_74 = u_xlat48.x * u_xlat16_13.x + u_xlat16_74;
    u_xlat16_34.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_56 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_74 = u_xlat4.y * u_xlat16_74;
    u_xlat4.x = min(u_xlat4.x, u_xlat16_68);
    u_xlat16_74 = min(u_xlat16_68, u_xlat16_74);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_18.y = u_xlat16_8.y;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat16_8.xyz;
    u_xlati68 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_12.xyz = u_xlat16_8.yyy * _IrradianceACCoeffs[u_xlati68].xyz;
    u_xlati68 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_8.xxx * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_12.xyz;
    u_xlat16_8.xyz = u_xlat16_8.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat26.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat9.xyz);
    u_xlat16_34.x = u_xlat16_80 * u_xlat16_80;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat26.xyz = u_xlat16_34.xxx * u_xlat26.xyz + u_xlat9.xyz;
    u_xlat7.xyz = (-u_xlat26.xyz) + u_xlat9.xyz;
    u_xlat26.xyz = abs(vec3(u_xlat16_57)) * u_xlat7.xyz + u_xlat26.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat18.y = u_xlat26.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_34.x = -abs(u_xlat16_57) * 0.800000012 + 1.0;
    u_xlat68 = (-u_xlat16_57) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_80;
    u_xlat26.x = u_xlat16_35.x * u_xlat16_80;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat16_34.x = u_xlat16_17.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_34.x);
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_34.x);
    u_xlat16_34.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_34.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = u_xlat16_12.xxx * u_xlat16_34.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb48)) ? u_xlat16_13.xyz : u_xlat16_34.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_13.xyz;
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_78 = log2(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _alphaClipPower;
    u_xlat16_78 = exp2(u_xlat16_78);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.x = u_xlat0.x + (-_ShadeRange);
    u_xlat7.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-_ShadeRange) + _DetailRange;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x;
    u_xlat16_22.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat22.xy = (-u_xlat16_22.xy) + vec2(1.0, 1.0);
    u_xlat16_80 = min(u_xlat22.x, u_xlat0.x);
    u_xlat16_80 = u_xlat16_80 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyw = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_15.zzz * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_61.x = (-u_xlat16_15.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + (-u_xlat0.xyw);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz + u_xlat0.xyw;
    u_xlat16_20.xyz = (-u_xlat16_13.xyz) * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_13.xyz = u_xlat22.yyy * u_xlat16_20.xyz + u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_61.xxx * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_17.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.y = u_xlat16_17.x;
    u_xlat9.x = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat9.x;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat0.xy).xy;
    u_xlat16_19.xyz = u_xlat16_39.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48.x = inversesqrt(u_xlat48.x);
    u_xlat6.xyz = u_xlat48.xxx * u_xlat6.xyz;
    u_xlat48.x = dot(u_xlat22.xyz, u_xlat6.xyz);
    u_xlat15.y = u_xlat48.x * u_xlat26.x;
    u_xlat16_74 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat15.x = u_xlat68 * u_xlat16_74;
    u_xlat48.x = u_xlat68 * u_xlat26.x;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_74) + 1.0;
    u_xlat15.z = u_xlat70 * u_xlat48.x;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat48.x / u_xlat70;
    u_xlat48.x = u_xlat48.x * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat48.x = u_xlat48.x * u_xlat70;
    u_xlat48.x = min(u_xlat48.x, 16.0);
    u_xlat70 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat22.x * u_xlat68;
    u_xlat7.z = u_xlat68 * u_xlat70;
    u_xlat16_74 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat22.x * u_xlat26.x;
    u_xlat7.y = u_xlat26.x * u_xlat16_74;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat0.y = u_xlat22.x + u_xlat7.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat0.x = u_xlat44 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.y + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat48.x;
    u_xlat22.x = u_xlat16_39.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat71 * u_xlat71;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat44 = (-u_xlat16_74) * u_xlat71 + 1.0;
    u_xlat16_74 = u_xlat71 * u_xlat16_74;
    u_xlat26.xyz = u_xlat16_39.xyz * vec3(u_xlat44);
    u_xlat22.xyz = u_xlat22.xxx * vec3(u_xlat16_74) + u_xlat26.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_17.xyz = u_xlat26.xyz * u_xlat16_36.xxx;
    u_xlat16_36.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_36.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_36.x);
#endif
    u_xlat16_36.xz = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_36.zzz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_80);
    u_xlat16_80 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_80 = (-u_xlat16_80) * u_xlat16_80 + 1.0;
    u_xlat16_80 = max(u_xlat16_80, 0.0);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_36.x, u_xlat16_14.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_14.xyw = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyw = u_xlat16_13.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = vec3(u_xlat46) * u_xlat16_14.xyw;
    u_xlat16_14.xyw = vec3(u_xlat66) * u_xlat16_14.xyw;
    u_xlat16_17.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat7.xxx + u_xlat16_14.xyw;
    u_xlat16_74 = u_xlat7.x + (-_MainLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_83 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_41.xyz = u_xlat2.xzw * u_xlat16_41.xxx;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_41.xyz = u_xlat16_41.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_42 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_41.xyz);
    u_xlat66 = dot(u_xlat10.xyz, u_xlat16_41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_42 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_41.x);
    u_xlat16_41.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19.x = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_19.x = u_xlat16_41.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_20.x, u_xlat16_19.x);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_19.x;
    u_xlat16_19.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = vec3(u_xlat24) * u_xlat16_19.xyz;
    u_xlat16_14.xyw = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_14.xyw;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat4.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat4.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz + u_xlat16_14.xyw;
    u_xlat16_14.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyw = min(max(u_xlat16_14.xyw, 0.0), 1.0);
#else
    u_xlat16_14.xyw = clamp(u_xlat16_14.xyw, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw + u_xlat16_8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyw;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_78;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_14.xyw * u_xlat16_19.xyz + u_xlat16_8.xyz;
    u_xlat16_34.xy = vec2(_MainLightCompensateStart, _MainLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _MainLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_34.x = _MainLightCompensateStrength * _MainLightCompensateStart;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_34.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_34.x;
    u_xlat16_14.xyw = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_14.xyw = u_xlat16_14.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyw = u_xlat16_17.xyz * u_xlat16_14.xyw;
    u_xlat16_14.xyw = u_xlat16_14.xyw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCardCompensation>=0.5);
#else
    u_xlatb0 = _HairCardCompensation>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_34.xxx * u_xlat16_14.xyw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_14.xyw;
    u_xlat16_74 = abs(_HairCustomAdditionalLightRange) + 6.10351563e-05;
    u_xlat16_74 = float(1.0) / u_xlat16_74;
    u_xlat16_14.xyw = (-vs_TEXCOORD9.xyz) + _HairCustomAdditionalLightPosition.xyz;
    u_xlat16_17.x = dot(u_xlat16_14.xyw, u_xlat16_14.xyw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_17.x;
    u_xlat16_17.xyz = _HairCustomAdditionalLightColor.xyz * vec3(_HairCustomAdditionalLightIntensity);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.xyz = u_xlat16_14.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_14.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_14.www + u_xlat0.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyw = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_74 = u_xlat0.x + (-_AdditionalLightCompensateStart);
    u_xlat16_74 = (-u_xlat16_74);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_HairCustomPointLight>=0.5);
#else
    u_xlatb0 = _HairCustomPointLight>=0.5;
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyw = u_xlat16_14.xyw * u_xlat16_19.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.yyy + u_xlat16_14.xyw;
    u_xlat16_14.xy = vec2(_AdditionalLightCompensateStart, _AdditionalLightCompensatePow) + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat16_74 = u_xlat16_74 / u_xlat16_14.x;
    u_xlat16_74 = log2(abs(u_xlat16_74));
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightCompensatePow;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat16_14.x = _AdditionalLightCompensateStrength * _AdditionalLightCompensateStart;
    u_xlat16_14.x = u_xlat16_14.x / u_xlat16_14.y;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_14.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_74);
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe_Y;
    u_xlat2.z = u_xlat16_14.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb68 = _UseSansheMask>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xy = u_xlat16_4.xy * u_xlat16_34.xx + u_xlat16_34.yy;
    u_xlat16_74 = u_xlat16_4.z * u_xlat16_1.z + u_xlat16_1.w;
    u_xlat2.x = u_xlat11.x * u_xlat16_79 + _Sanshe2_X;
    u_xlat2.y = u_xlat11.y * u_xlat16_79 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_34.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_34.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_14.xyz = u_xlat16_34.xxx * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
    u_xlat16_13.xyz = u_xlat22.xyz * vec3(u_xlat16_74) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat22.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = max(u_xlat16_13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_44 = texture(_darkMask, vs_TEXCOORD3.zw).x;
    u_xlat16_13.xyz = vec3(u_xlat16_44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_8.xyz) * vec3(u_xlat16_44) + _FogCol.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat16_74 = _PostExposure + _ExposureCompensate;
    u_xlat16_74 = exp2(u_xlat16_74);
    u_xlat2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_74) + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat44)) + u_xlat2.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_74 = (-_Saturation) + _SansheSaturation;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_74) * u_xlat2.xyz + vec3(u_xlat44);
    u_xlat16_34.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_74 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_74) * u_xlat16_34.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_34.x = float(1.0);
    u_xlat16_34.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_74) * u_xlat16_34.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_74 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_34.x = u_xlat16_74 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_74 = min(u_xlat16_34.x, u_xlat16_13.y);
    u_xlat16_34.x = u_xlat16_34.x + (-u_xlat16_13.y);
    u_xlat16_74 = (-u_xlat16_74) + u_xlat16_13.x;
    u_xlat16_56 = u_xlat16_74 * 6.0 + 9.99999975e-05;
    u_xlat16_34.x = u_xlat16_34.x / u_xlat16_56;
    u_xlat16_34.x = u_xlat16_34.x + u_xlat16_13.z;
    u_xlat16_34.x = abs(u_xlat16_34.x) + _HueShift;
    u_xlat16_35.xyz = u_xlat16_34.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_35.xyz = fract(u_xlat16_35.xyz);
    u_xlat16_35.xyz = u_xlat16_35.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_35.xyz = abs(u_xlat16_35.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.xyz = min(max(u_xlat16_35.xyz, 0.0), 1.0);
#else
    u_xlat16_35.xyz = clamp(u_xlat16_35.xyz, 0.0, 1.0);
#endif
    u_xlat16_35.xyz = u_xlat16_35.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_34.x = u_xlat16_13.x + 9.99999975e-05;
    u_xlat16_74 = u_xlat16_74 / u_xlat16_34.x;
    u_xlat16_35.xyz = vec3(u_xlat16_74) * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_34.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_34.xxx * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_34.yyy + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_78;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" }
  GpuProgramID 106456
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Hair_SF_ClipGUI"
}