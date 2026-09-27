//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/Lit/PBR(Weapon)" {
Properties {

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

[Toggle(_EMISSIVE_BREATHE)] _EnableBreathe ("自发光呼吸开关", Float) = 0.0

_emissiveBreathe ("emissiveBreath", Vector) = (0,0,0,0)

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

[Toggle(_VISIBILITY_BAKE)] _VisibilityBake ("VisiblityBake", Float) = 0.0

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

[Toggle(_LASER_ON)] _LaserOn ("镭射开关", Float) = 0.0

_LaserMask ("镭射遮罩", 2D) = "white" { }

_LaserRamp ("镭射渐变图", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (1,1,1,1)

_LaserRampIntensity ("镭射强度", Float) = 1.0

[Toggle(_DIRECTIONAL_SANSHE)] _DirectionalSanshe ("补光类型(关闭:边缘光;打开:平行光)  自发光alpha通道为遮罩图", Float) = 0.0

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
  GpuProgramID 61917
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
int u_xlati5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec3 u_xlat25;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
mediump vec2 u_xlat16_41;
float u_xlat53;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb65;
float u_xlat67;
float u_xlat68;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21.x = (-u_xlat16_21.x) * u_xlat16_21.x + 1.0;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41.x;
    u_xlat16_21.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_21.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * u_xlat16_21.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
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
    u_xlat16_22 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_22, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat16_23.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_5.xy = texture(_LaserMask, u_xlat16_23.xy).xy;
    u_xlat16_6.y = u_xlat16_5.y * _LaserRamp_ST.y;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_23.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat25.xyz = u_xlat16_23.xyz * vec3(u_xlat64);
    u_xlat8.xyz = u_xlat25.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat25.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat25.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_10.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_62 = dot(u_xlat16_10.xy, u_xlat16_10.xy);
    u_xlat16_62 = min(u_xlat16_62, 1.0);
    u_xlat16_62 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = sqrt(u_xlat16_62);
    u_xlat16_10.z = max(u_xlat16_62, 1.00000002e-16);
    u_xlat7.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat8.x = u_xlat25.y;
    u_xlat25.y = u_xlat8.z;
    u_xlat25.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_10.xyz, u_xlat25.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat25.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_62 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_62 = dot(u_xlat25.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_62 * _LaserRamp_ST.x;
    u_xlat16_23.xy = u_xlat16_6.xy + _LaserRamp_ST.zw;
    u_xlat16_8.xyz = texture(_LaserRamp, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_8.xyz * _LaserColor.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_5.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_10.xyz) * u_xlat16_11.xyz + u_xlat16_23.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_9.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat60) * u_xlat16_10.xyz;
    u_xlat60 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat67 = (-u_xlat5.x) * u_xlat16_21.x + u_xlat5.x;
    u_xlat67 = u_xlat5.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat5.x + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat25.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat13.x) * u_xlat16_21.x + u_xlat13.x;
    u_xlat8.x = u_xlat13.x * u_xlat8.x + u_xlat16_21.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + u_xlat13.x;
    u_xlat8.x = u_xlat8.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat8.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat68 = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat16_21.x / u_xlat68;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat67 = u_xlat67 * u_xlat68;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat67);
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat67 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat67 = dot(u_xlat25.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_1.x) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat24 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_21.x / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat72 = dot(u_xlat25.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat72) * u_xlat16_21.x + u_xlat72;
    u_xlat53 = u_xlat72 * u_xlat53 + u_xlat16_21.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat72 + u_xlat53;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat8.x = u_xlat8.x * u_xlat53;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat67 = u_xlat67 * u_xlat8.x;
    u_xlat16_1.x = u_xlat68 * u_xlat68;
    u_xlat16_1.x = u_xlat68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat68 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat68 * u_xlat16_1.x;
    u_xlat8.x = (-u_xlat16_1.x) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_10.xyz * u_xlat8.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat14.xyz;
    u_xlat16_1.xzw = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat16_62 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat72) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat25.xyz;
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati5 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_71 = u_xlat16_9.w * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_9.w * u_xlat16_71;
    u_xlat16_71 = u_xlat16_62 * u_xlat16_71;
    u_xlat16_76 = min(u_xlat16_8.z, u_xlat16_71);
    u_xlat16_77 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_77);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_76) + (-u_xlat16_19.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _localDiffuseGI.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat25.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat8.xyw = (-u_xlat25.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat25.xyz, u_xlat0.xyz);
    u_xlat20.x = dot(u_xlat16_16.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_16.xyz, u_xlat8.xyw);
    u_xlat16_3.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat64) + (-u_xlat8.xyw);
    u_xlat5.xyz = u_xlat16_21.xxx * u_xlat5.xyz + u_xlat8.xyw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat11.y = u_xlat5.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_21.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat13.y = u_xlat16_9.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_16.xyz = u_xlat16_10.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_21.x);
    u_xlat16_17.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb40)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_4.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_3.x = u_xlat16_21.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_4.x = u_xlat16_3.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21.x = u_xlat16_3.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_3.x = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_3.x + u_xlat16_60;
    u_xlat16_21.x = u_xlat16_62 * u_xlat16_21.x;
    u_xlat20.x = u_xlat20.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_71 * 0.5;
    u_xlat16_62 = (-u_xlat16_71) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat20.x * u_xlat16_62 + u_xlat16_21.x;
    u_xlat16_62 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_3.x = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_3.x + u_xlat16_62;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_71;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_21.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_21.xxx + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat20.x = _emissiveBreathe.y * _Time.y;
    u_xlat20.x = sin(u_xlat20.x);
    u_xlat40 = (-_emissiveBreathe.z) + 1.0;
    u_xlat20.x = abs(u_xlat20.x) * u_xlat40 + _emissiveBreathe.z;
    u_xlat16_3 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat20.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat20.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_41.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_41.xy = u_xlat16_41.xx * vs_TEXCOORD3.xy;
    u_xlat16_41.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_41.xy;
    u_xlat16_20.xyz = texture(_FlowLightMask, u_xlat16_41.xy).xyz;
    u_xlat5.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_41.xy;
    u_xlat16_41.xy = u_xlat5.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_4 = texture(_FlowLightTex, u_xlat16_41.xy);
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_4.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _FlowLightFactory.xxx;
    u_xlat16_16.xyz = u_xlat16_4.www * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat20.xyz = u_xlat20.xyz / u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = log2(u_xlat20.xyz);
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat20.xyz = exp2(u_xlat20.xyz);
    u_xlat20.xyz = u_xlat20.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat20.xyz = max(u_xlat20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat5.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat25.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat5.x = (-u_xlat25.x) + u_xlat5.x;
    u_xlat5.x = u_xlat5.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat25.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.5<_isGradient);
