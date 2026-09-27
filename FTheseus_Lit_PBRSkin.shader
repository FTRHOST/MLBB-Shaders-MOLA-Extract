//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/Lit/PBR(Skin)" {
Properties {

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveBreathe ("emissiveBreath", Vector) = (0,0,0,0)

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrengthMap ("shadowStrengthMap", 2D) = "white" { }

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

[Tex] _skinMap ("skinMap", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

[Toggle(_LG_ON)] _UseFlowLight ("流光开关关键字", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

[Toggle(_DIRECTIONAL_SANSHE)] _DirectionalSanshe ("补光类型(关闭:边缘光;打开:平行光)", Float) = 1.0

[Toggle] _EnableVISInfluence ("开启visibility影响", Float) = 0.0

_SanSheMaskMap ("补光遮罩图(R通道)", 2D) = "white" { }

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0, 20)) = 1.0

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
  GpuProgramID 60745
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _SanSheMaskMap;
UNITY_LOCATION(1) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(3) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
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
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec3 u_xlat25;
int u_xlati25;
mediump float u_xlat16_26;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_41;
float u_xlat45;
bool u_xlatb45;
mediump float u_xlat16_46;
mediump float u_xlat16_51;
float u_xlat60;
mediump float u_xlat16_62;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_68;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
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
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_23.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_8.xyz;
    u_xlat60 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat11.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat11.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat67 = (-u_xlat7) * u_xlat16_21.x + u_xlat7;
    u_xlat67 = u_xlat7 * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat7;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat12.x) * u_xlat16_21.x + u_xlat12.x;
    u_xlat69 = u_xlat12.x * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat12.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat69;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat67 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat24 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat24 * u_xlat24;
    u_xlat16_1.x = u_xlat24 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat24 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat24 * u_xlat16_1.x;
    u_xlat24 = (-u_xlat16_1.x) * u_xlat24 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat24);
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat13.xyz;
    u_xlat60 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat24 = (-u_xlat60) * u_xlat16_21.x + u_xlat60;
    u_xlat24 = u_xlat60 * u_xlat24 + u_xlat16_21.x;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat60 + u_xlat24;
    u_xlat67 = u_xlat24 + 6.10351563e-05;
    u_xlat69 = u_xlat67 * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat69 = u_xlat4.x * u_xlat69;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat69);
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat13.xyz;
    u_xlat16_1.xzw = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_62 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_26 = (-u_xlat16_3.x) + u_xlat16_26;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_26 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_26 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_26 + -1.0;
    u_xlat16_26 = _occlusionScale * u_xlat16_26 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_26;
    u_xlat16_68 = sqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat16_74 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = sqrt(u_xlat16_70);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_74) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = vec3(u_xlat7) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = vec3(u_xlat60) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + (-vec3(u_xlat60));
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_15.xyz + (-vec3(u_xlat7));
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = vec3(u_xlat16_74) * u_xlat16_16.xyz + vec3(u_xlat60);
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_1.xzw + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlat5.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat13.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat13.xyz + _sssColorBack.xyz;
    u_xlat5.xyz = u_xlat16_16.xyz * u_xlat5.xyz;
    u_xlat16_16.xyz = u_xlat5.xyz * u_xlat16_23.xyz + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = vec3(u_xlat16_70) * u_xlat16_16.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_26) * u_xlat16_16.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati5.x = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati25 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_70 = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat16_74 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_74);
    u_xlat16_19.xyz = u_xlat16_23.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_70) + (-u_xlat16_19.xyz);
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_16.xyz * u_xlat16_23.xyz + u_xlat16_15.xyz;
    u_xlat16_70 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat5.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_70) + (-u_xlat16_10.xyz);
    u_xlat0.z = u_xlat16_10.z;
    u_xlat69 = dot(u_xlat11.xyz, u_xlat0.xyz);
    u_xlat11.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat69 = max(u_xlat69, 0.00100000005);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = log2(u_xlat69);
    u_xlat16_0.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_46 = floor(u_xlat16_0.w);
    u_xlat16_66 = u_xlat16_46 + 1.0;
    u_xlat16_66 = min(u_xlat16_66, 15.0);
    u_xlat16_0.x = u_xlat16_66 * 16.0 + u_xlat16_0.z;
    u_xlat16_10.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_0.x = u_xlat16_46 * 16.0 + u_xlat16_0.z;
    u_xlat16_10.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_51 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_46 = u_xlat16_10.z * 15.0 + (-u_xlat16_46);
    u_xlat16_66 = (-u_xlat16_51) + u_xlat16_31;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_66 + u_xlat16_51;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_46;
    u_xlat11.x = u_xlat11.x * u_xlat16_26;
    u_xlat16_26 = u_xlat16_3.x * 0.5;
    u_xlat16_46 = (-u_xlat16_3.x) * 0.5 + 1.0;
    u_xlat16_26 = u_xlat11.x * u_xlat16_46 + u_xlat16_26;
    u_xlat16_46 = u_xlat16_26 + u_xlat16_26;
    u_xlat16_66 = (-u_xlat16_26) * 2.0 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66 + u_xlat16_46;
    u_xlat16_26 = u_xlat16_3.x * u_xlat16_26;
    u_xlat16_26 = min(u_xlat16_26, u_xlat16_7.z);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat64) + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat16_21.xxx * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_9.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_9.xxx + u_xlat16_9.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_21.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_68) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb5 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb5)) ? u_xlat16_10.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_23.xyz = u_xlat16_6.xzw * vec3(u_xlat16_26) + u_xlat16_23.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xzw * vec3(u_xlat16_26) + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat5.x = _emissiveBreathe.y * _Time.y;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat25.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat5.x = abs(u_xlat5.x) * u_xlat25.x + _emissiveBreathe.z;
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_0.www * _FlowLightColor.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat5.xyz * u_xlat16_6.xyz + u_xlat16_23.xyz;
    u_xlat16_6.xyz = (-u_xlat16_23.xyz) + _FogCol.xyz;
    u_xlat16_23.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_23.xyz;
    u_xlat5.xyz = u_xlat16_23.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat5.xyz = u_xlat16_23.xyz * u_xlat5.xyz;
    u_xlat9.xyz = u_xlat16_23.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat9.xyz = u_xlat16_23.xyz * u_xlat9.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat5.xyz = u_xlat5.xyz / u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = log2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xy = _Time.yy * _FlowLightFactory.yz + vs_TEXCOORD3.xy;
    u_xlat16_41.xy = u_xlat9.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
    u_xlat16_23.xyz = u_xlat16_0.xyz * _FlowLightFactory.xxx;
    u_xlat16_23.xyz = u_xlat16_0.www * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat5.xyz;
    u_xlat16_5.x = texture(_SanSheMaskMap, vs_TEXCOORD3.xy).x;
    u_xlat25.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat25.x = u_xlat69 * u_xlat25.x;
    u_xlat25.x = exp2(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _Sanshe_Power;
    u_xlat45 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat65 = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat45 = (-u_xlat65) + u_xlat45;
    u_xlat45 = u_xlat45 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat9.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * u_xlat9.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.5<_isGradient);
