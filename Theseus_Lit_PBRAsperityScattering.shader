//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(AsperityScattering)" {
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

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_emissiveBreathe ("自发光呼吸", Vector) = (0,0,0,0)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_CubeColor ("EnvCube Color", Color) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_FUZTexture ("FUZ贴图", 2D) = "black" { }

_FUZ_TillingOffset ("绒毛平铺值", Vector) = (1,1,0,0)

_FUZ_CoreDarkness ("绒毛核心暗度", Float) = 0.949999988079071

_FUZ_EdgeBrightness ("绒毛边缘亮度", Float) = 1.621999979019165

_FUZ_Power ("绒毛强度", Float) = 3.0

_FUZ_Amount ("绒毛数量", Float) = 1.0

_Base_Brightness ("基础亮度", Float) = 1.6221460103988647

_BaseColor_Colorize ("基础颜色", Color) = (0.755894,0.734728,1,1)

_SSSColor ("次表面散射颜色", Color) = (1,1,1,1)

_SSAmount ("次表面散射强度", Range(0, 1)) = 0.5

_SSMaskInfluence ("次表面散射遮罩影响", Float) = 1.0

_ViewOffset ("视角偏移", Vector) = (0,0,0,0)

_zwrite ("深度写入", Float) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 3517
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
float u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_20;
int u_xlati20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat51;
float u_xlat60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
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
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
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
    u_xlat5.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_23.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_5.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_7 = texture(_materialParamsMap, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_62 = u_xlat16_7.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_6.xyz;
    u_xlat60 = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat10.xyz = vec3(u_xlat64) * u_xlat16_8.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat12.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat12.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat10.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat67 = dot(u_xlat10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_7.x * _roughnessMultiplier;
    u_xlat16_62 = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat7 = (-u_xlat67) * u_xlat16_62 + u_xlat67;
    u_xlat7 = u_xlat67 * u_xlat7 + u_xlat16_62;
    u_xlat7 = sqrt(u_xlat7);
    u_xlat7 = u_xlat7 + u_xlat67;
    u_xlat7 = u_xlat7 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat11.x) * u_xlat16_62 + u_xlat11.x;
    u_xlat69 = u_xlat11.x * u_xlat69 + u_xlat16_62;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat11.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat7 = u_xlat7 * u_xlat69;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = u_xlat16_62 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_62 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat12.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat70 = inversesqrt(u_xlat7);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat12.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat70 = dot(u_xlat10.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat24.x + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_62 / u_xlat70;
    u_xlat51 = u_xlat70 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat71 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat71 * u_xlat71;
    u_xlat16_3.x = u_xlat71 * u_xlat16_3.x;
    u_xlat16_66 = u_xlat71 * u_xlat16_3.x;
    u_xlat16_68 = u_xlat71 * u_xlat16_66;
    u_xlat71 = (-u_xlat16_66) * u_xlat71 + 1.0;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat71);
    u_xlat12.xyz = vec3(u_xlat60) * vec3(u_xlat16_68) + u_xlat12.xyz;
    u_xlat71 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat72 = u_xlat71;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = log2(u_xlat71);
    u_xlat71 = u_xlat71 * 1.5;
    u_xlat71 = exp2(u_xlat71);
    u_xlat71 = u_xlat71 * 1.66700006;
    u_xlat13 = (-u_xlat72) * u_xlat16_62 + u_xlat72;
    u_xlat13 = u_xlat72 * u_xlat13 + u_xlat16_62;
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat72 + u_xlat13;
    u_xlat13 = u_xlat13 + 6.10351563e-05;
    u_xlat13 = u_xlat69 * u_xlat13;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = min(u_xlat13, 16.0);
    u_xlat51 = u_xlat51 * u_xlat13;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat72) * u_xlat12.xyz;
    u_xlat16_14.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_74 = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_68 * u_xlat16_74;
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_74);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_16.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_62 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_66 = u_xlat40 * u_xlat16_1.x;
    u_xlat40 = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat60) * vec3(u_xlat16_66) + u_xlat5.xyz;
    u_xlat40 = (-u_xlat20) * u_xlat16_62 + u_xlat20;
    u_xlat40 = u_xlat20 * u_xlat40 + u_xlat16_62;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat69;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = vec3(u_xlat20) * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.zzz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat67) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat72) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat20) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_0.x = texture(_FUZTexture, u_xlat16_16.xy).x;
    u_xlat0.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_1.x = (-_SSAmount) + 1.0;
    u_xlat16_1.x = u_xlat0.x * _SSMaskInfluence + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_1.x) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_21.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_1.x = u_xlat16_21.z * u_xlat16_66 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_21.z * u_xlat16_1.x;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat20 = u_xlat71 * u_xlat16_1.x;
    u_xlat40 = min(u_xlat16_1.x, 1.0);
    u_xlat60 = u_xlat20 * 0.159154937;
    u_xlat16_1.x = (-u_xlat20) * 0.159154937 + 1.0;
    u_xlat20 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_8.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * 12.0;
    u_xlat20 = exp2(u_xlat20);
    u_xlat16_1.x = u_xlat20 * u_xlat16_1.x + u_xlat60;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyw = u_xlat16_1.xxx * _SSSColor.zxy;
    u_xlat4.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_4.x = texture(_FUZTexture, u_xlat4.xy).y;
    u_xlat16_2.xyz = u_xlat0.xyw * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = min(u_xlat40, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlati20 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati20].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati20 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_15.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_4.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_68 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_4.xxx + vec3(u_xlat16_68);
    u_xlat16_68 = dot((-u_xlat16_8.xyz), u_xlat10.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat0.xyw = (-u_xlat10.xyz) * vec3(u_xlat16_68) + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_21.y = dot(u_xlat16_16.xyz, u_xlat0.xyw);
    u_xlat16_8.xyz = u_xlat16_21.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat9.xyz * vec3(u_xlat64) + (-u_xlat0.xyw);
    u_xlat0.xyw = vec3(u_xlat16_62) * u_xlat24.xyz + u_xlat0.xyw;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16.y = u_xlat0.y;
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_41 = u_xlat16_21.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21.x);
    u_xlat11.y = u_xlat16_21.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_41);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyw = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_21.xyz = u_xlat0.xyw * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_3.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_3.w);
    u_xlat16_62 = u_xlat16_61 + 1.0;
    u_xlat16_62 = min(u_xlat16_62, 15.0);
    u_xlat16_3.x = u_xlat16_62 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_61 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_61 = u_xlat16_8.z * 15.0 + (-u_xlat16_61);
    u_xlat16_62 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62 + u_xlat16_20.x;
    u_xlat16_61 = u_xlat16_66 * u_xlat16_61;
    u_xlat0.x = u_xlat4.x * u_xlat16_61;
    u_xlat16_61 = u_xlat40 * 0.5;
    u_xlat16_62 = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_61 = u_xlat0.x * u_xlat16_62 + u_xlat16_61;
    u_xlat16_62 = u_xlat16_61 + u_xlat16_61;
    u_xlat16_6.x = (-u_xlat16_61) * 2.0 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_6.x + u_xlat16_62;
    u_xlat16_61 = u_xlat40 * u_xlat16_61;
    u_xlat16_61 = min(u_xlat16_61, u_xlat16_7.z);
    u_xlat16_1.xyz = vec3(u_xlat16_61) * u_xlat16_1.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_6.yzx + u_xlat16_14.yzx;
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
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_41 = cos(u_xlat0.x);
    u_xlat16_41 = max(abs(u_xlat16_41), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_41 = (u_xlatb60) ? u_xlat16_41 : 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
float u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_20;
int u_xlati20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat51;
float u_xlat60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
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
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
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
    u_xlat5.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_23.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_5.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_7 = texture(_materialParamsMap, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz;
    u_xlat16_62 = u_xlat16_7.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_6.xyz;
    u_xlat60 = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat10.xyz = vec3(u_xlat64) * u_xlat16_8.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat12.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat12.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat64 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat10.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat67 = dot(u_xlat10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_7.x * _roughnessMultiplier;
    u_xlat16_62 = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat7 = (-u_xlat67) * u_xlat16_62 + u_xlat67;
    u_xlat7 = u_xlat67 * u_xlat7 + u_xlat16_62;
    u_xlat7 = sqrt(u_xlat7);
    u_xlat7 = u_xlat7 + u_xlat67;
    u_xlat7 = u_xlat7 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat11.x) * u_xlat16_62 + u_xlat11.x;
    u_xlat69 = u_xlat11.x * u_xlat69 + u_xlat16_62;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat11.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat7 = u_xlat7 * u_xlat69;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = u_xlat16_62 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_62 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat12.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat70 = inversesqrt(u_xlat7);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat12.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat70 = dot(u_xlat10.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat24.x + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_62 / u_xlat70;
    u_xlat51 = u_xlat70 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat71 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat71 * u_xlat71;
    u_xlat16_3.x = u_xlat71 * u_xlat16_3.x;
    u_xlat16_66 = u_xlat71 * u_xlat16_3.x;
    u_xlat16_68 = u_xlat71 * u_xlat16_66;
    u_xlat71 = (-u_xlat16_66) * u_xlat71 + 1.0;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat71);
    u_xlat12.xyz = vec3(u_xlat60) * vec3(u_xlat16_68) + u_xlat12.xyz;
    u_xlat71 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat72 = u_xlat71;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = log2(u_xlat71);
    u_xlat71 = u_xlat71 * 1.5;
    u_xlat71 = exp2(u_xlat71);
    u_xlat71 = u_xlat71 * 1.66700006;
    u_xlat13 = (-u_xlat72) * u_xlat16_62 + u_xlat72;
    u_xlat13 = u_xlat72 * u_xlat13 + u_xlat16_62;
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat72 + u_xlat13;
    u_xlat13 = u_xlat13 + 6.10351563e-05;
    u_xlat13 = u_xlat69 * u_xlat13;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = min(u_xlat13, 16.0);
    u_xlat51 = u_xlat51 * u_xlat13;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat72) * u_xlat12.xyz;
    u_xlat16_14.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_74 = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_68 * u_xlat16_74;
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_74);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_16.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_62 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_66 = u_xlat40 * u_xlat16_1.x;
    u_xlat40 = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat60) * vec3(u_xlat16_66) + u_xlat5.xyz;
    u_xlat40 = (-u_xlat20) * u_xlat16_62 + u_xlat20;
    u_xlat40 = u_xlat20 * u_xlat40 + u_xlat16_62;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat69;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = vec3(u_xlat20) * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.zzz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat67) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat72) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat20) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_0.x = texture(_FUZTexture, u_xlat16_16.xy).x;
    u_xlat0.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_1.x = (-_SSAmount) + 1.0;
    u_xlat16_1.x = u_xlat0.x * _SSMaskInfluence + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_1.x) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_21.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_1.x = u_xlat16_21.z * u_xlat16_66 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_21.z * u_xlat16_1.x;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat20 = u_xlat71 * u_xlat16_1.x;
    u_xlat40 = min(u_xlat16_1.x, 1.0);
    u_xlat60 = u_xlat20 * 0.159154937;
    u_xlat16_1.x = (-u_xlat20) * 0.159154937 + 1.0;
    u_xlat20 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_8.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * 12.0;
    u_xlat20 = exp2(u_xlat20);
    u_xlat16_1.x = u_xlat20 * u_xlat16_1.x + u_xlat60;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyw = u_xlat16_1.xxx * _SSSColor.zxy;
    u_xlat4.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_4.x = texture(_FUZTexture, u_xlat4.xy).y;
    u_xlat16_2.xyz = u_xlat0.xyw * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = min(u_xlat40, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlati20 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati20].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati20 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_15.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_4.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_68 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_4.xxx + vec3(u_xlat16_68);
    u_xlat16_68 = dot((-u_xlat16_8.xyz), u_xlat10.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat0.xyw = (-u_xlat10.xyz) * vec3(u_xlat16_68) + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_21.y = dot(u_xlat16_16.xyz, u_xlat0.xyw);
    u_xlat16_8.xyz = u_xlat16_21.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat9.xyz * vec3(u_xlat64) + (-u_xlat0.xyw);
    u_xlat0.xyw = vec3(u_xlat16_62) * u_xlat24.xyz + u_xlat0.xyw;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16.y = u_xlat0.y;
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_41 = u_xlat16_21.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21.x);
    u_xlat11.y = u_xlat16_21.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_41);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyw = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_21.xyz = u_xlat0.xyw * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_3.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_3.w);
    u_xlat16_62 = u_xlat16_61 + 1.0;
    u_xlat16_62 = min(u_xlat16_62, 15.0);
    u_xlat16_3.x = u_xlat16_62 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_61 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_61 = u_xlat16_8.z * 15.0 + (-u_xlat16_61);
    u_xlat16_62 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62 + u_xlat16_20.x;
    u_xlat16_61 = u_xlat16_66 * u_xlat16_61;
    u_xlat0.x = u_xlat4.x * u_xlat16_61;
    u_xlat16_61 = u_xlat40 * 0.5;
    u_xlat16_62 = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_61 = u_xlat0.x * u_xlat16_62 + u_xlat16_61;
    u_xlat16_62 = u_xlat16_61 + u_xlat16_61;
    u_xlat16_6.x = (-u_xlat16_61) * 2.0 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_6.x + u_xlat16_62;
    u_xlat16_61 = u_xlat40 * u_xlat16_61;
    u_xlat16_61 = min(u_xlat16_61, u_xlat16_7.z);
    u_xlat16_1.xyz = vec3(u_xlat16_61) * u_xlat16_1.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_6.yzx + u_xlat16_14.yzx;
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
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_41 = cos(u_xlat0.x);
    u_xlat16_41 = max(abs(u_xlat16_41), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_41 = (u_xlatb60) ? u_xlat16_41 : 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
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
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec2 u_xlat22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_32;
float u_xlat38;
int u_xlati38;
float u_xlat39;
vec2 u_xlat40;
float u_xlat41;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
float u_xlat59;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat21.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21.x * u_xlat21.x;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat21.x = (-u_xlat16_10.x) * u_xlat21.x + 1.0;
    u_xlat40.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_3 = texture(_albedoMap, u_xlat40.xy);
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat40.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_4 = texture(_materialParamsMap, u_xlat40.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_68 = u_xlat16_4.y * _metallicMultiplier;
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_29.xxx + u_xlat21.xyz;
    u_xlat16_32.x = u_xlat16_4.x * _roughnessMultiplier;
    u_xlat16_29.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat22.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat22.x = u_xlat58 * u_xlat22.x + u_xlat16_29.x;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat58 + u_xlat22.x;
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat8.x) * u_xlat16_29.x + u_xlat8.x;
    u_xlat41 = u_xlat8.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat22.y = u_xlat41 + u_xlat8.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat22.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat59 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat9.xyz = vec3(u_xlat59) * u_xlat9.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat4.x + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_29.x / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat22.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat22.x;
    u_xlat16_68 = u_xlat22.x * u_xlat16_68;
    u_xlat16_68 = u_xlat22.x * u_xlat16_68;
    u_xlat16_69 = u_xlat22.x * u_xlat16_68;
    u_xlat22.x = (-u_xlat16_68) * u_xlat22.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat22.xxx;
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_69) + u_xlat9.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat61 = u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = log2(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * 1.5;
    u_xlat22.x = exp2(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * 1.66700006;
    u_xlat64 = (-u_xlat61) * u_xlat16_29.x + u_xlat61;
    u_xlat64 = u_xlat61 * u_xlat64 + u_xlat16_29.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat61 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat22.y * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat59 = u_xlat59 * u_xlat64;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_13.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_29.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat39 * u_xlat39;
    u_xlat16_63 = u_xlat39 * u_xlat16_63;
    u_xlat16_63 = u_xlat39 * u_xlat16_63;
    u_xlat16_68 = u_xlat39 * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat39 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat39);
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat2.xyz;
    u_xlat39 = (-u_xlat20.x) * u_xlat16_29.x + u_xlat20.x;
    u_xlat39 = u_xlat20.x * u_xlat39 + u_xlat16_29.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 + u_xlat20.x;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat22.y;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat61) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat20.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat16_11.xy).x;
    u_xlat19.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_63 = (-_SSAmount) + 1.0;
    u_xlat16_63 = u_xlat19.x * _SSMaskInfluence + u_xlat16_63;
    u_xlat19.x = u_xlat16_63 * u_xlat16_63;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_32.z * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_32.z * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat38 = u_xlat22.x * u_xlat16_63;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat1.x = u_xlat38 * 0.159154937;
    u_xlat16_63 = (-u_xlat38) * 0.159154937 + 1.0;
    u_xlat38 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_14.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = log2(u_xlat38);
    u_xlat38 = u_xlat38 * 12.0;
    u_xlat38 = exp2(u_xlat38);
    u_xlat16_63 = u_xlat38 * u_xlat16_63 + u_xlat1.x;
    u_xlat16_63 = u_xlat19.x * u_xlat16_63;
    u_xlat1.xyz = vec3(u_xlat16_63) * _SSSColor.zxy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_19.xxx + u_xlat16_6.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati38 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xzw = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_19.xxx * u_xlat16_10.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_32.y = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat20.xyz + u_xlat0.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_29.x = u_xlat16_32.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_32.x);
    u_xlat8.y = u_xlat16_32.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_29.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xzw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_2.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_2.x = u_xlat16_67 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_63 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_63 = u_xlat16_11.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat1.x * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_11.x = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_11.x + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_4.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_11.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _albedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_29.x = cos(u_xlat0.x);
    u_xlat16_29.x = max(abs(u_xlat16_29.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_29.x = (u_xlatb57) ? u_xlat16_29.x : 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_29.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
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
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec2 u_xlat22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_32;
float u_xlat38;
int u_xlati38;
float u_xlat39;
vec2 u_xlat40;
float u_xlat41;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
float u_xlat59;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat21.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21.x * u_xlat21.x;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21.x * u_xlat16_10.x;
    u_xlat21.x = (-u_xlat16_10.x) * u_xlat21.x + 1.0;
    u_xlat40.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_3 = texture(_albedoMap, u_xlat40.xy);
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat40.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_4 = texture(_materialParamsMap, u_xlat40.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_68 = u_xlat16_4.y * _metallicMultiplier;
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_29.xxx + u_xlat21.xyz;
    u_xlat16_32.x = u_xlat16_4.x * _roughnessMultiplier;
    u_xlat16_29.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat22.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat22.x = u_xlat58 * u_xlat22.x + u_xlat16_29.x;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat58 + u_xlat22.x;
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat8.x) * u_xlat16_29.x + u_xlat8.x;
    u_xlat41 = u_xlat8.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat22.y = u_xlat41 + u_xlat8.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat22.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat59 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat9.xyz = vec3(u_xlat59) * u_xlat9.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat4.x + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_29.x / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat22.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat22.x;
    u_xlat16_68 = u_xlat22.x * u_xlat16_68;
    u_xlat16_68 = u_xlat22.x * u_xlat16_68;
    u_xlat16_69 = u_xlat22.x * u_xlat16_68;
    u_xlat22.x = (-u_xlat16_68) * u_xlat22.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat22.xxx;
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_69) + u_xlat9.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat61 = u_xlat22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = log2(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * 1.5;
    u_xlat22.x = exp2(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * 1.66700006;
    u_xlat64 = (-u_xlat61) * u_xlat16_29.x + u_xlat61;
    u_xlat64 = u_xlat61 * u_xlat64 + u_xlat16_29.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat61 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat22.y * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat59 = u_xlat59 * u_xlat64;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_13.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_29.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat39 * u_xlat39;
    u_xlat16_63 = u_xlat39 * u_xlat16_63;
    u_xlat16_63 = u_xlat39 * u_xlat16_63;
    u_xlat16_68 = u_xlat39 * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat39 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat39);
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat2.xyz;
    u_xlat39 = (-u_xlat20.x) * u_xlat16_29.x + u_xlat20.x;
    u_xlat39 = u_xlat20.x * u_xlat39 + u_xlat16_29.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 + u_xlat20.x;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat22.y;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat61) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat20.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat16_11.xy).x;
    u_xlat19.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_63 = (-_SSAmount) + 1.0;
    u_xlat16_63 = u_xlat19.x * _SSMaskInfluence + u_xlat16_63;
    u_xlat19.x = u_xlat16_63 * u_xlat16_63;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_32.z * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_32.z * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat38 = u_xlat22.x * u_xlat16_63;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat1.x = u_xlat38 * 0.159154937;
    u_xlat16_63 = (-u_xlat38) * 0.159154937 + 1.0;
    u_xlat38 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_14.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = log2(u_xlat38);
    u_xlat38 = u_xlat38 * 12.0;
    u_xlat38 = exp2(u_xlat38);
    u_xlat16_63 = u_xlat38 * u_xlat16_63 + u_xlat1.x;
    u_xlat16_63 = u_xlat19.x * u_xlat16_63;
    u_xlat1.xyz = vec3(u_xlat16_63) * _SSSColor.zxy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_19.xxx + u_xlat16_6.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati38 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xzw = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_19.xxx * u_xlat16_10.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_32.y = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat20.xyz + u_xlat0.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_29.x = u_xlat16_32.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_32.x);
    u_xlat8.y = u_xlat16_32.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_29.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xzw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_2.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_2.x = u_xlat16_67 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_63 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_63 = u_xlat16_11.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat1.x * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_11.x = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_11.x + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_4.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_11.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _albedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_29.x = cos(u_xlat0.x);
    u_xlat16_29.x = max(abs(u_xlat16_29.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_29.x = (u_xlatb57) ? u_xlat16_29.x : 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_29.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
float u_xlat36;
mediump float u_xlat16_37;
float u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
float u_xlat65;
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
    u_xlat5.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_7 = texture(_materialParamsMap, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_56 = u_xlat16_7.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_56) * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_6.xyz;
    u_xlat54 = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat12.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat12.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat10.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * _roughnessMultiplier;
    u_xlat16_56 = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_56 = max(u_xlat16_56, 0.0078125);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_56 = max(u_xlat16_56, 0.0078125);
    u_xlat7 = (-u_xlat61) * u_xlat16_56 + u_xlat61;
    u_xlat7 = u_xlat61 * u_xlat7 + u_xlat16_56;
    u_xlat7 = sqrt(u_xlat7);
    u_xlat7 = u_xlat7 + u_xlat61;
    u_xlat7 = u_xlat7 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat11.x) * u_xlat16_56 + u_xlat11.x;
    u_xlat63 = u_xlat11.x * u_xlat63 + u_xlat16_56;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat11.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat7 = u_xlat7 * u_xlat63;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_56 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_56 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat12.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat12.xyz = vec3(u_xlat7) * u_xlat12.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat7 = dot(u_xlat10.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat7 * u_xlat22.x + 1.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat16_56 / u_xlat7;
    u_xlat7 = u_xlat7 * 0.318309873;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat64 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat64 * u_xlat64;
    u_xlat16_3.x = u_xlat64 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat64 * u_xlat16_3.x;
    u_xlat16_60 = u_xlat64 * u_xlat16_3.x;
    u_xlat64 = (-u_xlat16_3.x) * u_xlat64 + 1.0;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat54) * vec3(u_xlat16_60) + u_xlat12.xyz;
    u_xlat64 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat47 = u_xlat64;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = log2(u_xlat64);
    u_xlat64 = u_xlat64 * 1.5;
    u_xlat64 = exp2(u_xlat64);
    u_xlat64 = u_xlat64 * 1.66700006;
    u_xlat65 = (-u_xlat47) * u_xlat16_56 + u_xlat47;
    u_xlat65 = u_xlat47 * u_xlat65 + u_xlat16_56;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat47;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat63 * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat7 = u_xlat7 * u_xlat65;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat47) * u_xlat12.xyz;
    u_xlat16_13.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_60 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_62 = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_62;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_15.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_62);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60;
    u_xlat16_15.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_56 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_3.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18) * u_xlat16_56 + u_xlat18;
    u_xlat36 = u_xlat18 * u_xlat36 + u_xlat16_56;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = vec3(u_xlat18) * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat47) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_0.x = texture(_FUZTexture, u_xlat16_14.xy).x;
    u_xlat0.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_1.x = (-_SSAmount) + 1.0;
    u_xlat16_1.x = u_xlat0.x * _SSMaskInfluence + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_1.x) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_19.z = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_1.x = u_xlat16_19.z * u_xlat16_57 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_19.z * u_xlat16_1.x;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat18 = u_xlat64 * u_xlat16_1.x;
    u_xlat36 = min(u_xlat16_1.x, 1.0);
    u_xlat54 = u_xlat18 * 0.159154937;
    u_xlat16_1.x = (-u_xlat18) * 0.159154937 + 1.0;
    u_xlat18 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_8.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * 12.0;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x + u_xlat54;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyw = u_xlat16_1.xxx * _SSSColor.xyz;
    u_xlat4.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_4.x = texture(_FUZTexture, u_xlat4.xy).y;
    u_xlat16_2.xyz = u_xlat0.xyw * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = min(u_xlat36, u_xlat16_7.z);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati18 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_60 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx + vec3(u_xlat16_60);
    u_xlat16_60 = dot((-u_xlat16_8.xyz), u_xlat10.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat0.xyw = (-u_xlat10.xyz) * vec3(u_xlat16_60) + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_19.y = dot(u_xlat16_14.xyz, u_xlat0.xyw);
    u_xlat16_8.xyz = u_xlat16_19.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat0.xyw);
    u_xlat0.xyw = vec3(u_xlat16_56) * u_xlat22.xyz + u_xlat0.xyw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.y;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_37 = u_xlat16_19.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_19.x);
    u_xlat11.y = u_xlat16_19.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_37);
    u_xlat16_19.xyz = u_xlat16_9.www * u_xlat16_9.xyz;
    u_xlat0.xyw = u_xlat16_19.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_19.xyz = u_xlat0.xyw * u_xlat16_3.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_6.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_55 = floor(u_xlat16_6.w);
    u_xlat16_56 = u_xlat16_55 + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_6.x = u_xlat16_56 * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_6.x = u_xlat16_55 * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_55 = u_xlat16_8.z * 15.0 + (-u_xlat16_55);
    u_xlat16_56 = (-u_xlat16_18) + u_xlat16_0.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56 + u_xlat16_18;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_55;
    u_xlat0.x = u_xlat4.x * u_xlat16_55;
    u_xlat16_55 = u_xlat36 * 0.5;
    u_xlat16_56 = (-u_xlat36) * 0.5 + 1.0;
    u_xlat16_55 = u_xlat0.x * u_xlat16_56 + u_xlat16_55;
    u_xlat16_56 = u_xlat16_55 + u_xlat16_55;
    u_xlat16_3.x = (-u_xlat16_55) * 2.0 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x + u_xlat16_56;
    u_xlat16_55 = u_xlat36 * u_xlat16_55;
    u_xlat16_55 = min(u_xlat16_55, u_xlat16_7.z);
    u_xlat16_1.xyz = vec3(u_xlat16_55) * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_13.xyz;
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
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
float u_xlat36;
mediump float u_xlat16_37;
float u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
float u_xlat65;
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
    u_xlat5.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_7 = texture(_materialParamsMap, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_56 = u_xlat16_7.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_56) * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_6.xyz;
    u_xlat54 = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat12.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat12.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat10.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * _roughnessMultiplier;
    u_xlat16_56 = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_56 = max(u_xlat16_56, 0.0078125);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_56 = max(u_xlat16_56, 0.0078125);
    u_xlat7 = (-u_xlat61) * u_xlat16_56 + u_xlat61;
    u_xlat7 = u_xlat61 * u_xlat7 + u_xlat16_56;
    u_xlat7 = sqrt(u_xlat7);
    u_xlat7 = u_xlat7 + u_xlat61;
    u_xlat7 = u_xlat7 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat11.x) * u_xlat16_56 + u_xlat11.x;
    u_xlat63 = u_xlat11.x * u_xlat63 + u_xlat16_56;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat11.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat7 = u_xlat7 * u_xlat63;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_56 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_56 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat12.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat12.xyz = vec3(u_xlat7) * u_xlat12.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat7 = dot(u_xlat10.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat7 * u_xlat22.x + 1.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat16_56 / u_xlat7;
    u_xlat7 = u_xlat7 * 0.318309873;
    u_xlat7 = min(u_xlat7, 16.0);
    u_xlat64 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat64 * u_xlat64;
    u_xlat16_3.x = u_xlat64 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat64 * u_xlat16_3.x;
    u_xlat16_60 = u_xlat64 * u_xlat16_3.x;
    u_xlat64 = (-u_xlat16_3.x) * u_xlat64 + 1.0;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat54) * vec3(u_xlat16_60) + u_xlat12.xyz;
    u_xlat64 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat47 = u_xlat64;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = log2(u_xlat64);
    u_xlat64 = u_xlat64 * 1.5;
    u_xlat64 = exp2(u_xlat64);
    u_xlat64 = u_xlat64 * 1.66700006;
    u_xlat65 = (-u_xlat47) * u_xlat16_56 + u_xlat47;
    u_xlat65 = u_xlat47 * u_xlat65 + u_xlat16_56;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat47;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat63 * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat7 = u_xlat7 * u_xlat65;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat47) * u_xlat12.xyz;
    u_xlat16_13.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_60 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_62 = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_62;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_15.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_62);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60;
    u_xlat16_15.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_56 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = dot(u_xlat10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_3.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_6.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18) * u_xlat16_56 + u_xlat18;
    u_xlat36 = u_xlat18 * u_xlat36 + u_xlat16_56;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = vec3(u_xlat18) * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat47) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_0.x = texture(_FUZTexture, u_xlat16_14.xy).x;
    u_xlat0.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_1.x = (-_SSAmount) + 1.0;
    u_xlat16_1.x = u_xlat0.x * _SSMaskInfluence + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat16_1.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_1.x) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_19.z = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_1.x = u_xlat16_19.z * u_xlat16_57 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_19.z * u_xlat16_1.x;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat18 = u_xlat64 * u_xlat16_1.x;
    u_xlat36 = min(u_xlat16_1.x, 1.0);
    u_xlat54 = u_xlat18 * 0.159154937;
    u_xlat16_1.x = (-u_xlat18) * 0.159154937 + 1.0;
    u_xlat18 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_8.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * 12.0;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x + u_xlat54;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyw = u_xlat16_1.xxx * _SSSColor.xyz;
    u_xlat4.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_4.x = texture(_FUZTexture, u_xlat4.xy).y;
    u_xlat16_2.xyz = u_xlat0.xyw * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = min(u_xlat36, u_xlat16_7.z);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati18 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_60 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx + vec3(u_xlat16_60);
    u_xlat16_60 = dot((-u_xlat16_8.xyz), u_xlat10.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat0.xyw = (-u_xlat10.xyz) * vec3(u_xlat16_60) + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_19.y = dot(u_xlat16_14.xyz, u_xlat0.xyw);
    u_xlat16_8.xyz = u_xlat16_19.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat0.xyw);
    u_xlat0.xyw = vec3(u_xlat16_56) * u_xlat22.xyz + u_xlat0.xyw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.y;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_37 = u_xlat16_19.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_19.x);
    u_xlat11.y = u_xlat16_19.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_37);
    u_xlat16_19.xyz = u_xlat16_9.www * u_xlat16_9.xyz;
    u_xlat0.xyw = u_xlat16_19.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_19.xyz = u_xlat0.xyw * u_xlat16_3.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_6.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_55 = floor(u_xlat16_6.w);
    u_xlat16_56 = u_xlat16_55 + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_6.x = u_xlat16_56 * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_6.x = u_xlat16_55 * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_55 = u_xlat16_8.z * 15.0 + (-u_xlat16_55);
    u_xlat16_56 = (-u_xlat16_18) + u_xlat16_0.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56 + u_xlat16_18;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_55;
    u_xlat0.x = u_xlat4.x * u_xlat16_55;
    u_xlat16_55 = u_xlat36 * 0.5;
    u_xlat16_56 = (-u_xlat36) * 0.5 + 1.0;
    u_xlat16_55 = u_xlat0.x * u_xlat16_56 + u_xlat16_55;
    u_xlat16_56 = u_xlat16_55 + u_xlat16_55;
    u_xlat16_3.x = (-u_xlat16_55) * 2.0 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x + u_xlat16_56;
    u_xlat16_55 = u_xlat36 * u_xlat16_55;
    u_xlat16_55 = min(u_xlat16_55, u_xlat16_7.z);
    u_xlat16_1.xyz = vec3(u_xlat16_55) * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_13.xyz;
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
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FUZTexture;
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
mediump vec2 u_xlat16_1;
int u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
ivec3 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat25;
float u_xlat29;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_35;
float u_xlat43;
int u_xlati43;
float u_xlat44;
vec2 u_xlat46;
float u_xlat50;
float u_xlat51;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat70;
float u_xlat71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
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
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_22.z * _shadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_10.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat1.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_73 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_73 = max(u_xlat16_73, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_73 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_73);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_12.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_12.x);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_12.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + u_xlat16_11.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25.x = (-u_xlat16_74) + 1.0;
    u_xlat16_11.x = u_xlat25.x * u_xlat25.x;
    u_xlat16_11.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat16_32.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat25.x = (-u_xlat16_11.x) * u_xlat25.x + 1.0;
    u_xlat46.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat46.xy);
    u_xlat16_11.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_0.xyz * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_0.xyz * u_xlat16_11.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat46.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_3 = texture(_materialParamsMap, u_xlat46.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_75 = u_xlat16_3.y * _metallicMultiplier;
    u_xlat16_13.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat70 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat70) * u_xlat16_32.xxx + u_xlat25.xyz;
    u_xlat16_35.x = u_xlat16_3.x * _roughnessMultiplier;
    u_xlat16_32.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat8.x = (-u_xlat65) * u_xlat16_32.x + u_xlat65;
    u_xlat8.x = u_xlat65 * u_xlat8.x + u_xlat16_32.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat65 + u_xlat8.x;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat9.x) * u_xlat16_32.x + u_xlat9.x;
    u_xlat29 = u_xlat9.x * u_xlat29 + u_xlat16_32.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat8.y = u_xlat29 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat50 = u_xlat16_32.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat50 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_32.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat8.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat22.xxx * u_xlat4.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat50 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_32.x / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat8.x = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat8.x * u_xlat8.x;
    u_xlat16_75 = u_xlat8.x * u_xlat16_75;
    u_xlat16_75 = u_xlat8.x * u_xlat16_75;
    u_xlat16_76 = u_xlat8.x * u_xlat16_75;
    u_xlat8.x = (-u_xlat16_75) * u_xlat8.x + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * u_xlat8.xxx;
    u_xlat16.xyz = vec3(u_xlat70) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat71 = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat8.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1.5;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1.66700006;
    u_xlat51 = (-u_xlat71) * u_xlat16_32.x + u_xlat71;
    u_xlat51 = u_xlat71 * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat71 + u_xlat51;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat8.y * u_xlat51;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat67 = u_xlat67 * u_xlat51;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16.xyz * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat4.xyz * vec3(u_xlat16_75);
    u_xlat16_75 = u_xlat16_76 * u_xlat16_14.x;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_14.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_14.x);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat16_73 = dot(u_xlat16_18.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat50 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_73) + 1.0;
    u_xlat16_73 = u_xlat44 * u_xlat44;
    u_xlat16_73 = u_xlat44 * u_xlat16_73;
    u_xlat16_73 = u_xlat44 * u_xlat16_73;
    u_xlat16_75 = u_xlat44 * u_xlat16_73;
    u_xlat44 = (-u_xlat16_73) * u_xlat44 + 1.0;
    u_xlat4.xyz = u_xlat16_13.xyz * vec3(u_xlat44);
    u_xlat4.xyz = vec3(u_xlat70) * vec3(u_xlat16_75) + u_xlat4.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_32.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_32.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat8.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat23.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_19.xyz * u_xlat4.xyz;
    u_xlat16_17.xyz = u_xlat4.xyz * u_xlat22.yyy + u_xlat16_17.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_73) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat65) * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat71) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat23.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_17.xyz + u_xlat16_10.xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_22.x = texture(_FUZTexture, u_xlat16_12.xy).x;
    u_xlat22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_73 = (-_SSAmount) + 1.0;
    u_xlat16_73 = u_xlat22.x * _SSMaskInfluence + u_xlat16_73;
    u_xlat22.x = u_xlat16_73 * u_xlat16_73;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat7.xyz;
    u_xlat16_73 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz;
    u_xlat16_73 = dot(u_xlat16_12.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_73) + u_xlat16_75;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_73 = u_xlat16_35.z * u_xlat16_75 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_35.z * u_xlat16_73;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_75;
    u_xlat43 = u_xlat8.x * u_xlat16_73;
    u_xlat1.xw = min(u_xlat1.xw, vec2(u_xlat16_73));
    u_xlat2.x = u_xlat43 * 0.159154937;
    u_xlat16_73 = (-u_xlat43) * 0.159154937 + 1.0;
    u_xlat43 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_15.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat43 = log2(u_xlat43);
    u_xlat43 = u_xlat43 * 12.0;
    u_xlat43 = exp2(u_xlat43);
    u_xlat16_73 = u_xlat43 * u_xlat16_73 + u_xlat2.x;
    u_xlat16_73 = u_xlat22.x * u_xlat16_73;
    u_xlat2.xyz = vec3(u_xlat16_73) * _SSSColor.xyz;
    u_xlat22.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_22.x = texture(_FUZTexture, u_xlat22.xy).y;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_22.xxx + u_xlat16_10.xyz;
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_19.y = u_xlat16_12.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati1 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati1].xyz;
    u_xlati1 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati43 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_20.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xzw = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xzw = u_xlat16_22.xxx * u_xlat16_11.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat16_76 = (-u_xlat16_22.x) + 1.0;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_22.xxx + vec3(u_xlat16_76);
    u_xlat16_76 = dot((-u_xlat16_15.xyz), u_xlat7.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat1.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_76) + (-u_xlat16_15.xyz);
    u_xlat2.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_35.y = dot(u_xlat16_12.xyz, u_xlat1.xyz);
    u_xlat16_12.xyz = u_xlat16_35.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat23.xyz + u_xlat1.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat15.y = u_xlat1.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_32.x = u_xlat16_35.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_35.x);
    u_xlat9.y = u_xlat16_35.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_32.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_11.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb1)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_4.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = u_xlat16_73 * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_12.z * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_22.x) + u_xlat16_1.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_22.x;
    u_xlat16_73 = u_xlat16_75 * u_xlat16_73;
    u_xlat1.x = u_xlat2.x * u_xlat16_73;
    u_xlat16_73 = u_xlat1.w * 0.5;
    u_xlat16_74 = (-u_xlat1.w) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat1.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_73 = u_xlat1.w * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w + u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_32.x = cos(u_xlat1.x);
    u_xlat16_32.x = max(abs(u_xlat16_32.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb1 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_32.x = (u_xlatb1) ? u_xlat16_32.x : 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_32.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_73 : u_xlat16_11.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FUZTexture;
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
mediump vec2 u_xlat16_1;
int u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
ivec3 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat25;
float u_xlat29;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_35;
float u_xlat43;
int u_xlati43;
float u_xlat44;
vec2 u_xlat46;
float u_xlat50;
float u_xlat51;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat70;
float u_xlat71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
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
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_22.z * _shadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_10.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat1.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_73 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_73 = max(u_xlat16_73, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_73 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_73);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_12.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_12.x);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_12.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + u_xlat16_11.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25.x = (-u_xlat16_74) + 1.0;
    u_xlat16_11.x = u_xlat25.x * u_xlat25.x;
    u_xlat16_11.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat16_32.x = u_xlat25.x * u_xlat16_11.x;
    u_xlat25.x = (-u_xlat16_11.x) * u_xlat25.x + 1.0;
    u_xlat46.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat46.xy);
    u_xlat16_11.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_0.xyz * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_0.xyz * u_xlat16_11.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat46.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_3 = texture(_materialParamsMap, u_xlat46.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_75 = u_xlat16_3.y * _metallicMultiplier;
    u_xlat16_13.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat70 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat70) * u_xlat16_32.xxx + u_xlat25.xyz;
    u_xlat16_35.x = u_xlat16_3.x * _roughnessMultiplier;
    u_xlat16_32.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat8.x = (-u_xlat65) * u_xlat16_32.x + u_xlat65;
    u_xlat8.x = u_xlat65 * u_xlat8.x + u_xlat16_32.x;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat65 + u_xlat8.x;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat9.x) * u_xlat16_32.x + u_xlat9.x;
    u_xlat29 = u_xlat9.x * u_xlat29 + u_xlat16_32.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat8.y = u_xlat29 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat50 = u_xlat16_32.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat50 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_32.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat8.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat22.xxx * u_xlat4.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat50 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_32.x / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat8.x = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat8.x * u_xlat8.x;
    u_xlat16_75 = u_xlat8.x * u_xlat16_75;
    u_xlat16_75 = u_xlat8.x * u_xlat16_75;
    u_xlat16_76 = u_xlat8.x * u_xlat16_75;
    u_xlat8.x = (-u_xlat16_75) * u_xlat8.x + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * u_xlat8.xxx;
    u_xlat16.xyz = vec3(u_xlat70) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat71 = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat8.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1.5;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1.66700006;
    u_xlat51 = (-u_xlat71) * u_xlat16_32.x + u_xlat71;
    u_xlat51 = u_xlat71 * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat71 + u_xlat51;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat8.y * u_xlat51;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat67 = u_xlat67 * u_xlat51;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16.xyz * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat4.xyz * vec3(u_xlat16_75);
    u_xlat16_75 = u_xlat16_76 * u_xlat16_14.x;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_14.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_14.x);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_73) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat16_73 = dot(u_xlat16_18.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat50 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_73) + 1.0;
    u_xlat16_73 = u_xlat44 * u_xlat44;
    u_xlat16_73 = u_xlat44 * u_xlat16_73;
    u_xlat16_73 = u_xlat44 * u_xlat16_73;
    u_xlat16_75 = u_xlat44 * u_xlat16_73;
    u_xlat44 = (-u_xlat16_73) * u_xlat44 + 1.0;
    u_xlat4.xyz = u_xlat16_13.xyz * vec3(u_xlat44);
    u_xlat4.xyz = vec3(u_xlat70) * vec3(u_xlat16_75) + u_xlat4.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_32.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_32.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat8.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat23.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_19.xyz * u_xlat4.xyz;
    u_xlat16_17.xyz = u_xlat4.xyz * u_xlat22.yyy + u_xlat16_17.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_73) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat65) * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat71) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat23.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_17.xyz + u_xlat16_10.xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_22.x = texture(_FUZTexture, u_xlat16_12.xy).x;
    u_xlat22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_73 = (-_SSAmount) + 1.0;
    u_xlat16_73 = u_xlat22.x * _SSMaskInfluence + u_xlat16_73;
    u_xlat22.x = u_xlat16_73 * u_xlat16_73;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat7.xyz;
    u_xlat16_73 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz;
    u_xlat16_73 = dot(u_xlat16_12.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_73) + u_xlat16_75;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_73 = u_xlat16_35.z * u_xlat16_75 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_35.z * u_xlat16_73;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_75;
    u_xlat43 = u_xlat8.x * u_xlat16_73;
    u_xlat1.xw = min(u_xlat1.xw, vec2(u_xlat16_73));
    u_xlat2.x = u_xlat43 * 0.159154937;
    u_xlat16_73 = (-u_xlat43) * 0.159154937 + 1.0;
    u_xlat43 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_15.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat43 = log2(u_xlat43);
    u_xlat43 = u_xlat43 * 12.0;
    u_xlat43 = exp2(u_xlat43);
    u_xlat16_73 = u_xlat43 * u_xlat16_73 + u_xlat2.x;
    u_xlat16_73 = u_xlat22.x * u_xlat16_73;
    u_xlat2.xyz = vec3(u_xlat16_73) * _SSSColor.xyz;
    u_xlat22.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_22.x = texture(_FUZTexture, u_xlat22.xy).y;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_22.xxx + u_xlat16_10.xyz;
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_19.y = u_xlat16_12.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati1 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati1].xyz;
    u_xlati1 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati43 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_20.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xzw = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xzw = u_xlat16_22.xxx * u_xlat16_11.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat16_76 = (-u_xlat16_22.x) + 1.0;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_22.xxx + vec3(u_xlat16_76);
    u_xlat16_76 = dot((-u_xlat16_15.xyz), u_xlat7.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat1.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_76) + (-u_xlat16_15.xyz);
    u_xlat2.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_35.y = dot(u_xlat16_12.xyz, u_xlat1.xyz);
    u_xlat16_12.xyz = u_xlat16_35.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat23.xyz + u_xlat1.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat15.y = u_xlat1.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_32.x = u_xlat16_35.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_35.x);
    u_xlat9.y = u_xlat16_35.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_32.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_11.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb1)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_4.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = u_xlat16_73 * 16.0 + u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_12.z * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_22.x) + u_xlat16_1.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_22.x;
    u_xlat16_73 = u_xlat16_75 * u_xlat16_73;
    u_xlat1.x = u_xlat2.x * u_xlat16_73;
    u_xlat16_73 = u_xlat1.w * 0.5;
    u_xlat16_74 = (-u_xlat1.w) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat1.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_74;
    u_xlat16_73 = u_xlat1.w * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w + u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_32.x = cos(u_xlat1.x);
    u_xlat16_32.x = max(abs(u_xlat16_32.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb1 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_32.x = (u_xlatb1) ? u_xlat16_32.x : 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_32.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_73 : u_xlat16_11.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
mediump vec3 u_xlat16_21;
vec3 u_xlat25;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec2 u_xlat16_31;
float u_xlat40;
vec2 u_xlat42;
float u_xlat45;
bool u_xlatb45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat52;
mediump float u_xlat16_52;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_5 = texture(_materialParamsMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_46 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb15 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_46 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_47 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_47 = max(u_xlat16_47, 6.10351563e-05);
    u_xlat16_48 = inversesqrt(u_xlat16_47);
    u_xlat16_6.xyz = vec3(u_xlat16_48) * u_xlat7.xyz;
    u_xlat16_48 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.00100000005>=abs(u_xlat16_48));
#else
    u_xlatb15 = 0.00100000005>=abs(u_xlat16_48);
#endif
    u_xlat16_8.xy = (bool(u_xlatb15)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_48 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_48 = u_xlat16_48 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_46 = max(u_xlat16_46, u_xlat16_48);
    u_xlat16_48 = u_xlat16_47 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_47 = float(1.0) / float(u_xlat16_47);
    u_xlat16_48 = (-u_xlat16_48) * u_xlat16_48 + 1.0;
    u_xlat16_48 = max(u_xlat16_48, 0.0);
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat16_47 = max(u_xlat16_8.x, u_xlat16_47);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_47;
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_46 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_46) + vs_TEXCOORD2.yzx;
    u_xlat50 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat11.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_11.xyz = texture(_normalMap, u_xlat11.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat50 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat50);
    u_xlat52 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat52 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.x = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * 1.5;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * 1.66700006;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat25.xxx + u_xlat16_6.xyz;
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_46 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat11.xyz = u_xlat25.xyz * vec3(u_xlat16_46) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_46) * u_xlat25.xyz;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat11.xyz;
    u_xlat16_46 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat40 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = u_xlat40 * u_xlat40;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat55 = (-u_xlat16_46) * u_xlat40 + 1.0;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat16_47 = u_xlat16_5.y * _metallicMultiplier;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = u_xlat16_3.xyz * vec3(u_xlat55);
    u_xlat20 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat20) * vec3(u_xlat16_46) + u_xlat11.xyz;
    u_xlat16_21.x = u_xlat16_5.x * _roughnessMultiplier;
    u_xlat16_46 = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_46 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_46;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat12.x) * u_xlat16_46 + u_xlat12.x;
    u_xlat20 = u_xlat12.x * u_xlat20 + u_xlat16_46;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat5.y = u_xlat20 + u_xlat12.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat20 = u_xlat16_46 + -1.0;
    u_xlat20 = u_xlat25.x * u_xlat20 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_46 / u_xlat20;
    u_xlat25.x = u_xlat20 * 0.318309873;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat25.x = u_xlat5.x * u_xlat25.x;
    u_xlat25.xyz = u_xlat11.xyz * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat25.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_55 = texture(_FUZTexture, u_xlat16_8.xy).x;
    u_xlat55 = u_xlat16_55 + u_xlat16_55;
    u_xlat16_47 = (-_SSAmount) + 1.0;
    u_xlat16_47 = u_xlat55 * _SSMaskInfluence + u_xlat16_47;
    u_xlat55 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_47 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_47 = inversesqrt(u_xlat16_47);
    u_xlat16_8.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_47 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_47 * 0.5 + 0.5;
    u_xlat16_48 = (-u_xlat16_47) + u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_21.z = _occlusionScale * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_21.z * u_xlat16_48 + u_xlat16_47;
    u_xlat16_47 = u_xlat16_21.z * u_xlat16_47;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _occlusionScale * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_49;
    u_xlat52 = u_xlat52 * u_xlat16_47;
    u_xlat11.x = min(u_xlat16_47, 1.0);
    u_xlat26.x = u_xlat52 * 0.159154937;
    u_xlat16_47 = (-u_xlat52) * 0.159154937 + 1.0;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * 12.0;
    u_xlat52 = exp2(u_xlat52);
    u_xlat16_47 = u_xlat52 * u_xlat16_47 + u_xlat26.x;
    u_xlat16_47 = u_xlat55 * u_xlat16_47;
    u_xlat26.xyz = vec3(u_xlat16_47) * _SSSColor.zxy;
    u_xlat42.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_52 = texture(_FUZTexture, u_xlat42.xy).y;
    u_xlat16_1.xyz = u_xlat26.xyz * vec3(u_xlat16_52) + u_xlat16_1.xyz;
    u_xlat55 = min(u_xlat16_5.z, u_xlat11.x);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat55) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat55) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat55) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_13.y = u_xlat16_8.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati55 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati55].xyz;
    u_xlati55 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_47 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.x = (-u_xlat16_52) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat16_52) + u_xlat16_6.xxx;
    u_xlat16_6.x = dot((-u_xlat16_2.xyz), u_xlat7.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat26.xyz = (-u_xlat7.xyz) * u_xlat16_6.xxx + (-u_xlat16_2.xyz);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_21.y = dot(u_xlat16_8.xyz, u_xlat26.xyz);
    u_xlat16_2.xyz = u_xlat16_21.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat50) + (-u_xlat26.xyz);
    u_xlat0.xyz = vec3(u_xlat16_46) * u_xlat0.xyz + u_xlat26.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat8.y = u_xlat0.y;
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_46 = u_xlat16_21.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21.x);
    u_xlat12.y = u_xlat16_21.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_46);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_47) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_3.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_46 = floor(u_xlat16_3.w);
    u_xlat16_2.x = u_xlat16_46 + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_3.x = u_xlat16_2.x * 16.0 + u_xlat16_3.z;
    u_xlat16_2.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_3.x = u_xlat16_46 * 16.0 + u_xlat16_3.z;
    u_xlat16_2.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_15.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_46 = u_xlat16_2.z * 15.0 + (-u_xlat16_46);
    u_xlat16_2.x = (-u_xlat16_15.x) + u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_2.x + u_xlat16_15.x;
    u_xlat16_46 = u_xlat16_49 * u_xlat16_46;
    u_xlat0.x = u_xlat7.x * u_xlat16_46;
    u_xlat16_46 = u_xlat11.x * 0.5;
    u_xlat16_2.x = (-u_xlat11.x) * 0.5 + 1.0;
    u_xlat16_46 = u_xlat0.x * u_xlat16_2.x + u_xlat16_46;
    u_xlat16_2.x = u_xlat16_46 + u_xlat16_46;
    u_xlat16_17.x = (-u_xlat16_46) * 2.0 + 1.0;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x + u_xlat16_2.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat11.x;
    u_xlat16_46 = min(u_xlat16_46, u_xlat16_5.z);
    u_xlat16_2.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_46 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w + u_xlat16_46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_17.x = cos(u_xlat0.x);
    u_xlat16_17.x = max(abs(u_xlat16_17.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb45 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_17.x = (u_xlatb45) ? u_xlat16_17.x : 1.0;
    u_xlat16_17.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat3.x = u_xlat45 * 0.0625 + u_xlat3.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_15.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_46 : u_xlat16_2.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
mediump vec3 u_xlat16_21;
vec3 u_xlat25;
vec3 u_xlat26;
ivec3 u_xlati26;
mediump vec2 u_xlat16_31;
float u_xlat40;
vec2 u_xlat42;
float u_xlat45;
bool u_xlatb45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat52;
mediump float u_xlat16_52;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_5 = texture(_materialParamsMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_46 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb15 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_46 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_47 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_47 = max(u_xlat16_47, 6.10351563e-05);
    u_xlat16_48 = inversesqrt(u_xlat16_47);
    u_xlat16_6.xyz = vec3(u_xlat16_48) * u_xlat7.xyz;
    u_xlat16_48 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.00100000005>=abs(u_xlat16_48));
#else
    u_xlatb15 = 0.00100000005>=abs(u_xlat16_48);
#endif
    u_xlat16_8.xy = (bool(u_xlatb15)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_48 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_48 = u_xlat16_48 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_46 = max(u_xlat16_46, u_xlat16_48);
    u_xlat16_48 = u_xlat16_47 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_47 = float(1.0) / float(u_xlat16_47);
    u_xlat16_48 = (-u_xlat16_48) * u_xlat16_48 + 1.0;
    u_xlat16_48 = max(u_xlat16_48, 0.0);
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat16_47 = max(u_xlat16_8.x, u_xlat16_47);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_47;
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_46 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_46) + vs_TEXCOORD2.yzx;
    u_xlat50 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat11.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_11.xyz = texture(_normalMap, u_xlat11.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat50 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat50);
    u_xlat52 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat52 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.x = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * 1.5;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * 1.66700006;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat25.xxx + u_xlat16_6.xyz;
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_46 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat11.xyz = u_xlat25.xyz * vec3(u_xlat16_46) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_46) * u_xlat25.xyz;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat11.xyz;
    u_xlat16_46 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat40 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = u_xlat40 * u_xlat40;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat55 = (-u_xlat16_46) * u_xlat40 + 1.0;
    u_xlat16_46 = u_xlat40 * u_xlat16_46;
    u_xlat16_47 = u_xlat16_5.y * _metallicMultiplier;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = u_xlat16_3.xyz * vec3(u_xlat55);
    u_xlat20 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat20) * vec3(u_xlat16_46) + u_xlat11.xyz;
    u_xlat16_21.x = u_xlat16_5.x * _roughnessMultiplier;
    u_xlat16_46 = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_46 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_46;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat12.x) * u_xlat16_46 + u_xlat12.x;
    u_xlat20 = u_xlat12.x * u_xlat20 + u_xlat16_46;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat5.y = u_xlat20 + u_xlat12.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat20 = u_xlat16_46 + -1.0;
    u_xlat20 = u_xlat25.x * u_xlat20 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_46 / u_xlat20;
    u_xlat25.x = u_xlat20 * 0.318309873;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat25.x = u_xlat5.x * u_xlat25.x;
    u_xlat25.xyz = u_xlat11.xyz * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat25.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_55 = texture(_FUZTexture, u_xlat16_8.xy).x;
    u_xlat55 = u_xlat16_55 + u_xlat16_55;
    u_xlat16_47 = (-_SSAmount) + 1.0;
    u_xlat16_47 = u_xlat55 * _SSMaskInfluence + u_xlat16_47;
    u_xlat55 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_47 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_47 = inversesqrt(u_xlat16_47);
    u_xlat16_8.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_47 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_47 * 0.5 + 0.5;
    u_xlat16_48 = (-u_xlat16_47) + u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_21.z = _occlusionScale * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_21.z * u_xlat16_48 + u_xlat16_47;
    u_xlat16_47 = u_xlat16_21.z * u_xlat16_47;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _occlusionScale * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_49;
    u_xlat52 = u_xlat52 * u_xlat16_47;
    u_xlat11.x = min(u_xlat16_47, 1.0);
    u_xlat26.x = u_xlat52 * 0.159154937;
    u_xlat16_47 = (-u_xlat52) * 0.159154937 + 1.0;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * 12.0;
    u_xlat52 = exp2(u_xlat52);
    u_xlat16_47 = u_xlat52 * u_xlat16_47 + u_xlat26.x;
    u_xlat16_47 = u_xlat55 * u_xlat16_47;
    u_xlat26.xyz = vec3(u_xlat16_47) * _SSSColor.zxy;
    u_xlat42.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_52 = texture(_FUZTexture, u_xlat42.xy).y;
    u_xlat16_1.xyz = u_xlat26.xyz * vec3(u_xlat16_52) + u_xlat16_1.xyz;
    u_xlat55 = min(u_xlat16_5.z, u_xlat11.x);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat55) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat55) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat55) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_13.y = u_xlat16_8.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati26.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati55 = int(int_bitfieldInsert(2,u_xlati26.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati55].xyz;
    u_xlati55 = int(uint(uint(u_xlati26.x) & 1u));
    u_xlati26.x = (u_xlati26.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati26.x].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_47 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.x = (-u_xlat16_52) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat16_52) + u_xlat16_6.xxx;
    u_xlat16_6.x = dot((-u_xlat16_2.xyz), u_xlat7.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat26.xyz = (-u_xlat7.xyz) * u_xlat16_6.xxx + (-u_xlat16_2.xyz);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_21.y = dot(u_xlat16_8.xyz, u_xlat26.xyz);
    u_xlat16_2.xyz = u_xlat16_21.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat50) + (-u_xlat26.xyz);
    u_xlat0.xyz = vec3(u_xlat16_46) * u_xlat0.xyz + u_xlat26.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat8.y = u_xlat0.y;
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_46 = u_xlat16_21.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21.x);
    u_xlat12.y = u_xlat16_21.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_46);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_47) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_3.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_46 = floor(u_xlat16_3.w);
    u_xlat16_2.x = u_xlat16_46 + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_3.x = u_xlat16_2.x * 16.0 + u_xlat16_3.z;
    u_xlat16_2.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_3.x = u_xlat16_46 * 16.0 + u_xlat16_3.z;
    u_xlat16_2.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_15.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_46 = u_xlat16_2.z * 15.0 + (-u_xlat16_46);
    u_xlat16_2.x = (-u_xlat16_15.x) + u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_2.x + u_xlat16_15.x;
    u_xlat16_46 = u_xlat16_49 * u_xlat16_46;
    u_xlat0.x = u_xlat7.x * u_xlat16_46;
    u_xlat16_46 = u_xlat11.x * 0.5;
    u_xlat16_2.x = (-u_xlat11.x) * 0.5 + 1.0;
    u_xlat16_46 = u_xlat0.x * u_xlat16_2.x + u_xlat16_46;
    u_xlat16_2.x = u_xlat16_46 + u_xlat16_46;
    u_xlat16_17.x = (-u_xlat16_46) * 2.0 + 1.0;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x + u_xlat16_2.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat11.x;
    u_xlat16_46 = min(u_xlat16_46, u_xlat16_5.z);
    u_xlat16_2.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_46 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w + u_xlat16_46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_17.x = cos(u_xlat0.x);
    u_xlat16_17.x = max(abs(u_xlat16_17.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb45 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_17.x = (u_xlatb45) ? u_xlat16_17.x : 1.0;
    u_xlat16_17.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat3.x = u_xlat45 * 0.0625 + u_xlat3.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_15.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_46 : u_xlat16_2.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
bool u_xlatb20;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_33;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_44;
float u_xlat57;
bool u_xlatb57;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_2 = texture(_materialParamsMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat1.x = u_xlat19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 1.5;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat3.xyz = vec3(u_xlat38) * u_xlat4.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat20.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat20.x;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat20.x + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_67 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_67) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat39) * u_xlat16_10.xyz;
    u_xlat20.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat20.xxx * vec3(u_xlat16_63) + u_xlat3.xyz;
    u_xlat16_33.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat20.x = (-u_xlat1.x) * u_xlat16_63 + u_xlat1.x;
    u_xlat20.x = u_xlat1.x * u_xlat20.x + u_xlat16_63;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat1.x;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat39 = u_xlat2.x * u_xlat39 + u_xlat16_63;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat20.y = u_xlat39 + u_xlat2.x;
    u_xlat20.xy = u_xlat20.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = min(u_xlat20.x, 16.0);
    u_xlat39 = u_xlat16_63 + -1.0;
    u_xlat38 = u_xlat38 * u_xlat39 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat19.y = u_xlat16_63 / u_xlat38;
    u_xlat19.xy = u_xlat19.xy * vec2(1.66700006, 0.318309873);
    u_xlat38 = min(u_xlat19.y, 16.0);
    u_xlat38 = u_xlat20.x * u_xlat38;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_38 = texture(_FUZTexture, u_xlat16_15.xy).x;
    u_xlat38 = u_xlat16_38 + u_xlat16_38;
    u_xlat16_67 = (-_SSAmount) + 1.0;
    u_xlat16_67 = u_xlat38 * _SSMaskInfluence + u_xlat16_67;
    u_xlat38 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_67) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_33.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_68 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat19.x = u_xlat19.x * u_xlat16_67;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat59 = u_xlat19.x * 0.159154937;
    u_xlat16_67 = (-u_xlat19.x) * 0.159154937 + 1.0;
    u_xlat19.x = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_13.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 12.0;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_67 = u_xlat19.x * u_xlat16_67 + u_xlat59;
    u_xlat16_67 = u_xlat38 * u_xlat16_67;
    u_xlat3.xyz = vec3(u_xlat16_67) * _SSSColor.zxy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_19.xxx + u_xlat16_12.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati38 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_19.xxx * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_13.xyz);
    u_xlat59 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_33.y = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat2.y = u_xlat16_33.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_3.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_3.x = u_xlat16_67 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_63 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_63 = u_xlat16_13.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat59 * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_68 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68 + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_2.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
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
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_44 = cos(u_xlat0.x);
    u_xlat16_44 = max(abs(u_xlat16_44), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_44 = (u_xlatb57) ? u_xlat16_44 : 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_44) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