#else
    u_xlatb65 = 0.5<_isGradient;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb65)) ? u_xlat5.xyz : _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat7.xyz = vec3(u_xlat16_71) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb0 = 0.5<_EnableVISInfluence;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat16_3.www + u_xlat20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
int u_xlati5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec3 u_xlat25;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
mediump vec2 u_xlat16_41;
float u_xlat53;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb65;
float u_xlat67;
float u_xlat68;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21.x = (-u_xlat16_21.x) * u_xlat16_21.x + 1.0;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41.x;
    u_xlat16_21.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_21.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * u_xlat16_21.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
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
    u_xlat16_22 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_22, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat16_23.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_5.xy = texture(_LaserMask, u_xlat16_23.xy).xy;
    u_xlat16_6.y = u_xlat16_5.y * _LaserRamp_ST.y;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_23.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat25.xyz = u_xlat16_23.xyz * vec3(u_xlat64);
    u_xlat8.xyz = u_xlat25.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat25.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat25.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_10.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_62 = dot(u_xlat16_10.xy, u_xlat16_10.xy);
    u_xlat16_62 = min(u_xlat16_62, 1.0);
    u_xlat16_62 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = sqrt(u_xlat16_62);
    u_xlat16_10.z = max(u_xlat16_62, 1.00000002e-16);
    u_xlat7.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat8.x = u_xlat25.y;
    u_xlat25.y = u_xlat8.z;
    u_xlat25.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_10.xyz, u_xlat25.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat25.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_62 = dot(u_xlat16_23.xyz, u_xlat16_23.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_62 = dot(u_xlat25.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_62 * _LaserRamp_ST.x;
    u_xlat16_23.xy = u_xlat16_6.xy + _LaserRamp_ST.zw;
    u_xlat16_8.xyz = texture(_LaserRamp, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_8.xyz * _LaserColor.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_5.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_10.xyz) * u_xlat16_11.xyz + u_xlat16_23.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_9.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat60) * u_xlat16_10.xyz;
    u_xlat60 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat67 = (-u_xlat5.x) * u_xlat16_21.x + u_xlat5.x;
    u_xlat67 = u_xlat5.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat5.x + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat25.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat13.x) * u_xlat16_21.x + u_xlat13.x;
    u_xlat8.x = u_xlat13.x * u_xlat8.x + u_xlat16_21.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + u_xlat13.x;
    u_xlat8.x = u_xlat8.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat8.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat68 = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat16_21.x / u_xlat68;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat67 = u_xlat67 * u_xlat68;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat67);
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat67 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat67 = dot(u_xlat25.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_1.x) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat24 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_21.x / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat72 = dot(u_xlat25.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat72) * u_xlat16_21.x + u_xlat72;
    u_xlat53 = u_xlat72 * u_xlat53 + u_xlat16_21.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat72 + u_xlat53;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat8.x = u_xlat8.x * u_xlat53;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat67 = u_xlat67 * u_xlat8.x;
    u_xlat16_1.x = u_xlat68 * u_xlat68;
    u_xlat16_1.x = u_xlat68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat68 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat68 * u_xlat16_1.x;
    u_xlat8.x = (-u_xlat16_1.x) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_10.xyz * u_xlat8.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat14.xyz;
    u_xlat16_1.xzw = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat16_62 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat72) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat25.xyz;
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati5 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_71 = u_xlat16_9.w * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_9.w * u_xlat16_71;
    u_xlat16_71 = u_xlat16_62 * u_xlat16_71;
    u_xlat16_76 = min(u_xlat16_8.z, u_xlat16_71);
    u_xlat16_77 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_77);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_76) + (-u_xlat16_19.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _localDiffuseGI.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat25.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat8.xyw = (-u_xlat25.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat25.xyz, u_xlat0.xyz);
    u_xlat20.x = dot(u_xlat16_16.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_16.xyz, u_xlat8.xyw);
    u_xlat16_3.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat64) + (-u_xlat8.xyw);
    u_xlat5.xyz = u_xlat16_21.xxx * u_xlat5.xyz + u_xlat8.xyw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat11.y = u_xlat5.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_21.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat13.y = u_xlat16_9.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_16.xyz = u_xlat16_10.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_21.x);
    u_xlat16_17.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb40)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_4.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_3.x = u_xlat16_21.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_4.x = u_xlat16_3.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21.x = u_xlat16_3.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_3.x = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_3.x + u_xlat16_60;
    u_xlat16_21.x = u_xlat16_62 * u_xlat16_21.x;
    u_xlat20.x = u_xlat20.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_71 * 0.5;
    u_xlat16_62 = (-u_xlat16_71) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat20.x * u_xlat16_62 + u_xlat16_21.x;
    u_xlat16_62 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_3.x = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_3.x + u_xlat16_62;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_71;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_21.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_21.xxx + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat20.x = _emissiveBreathe.y * _Time.y;
    u_xlat20.x = sin(u_xlat20.x);
    u_xlat40 = (-_emissiveBreathe.z) + 1.0;
    u_xlat20.x = abs(u_xlat20.x) * u_xlat40 + _emissiveBreathe.z;
    u_xlat16_3 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat20.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat20.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_41.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_41.xy = u_xlat16_41.xx * vs_TEXCOORD3.xy;
    u_xlat16_41.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_41.xy;
    u_xlat16_20.xyz = texture(_FlowLightMask, u_xlat16_41.xy).xyz;
    u_xlat5.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_41.xy;
    u_xlat16_41.xy = u_xlat5.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_4 = texture(_FlowLightTex, u_xlat16_41.xy);
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_4.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _FlowLightFactory.xxx;
    u_xlat16_16.xyz = u_xlat16_4.www * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat20.xyz = u_xlat20.xyz / u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = log2(u_xlat20.xyz);
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat20.xyz = exp2(u_xlat20.xyz);
    u_xlat20.xyz = u_xlat20.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat20.xyz = max(u_xlat20.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat5.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat25.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat5.x = (-u_xlat25.x) + u_xlat5.x;
    u_xlat5.x = u_xlat5.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat25.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.5<_isGradient);