#else
    u_xlatb45 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : _Sanshe_color.xyz;
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb69 = 0.5<_EnableVISInfluence;
#endif
    u_xlat25.xyz = (bool(u_xlatb69)) ? u_xlat9.xyz : u_xlat25.xyz;
    u_xlat5.xyz = u_xlat25.xyz * u_xlat16_5.xxx + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb5 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb5) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _SanSheMaskMap;
UNITY_LOCATION(1) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(3) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
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
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec3 u_xlat25;
int u_xlati25;
mediump float u_xlat16_26;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_41;
float u_xlat45;
bool u_xlatb45;
mediump float u_xlat16_46;
mediump float u_xlat16_51;
float u_xlat60;
mediump float u_xlat16_62;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_68;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
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
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_23.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_8.xyz;
    u_xlat60 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat11.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat11.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat67 = (-u_xlat7) * u_xlat16_21.x + u_xlat7;
    u_xlat67 = u_xlat7 * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat7;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat12.x) * u_xlat16_21.x + u_xlat12.x;
    u_xlat69 = u_xlat12.x * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat12.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat69;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat67 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat24 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat24 * u_xlat24;
    u_xlat16_1.x = u_xlat24 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat24 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat24 * u_xlat16_1.x;
    u_xlat24 = (-u_xlat16_1.x) * u_xlat24 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat24);
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat13.xyz;
    u_xlat60 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat24 = (-u_xlat60) * u_xlat16_21.x + u_xlat60;
    u_xlat24 = u_xlat60 * u_xlat24 + u_xlat16_21.x;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat60 + u_xlat24;
    u_xlat67 = u_xlat24 + 6.10351563e-05;
    u_xlat69 = u_xlat67 * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat69 = u_xlat4.x * u_xlat69;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat69);
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat13.xyz;
    u_xlat16_1.xzw = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_62 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_26 = (-u_xlat16_3.x) + u_xlat16_26;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_26 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_26 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_26 + -1.0;
    u_xlat16_26 = _occlusionScale * u_xlat16_26 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_26;
    u_xlat16_68 = sqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat16_74 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = sqrt(u_xlat16_70);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_74) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = vec3(u_xlat7) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = vec3(u_xlat60) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + (-vec3(u_xlat60));
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_15.xyz + (-vec3(u_xlat7));
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = vec3(u_xlat16_74) * u_xlat16_16.xyz + vec3(u_xlat60);
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_1.xzw + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlat5.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat13.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat13.xyz + _sssColorBack.xyz;
    u_xlat5.xyz = u_xlat16_16.xyz * u_xlat5.xyz;
    u_xlat16_16.xyz = u_xlat5.xyz * u_xlat16_23.xyz + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = vec3(u_xlat16_70) * u_xlat16_16.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_26) * u_xlat16_16.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati5.x = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati25 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_70 = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat16_74 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_74);
    u_xlat16_19.xyz = u_xlat16_23.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_70) + (-u_xlat16_19.xyz);
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_16.xyz * u_xlat16_23.xyz + u_xlat16_15.xyz;
    u_xlat16_70 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat5.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_70) + (-u_xlat16_10.xyz);
    u_xlat0.z = u_xlat16_10.z;
    u_xlat69 = dot(u_xlat11.xyz, u_xlat0.xyz);
    u_xlat11.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat69 = max(u_xlat69, 0.00100000005);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = log2(u_xlat69);
    u_xlat16_0.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_46 = floor(u_xlat16_0.w);
    u_xlat16_66 = u_xlat16_46 + 1.0;
    u_xlat16_66 = min(u_xlat16_66, 15.0);
    u_xlat16_0.x = u_xlat16_66 * 16.0 + u_xlat16_0.z;
    u_xlat16_10.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_0.x = u_xlat16_46 * 16.0 + u_xlat16_0.z;
    u_xlat16_10.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_51 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_46 = u_xlat16_10.z * 15.0 + (-u_xlat16_46);
    u_xlat16_66 = (-u_xlat16_51) + u_xlat16_31;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_66 + u_xlat16_51;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_46;
    u_xlat11.x = u_xlat11.x * u_xlat16_26;
    u_xlat16_26 = u_xlat16_3.x * 0.5;
    u_xlat16_46 = (-u_xlat16_3.x) * 0.5 + 1.0;
    u_xlat16_26 = u_xlat11.x * u_xlat16_46 + u_xlat16_26;
    u_xlat16_46 = u_xlat16_26 + u_xlat16_26;
    u_xlat16_66 = (-u_xlat16_26) * 2.0 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66 + u_xlat16_46;
    u_xlat16_26 = u_xlat16_3.x * u_xlat16_26;
    u_xlat16_26 = min(u_xlat16_26, u_xlat16_7.z);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat64) + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat16_21.xxx * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_9.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_9.xxx + u_xlat16_9.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_21.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_68) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb5 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb5)) ? u_xlat16_10.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_23.xyz = u_xlat16_6.xzw * vec3(u_xlat16_26) + u_xlat16_23.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xzw * vec3(u_xlat16_26) + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat5.x = _emissiveBreathe.y * _Time.y;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat25.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat5.x = abs(u_xlat5.x) * u_xlat25.x + _emissiveBreathe.z;
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_0.www * _FlowLightColor.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat5.xyz * u_xlat16_6.xyz + u_xlat16_23.xyz;
    u_xlat16_6.xyz = (-u_xlat16_23.xyz) + _FogCol.xyz;
    u_xlat16_23.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_23.xyz;
    u_xlat5.xyz = u_xlat16_23.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat5.xyz = u_xlat16_23.xyz * u_xlat5.xyz;
    u_xlat9.xyz = u_xlat16_23.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat9.xyz = u_xlat16_23.xyz * u_xlat9.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat5.xyz = u_xlat5.xyz / u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = log2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xy = _Time.yy * _FlowLightFactory.yz + vs_TEXCOORD3.xy;
    u_xlat16_41.xy = u_xlat9.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
    u_xlat16_23.xyz = u_xlat16_0.xyz * _FlowLightFactory.xxx;
    u_xlat16_23.xyz = u_xlat16_0.www * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat5.xyz;
    u_xlat16_5.x = texture(_SanSheMaskMap, vs_TEXCOORD3.xy).x;
    u_xlat25.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat25.x = u_xlat69 * u_xlat25.x;
    u_xlat25.x = exp2(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _Sanshe_Power;
    u_xlat45 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat65 = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat45 = (-u_xlat65) + u_xlat45;
    u_xlat45 = u_xlat45 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat9.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * u_xlat9.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.5<_isGradient);