bool u_xlatb20;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_33;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_44;
float u_xlat57;
bool u_xlatb57;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_2 = texture(_materialParamsMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat1.x = u_xlat19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 1.5;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat3.xyz = vec3(u_xlat38) * u_xlat4.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat20.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat20.x;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat20.x + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_67 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_67) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat39) * u_xlat16_10.xyz;
    u_xlat20.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat20.xxx * vec3(u_xlat16_63) + u_xlat3.xyz;
    u_xlat16_33.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat20.x = (-u_xlat1.x) * u_xlat16_63 + u_xlat1.x;
    u_xlat20.x = u_xlat1.x * u_xlat20.x + u_xlat16_63;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat1.x;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat39 = u_xlat2.x * u_xlat39 + u_xlat16_63;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat20.y = u_xlat39 + u_xlat2.x;
    u_xlat20.xy = u_xlat20.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = min(u_xlat20.x, 16.0);
    u_xlat39 = u_xlat16_63 + -1.0;
    u_xlat38 = u_xlat38 * u_xlat39 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat19.y = u_xlat16_63 / u_xlat38;
    u_xlat19.xy = u_xlat19.xy * vec2(1.66700006, 0.318309873);
    u_xlat38 = min(u_xlat19.y, 16.0);
    u_xlat38 = u_xlat20.x * u_xlat38;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_38 = texture(_FUZTexture, u_xlat16_15.xy).x;
    u_xlat38 = u_xlat16_38 + u_xlat16_38;
    u_xlat16_67 = (-_SSAmount) + 1.0;
    u_xlat16_67 = u_xlat38 * _SSMaskInfluence + u_xlat16_67;
    u_xlat38 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_67) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_33.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_68 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat19.x = u_xlat19.x * u_xlat16_67;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat59 = u_xlat19.x * 0.159154937;
    u_xlat16_67 = (-u_xlat19.x) * 0.159154937 + 1.0;
    u_xlat19.x = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_13.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 12.0;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_67 = u_xlat19.x * u_xlat16_67 + u_xlat59;
    u_xlat16_67 = u_xlat38 * u_xlat16_67;
    u_xlat3.xyz = vec3(u_xlat16_67) * _SSSColor.zxy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_19.xxx + u_xlat16_12.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati38 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_19.xxx * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_13.xyz);
    u_xlat59 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_33.y = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat2.y = u_xlat16_33.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_3.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_3.x = u_xlat16_67 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_63 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_63 = u_xlat16_13.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat59 * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_68 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68 + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_2.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
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
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_44 = cos(u_xlat0.x);
    u_xlat16_44 = max(abs(u_xlat16_44), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_44 = (u_xlatb57) ? u_xlat16_44 : 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_44) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