#else
    u_xlatb65 = 0.5<_isGradient;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb65)) ? u_xlat5.xyz : _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat7.xyz = vec3(u_xlat16_71) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb0 = 0.5<_EnableVISInfluence;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat16_3.www + u_xlat20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
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
vec4 u_xlat8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat23;
vec3 u_xlat24;
float u_xlat27;
mediump vec3 u_xlat16_29;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
float u_xlat46;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
float u_xlat58;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_63 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = sqrt(u_xlat16_63);
    u_xlat16_6.z = max(u_xlat16_63, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat23.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_10.xzw = u_xlat0.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_68 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_68);
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_10.x * _LaserRamp_ST.x;
    u_xlat16_10.xz = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_39.xy = texture(_LaserMask, u_xlat16_10.xz).xy;
    u_xlat16_12.y = u_xlat16_39.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_4.xyz * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_39.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat64 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat64) * u_xlat16_29.xxx + u_xlat20.xyz;
    u_xlat16_29.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat8.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat8.x = u_xlat57 * u_xlat8.x + u_xlat16_29.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat57 + u_xlat8.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat27 = u_xlat9.x * u_xlat27 + u_xlat16_29.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat8.y = u_xlat27 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat46 = u_xlat16_29.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat46 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_29.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat8.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat20.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_63) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_63) + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat46 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat46 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat46) * u_xlat16_29.x + u_xlat46;
    u_xlat65 = u_xlat46 * u_xlat65 + u_xlat16_29.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat46;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat27 = u_xlat65 * u_xlat8.y;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat58 = u_xlat58 * u_xlat27;
    u_xlat16_63 = u_xlat8.x * u_xlat8.x;
    u_xlat16_63 = u_xlat8.x * u_xlat16_63;
    u_xlat16_63 = u_xlat8.x * u_xlat16_63;
    u_xlat16_68 = u_xlat8.x * u_xlat16_63;
    u_xlat8.x = (-u_xlat16_63) * u_xlat8.x + 1.0;
    u_xlat8.xyw = u_xlat16_12.xyz * u_xlat8.xxx;
    u_xlat8.xyw = vec3(u_xlat64) * vec3(u_xlat16_68) + u_xlat8.xyw;
    u_xlat8.xyw = vec3(u_xlat58) * u_xlat8.xyw;
    u_xlat8.xyw = u_xlat8.xyw * _directSpecularColor.xyz;
    u_xlat8.xyw = vec3(u_xlat46) * u_xlat8.xyw;
    u_xlat8.xyw = u_xlat8.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_6.xyz + u_xlat1.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati1.x = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_69) + u_xlat16_70;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_70 = u_xlat16_4.w * u_xlat16_70 + u_xlat16_69;
    u_xlat16_70 = u_xlat16_4.w * u_xlat16_70;
    u_xlat16_70 = u_xlat16_63 * u_xlat16_70;
    u_xlat16_72 = min(u_xlat16_3.z, u_xlat16_70);
    u_xlat16_73 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72) + (-u_xlat16_18.xyz);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_72) + u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat0.xyz);
    u_xlat19.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xyz);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat16_29.xxx * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat9.y = u_xlat16_4.x;
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb38)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_1.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_1.w);
    u_xlat16_29.x = u_xlat16_10.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_1.x = u_xlat16_29.x * 16.0 + u_xlat16_1.z;
    u_xlat16_29.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_29.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_29.x = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_29.x + u_xlat16_57;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_10.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_63;
    u_xlat16_63 = u_xlat16_70 * 0.5;
    u_xlat16_10.x = (-u_xlat16_70) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat19.x * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_10.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_29.x = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_29.x + u_xlat16_10.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_70;
    u_xlat16_63 = min(u_xlat16_3.z, u_xlat16_63);
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_2.w * _albedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat16_1 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_29.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat19.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat19.xyz * u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_29.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_29.xy = u_xlat16_29.xx * vs_TEXCOORD3.xy;
    u_xlat16_29.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_29.xy;
    u_xlat16_19.xyz = texture(_FlowLightMask, u_xlat16_29.xy).xyz;
    u_xlat5.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_29.xy;
    u_xlat16_29.xy = u_xlat5.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat16_29.xy);
    u_xlat16_29.xyz = u_xlat16_19.xyz * u_xlat16_2.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _FlowLightFactory.xxx;
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat19.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat16_6.xyz;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat5.xyz = u_xlat16_6.xyz * u_xlat5.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat19.xyz = u_xlat19.xyz / u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = log2(u_xlat19.xyz);
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat19.xyz = exp2(u_xlat19.xyz);
    u_xlat19.xyz = u_xlat19.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat19.xyz = max(u_xlat19.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat5.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat24.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat5.x = (-u_xlat24.x) + u_xlat5.x;
    u_xlat5.x = u_xlat5.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat24.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.5<_isGradient);