#else
    u_xlatb45 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : _Sanshe_color.xyz;
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb69 = 0.5<_EnableVISInfluence;
#endif
    u_xlat25.xyz = (bool(u_xlatb69)) ? u_xlat9.xyz : u_xlat25.xyz;
    u_xlat5.xyz = u_xlat25.xyz * u_xlat16_5.xxx + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb5 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb5) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _SanSheMaskMap;
UNITY_LOCATION(1) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(3) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
float u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
float u_xlat44;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
float u_xlat64;
bool u_xlatb64;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_69);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = u_xlat16_10.x * u_xlat16_31.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat16_69) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz;
    u_xlat16_73 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat22.x = (-u_xlat16_73) + 1.0;
    u_xlat16_10.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_10.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat22.x = (-u_xlat16_10.x) * u_xlat22.x + 1.0;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat2.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat23.x = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat23.x = u_xlat63 * u_xlat23.x + u_xlat16_31.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat63 + u_xlat23.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_69);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_31.x + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat8.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat3.x = u_xlat16_31.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat22.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_69) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat3.x + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_31.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat23.x = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat23.x * u_xlat23.x;
    u_xlat16_69 = u_xlat23.x * u_xlat16_69;
    u_xlat16_69 = u_xlat23.x * u_xlat16_69;
    u_xlat16_74 = u_xlat23.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat23.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat23.xxx;
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_74) + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat2.x) * u_xlat16_31.x + u_xlat2.x;
    u_xlat23.x = u_xlat2.x * u_xlat23.x + u_xlat16_31.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat64 = u_xlat64 * u_xlat23.x;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat64);
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat1.xyz;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_69 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_4.w * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_4.w * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat16_75 = sqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_6.xyz * vec3(u_xlat16_75);
    u_xlat16_17.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_1.x * u_xlat16_76;
    u_xlat16_77 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_77);
    u_xlat16_77 = sqrt(u_xlat16_76);
    u_xlat16_17.xyz = vec3(u_xlat16_77) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_18.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz + (-u_xlat16_19.xyz);
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-vec3(u_xlat63));
    u_xlat16_17.xyz = vec3(u_xlat16_77) * u_xlat16_17.xyz + vec3(u_xlat63);
    u_xlat16_17.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_16.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_11.xyz + _sssColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat63 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_76) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_11.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati63 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati1.x = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_11.xxx * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.zzz * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.x = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_53 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_53);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_53) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_32.xxx + (-u_xlat16_19.xyz);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_32.xxx + u_xlat16_18.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat0.xyz);
    u_xlat21.x = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_15.xyz, u_xlat1.xyz);
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
    u_xlat16_7.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_7.w);
    u_xlat16_52 = u_xlat16_10.x + 1.0;
    u_xlat16_52 = min(u_xlat16_52, 15.0);
    u_xlat16_7.x = u_xlat16_52 * 16.0 + u_xlat16_7.z;
    u_xlat16_32.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_7.x = u_xlat16_10.x * 16.0 + u_xlat16_7.z;
    u_xlat16_32.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_52 = (-u_xlat16_63) + u_xlat16_42;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_52 + u_xlat16_63;
    u_xlat16_10.x = u_xlat16_74 * u_xlat16_10.x;
    u_xlat21.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_69 * 0.5;
    u_xlat16_52 = (-u_xlat16_69) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_52 + u_xlat16_10.x;
    u_xlat16_52 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_73 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_73 + u_xlat16_52;
    u_xlat16_10.x = u_xlat16_69 * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_3.z, u_xlat16_10.x);
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat1.xyz);
    u_xlat21.xyz = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat1.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat21.xz);
    u_xlat21.z = dot(_IndirectCubemapRotationParams.zw, u_xlat21.xz);
    u_xlat21.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_32.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat21.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat21.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat21.xyz * u_xlat21.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb21 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb21)) ? u_xlat16_12.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_10.xxx + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_31.xyz * u_xlat16_10.xxx + u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_2.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat16_1 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_1.www * _FlowLightColor.xyz;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat21.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat21.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat21.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat1.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat21.xyz = u_xlat21.xyz / u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = log2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat21.xyz = max(u_xlat21.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = _Time.yy * _FlowLightFactory.yz + vs_TEXCOORD3.xy;
    u_xlat16_6.xy = u_xlat1.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_1 = texture(_FlowLightTex, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * _FlowLightFactory.xxx;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + u_xlat21.xyz;
    u_xlat16_21 = texture(_SanSheMaskMap, vs_TEXCOORD3.xy).x;
    u_xlat42 = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat42 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat63 = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat42 = (-u_xlat63) + u_xlat42;
    u_xlat42 = u_xlat42 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat1.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat1.xyz = vec3(u_xlat42) * u_xlat1.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.5<_isGradient);
#else
    u_xlatb42 = 0.5<_isGradient;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb42)) ? u_xlat1.xyz : _Sanshe_color.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat1.xyz = vec3(u_xlat16_69) * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb64 = 0.5<_EnableVISInfluence;