ivec3 u_xlati13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat22;
int u_xlati22;
mediump vec3 u_xlat16_23;
vec3 u_xlat28;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
float u_xlat58;
float u_xlat62;
int u_xlati62;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_5 = texture(_materialParamsMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat11.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_11.xyz = texture(_normalMap, u_xlat11.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.x = u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = log2(u_xlat58);
    u_xlat58 = u_xlat58 * 1.5;
    u_xlat58 = exp2(u_xlat58);
    u_xlat58 = u_xlat58 * 1.66700006;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_52) * u_xlat11.xyz;
    u_xlat11.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat12.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat28.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat28.x * u_xlat28.x;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat45 = (-u_xlat16_52) * u_xlat28.x + 1.0;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat16_53 = u_xlat16_5.y * _metallicMultiplier;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat22 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat28.xyz = vec3(u_xlat22) * vec3(u_xlat16_52) + u_xlat28.xyz;
    u_xlat16_23.x = u_xlat16_5.x * _roughnessMultiplier;
    u_xlat16_52 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_52 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_52;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat12.x) * u_xlat16_52 + u_xlat12.x;
    u_xlat22 = u_xlat12.x * u_xlat22 + u_xlat16_52;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat5.y = u_xlat22 + u_xlat12.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat22 = u_xlat16_52 + -1.0;
    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_52 / u_xlat22;
    u_xlat5.y = u_xlat22 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat28.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat16_8.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_5.x = texture(_FUZTexture, u_xlat16_9.xy).x;
    u_xlat5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_53 = (-_SSAmount) + 1.0;
    u_xlat16_53 = u_xlat5.x * _SSMaskInfluence + u_xlat16_53;
    u_xlat5.x = u_xlat16_53 * u_xlat16_53;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_23.z = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_23.z * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_23.z * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat22 = u_xlat58 * u_xlat16_53;
    u_xlat58 = min(u_xlat16_53, 1.0);
    u_xlat62 = u_xlat22 * 0.159154937;
    u_xlat16_53 = (-u_xlat22) * 0.159154937 + 1.0;
    u_xlat22 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * 12.0;
    u_xlat22 = exp2(u_xlat22);
    u_xlat16_53 = u_xlat22 * u_xlat16_53 + u_xlat62;
    u_xlat16_53 = u_xlat5.x * u_xlat16_53;
    u_xlat13.xyz = vec3(u_xlat16_53) * _SSSColor.xyz;
    u_xlat5.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_5.x = texture(_FUZTexture, u_xlat5.xy).y;
    u_xlat16_8.xyz = u_xlat13.xyz * u_xlat16_5.xxx + u_xlat16_8.xyz;
    u_xlat22 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat22) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati13.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati13.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati22 = int(uint(uint(u_xlati13.x) & 1u));
    u_xlati62 = (u_xlati13.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_55 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_5.xxx + vec3(u_xlat16_55);
    u_xlat16_55 = dot((-u_xlat16_2.xyz), u_xlat7.xyz);
    u_xlat16_55 = u_xlat16_55 + u_xlat16_55;
    u_xlat13.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_55) + (-u_xlat16_2.xyz);
    u_xlat5.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_23.y = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_2.xyz = u_xlat16_23.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat13.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat13.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_55 = u_xlat16_23.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_23.x);
    u_xlat12.y = u_xlat16_23.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_55);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_1.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_1.w);
    u_xlat16_19.x = u_xlat16_2.x + 1.0;
    u_xlat16_19.x = min(u_xlat16_19.x, 15.0);
    u_xlat16_1.x = u_xlat16_19.x * 16.0 + u_xlat16_1.z;
    u_xlat16_19.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_19.xz = u_xlat16_19.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_19.xz).x;
    u_xlat16_1.x = u_xlat16_2.x * 16.0 + u_xlat16_1.z;
    u_xlat16_19.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_19.xz = u_xlat16_19.xz * vec2(0.00390625, 0.0625);
    u_xlat16_17 = texture(_SpecularOcclusionLut3D, u_xlat16_19.xz).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_19.x = (-u_xlat16_17) + u_xlat16_0.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_19.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_54 * u_xlat16_2.x;
    u_xlat0.x = u_xlat5.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat58 * 0.5;
    u_xlat16_19.x = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_36 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_36 + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat58;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_36 = cos(u_xlat0.x);
    u_xlat16_36 = max(abs(u_xlat16_36), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb51 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_36 = (u_xlatb51) ? u_xlat16_36 : 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_4.xyz;
    u_xlat16_6.xyz = (-u_xlat16_4.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_19.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
ivec3 u_xlati13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat22;
int u_xlati22;
mediump vec3 u_xlat16_23;
vec3 u_xlat28;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
float u_xlat58;
float u_xlat62;
int u_xlati62;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_5 = texture(_materialParamsMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat11.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_11.xyz = texture(_normalMap, u_xlat11.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.x = u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = log2(u_xlat58);
    u_xlat58 = u_xlat58 * 1.5;
    u_xlat58 = exp2(u_xlat58);
    u_xlat58 = u_xlat58 * 1.66700006;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_52) * u_xlat11.xyz;
    u_xlat11.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat12.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat28.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat28.x * u_xlat28.x;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat45 = (-u_xlat16_52) * u_xlat28.x + 1.0;
    u_xlat16_52 = u_xlat28.x * u_xlat16_52;
    u_xlat16_53 = u_xlat16_5.y * _metallicMultiplier;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat22 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat28.xyz = vec3(u_xlat22) * vec3(u_xlat16_52) + u_xlat28.xyz;
    u_xlat16_23.x = u_xlat16_5.x * _roughnessMultiplier;
    u_xlat16_52 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_52 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_52;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat12.x) * u_xlat16_52 + u_xlat12.x;
    u_xlat22 = u_xlat12.x * u_xlat22 + u_xlat16_52;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat5.y = u_xlat22 + u_xlat12.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat22 = u_xlat16_52 + -1.0;
    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_52 / u_xlat22;
    u_xlat5.y = u_xlat22 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat28.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat16_8.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_5.x = texture(_FUZTexture, u_xlat16_9.xy).x;
    u_xlat5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_53 = (-_SSAmount) + 1.0;
    u_xlat16_53 = u_xlat5.x * _SSMaskInfluence + u_xlat16_53;
    u_xlat5.x = u_xlat16_53 * u_xlat16_53;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_23.z = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_23.z * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_23.z * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat22 = u_xlat58 * u_xlat16_53;
    u_xlat58 = min(u_xlat16_53, 1.0);
    u_xlat62 = u_xlat22 * 0.159154937;
    u_xlat16_53 = (-u_xlat22) * 0.159154937 + 1.0;
    u_xlat22 = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * 12.0;
    u_xlat22 = exp2(u_xlat22);
    u_xlat16_53 = u_xlat22 * u_xlat16_53 + u_xlat62;
    u_xlat16_53 = u_xlat5.x * u_xlat16_53;
    u_xlat13.xyz = vec3(u_xlat16_53) * _SSSColor.xyz;
    u_xlat5.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_5.x = texture(_FUZTexture, u_xlat5.xy).y;
    u_xlat16_8.xyz = u_xlat13.xyz * u_xlat16_5.xxx + u_xlat16_8.xyz;
    u_xlat22 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat22) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati13.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati13.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati22 = int(uint(uint(u_xlati13.x) & 1u));
    u_xlati62 = (u_xlati13.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_55 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_5.xxx + vec3(u_xlat16_55);
    u_xlat16_55 = dot((-u_xlat16_2.xyz), u_xlat7.xyz);
    u_xlat16_55 = u_xlat16_55 + u_xlat16_55;
    u_xlat13.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_55) + (-u_xlat16_2.xyz);
    u_xlat5.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_23.y = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_2.xyz = u_xlat16_23.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat13.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat13.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_55 = u_xlat16_23.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_23.x);
    u_xlat12.y = u_xlat16_23.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_55);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_1.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_1.w);
    u_xlat16_19.x = u_xlat16_2.x + 1.0;
    u_xlat16_19.x = min(u_xlat16_19.x, 15.0);
    u_xlat16_1.x = u_xlat16_19.x * 16.0 + u_xlat16_1.z;
    u_xlat16_19.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_19.xz = u_xlat16_19.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_19.xz).x;
    u_xlat16_1.x = u_xlat16_2.x * 16.0 + u_xlat16_1.z;
    u_xlat16_19.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_19.xz = u_xlat16_19.xz * vec2(0.00390625, 0.0625);
    u_xlat16_17 = texture(_SpecularOcclusionLut3D, u_xlat16_19.xz).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_19.x = (-u_xlat16_17) + u_xlat16_0.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_19.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_54 * u_xlat16_2.x;
    u_xlat0.x = u_xlat5.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat58 * 0.5;
    u_xlat16_19.x = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_36 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_36 + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat58;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_36 = cos(u_xlat0.x);
    u_xlat16_36 = max(abs(u_xlat16_36), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb51 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_36 = (u_xlatb51) ? u_xlat16_36 : 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_4.xyz;
    u_xlat16_6.xyz = (-u_xlat16_4.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_19.x;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
bool u_xlatb20;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_33;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_44;
bool u_xlatb57;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_2 = texture(_materialParamsMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat1.x = u_xlat19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 1.5;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat3.xyz = vec3(u_xlat38) * u_xlat4.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat20.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat20.x;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat20.x + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_67 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_67) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat39) * u_xlat16_10.xyz;
    u_xlat20.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat20.xxx * vec3(u_xlat16_63) + u_xlat3.xyz;
    u_xlat16_33.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat20.x = (-u_xlat1.x) * u_xlat16_63 + u_xlat1.x;
    u_xlat20.x = u_xlat1.x * u_xlat20.x + u_xlat16_63;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat1.x;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat39 = u_xlat2.x * u_xlat39 + u_xlat16_63;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat20.y = u_xlat39 + u_xlat2.x;
    u_xlat20.xy = u_xlat20.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = min(u_xlat20.x, 16.0);
    u_xlat39 = u_xlat16_63 + -1.0;
    u_xlat38 = u_xlat38 * u_xlat39 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat19.y = u_xlat16_63 / u_xlat38;
    u_xlat19.xy = u_xlat19.xy * vec2(1.66700006, 0.318309873);
    u_xlat38 = min(u_xlat19.y, 16.0);
    u_xlat38 = u_xlat20.x * u_xlat38;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_38 = texture(_FUZTexture, u_xlat16_15.xy).x;
    u_xlat38 = u_xlat16_38 + u_xlat16_38;
    u_xlat16_67 = (-_SSAmount) + 1.0;
    u_xlat16_67 = u_xlat38 * _SSMaskInfluence + u_xlat16_67;
    u_xlat38 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_67) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_33.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_68 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat19.x = u_xlat19.x * u_xlat16_67;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat59 = u_xlat19.x * 0.159154937;
    u_xlat16_67 = (-u_xlat19.x) * 0.159154937 + 1.0;
    u_xlat19.x = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_13.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 12.0;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_67 = u_xlat19.x * u_xlat16_67 + u_xlat59;
    u_xlat16_67 = u_xlat38 * u_xlat16_67;
    u_xlat3.xyz = vec3(u_xlat16_67) * _SSSColor.xyz;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_19.xxx + u_xlat16_12.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati38 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_19.xxx * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_13.xyz);
    u_xlat59 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_33.y = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat2.y = u_xlat16_33.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_3.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_3.x = u_xlat16_67 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_63 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_63 = u_xlat16_13.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat59 * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_68 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68 + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_2.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_44 = cos(u_xlat0.x);
    u_xlat16_44 = max(abs(u_xlat16_44), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_44 = (u_xlatb57) ? u_xlat16_44 : 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_44) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
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
uniform 	vec4 _albedoMap_ST;
uniform 	vec4 _materialParamsMap_ST;
uniform 	vec4 _normalMap_ST;
uniform 	vec4 _FUZTexture_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FUZ_TillingOffset;
uniform 	mediump vec4 _CubeColor;
uniform 	mediump vec3 _SSSColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _SSAmount;
uniform 	mediump float _SSMaskInfluence;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FUZTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
bool u_xlatb20;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_33;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_44;
bool u_xlatb57;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
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
    u_xlat9.xy = vs_TEXCOORD3.xy * _normalMap_ST.xy + _normalMap_ST.zw;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * _materialParamsMap_ST.xy + _materialParamsMap_ST.zw;
    u_xlat16_2 = texture(_materialParamsMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat1.x = u_xlat19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * 0.660000026 + 0.330000013;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 1.5;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_68);
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_14.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_13.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat19.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat3.xyz = vec3(u_xlat38) * u_xlat4.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat20.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat20.x;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat39 = (-u_xlat16_63) * u_xlat20.x + 1.0;
    u_xlat16_63 = u_xlat20.x * u_xlat16_63;
    u_xlat16_67 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_67) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat39) * u_xlat16_10.xyz;
    u_xlat20.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat20.xxx * vec3(u_xlat16_63) + u_xlat3.xyz;
    u_xlat16_33.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat20.x = (-u_xlat1.x) * u_xlat16_63 + u_xlat1.x;
    u_xlat20.x = u_xlat1.x * u_xlat20.x + u_xlat16_63;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat1.x;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat39 = u_xlat2.x * u_xlat39 + u_xlat16_63;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat20.y = u_xlat39 + u_xlat2.x;
    u_xlat20.xy = u_xlat20.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = min(u_xlat20.x, 16.0);
    u_xlat39 = u_xlat16_63 + -1.0;
    u_xlat38 = u_xlat38 * u_xlat39 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat19.y = u_xlat16_63 / u_xlat38;
    u_xlat19.xy = u_xlat19.xy * vec2(1.66700006, 0.318309873);
    u_xlat38 = min(u_xlat19.y, 16.0);
    u_xlat38 = u_xlat20.x * u_xlat38;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _FUZ_TillingOffset.xy + _FUZ_TillingOffset.zw;
    u_xlat16_38 = texture(_FUZTexture, u_xlat16_15.xy).x;
    u_xlat38 = u_xlat16_38 + u_xlat16_38;
    u_xlat16_67 = (-_SSAmount) + 1.0;
    u_xlat16_67 = u_xlat38 * _SSMaskInfluence + u_xlat16_67;
    u_xlat38 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_15.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_67) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_33.z = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_68 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_33.z * u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat19.x = u_xlat19.x * u_xlat16_67;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat59 = u_xlat19.x * 0.159154937;
    u_xlat16_67 = (-u_xlat19.x) * 0.159154937 + 1.0;
    u_xlat19.x = dot(_MainLightDirectionAndAngleOffset.xyz, (-u_xlat16_13.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = log2(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 12.0;
    u_xlat19.x = exp2(u_xlat19.x);
    u_xlat16_67 = u_xlat19.x * u_xlat16_67 + u_xlat59;
    u_xlat16_67 = u_xlat38 * u_xlat16_67;
    u_xlat3.xyz = vec3(u_xlat16_67) * _SSSColor.xyz;
    u_xlat19.xy = vs_TEXCOORD3.xy * _FUZTexture_ST.xy + _FUZTexture_ST.zw;
    u_xlat16_19.x = texture(_FUZTexture, u_xlat19.xy).y;
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_19.xxx + u_xlat16_12.xyz;
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati38 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_19.xxx * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_69 = (-u_xlat16_19.x) + 1.0;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xxx + vec3(u_xlat16_69);
    u_xlat16_69 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_69 = u_xlat16_69 + u_xlat16_69;
    u_xlat0.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_69) + (-u_xlat16_13.xyz);
    u_xlat59 = dot(u_xlat16_15.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_33.y = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat2.y = u_xlat16_33.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_3.w);
    u_xlat16_67 = u_xlat16_63 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_3.x = u_xlat16_67 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_63 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_63 = u_xlat16_13.z * 15.0 + (-u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67 + u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_68 * u_xlat16_63;
    u_xlat0.x = u_xlat59 * u_xlat16_63;
    u_xlat16_63 = u_xlat0.w * 0.5;
    u_xlat16_67 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat0.x * u_xlat16_67 + u_xlat16_63;
    u_xlat16_67 = u_xlat16_63 + u_xlat16_63;
    u_xlat16_68 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68 + u_xlat16_67;
    u_xlat16_63 = u_xlat0.w * u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_2.z, u_xlat16_63);
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_44 = cos(u_xlat0.x);
    u_xlat16_44 = max(abs(u_xlat16_44), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_44 = (u_xlatb57) ? u_xlat16_44 : 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_44) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
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
  GpuProgramID 113235
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_AsperityScatteringGUI"
}