#else
    u_xlatb62 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb62)) ? u_xlat5.xyz : _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = vec3(u_xlat16_70) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb0 = 0.5<_EnableVISInfluence;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat16_1.www + u_xlat19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
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
vec4 u_xlat8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat23;
vec3 u_xlat24;
float u_xlat27;
mediump vec3 u_xlat16_29;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
float u_xlat46;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
float u_xlat58;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_63 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = sqrt(u_xlat16_63);
    u_xlat16_6.z = max(u_xlat16_63, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat23.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_10.xzw = u_xlat0.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_68 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_68);
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_10.x * _LaserRamp_ST.x;
    u_xlat16_10.xz = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_39.xy = texture(_LaserMask, u_xlat16_10.xz).xy;
    u_xlat16_12.y = u_xlat16_39.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_4.xyz * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_39.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat64 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat64) * u_xlat16_29.xxx + u_xlat20.xyz;
    u_xlat16_29.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat8.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat8.x = u_xlat57 * u_xlat8.x + u_xlat16_29.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat57 + u_xlat8.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat27 = u_xlat9.x * u_xlat27 + u_xlat16_29.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat8.y = u_xlat27 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat46 = u_xlat16_29.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat46 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_29.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat8.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat20.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_63) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_63) + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat46 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat46 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat46) * u_xlat16_29.x + u_xlat46;
    u_xlat65 = u_xlat46 * u_xlat65 + u_xlat16_29.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat46;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat27 = u_xlat65 * u_xlat8.y;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat58 = u_xlat58 * u_xlat27;
    u_xlat16_63 = u_xlat8.x * u_xlat8.x;
    u_xlat16_63 = u_xlat8.x * u_xlat16_63;
    u_xlat16_63 = u_xlat8.x * u_xlat16_63;
    u_xlat16_68 = u_xlat8.x * u_xlat16_63;
    u_xlat8.x = (-u_xlat16_63) * u_xlat8.x + 1.0;
    u_xlat8.xyw = u_xlat16_12.xyz * u_xlat8.xxx;
    u_xlat8.xyw = vec3(u_xlat64) * vec3(u_xlat16_68) + u_xlat8.xyw;
    u_xlat8.xyw = vec3(u_xlat58) * u_xlat8.xyw;
    u_xlat8.xyw = u_xlat8.xyw * _directSpecularColor.xyz;
    u_xlat8.xyw = vec3(u_xlat46) * u_xlat8.xyw;
    u_xlat8.xyw = u_xlat8.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_6.xyz + u_xlat1.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati1.x = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_69) + u_xlat16_70;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_70 = u_xlat16_4.w * u_xlat16_70 + u_xlat16_69;
    u_xlat16_70 = u_xlat16_4.w * u_xlat16_70;
    u_xlat16_70 = u_xlat16_63 * u_xlat16_70;
    u_xlat16_72 = min(u_xlat16_3.z, u_xlat16_70);
    u_xlat16_73 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72) + (-u_xlat16_18.xyz);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_72) + u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat0.xyz);
    u_xlat19.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xyz);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat16_29.xxx * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat9.y = u_xlat16_4.x;
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb38)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_1.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_1.w);
    u_xlat16_29.x = u_xlat16_10.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_1.x = u_xlat16_29.x * 16.0 + u_xlat16_1.z;
    u_xlat16_29.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_29.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_29.x = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_29.x + u_xlat16_57;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_10.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_63;
    u_xlat16_63 = u_xlat16_70 * 0.5;
    u_xlat16_10.x = (-u_xlat16_70) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat19.x * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_10.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_29.x = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_29.x + u_xlat16_10.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_70;
    u_xlat16_63 = min(u_xlat16_3.z, u_xlat16_63);
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_2.w * _albedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat16_1 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_29.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat19.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat19.xyz * u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_29.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_29.xy = u_xlat16_29.xx * vs_TEXCOORD3.xy;
    u_xlat16_29.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_29.xy;
    u_xlat16_19.xyz = texture(_FlowLightMask, u_xlat16_29.xy).xyz;
    u_xlat5.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_29.xy;
    u_xlat16_29.xy = u_xlat5.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat16_29.xy);
    u_xlat16_29.xyz = u_xlat16_19.xyz * u_xlat16_2.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _FlowLightFactory.xxx;
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat19.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat16_6.xyz;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat5.xyz = u_xlat16_6.xyz * u_xlat5.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat19.xyz = u_xlat19.xyz / u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = log2(u_xlat19.xyz);
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat19.xyz = exp2(u_xlat19.xyz);
    u_xlat19.xyz = u_xlat19.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat19.xyz = max(u_xlat19.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat5.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat24.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat5.x = (-u_xlat24.x) + u_xlat5.x;
    u_xlat5.x = u_xlat5.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat24.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.5<_isGradient);