#endif
    u_xlat0.xzw = (bool(u_xlatb64)) ? u_xlat1.xyz : u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xzw * vec3(u_xlat16_21) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_31.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _SanSheMaskMap;
UNITY_LOCATION(1) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(3) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
float u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
float u_xlat44;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
float u_xlat64;
bool u_xlatb64;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_69);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = u_xlat16_10.x * u_xlat16_31.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat16_69) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz;
    u_xlat16_73 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat22.x = (-u_xlat16_73) + 1.0;
    u_xlat16_10.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_10.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_10.x;
    u_xlat22.x = (-u_xlat16_10.x) * u_xlat22.x + 1.0;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat2.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat23.x = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat23.x = u_xlat63 * u_xlat23.x + u_xlat16_31.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat63 + u_xlat23.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_69);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_31.x + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat8.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat3.x = u_xlat16_31.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat22.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_69) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat3.x + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_31.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat23.x = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat23.x * u_xlat23.x;
    u_xlat16_69 = u_xlat23.x * u_xlat16_69;
    u_xlat16_69 = u_xlat23.x * u_xlat16_69;
    u_xlat16_74 = u_xlat23.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat23.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat23.xxx;
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_74) + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat2.x) * u_xlat16_31.x + u_xlat2.x;
    u_xlat23.x = u_xlat2.x * u_xlat23.x + u_xlat16_31.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat64 = u_xlat64 * u_xlat23.x;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat64);
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat1.xyz;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_69 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_4.w * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_4.w * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat16_75 = sqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_6.xyz * vec3(u_xlat16_75);
    u_xlat16_17.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_1.x * u_xlat16_76;
    u_xlat16_77 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_77);
    u_xlat16_77 = sqrt(u_xlat16_76);
    u_xlat16_17.xyz = vec3(u_xlat16_77) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_18.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz + (-u_xlat16_19.xyz);
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-vec3(u_xlat63));
    u_xlat16_17.xyz = vec3(u_xlat16_77) * u_xlat16_17.xyz + vec3(u_xlat63);
    u_xlat16_17.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_16.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_11.xyz + _sssColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat63 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = vec3(u_xlat63) * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_76) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_11.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati63 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati1.x = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_11.xxx * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.zzz * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.x = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_53 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_53);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = vec3(u_xlat16_53) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_32.xxx + (-u_xlat16_19.xyz);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_32.xxx + u_xlat16_18.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat0.xyz);
    u_xlat21.x = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_15.xyz, u_xlat1.xyz);
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
    u_xlat16_7.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_7.w);
    u_xlat16_52 = u_xlat16_10.x + 1.0;
    u_xlat16_52 = min(u_xlat16_52, 15.0);
    u_xlat16_7.x = u_xlat16_52 * 16.0 + u_xlat16_7.z;
    u_xlat16_32.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_7.x = u_xlat16_10.x * 16.0 + u_xlat16_7.z;
    u_xlat16_32.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_52 = (-u_xlat16_63) + u_xlat16_42;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_52 + u_xlat16_63;
    u_xlat16_10.x = u_xlat16_74 * u_xlat16_10.x;
    u_xlat21.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_69 * 0.5;
    u_xlat16_52 = (-u_xlat16_69) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_52 + u_xlat16_10.x;
    u_xlat16_52 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_73 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_73 + u_xlat16_52;
    u_xlat16_10.x = u_xlat16_69 * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_3.z, u_xlat16_10.x);
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat1.xyz);
    u_xlat21.xyz = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat1.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat21.xz);
    u_xlat21.z = dot(_IndirectCubemapRotationParams.zw, u_xlat21.xz);
    u_xlat21.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_32.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat21.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat21.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat21.xyz * u_xlat21.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb21 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb21)) ? u_xlat16_12.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_10.xxx + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_31.xyz * u_xlat16_10.xxx + u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_2.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat16_1 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_1.www * _FlowLightColor.xyz;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat21.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat21.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat21.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat1.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat21.xyz = u_xlat21.xyz / u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = log2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat21.xyz = max(u_xlat21.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = _Time.yy * _FlowLightFactory.yz + vs_TEXCOORD3.xy;
    u_xlat16_6.xy = u_xlat1.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_1 = texture(_FlowLightTex, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * _FlowLightFactory.xxx;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + u_xlat21.xyz;
    u_xlat16_21 = texture(_SanSheMaskMap, vs_TEXCOORD3.xy).x;
    u_xlat42 = max(_Sanshe_Fw, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat42 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat63 = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat42 = (-u_xlat63) + u_xlat42;
    u_xlat42 = u_xlat42 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat1.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat1.xyz = vec3(u_xlat42) * u_xlat1.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.5<_isGradient);
#else
    u_xlatb42 = 0.5<_isGradient;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb42)) ? u_xlat1.xyz : _Sanshe_color.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat1.xyz = vec3(u_xlat16_69) * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb64 = 0.5<_EnableVISInfluence;
#endif
    u_xlat0.xzw = (bool(u_xlatb64)) ? u_xlat1.xyz : u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xzw * vec3(u_xlat16_21) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_31.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec2 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
float u_xlat17;
mediump vec3 u_xlat16_17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_29;
float u_xlat34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
float u_xlat60;
int u_xlati60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat16_52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_52 = _sssIntensity * _sssIntensity;
    u_xlat16_52 = u_xlat16_4.x * u_xlat16_52;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_53 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_54 = sqrt(u_xlat16_52);
    u_xlat16_2.xyz = vec3(u_xlat16_54) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat16_54) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
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
    u_xlat58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat7.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_8.xyz;
    u_xlat16_56 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_10.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_56 = u_xlat16_10.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_10.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_59 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_12.x = sqrt(u_xlat16_59);
    u_xlat16_29.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_29.xyz = vec3(u_xlat16_54) * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat16_29.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + (-vec3(u_xlat51));
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat16_6.xyz + vec3(u_xlat51);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat51) * u_xlat16_1.xyz;
    u_xlat51 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat51) * u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + (-vec3(u_xlat51));
    u_xlat16_2.xyz = vec3(u_xlat16_54) * u_xlat16_2.xyz + vec3(u_xlat51);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_10.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat60 = (-u_xlat11.x) * u_xlat16_2.x + u_xlat11.x;
    u_xlat60 = u_xlat11.x * u_xlat60 + u_xlat16_2.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat11.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat45 = (-u_xlat51) * u_xlat16_2.x + u_xlat51;
    u_xlat45 = u_xlat51 * u_xlat45 + u_xlat16_2.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat51 + u_xlat45;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat45;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45);
    u_xlat45 = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_19.x) + 1.0;
    u_xlat17 = u_xlat45 * u_xlat45;
    u_xlat34 = u_xlat16_2.x + -1.0;
    u_xlat17 = u_xlat17 * u_xlat34 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_2.x / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat17 = u_xlat60 * u_xlat17;
    u_xlat16_19.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_36 = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = (-u_xlat16_19.x) * u_xlat0.x + 1.0;
    u_xlat16_6.xyz = u_xlat16_10.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat0.xxx * vec3(u_xlat16_36) + u_xlat16.xyz;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_10.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat12.y = u_xlat9.y;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_13.y = u_xlat16_8.y;
    u_xlat51 = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat16.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz + _sssColorBack.xyz;
    u_xlat16.xyz = u_xlat16_19.xyz * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat16.xyz * u_xlat16_14.xyz + (-u_xlat16_14.xyz);
    u_xlat16_19.xyz = vec3(u_xlat16_52) * u_xlat16_19.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_52 = min(u_xlat16_4.z, u_xlat16_59);
    u_xlat16_54 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat16_54) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_52) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati60 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_19.x = dot((-u_xlat16_3.xyz), u_xlat9.xyz);
    u_xlat16_19.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16.xyz = (-u_xlat9.xyz) * u_xlat16_19.xxx + (-u_xlat16_3.xyz);
    u_xlat51 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_10.z = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.xyz = min(max(u_xlat16_19.xyz, 0.0), 1.0);