#else
    u_xlatb62 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb62)) ? u_xlat5.xyz : _Sanshe_color.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = vec3(u_xlat16_70) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb0 = 0.5<_EnableVISInfluence;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat16_1.www + u_xlat19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
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
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
ivec4 u_xlati7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump float u_xlat16_32;
float u_xlat34;
float u_xlat45;
mediump float u_xlat16_46;
float u_xlat47;
int u_xlati47;
bool u_xlatb47;
float u_xlat48;
int u_xlati48;
mediump float u_xlat16_50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat45 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_1.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_46 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_46 = min(u_xlat16_46, 1.0);
    u_xlat16_46 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = sqrt(u_xlat16_46);
    u_xlat16_1.z = max(u_xlat16_46, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_5.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_5.xxx;
    u_xlat16_16.x = dot(u_xlat2.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_16.x * _LaserRamp_ST.x;
    u_xlat16_16.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_4.xy = texture(_LaserMask, u_xlat16_16.xy).xy;
    u_xlat16_5.y = u_xlat16_4.y * _LaserRamp_ST.y;
    u_xlat16_16.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_19.xyz = texture(_LaserRamp, u_xlat16_16.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.xyz * _LaserColor.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_16.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_5.x = u_xlat16_4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * _LaserColor.w;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = (-u_xlat16_20.xyz) * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_6.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xxx * u_xlat16_16.xyz + u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_6.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat3.xyz;
    u_xlat47 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat3.xyz = vec3(u_xlat47) * u_xlat4.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat47 = dot(u_xlat2.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat3.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat18 = (-u_xlat16_1.x) * u_xlat3.x + 1.0;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.xyz = u_xlat16_5.xyz * vec3(u_xlat18);
    u_xlat48 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat48) * u_xlat16_1.xxx + u_xlat3.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat48 = (-u_xlat4.x) * u_xlat16_1.x + u_xlat4.x;
    u_xlat48 = u_xlat4.x * u_xlat48 + u_xlat16_1.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat4.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat34 = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat34) * u_xlat16_1.x + u_xlat34;
    u_xlat7.x = u_xlat34 * u_xlat7.x + u_xlat16_1.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat34 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat7.x;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat7.x = u_xlat16_1.x + -1.0;
    u_xlat47 = u_xlat47 * u_xlat7.x + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat47 = u_xlat16_1.x / u_xlat47;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat47 = u_xlat48 * u_xlat47;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat47);
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb47 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_50 = (u_xlatb47) ? 1.0 : 0.0;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_21 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_21 = max(u_xlat16_21, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_21);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat9.xyz;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb47 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_11.xy = (bool(u_xlatb47)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.yyy + u_xlat16_12.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat47 = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_50 = max(u_xlat16_50, u_xlat16_53);
    u_xlat16_53 = u_xlat16_21 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = float(1.0) / float(u_xlat16_21);
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_53;
    u_xlat16_21 = max(u_xlat16_11.x, u_xlat16_21);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_21;
    u_xlat16_10.xyz = vec3(u_xlat16_50) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_50 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_50);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = vec3(u_xlat47) * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_11.xyz * vec3(u_xlat34) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat0.xyz) * vec3(u_xlat45) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat16_50 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_12.xyz = vec3(u_xlat16_50) * u_xlat16_12.xyz;
    u_xlat16_50 = dot(u_xlat16_12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_50 * 0.5 + 0.5;
    u_xlat16_21 = (-u_xlat16_50) + u_xlat16_21;
    u_xlat16_53 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_53 + 1.0;
    u_xlat16_50 = u_xlat16_6.w * u_xlat16_21 + u_xlat16_50;
    u_xlat16_50 = u_xlat16_6.w * u_xlat16_50;
    u_xlat16_21 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat16_21 = _occlusionScale * u_xlat16_21 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_21;
    u_xlat16_53 = min(u_xlat16_50, u_xlat16_7.z);
    u_xlat16_55 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_55);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat16_55) * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_53) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(u_xlat16_53) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati7.xyw = ivec3(uvec3(lessThan(u_xlat16_13.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_21) * u_xlat16_14.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati47 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati48 = (u_xlati7.w != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot((-u_xlat16_8.xyz), u_xlat2.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat7.xyw = (-u_xlat2.xyz) * u_xlat16_10.xxx + (-u_xlat16_8.xyz);
    u_xlat2.x = dot(u_xlat16_12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_12.xyz, u_xlat7.xyw);
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45) + (-u_xlat7.xyw);
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_1.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat4.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_1.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_6.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_0.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_0.w);
    u_xlat16_6.x = u_xlat16_1.x + 1.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 15.0);
    u_xlat16_0.x = u_xlat16_6.x * 16.0 + u_xlat16_0.z;
    u_xlat16_6.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_6.xz = u_xlat16_6.xz * vec2(0.00390625, 0.0625);
    u_xlat16_17.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xz).x;
    u_xlat16_0.x = u_xlat16_1.x * 16.0 + u_xlat16_0.z;
    u_xlat16_6.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_6.xz = u_xlat16_6.xz * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xz).x;
    u_xlat16_1.x = u_xlat16_8.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_6.x = (-u_xlat16_32) + u_xlat16_17.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_6.x + u_xlat16_32;
    u_xlat16_1.x = u_xlat16_21 * u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_50 * 0.5;
    u_xlat16_6.x = (-u_xlat16_50) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_6.x + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_21 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_50;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat2.x = _emissiveBreathe.y * _Time.y;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat17 = (-_emissiveBreathe.z) + 1.0;
    u_xlat2.x = abs(u_xlat2.x) * u_xlat17 + _emissiveBreathe.z;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat16_20.xyz + u_xlat16_16.xyz;
    u_xlat16_20.xyz = (-u_xlat16_16.xyz) + _FogCol.xyz;
    u_xlat16_16.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_16.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_16.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat2.xyz = u_xlat2.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_5.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
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
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
ivec4 u_xlati7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump float u_xlat16_32;
float u_xlat34;
float u_xlat45;
mediump float u_xlat16_46;
float u_xlat47;
int u_xlati47;
bool u_xlatb47;
float u_xlat48;
int u_xlati48;
mediump float u_xlat16_50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat45 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_1.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_46 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_46 = min(u_xlat16_46, 1.0);
    u_xlat16_46 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = sqrt(u_xlat16_46);
    u_xlat16_1.z = max(u_xlat16_46, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat2.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_5.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_5.xxx;
    u_xlat16_16.x = dot(u_xlat2.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_16.x * _LaserRamp_ST.x;
    u_xlat16_16.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_4.xy = texture(_LaserMask, u_xlat16_16.xy).xy;
    u_xlat16_5.y = u_xlat16_4.y * _LaserRamp_ST.y;
    u_xlat16_16.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_19.xyz = texture(_LaserRamp, u_xlat16_16.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.xyz * _LaserColor.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_16.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_5.x = u_xlat16_4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * _LaserColor.w;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = (-u_xlat16_20.xyz) * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_6.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xxx * u_xlat16_16.xyz + u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_6.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat3.xyz;
    u_xlat47 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat3.xyz = vec3(u_xlat47) * u_xlat4.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat47 = dot(u_xlat2.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat3.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat18 = (-u_xlat16_1.x) * u_xlat3.x + 1.0;
    u_xlat16_1.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.xyz = u_xlat16_5.xyz * vec3(u_xlat18);
    u_xlat48 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat48) * u_xlat16_1.xxx + u_xlat3.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat48 = (-u_xlat4.x) * u_xlat16_1.x + u_xlat4.x;
    u_xlat48 = u_xlat4.x * u_xlat48 + u_xlat16_1.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat4.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat34 = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat34) * u_xlat16_1.x + u_xlat34;
    u_xlat7.x = u_xlat34 * u_xlat7.x + u_xlat16_1.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat34 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat7.x;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat7.x = u_xlat16_1.x + -1.0;
    u_xlat47 = u_xlat47 * u_xlat7.x + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat47 = u_xlat16_1.x / u_xlat47;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat47 = u_xlat48 * u_xlat47;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat47);
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb47 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_50 = (u_xlatb47) ? 1.0 : 0.0;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_21 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_21 = max(u_xlat16_21, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_21);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat9.xyz;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb47 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_11.xy = (bool(u_xlatb47)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.yyy + u_xlat16_12.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat47 = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_50 = max(u_xlat16_50, u_xlat16_53);
    u_xlat16_53 = u_xlat16_21 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = float(1.0) / float(u_xlat16_21);
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_53;
    u_xlat16_21 = max(u_xlat16_11.x, u_xlat16_21);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_21;
    u_xlat16_10.xyz = vec3(u_xlat16_50) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_50 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_50);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = vec3(u_xlat47) * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_11.xyz * vec3(u_xlat34) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat0.xyz) * vec3(u_xlat45) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat16_50 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_12.xyz = vec3(u_xlat16_50) * u_xlat16_12.xyz;
    u_xlat16_50 = dot(u_xlat16_12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_50 * 0.5 + 0.5;
    u_xlat16_21 = (-u_xlat16_50) + u_xlat16_21;
    u_xlat16_53 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_53 + 1.0;
    u_xlat16_50 = u_xlat16_6.w * u_xlat16_21 + u_xlat16_50;
    u_xlat16_50 = u_xlat16_6.w * u_xlat16_50;
    u_xlat16_21 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat16_21 = _occlusionScale * u_xlat16_21 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_21;
    u_xlat16_53 = min(u_xlat16_50, u_xlat16_7.z);
    u_xlat16_55 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_55);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat16_55) * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_53) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(u_xlat16_53) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati7.xyw = ivec3(uvec3(lessThan(u_xlat16_13.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_21) * u_xlat16_14.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati47 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati48 = (u_xlati7.w != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot((-u_xlat16_8.xyz), u_xlat2.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat7.xyw = (-u_xlat2.xyz) * u_xlat16_10.xxx + (-u_xlat16_8.xyz);
    u_xlat2.x = dot(u_xlat16_12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_12.xyz, u_xlat7.xyw);
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45) + (-u_xlat7.xyw);
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_1.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat4.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_1.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_6.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_0.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_0.w);
    u_xlat16_6.x = u_xlat16_1.x + 1.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 15.0);
    u_xlat16_0.x = u_xlat16_6.x * 16.0 + u_xlat16_0.z;
    u_xlat16_6.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_6.xz = u_xlat16_6.xz * vec2(0.00390625, 0.0625);
    u_xlat16_17.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xz).x;
    u_xlat16_0.x = u_xlat16_1.x * 16.0 + u_xlat16_0.z;
    u_xlat16_6.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_6.xz = u_xlat16_6.xz * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xz).x;
    u_xlat16_1.x = u_xlat16_8.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_6.x = (-u_xlat16_32) + u_xlat16_17.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_6.x + u_xlat16_32;
    u_xlat16_1.x = u_xlat16_21 * u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_50 * 0.5;
    u_xlat16_6.x = (-u_xlat16_50) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_6.x + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_21 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_50;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat2.x = _emissiveBreathe.y * _Time.y;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat17 = (-_emissiveBreathe.z) + 1.0;
    u_xlat2.x = abs(u_xlat2.x) * u_xlat17 + _emissiveBreathe.z;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat16_20.xyz + u_xlat16_16.xyz;
    u_xlat16_20.xyz = (-u_xlat16_16.xyz) + _FogCol.xyz;
    u_xlat16_16.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_16.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_16.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat2.xyz = u_xlat2.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_5.x;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_24;