#else
    u_xlat16_19.xyz = clamp(u_xlat16_19.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_19.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_3.w);
    u_xlat16_36 = u_xlat16_19.x + 1.0;
    u_xlat16_36 = min(u_xlat16_36, 15.0);
    u_xlat16_3.x = u_xlat16_36 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_19.x * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_19.x = u_xlat16_19.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_36 = (-u_xlat16_26) + u_xlat16_9.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_36 + u_xlat16_26;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat51 = u_xlat51 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_59 * 0.5;
    u_xlat16_36 = (-u_xlat16_59) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat51 * u_xlat16_36 + u_xlat16_19.x;
    u_xlat16_36 = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_53 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_59;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_4.z);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat58) + (-u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16_2.xxx * u_xlat7.xyz + u_xlat16.xyz;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat7.xz);
    u_xlat7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat7.xz);
    u_xlat7.x = u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat11.y = u_xlat16_10.x;
    u_xlat16_9.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_9.xxx + u_xlat16_9.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat7.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_52) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb51 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_19.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xxx * u_xlat16_2.xzw;
    u_xlat16_2.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_11.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat17 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat17 + _emissiveBreathe.z;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat7.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat7.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec2 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
float u_xlat17;
mediump vec3 u_xlat16_17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_29;
float u_xlat34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
float u_xlat60;
int u_xlati60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat16_52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_52 = _sssIntensity * _sssIntensity;
    u_xlat16_52 = u_xlat16_4.x * u_xlat16_52;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_53 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_54 = sqrt(u_xlat16_52);
    u_xlat16_2.xyz = vec3(u_xlat16_54) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat16_54) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
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
    u_xlat58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat16_8.xyz = (-u_xlat7.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat7.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_8.xyz;
    u_xlat16_56 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_10.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_56 = u_xlat16_10.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_10.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_59 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_12.x = sqrt(u_xlat16_59);
    u_xlat16_29.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_29.xyz = vec3(u_xlat16_54) * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat16_29.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + (-vec3(u_xlat51));
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat16_6.xyz + vec3(u_xlat51);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat51) * u_xlat16_1.xyz;
    u_xlat51 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat51) * u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + (-vec3(u_xlat51));
    u_xlat16_2.xyz = vec3(u_xlat16_54) * u_xlat16_2.xyz + vec3(u_xlat51);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_10.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat60 = (-u_xlat11.x) * u_xlat16_2.x + u_xlat11.x;
    u_xlat60 = u_xlat11.x * u_xlat60 + u_xlat16_2.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat11.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat45 = (-u_xlat51) * u_xlat16_2.x + u_xlat51;
    u_xlat45 = u_xlat51 * u_xlat45 + u_xlat16_2.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat51 + u_xlat45;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat45;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45);
    u_xlat45 = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_19.x) + 1.0;
    u_xlat17 = u_xlat45 * u_xlat45;
    u_xlat34 = u_xlat16_2.x + -1.0;
    u_xlat17 = u_xlat17 * u_xlat34 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_2.x / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat17 = u_xlat60 * u_xlat17;
    u_xlat16_19.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_36 = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = (-u_xlat16_19.x) * u_xlat0.x + 1.0;
    u_xlat16_6.xyz = u_xlat16_10.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat0.xxx * vec3(u_xlat16_36) + u_xlat16.xyz;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_10.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat12.y = u_xlat9.y;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_13.y = u_xlat16_8.y;
    u_xlat51 = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat16.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz + _sssColorBack.xyz;
    u_xlat16.xyz = u_xlat16_19.xyz * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat16.xyz * u_xlat16_14.xyz + (-u_xlat16_14.xyz);
    u_xlat16_19.xyz = vec3(u_xlat16_52) * u_xlat16_19.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_52 = min(u_xlat16_4.z, u_xlat16_59);
    u_xlat16_54 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat16_54) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_52) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati60 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_19.x = dot((-u_xlat16_3.xyz), u_xlat9.xyz);
    u_xlat16_19.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16.xyz = (-u_xlat9.xyz) * u_xlat16_19.xxx + (-u_xlat16_3.xyz);
    u_xlat51 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_10.z = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.xyz = min(max(u_xlat16_19.xyz, 0.0), 1.0);