float u_xlat36;
float u_xlat37;
int u_xlati37;
mediump vec2 u_xlat16_46;
float u_xlat54;
int u_xlati54;
bool u_xlatb54;
float u_xlat58;
bool u_xlatb59;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyz = vec3(u_xlat58) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_60 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_60 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = sqrt(u_xlat16_60);
    u_xlat16_6.z = max(u_xlat16_60, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat58 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyz = vec3(u_xlat58) * u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb59 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb59)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _LaserRamp_ST.x;
    u_xlat16_46.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_1.xy = texture(_LaserMask, u_xlat16_46.xy).xy;
    u_xlat16_10.y = u_xlat16_1.y * _LaserRamp_ST.y;
    u_xlat16_10.xy = u_xlat16_10.xy + _LaserRamp_ST.zw;
    u_xlat16_19.xyz = texture(_LaserRamp, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _LaserColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = u_xlat16_1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _LaserColor.w;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat16_11.xyz) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
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
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat0.xyz * vec3(u_xlat16_60);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat16_15.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_14.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat37 = (-u_xlat1.x) * u_xlat16_60 + u_xlat1.x;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat16_60;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat1.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat2.x = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat2.x = u_xlat54 * u_xlat2.x + u_xlat16_60;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat54 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat2.x;
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = min(u_xlat37, 16.0);
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_64) + 1.0;
    u_xlat18 = u_xlat2.x * u_xlat2.x;
    u_xlat36 = u_xlat16_60 + -1.0;
    u_xlat18 = u_xlat18 * u_xlat36 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat16_60 / u_xlat18;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat18 = u_xlat37 * u_xlat18;
    u_xlat16_64 = u_xlat0.x * u_xlat0.x;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_65 = u_xlat0.x * u_xlat16_64;
    u_xlat0.x = (-u_xlat16_64) * u_xlat0.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat0.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat2.xyw;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_67 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_67);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_66) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(u_xlat16_66) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati54 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati54].xyz;
    u_xlati54 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati37 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati37].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat2.xyw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat54 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat58) + (-u_xlat2.xyw);
    u_xlat2.xyw = vec3(u_xlat16_60) * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xw);
    u_xlat13.y = u_xlat2.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat1.y = u_xlat16_3.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_12.x = u_xlat16_60 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_3.x = u_xlat16_12.x * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_12.x = (-u_xlat16_19.x) + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_12.x + u_xlat16_19.x;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat54 = u_xlat54 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_64 * 0.5;
    u_xlat16_65 = (-u_xlat16_64) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat54 * u_xlat16_65 + u_xlat16_60;
    u_xlat16_65 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_12.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat18 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat18 + _emissiveBreathe.z;
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat1.xyz = u_xlat16_10.xyz * u_xlat1.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_24;
float u_xlat36;
float u_xlat37;
int u_xlati37;
mediump vec2 u_xlat16_46;
float u_xlat54;
int u_xlati54;
bool u_xlatb54;
float u_xlat58;
bool u_xlatb59;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyz = vec3(u_xlat58) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_60 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_60 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = sqrt(u_xlat16_60);
    u_xlat16_6.z = max(u_xlat16_60, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat58 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyz = vec3(u_xlat58) * u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb59 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb59)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _LaserRamp_ST.x;
    u_xlat16_46.xy = vs_TEXCOORD3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_1.xy = texture(_LaserMask, u_xlat16_46.xy).xy;
    u_xlat16_10.y = u_xlat16_1.y * _LaserRamp_ST.y;
    u_xlat16_10.xy = u_xlat16_10.xy + _LaserRamp_ST.zw;
    u_xlat16_19.xyz = texture(_LaserRamp, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _LaserColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = u_xlat16_1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _LaserColor.w;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat16_11.xyz) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
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
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat0.xyz * vec3(u_xlat16_60);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat16_15.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_14.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat37 = (-u_xlat1.x) * u_xlat16_60 + u_xlat1.x;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat16_60;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat1.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat2.x = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat2.x = u_xlat54 * u_xlat2.x + u_xlat16_60;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat54 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat2.x;
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat37 = min(u_xlat37, 16.0);
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_64) + 1.0;
    u_xlat18 = u_xlat2.x * u_xlat2.x;
    u_xlat36 = u_xlat16_60 + -1.0;
    u_xlat18 = u_xlat18 * u_xlat36 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat16_60 / u_xlat18;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat18 = u_xlat37 * u_xlat18;
    u_xlat16_64 = u_xlat0.x * u_xlat0.x;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_65 = u_xlat0.x * u_xlat16_64;
    u_xlat0.x = (-u_xlat16_64) * u_xlat0.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat0.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat2.xyw;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_67 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_67);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_66) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(u_xlat16_66) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati54 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati54].xyz;
    u_xlati54 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati37 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati37].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat2.xyw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat54 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat58) + (-u_xlat2.xyw);
    u_xlat2.xyw = vec3(u_xlat16_60) * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xw);
    u_xlat13.y = u_xlat2.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat1.y = u_xlat16_3.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_12.x = u_xlat16_60 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_3.x = u_xlat16_12.x * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_12.x = (-u_xlat16_19.x) + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_12.x + u_xlat16_19.x;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat54 = u_xlat54 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_64 * 0.5;
    u_xlat16_65 = (-u_xlat16_64) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat54 * u_xlat16_65 + u_xlat16_60;
    u_xlat16_65 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_12.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat18 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat18 + _emissiveBreathe.z;
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat1.xyz = u_xlat16_10.xyz * u_xlat1.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
  GpuProgramID 113570
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
CustomEditor "FTheseusShaderGUI.WeaponPbrShaderGUI"
}