#else
    u_xlat16_19.xyz = clamp(u_xlat16_19.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_19.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_3.w);
    u_xlat16_36 = u_xlat16_19.x + 1.0;
    u_xlat16_36 = min(u_xlat16_36, 15.0);
    u_xlat16_3.x = u_xlat16_36 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_19.x * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_19.x = u_xlat16_19.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_36 = (-u_xlat16_26) + u_xlat16_9.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_36 + u_xlat16_26;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat51 = u_xlat51 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_59 * 0.5;
    u_xlat16_36 = (-u_xlat16_59) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat51 * u_xlat16_36 + u_xlat16_19.x;
    u_xlat16_36 = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_53 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_59;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_4.z);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat58) + (-u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16_2.xxx * u_xlat7.xyz + u_xlat16.xyz;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat7.xz);
    u_xlat7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat7.xz);
    u_xlat7.x = u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat11.y = u_xlat16_10.x;
    u_xlat16_9.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_9.xxx + u_xlat16_9.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat7.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_52) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb51 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_19.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xxx * u_xlat16_2.xzw;
    u_xlat16_2.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_11.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat17 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat17 + _emissiveBreathe.z;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat16_19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat7.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat7.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_33;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_50;
float u_xlat61;
bool u_xlatb61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21 = (-u_xlat1.x) + u_xlat21;
    u_xlat0.z = _ShadowBias.y * u_xlat21 + u_xlat1.x;
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
    u_xlat21 = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat21 + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_21.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21.x * _shadowStrength;
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_66) + u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_66 = u_xlat16_0.w * u_xlat16_70 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_0.w * u_xlat16_66;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.x = sqrt(u_xlat16_66);
    u_xlat16_31.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _sssIntensity * _sssIntensity;
    u_xlat16_72 = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_33 = sqrt(u_xlat16_72);
    u_xlat16_12.xyz = vec3(u_xlat16_33) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_33) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_31.xyz + (-u_xlat2.xxx);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz + u_xlat2.xxx;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_1.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_74 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_75 = inversesqrt(u_xlat16_74);
    u_xlat16_17.xyz = u_xlat22.xyz * vec3(u_xlat16_75);
    u_xlat16_75 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.00100000005>=abs(u_xlat16_75));
#else
    u_xlatb61 = 0.00100000005>=abs(u_xlat16_75);
#endif
    u_xlat16_18.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_75 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_75);
    u_xlat16_75 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_74 = float(1.0) / float(u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat16_74 = max(u_xlat16_18.x, u_xlat16_74);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_19.xyz = u_xlat22.xyz * vec3(u_xlat16_71);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat16_19.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz + (-vec3(u_xlat61));
    u_xlat16_12.xyz = vec3(u_xlat16_33) * u_xlat16_12.xyz + vec3(u_xlat61);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_0.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_71 + u_xlat3.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x + u_xlat16_71;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat16_71 + u_xlat2.x;
    u_xlat21 = u_xlat2.x * u_xlat21 + u_xlat16_71;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat1.y = u_xlat21 + u_xlat2.x;
    u_xlat1.xy = u_xlat1.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat21 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22.xyz = vec3(u_xlat21) * u_xlat22.xyz;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_12.x) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat22.x = u_xlat16_71 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat22.x + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_71 / u_xlat21;
    u_xlat1.y = u_xlat21 * 0.318309873;
    u_xlat1.xy = min(u_xlat1.xy, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_12.x = u_xlat61 * u_xlat61;
    u_xlat16_12.x = u_xlat61 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat61 * u_xlat16_12.x;
    u_xlat16_32 = u_xlat61 * u_xlat16_12.x;
    u_xlat21 = (-u_xlat16_12.x) * u_xlat61 + 1.0;
    u_xlat16_14.xyz = u_xlat16_0.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat21 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat21) * vec3(u_xlat16_32) + u_xlat22.xyz;
    u_xlat1.xyw = u_xlat1.xxx * u_xlat22.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = u_xlat2.xxx * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_12.xyz + _sssColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat7.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_16.y = u_xlat16_10.y;
    u_xlat2.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_12.xyz = vec3(u_xlat16_72) * u_xlat16_12.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_72 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_73 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_73);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_72) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati22 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_19.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_19.xyz);
    u_xlat62 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_0.z = dot(u_xlat16_10.xyz, u_xlat2.xyz);
    u_xlat16_10.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_10.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_30.x = u_xlat16_43 + (-u_xlat16_7);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_30.x + u_xlat16_7;
    u_xlat16_10.x = u_xlat16_70 * u_xlat16_10.x;
    u_xlat62 = u_xlat62 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_66 * 0.5;
    u_xlat16_30.x = (-u_xlat16_66) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat62 * u_xlat16_30.x + u_xlat16_10.x;
    u_xlat16_30.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_50 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat16_66 = min(u_xlat16_1.z, u_xlat16_66);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat16_71) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat3.y = u_xlat16_0.x;
    u_xlat16_3.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_3.xxx + u_xlat16_3.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_72) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb41)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_3.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat21 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = abs(u_xlat1.x) * u_xlat21 + _emissiveBreathe.z;
    u_xlat16_21.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_21.xyz * _emissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_10.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat2.xyz;
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
    SV_Target0.w = (u_xlatb1) ? u_xlat16_6.x : u_xlat16_26;
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
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_33;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_50;
float u_xlat61;
bool u_xlatb61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21 = (-u_xlat1.x) + u_xlat21;
    u_xlat0.z = _ShadowBias.y * u_xlat21 + u_xlat1.x;
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
    u_xlat21 = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat21 + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_21.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21.x * _shadowStrength;
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_66) + u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_66 = u_xlat16_0.w * u_xlat16_70 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_0.w * u_xlat16_66;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.x = sqrt(u_xlat16_66);
    u_xlat16_31.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _sssIntensity * _sssIntensity;
    u_xlat16_72 = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_33 = sqrt(u_xlat16_72);
    u_xlat16_12.xyz = vec3(u_xlat16_33) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_33) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_31.xyz + (-u_xlat2.xxx);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz + u_xlat2.xxx;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_1.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_74 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_75 = inversesqrt(u_xlat16_74);
    u_xlat16_17.xyz = u_xlat22.xyz * vec3(u_xlat16_75);
    u_xlat16_75 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.00100000005>=abs(u_xlat16_75));
#else
    u_xlatb61 = 0.00100000005>=abs(u_xlat16_75);
#endif
    u_xlat16_18.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_75 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_75);
    u_xlat16_75 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_74 = float(1.0) / float(u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat16_74 = max(u_xlat16_18.x, u_xlat16_74);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_19.xyz = u_xlat22.xyz * vec3(u_xlat16_71);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat16_19.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz + (-vec3(u_xlat61));
    u_xlat16_12.xyz = vec3(u_xlat16_33) * u_xlat16_12.xyz + vec3(u_xlat61);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_0.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_71 + u_xlat3.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x + u_xlat16_71;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat16_71 + u_xlat2.x;
    u_xlat21 = u_xlat2.x * u_xlat21 + u_xlat16_71;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat1.y = u_xlat21 + u_xlat2.x;
    u_xlat1.xy = u_xlat1.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat21 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22.xyz = vec3(u_xlat21) * u_xlat22.xyz;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_12.x) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat22.x = u_xlat16_71 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat22.x + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_71 / u_xlat21;
    u_xlat1.y = u_xlat21 * 0.318309873;
    u_xlat1.xy = min(u_xlat1.xy, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_12.x = u_xlat61 * u_xlat61;
    u_xlat16_12.x = u_xlat61 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat61 * u_xlat16_12.x;
    u_xlat16_32 = u_xlat61 * u_xlat16_12.x;
    u_xlat21 = (-u_xlat16_12.x) * u_xlat61 + 1.0;
    u_xlat16_14.xyz = u_xlat16_0.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat21 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat21) * vec3(u_xlat16_32) + u_xlat22.xyz;
    u_xlat1.xyw = u_xlat1.xxx * u_xlat22.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = u_xlat2.xxx * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_12.xyz + _sssColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat7.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_16.y = u_xlat16_10.y;
    u_xlat2.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_12.xyz = vec3(u_xlat16_72) * u_xlat16_12.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_72 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_73 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_73);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_72) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati22 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_19.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_19.xyz);
    u_xlat62 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_0.z = dot(u_xlat16_10.xyz, u_xlat2.xyz);
    u_xlat16_10.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_10.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_30.x = u_xlat16_43 + (-u_xlat16_7);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_30.x + u_xlat16_7;
    u_xlat16_10.x = u_xlat16_70 * u_xlat16_10.x;
    u_xlat62 = u_xlat62 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_66 * 0.5;
    u_xlat16_30.x = (-u_xlat16_66) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat62 * u_xlat16_30.x + u_xlat16_10.x;
    u_xlat16_30.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_50 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat16_66 = min(u_xlat16_1.z, u_xlat16_66);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat16_71) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat3.y = u_xlat16_0.x;
    u_xlat16_3.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_3.xxx + u_xlat16_3.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_72) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb41)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_3.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat21 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = abs(u_xlat1.x) * u_xlat21 + _emissiveBreathe.z;
    u_xlat16_21.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_21.xyz * _emissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_10.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat2.xyz;
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
    SV_Target0.w = (u_xlatb1) ? u_xlat16_6.x : u_xlat16_26;
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
  GpuProgramID 95962
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
CustomEditor "FTheseusShaderGUI.SkinShaderGUI"
}