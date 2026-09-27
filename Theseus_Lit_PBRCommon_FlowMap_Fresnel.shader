//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_FlowMap_Fresnel" {
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

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_normalIntensity ("法线强度", Range(0, 2)) = 1.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_emissiveBreathe ("自发光呼吸参数", Vector) = (0,0,0,0)

_FlowTex ("流动贴图", 2D) = "white" { }

_FlowIntensity ("扭曲强度", Range(-1, 1)) = 0.0

_FlowSpeed ("流动速度", Range(-20, 20)) = 0.0

_FlowScale ("XY:整体缩放  ZW: 位移", Vector) = (1,1,0,0)

_FresnelTex ("R:手绘菲涅尔 G:菲涅尔遮罩", 2D) = "black" { }

_FresnelColor ("手绘菲涅尔颜色", Color) = (1,1,1,1)

_FresnelDir ("菲涅尔方向偏移", Vector) = (0,0,0,0)

_Fresnel2Color ("菲涅尔2颜色", Color) = (1,1,1,1)

_Fresnel3Color ("菲涅尔3颜色", Color) = (1,1,1,1)

_FresnelVector ("手绘菲涅尔参数", Vector) = (1,1,1,1)

_Fresnel2Vector ("菲涅尔2参数", Vector) = (1,1,1,1)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_DIRECT_SANSHE ("平行光开关", Float) = 0.0

_FeatureMaskTex ("R:平行光1遮罩 G:平行光2遮罩", 2D) = "white" { }

_DirectionalColor1 ("平行光颜色1", Color) = (1,1,1,1)

_DirectionalIntensity1 ("平行光强度1", Float) = 0.0

_DirectionalDir1 ("平行光方向1", Vector) = (1,1,1,1)

_DirectionalColor2 ("平行光颜色2", Color) = (1,1,1,1)

_DirectionalIntensity2 ("平行光强度2", Float) = 0.0

_DirectionalDir2 ("平行光方向2", Vector) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_shadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 22597
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
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
float u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
int u_xlati25;
float u_xlat27;
mediump float u_xlat16_29;
mediump float u_xlat16_42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
vec2 u_xlat47;
mediump float u_xlat16_50;
float u_xlat63;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat68;
float u_xlat70;
mediump float u_xlat16_72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_22.x, u_xlat16_1);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_22.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_3.x = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_24.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat67 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat67 * _FlowSpeed + 0.5;
    u_xlat67 = u_xlat67 * _FlowSpeed;
    u_xlat67 = fract(u_xlat67);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_24.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat47.xy = (-u_xlat16_24.xy) * vec2(u_xlat67) + vs_TEXCOORD4.xy;
    u_xlat16_65 = (-u_xlat67) + 0.5;
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat47.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_65)) * u_xlat6 + u_xlat16_7;
    u_xlat16_24.xyz = u_xlat6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat6.zxy * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_24.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat63) * u_xlat16_9.xyz;
    u_xlat63 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat47.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat47.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_65)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat10.xyz;
    u_xlat68 = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat7.x = (-u_xlat68) * u_xlat16_22.x + u_xlat68;
    u_xlat7.x = u_xlat68 * u_xlat7.x + u_xlat16_22.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat68 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat15.x) * u_xlat16_22.x + u_xlat15.x;
    u_xlat70 = u_xlat15.x * u_xlat70 + u_xlat16_22.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat7.w = u_xlat70 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25 = u_xlat16_22.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat25 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_22.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat25 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_22.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat73 = (-u_xlat16_43) + 1.0;
    u_xlat16_3.x = u_xlat73 * u_xlat73;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat74 = (-u_xlat16_3.x) * u_xlat73 + 1.0;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat74);
    u_xlat16.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat16.xyz;
    u_xlat73 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat73) * u_xlat16_22.x + u_xlat73;
    u_xlat74 = u_xlat73 * u_xlat74 + u_xlat16_22.x;
    u_xlat75 = sqrt(u_xlat74);
    u_xlat75 = u_xlat73 + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat7.w * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat75;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_29 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29 = (-u_xlat16_29) * u_xlat16_29 + 1.0;
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_72 = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_29 * u_xlat16_72;
    u_xlat16_29 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_29));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_29);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_29 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_29 = u_xlat16_29 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_72);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_29;
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_1) + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_3.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat25 = u_xlat6.x * u_xlat25 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_22.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat27 * u_xlat27;
    u_xlat16_3.x = u_xlat27 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat27 * u_xlat16_3.x;
    u_xlat16_29 = u_xlat27 * u_xlat16_3.x;
    u_xlat27 = (-u_xlat16_3.x) * u_xlat27 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat27);
    u_xlat16.xyz = vec3(u_xlat63) * vec3(u_xlat16_29) + u_xlat16.xyz;
    u_xlat63 = (-u_xlat6.x) * u_xlat16_22.x + u_xlat6.x;
    u_xlat63 = u_xlat6.x * u_xlat63 + u_xlat16_22.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat6.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat7.w;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat63 = u_xlat63 * u_xlat25;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat63);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.zzz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat68) * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(u_xlat73) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat10.xyz) * vec3(u_xlat67) + vs_TEXCOORD5.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_29 = (-u_xlat16_66) + u_xlat16_29;
    u_xlat16_72 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_29 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_29 + -1.0;
    u_xlat16_29 = _occlusionScale * u_xlat16_29 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_29;
    u_xlat63 = min(u_xlat16_66, 1.0);
    u_xlat4.x = min(u_xlat63, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat4.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_29) * u_xlat16_20.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati25 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat16_18.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_18.xyz, u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_50 = log2(u_xlat0.x);
    u_xlat16_12.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_12.w);
    u_xlat16_24.x = u_xlat16_3.x + 1.0;
    u_xlat16_24.x = min(u_xlat16_24.x, 15.0);
    u_xlat16_12.x = u_xlat16_24.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_3.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_24.x = (-u_xlat16_42) + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_42;
    u_xlat16_3.x = u_xlat16_29 * u_xlat16_3.x;
    u_xlat0.x = u_xlat21 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat63 * 0.5;
    u_xlat16_24.x = (-u_xlat63) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_24.x + u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_45 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat63 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat67) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_22.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyw = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_24.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_24.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat16_9.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_8.xyw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_3.yzx * u_xlat16_8.ywx + u_xlat16_14.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat6.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.zxy) + u_xlat16_11.zxy;
    u_xlat0.xyz = abs(vec3(u_xlat16_65)) * u_xlat0.xyz + u_xlat16_5.zxy;
    u_xlat16_8.xyw = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_65 = u_xlat16_50 * _Fresnel2Vector.x;
    u_xlat16_45 = u_xlat16_50 * _FresnelVector.z;
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_66 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _Fresnel3Color.zxy;
    u_xlat16_9.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_65 = u_xlat16_45 * u_xlat16_9.y;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _Fresnel2Color.zxy + u_xlat16_8.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.yyy;
    u_xlat16_65 = log2(u_xlat16_0.x);
    u_xlat16_65 = u_xlat16_65 * _FresnelVector.x;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_9.x * u_xlat16_65;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _FresnelColor.zxy + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_21.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_24.x;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
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
float u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
int u_xlati25;
float u_xlat27;
mediump float u_xlat16_29;
mediump float u_xlat16_42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
vec2 u_xlat47;
mediump float u_xlat16_50;
float u_xlat63;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat68;
float u_xlat70;
mediump float u_xlat16_72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_22.x, u_xlat16_1);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_22.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_3.x = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_24.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat67 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat67 * _FlowSpeed + 0.5;
    u_xlat67 = u_xlat67 * _FlowSpeed;
    u_xlat67 = fract(u_xlat67);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_24.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat47.xy = (-u_xlat16_24.xy) * vec2(u_xlat67) + vs_TEXCOORD4.xy;
    u_xlat16_65 = (-u_xlat67) + 0.5;
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat47.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_65)) * u_xlat6 + u_xlat16_7;
    u_xlat16_24.xyz = u_xlat6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat6.zxy * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_24.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat63) * u_xlat16_9.xyz;
    u_xlat63 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat47.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat47.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_65)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat10.xyz;
    u_xlat68 = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat7.x = (-u_xlat68) * u_xlat16_22.x + u_xlat68;
    u_xlat7.x = u_xlat68 * u_xlat7.x + u_xlat16_22.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat68 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat15.x) * u_xlat16_22.x + u_xlat15.x;
    u_xlat70 = u_xlat15.x * u_xlat70 + u_xlat16_22.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat7.w = u_xlat70 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25 = u_xlat16_22.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat25 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_22.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat68) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat25 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_22.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat73 = (-u_xlat16_43) + 1.0;
    u_xlat16_3.x = u_xlat73 * u_xlat73;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat74 = (-u_xlat16_3.x) * u_xlat73 + 1.0;
    u_xlat16_3.x = u_xlat73 * u_xlat16_3.x;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat74);
    u_xlat16.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat16.xyz;
    u_xlat73 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat73) * u_xlat16_22.x + u_xlat73;
    u_xlat74 = u_xlat73 * u_xlat74 + u_xlat16_22.x;
    u_xlat75 = sqrt(u_xlat74);
    u_xlat75 = u_xlat73 + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat7.w * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat75;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_29 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29 = (-u_xlat16_29) * u_xlat16_29 + 1.0;
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_72 = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_29 * u_xlat16_72;
    u_xlat16_29 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_29));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_29);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_29 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_29 = u_xlat16_29 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_72);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_29;
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_1) + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_3.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat25 = u_xlat6.x * u_xlat25 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_22.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.x = u_xlat27 * u_xlat27;
    u_xlat16_3.x = u_xlat27 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat27 * u_xlat16_3.x;
    u_xlat16_29 = u_xlat27 * u_xlat16_3.x;
    u_xlat27 = (-u_xlat16_3.x) * u_xlat27 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat27);
    u_xlat16.xyz = vec3(u_xlat63) * vec3(u_xlat16_29) + u_xlat16.xyz;
    u_xlat63 = (-u_xlat6.x) * u_xlat16_22.x + u_xlat6.x;
    u_xlat63 = u_xlat6.x * u_xlat63 + u_xlat16_22.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat6.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat7.w;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat63 = u_xlat63 * u_xlat25;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat63);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.zzz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat68) * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(u_xlat73) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat10.xyz) * vec3(u_xlat67) + vs_TEXCOORD5.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_29 = (-u_xlat16_66) + u_xlat16_29;
    u_xlat16_72 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_29 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_29 + -1.0;
    u_xlat16_29 = _occlusionScale * u_xlat16_29 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_29;
    u_xlat63 = min(u_xlat16_66, 1.0);
    u_xlat4.x = min(u_xlat63, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat4.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_29) * u_xlat16_20.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati25 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat16_18.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_18.xyz, u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_50 = log2(u_xlat0.x);
    u_xlat16_12.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_12.w);
    u_xlat16_24.x = u_xlat16_3.x + 1.0;
    u_xlat16_24.x = min(u_xlat16_24.x, 15.0);
    u_xlat16_12.x = u_xlat16_24.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_3.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_24.x = (-u_xlat16_42) + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_42;
    u_xlat16_3.x = u_xlat16_29 * u_xlat16_3.x;
    u_xlat0.x = u_xlat21 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat63 * 0.5;
    u_xlat16_24.x = (-u_xlat63) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_24.x + u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_45 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat63 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat67) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_22.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_24.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyw = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_24.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_24.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat16_9.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_8.xyw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_3.yzx * u_xlat16_8.ywx + u_xlat16_14.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat6.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.zxy) + u_xlat16_11.zxy;
    u_xlat0.xyz = abs(vec3(u_xlat16_65)) * u_xlat0.xyz + u_xlat16_5.zxy;
    u_xlat16_8.xyw = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_65 = u_xlat16_50 * _Fresnel2Vector.x;
    u_xlat16_45 = u_xlat16_50 * _FresnelVector.z;
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_66 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _Fresnel3Color.zxy;
    u_xlat16_9.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_65 = u_xlat16_45 * u_xlat16_9.y;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _Fresnel2Color.zxy + u_xlat16_8.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.yyy;
    u_xlat16_65 = log2(u_xlat16_0.x);
    u_xlat16_65 = u_xlat16_65 * _FresnelVector.x;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_9.x * u_xlat16_65;
    u_xlat16_8.xyz = vec3(u_xlat16_65) * _FresnelColor.zxy + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_21.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_24.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.zxy;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_33.yzx + u_xlat16_10.zwx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.zxy + (-u_xlat16_6.zxy);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.zxy;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.zxy;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.zxy + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_1.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.yyy + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
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
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.zxy;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_33.yzx + u_xlat16_10.zwx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.zxy + (-u_xlat16_6.zxy);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.zxy;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.zxy;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.zxy + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_1.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.yyy + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.zxy;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat22 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_1.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_33.yzx + u_xlat16_10.zwx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.zxy + (-u_xlat16_6.zxy);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.zxy;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.zxy;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.zxy + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.zxy;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat22 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_1.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_33.yzx + u_xlat16_10.zwx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.zxy + (-u_xlat16_6.zxy);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.zxy;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.zxy;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.zxy + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump vec2 u_xlat16_48;
float u_xlat55;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat70 = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_21.x / u_xlat70;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat71 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat71 * u_xlat71;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat71 + 1.0;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat72);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat71 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_21.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat7.w * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat55 = min(u_xlat72, 16.0);
    u_xlat70 = u_xlat70 * u_xlat55;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat70);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.x = log2(u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_23.x = floor(u_xlat16_14.w);
    u_xlat16_43 = u_xlat16_23.x + 1.0;
    u_xlat16_43 = min(u_xlat16_43, 15.0);
    u_xlat16_14.x = u_xlat16_43 * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_14.x = u_xlat16_23.x * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_23.x = u_xlat16_13.z * 15.0 + (-u_xlat16_23.x);
    u_xlat16_43 = (-u_xlat16_40) + u_xlat16_20.x;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_43 + u_xlat16_40;
    u_xlat16_23.x = u_xlat16_28 * u_xlat16_23.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat60 * 0.5;
    u_xlat16_43 = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_23.x = u_xlat0.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat16_28 = (-u_xlat16_23.x) * 2.0 + 1.0;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_28 + u_xlat16_43;
    u_xlat16_23.x = u_xlat60 * u_xlat16_23.x;
    u_xlat16_23.x = min(u_xlat16_23.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_23.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.zxy) + u_xlat16_11.zxy;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.zxy;
    u_xlat16_23.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_3.x * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_3.x * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.zxy;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.zxy + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.zxy + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.yyy + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump vec2 u_xlat16_48;
float u_xlat55;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat70 = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_21.x / u_xlat70;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat71 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat71 * u_xlat71;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat71 + 1.0;
    u_xlat16_41 = u_xlat71 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat72);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat71 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_21.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat7.w * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat55 = min(u_xlat72, 16.0);
    u_xlat70 = u_xlat70 * u_xlat55;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat70);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.x = log2(u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_23.x = floor(u_xlat16_14.w);
    u_xlat16_43 = u_xlat16_23.x + 1.0;
    u_xlat16_43 = min(u_xlat16_43, 15.0);
    u_xlat16_14.x = u_xlat16_43 * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_14.x = u_xlat16_23.x * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_23.x = u_xlat16_13.z * 15.0 + (-u_xlat16_23.x);
    u_xlat16_43 = (-u_xlat16_40) + u_xlat16_20.x;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_43 + u_xlat16_40;
    u_xlat16_23.x = u_xlat16_28 * u_xlat16_23.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat60 * 0.5;
    u_xlat16_43 = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_23.x = u_xlat0.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat16_28 = (-u_xlat16_23.x) * 2.0 + 1.0;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_28 + u_xlat16_43;
    u_xlat16_23.x = u_xlat60 * u_xlat16_23.x;
    u_xlat16_23.x = min(u_xlat16_23.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_23.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.zxy) + u_xlat16_11.zxy;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.zxy;
    u_xlat16_23.xyz = u_xlat0.xyz * _emissiveColor.zxy;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_3.x * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_3.x * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.zxy;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.zxy + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.zxy + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.yyy + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump float u_xlat16_48;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
mediump float u_xlat16_69;
float u_xlat70;
float u_xlat71;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_21.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat71 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat71 = u_xlat70 * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat70 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat7.w * u_xlat71;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat71;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_69 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat20 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_48 = log2(u_xlat0.x);
    u_xlat16_12.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_12.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_12.x = u_xlat16_23.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_3.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_28 * u_xlat16_3.x;
    u_xlat0.x = u_xlat20 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyw = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_21.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_23.xyz = vec3(u_xlat16_63) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_23.xyz = (bool(u_xlatb0)) ? u_xlat16_23.xyz : u_xlat16_9.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + u_xlat16_11.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_48 * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_48 * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.xyz;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump float u_xlat16_48;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
mediump float u_xlat16_69;
float u_xlat70;
float u_xlat71;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_21.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat71 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat71 = u_xlat70 * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat70 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat7.w * u_xlat71;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat71;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_69 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat20 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_48 = log2(u_xlat0.x);
    u_xlat16_12.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_12.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_12.x = u_xlat16_23.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_3.x * 16.0 + u_xlat16_12.z;
    u_xlat16_13.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_28 * u_xlat16_3.x;
    u_xlat0.x = u_xlat20 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyw = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_21.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_23.xyz = vec3(u_xlat16_63) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_23.xyz = (bool(u_xlatb0)) ? u_xlat16_23.xyz : u_xlat16_9.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + u_xlat16_11.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_48 * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_48 * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.xyz;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.xyz;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.xyz + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_1.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.yyy + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.xyz;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.xyz + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_1.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_1.yyy + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat22 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_1.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.xyz;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.xyz + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec3 u_xlat23;
vec2 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
int u_xlati42;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat45;
vec2 u_xlat48;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat64;
float u_xlat65;
float u_xlat67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_7.xy = u_xlat6.xy * (-vec2(_FlowIntensity));
    u_xlat68 = _Time.y * 0.100000001;
    u_xlat6.x = u_xlat68 * _FlowSpeed + 0.5;
    u_xlat68 = u_xlat68 * _FlowSpeed;
    u_xlat68 = fract(u_xlat68);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.xy = (-u_xlat16_7.xy) * u_xlat6.xx + vs_TEXCOORD4.xy;
    u_xlat48.xy = (-u_xlat16_7.xy) * vec2(u_xlat68) + vs_TEXCOORD4.xy;
    u_xlat16_7.x = (-u_xlat68) + 0.5;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_8.xyz = texture(_normalMap, u_xlat6.xy).xyz;
    u_xlat16_9.xyz = texture(_normalMap, u_xlat48.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat8.xyz = abs(u_xlat16_7.xxx) * u_xlat8.xyz + u_xlat16_9.xyz;
    u_xlat16_28.xyz = u_xlat8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(_normalIntensity);
    u_xlat16_10.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_10.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat16_10.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat9.x;
    u_xlat5.x = u_xlat8.z;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat16_28.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_28.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_28.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_28.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_28.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_31.x = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_52 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16_10.x = u_xlat16_31.x * u_xlat16_52;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_31.x, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_31.xyz = u_xlat16_11.xyz * u_xlat16_31.yyy + u_xlat16_12.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_31.xyz);
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_11.x = max(u_xlat16_32.x, u_xlat16_11.x);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_31.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_74 = dot(u_xlat16_31.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_74) + 1.0;
    u_xlat16_31.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat23.x * u_xlat16_31.x;
    u_xlat16_52 = u_xlat23.x * u_xlat16_31.x;
    u_xlat23.x = (-u_xlat16_31.x) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat6.xy).xyz;
    u_xlat16_9 = texture(_albedoMap, u_xlat48.xy);
    u_xlat16_6.xyz = texture(_emissiveMap, u_xlat48.xy).xyz;
    u_xlat3 = u_xlat16_3 + (-u_xlat16_9);
    u_xlat3 = abs(u_xlat16_7.xxxx) * u_xlat3 + u_xlat16_9;
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_13.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat3.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat23.xyz;
    u_xlat16_31.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat24.x = u_xlat64 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat64 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_10.xxx;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16.x) * u_xlat16_31.x + u_xlat16.x;
    u_xlat45 = u_xlat16.x * u_xlat45 + u_xlat16_31.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat24.y = u_xlat45 + u_xlat16.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat67 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat17.xyz = u_xlat1.xyz * u_xlat16_10.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat17.xyz = vec3(u_xlat65) * u_xlat17.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat67 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_31.x / u_xlat65;
    u_xlat65 = u_xlat65 * 0.318309873;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat24.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat24.x;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat69 = (-u_xlat16_52) * u_xlat24.x + 1.0;
    u_xlat16_52 = u_xlat24.x * u_xlat16_52;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat69);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat69 = u_xlat24.x * u_xlat69 + u_xlat16_31.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat24.x + u_xlat69;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat24.y * u_xlat69;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat65 = u_xlat65 * u_xlat69;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat65);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_28.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_52 = max(u_xlat16_52, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_52 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_52);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_52);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_20.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_52 = u_xlat16_73 * u_xlat16_52;
    u_xlat16_20.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_10.xxx + u_xlat16_19.xyz;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_10.xx + _FresnelDir.xy;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat16_19.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat67 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat44 * u_xlat44;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat44 * u_xlat16_10.x;
    u_xlat16_52 = u_xlat44 * u_xlat16_10.x;
    u_xlat44 = (-u_xlat16_10.x) * u_xlat44 + 1.0;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat44);
    u_xlat17.xyz = u_xlat3.xxx * vec3(u_xlat16_52) + u_xlat17.xyz;
    u_xlat44 = (-u_xlat23.x) * u_xlat16_31.x + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat23.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat24.y;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat2.xzw = u_xlat17.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = u_xlat23.xxx * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_20.xyz * u_xlat2.xzw;
    u_xlat16_10.xzw = u_xlat2.xzw * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * u_xlat16_12.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_18.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat21.yyy * u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat23.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_10.xzw + u_xlat16_28.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD5.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_74) + u_xlat16_75;
    u_xlat16_34 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_13.w = _occlusionScale * u_xlat16_34 + 1.0;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_75 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_13.w * u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_28.xyz;
    u_xlat16_12.x = dot((-u_xlat16_15.xyz), u_xlat8.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_12.xxx + (-u_xlat16_15.xyz);
    u_xlat1.z = u_xlat16_15.z;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat1.xyz);
    u_xlat22 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_13.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_13.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_12.x = log2(u_xlat1.x);
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_33.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = (-u_xlat16_43) + u_xlat16_1.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_43;
    u_xlat16_11.x = u_xlat16_75 * u_xlat16_11.x;
    u_xlat1.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_32.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_9.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_33.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_32.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_32.xyz : u_xlat16_13.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_33.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_28.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_33.xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat3.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat3.w * _albedoColor.w;
    u_xlat0.xyz = u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = abs(u_xlat16_7.xxx) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_28.xyz;
    u_xlat16_70 = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_52 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_73 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel3Color.xyz;
    u_xlat16_12.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_70 = u_xlat16_52 * u_xlat16_12.y;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _Fresnel2Color.xyz + u_xlat16_11.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy;
    u_xlat16_70 = log2(u_xlat16_0.x);
    u_xlat16_70 = u_xlat16_70 * _FresnelVector.x;
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_12.x * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump vec2 u_xlat16_48;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
mediump float u_xlat16_69;
float u_xlat70;
float u_xlat71;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_21.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat71 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat71 = u_xlat70 * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat70 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat7.w * u_xlat71;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat71;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_69 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.x = log2(u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_23.x = floor(u_xlat16_14.w);
    u_xlat16_43 = u_xlat16_23.x + 1.0;
    u_xlat16_43 = min(u_xlat16_43, 15.0);
    u_xlat16_14.x = u_xlat16_43 * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_14.x = u_xlat16_23.x * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_23.x = u_xlat16_13.z * 15.0 + (-u_xlat16_23.x);
    u_xlat16_43 = (-u_xlat16_40) + u_xlat16_20;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_43 + u_xlat16_40;
    u_xlat16_23.x = u_xlat16_28 * u_xlat16_23.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat60 * 0.5;
    u_xlat16_43 = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_23.x = u_xlat0.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat16_28 = (-u_xlat16_23.x) * 2.0 + 1.0;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_28 + u_xlat16_43;
    u_xlat16_23.x = u_xlat60 * u_xlat16_23.x;
    u_xlat16_23.x = min(u_xlat16_23.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + u_xlat16_11.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_3.x * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_3.x * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.xyz;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.yyy + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
uniform 	mediump vec4 _FlowScale;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _FlowScale.xy + _FlowScale.zw;
    vs_TEXCOORD4.zw = in_TEXCOORD2.xy * _FlowScale.xy + _FlowScale.zw;
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
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
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
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _DirectionalColor1;
uniform 	mediump float _DirectionalIntensity1;
uniform 	mediump vec4 _DirectionalDir1;
uniform 	mediump vec4 _DirectionalColor2;
uniform 	mediump float _DirectionalIntensity2;
uniform 	mediump vec4 _DirectionalDir2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
int u_xlati24;
float u_xlat26;
mediump float u_xlat16_28;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat45;
mediump vec2 u_xlat16_48;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat67;
mediump float u_xlat16_69;
float u_xlat70;
float u_xlat71;
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
    u_xlat16_5.xy = texture(_FlowTex, vs_TEXCOORD4.xy).xy;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_23.xy = u_xlat5.xy * (-vec2(_FlowIntensity));
    u_xlat64 = _Time.y * 0.100000001;
    u_xlat5.x = u_xlat64 * _FlowSpeed + 0.5;
    u_xlat64 = u_xlat64 * _FlowSpeed;
    u_xlat64 = fract(u_xlat64);
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.xy = (-u_xlat16_23.xy) * u_xlat5.xx + vs_TEXCOORD4.xy;
    u_xlat45.xy = (-u_xlat16_23.xy) * vec2(u_xlat64) + vs_TEXCOORD4.xy;
    u_xlat16_62 = (-u_xlat64) + 0.5;
    u_xlat16_62 = u_xlat16_62 + u_xlat16_62;
    u_xlat16_6 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7 = texture(_albedoMap, u_xlat45.xy);
    u_xlat6 = u_xlat16_6 + (-u_xlat16_7);
    u_xlat6 = abs(vec4(u_xlat16_62)) * u_xlat6 + u_xlat16_7;
    u_xlat16_23.xyz = u_xlat6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat6.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_8.xyz = u_xlat16_7.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_9.xyz;
    u_xlat60 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat6.xyz;
    u_xlat16_10.xyz = texture(_normalMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, u_xlat5.xy).xyz;
    u_xlat16_12.xyz = texture(_normalMap, u_xlat45.xy).xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, u_xlat45.xy).xyz;
    u_xlat10.xyz = u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat10.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(_normalIntensity);
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_14.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat15.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat15.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat10.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat15.x = u_xlat12.y;
    u_xlat12.y = u_xlat15.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat7.x = (-u_xlat65) * u_xlat16_21.x + u_xlat65;
    u_xlat7.x = u_xlat65 * u_xlat7.x + u_xlat16_21.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat65 + u_xlat7.x;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat15.x = dot(u_xlat12.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat67 = u_xlat15.x * u_xlat67 + u_xlat16_21.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat7.w = u_xlat67 + u_xlat15.x;
    u_xlat7.xw = u_xlat7.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.w;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat65) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat16.xyz = u_xlat7.xxx * u_xlat16.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat24 + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_21.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat71 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat71 = u_xlat70 * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat70 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat7.w * u_xlat71;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat71;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_17.xyz = vec3(u_xlat16_41) * u_xlat6.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_3.x;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_3.x);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_18.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat24 = u_xlat6.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat16_21.x / u_xlat24;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat26 * u_xlat26;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat26 * u_xlat16_1.x;
    u_xlat16_41 = u_xlat26 * u_xlat16_1.x;
    u_xlat26 = (-u_xlat16_1.x) * u_xlat26 + 1.0;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat26);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat16.xyz;
    u_xlat60 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat60 = u_xlat6.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat6.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat7.w;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat24;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat6.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16_1.xzw = u_xlat16.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_3.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat65) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD5.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_28 = (-u_xlat16_63) + u_xlat16_28;
    u_xlat16_69 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_28 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_28 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_28 + -1.0;
    u_xlat16_28 = _occlusionScale * u_xlat16_28 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat4.x = min(u_xlat60, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_28) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati24 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat0.z = u_xlat16_13.z;
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.x = log2(u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_23.x = floor(u_xlat16_14.w);
    u_xlat16_43 = u_xlat16_23.x + 1.0;
    u_xlat16_43 = min(u_xlat16_43, 15.0);
    u_xlat16_14.x = u_xlat16_43 * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_14.x = u_xlat16_23.x * 16.0 + u_xlat16_14.z;
    u_xlat16_48.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_48.xy = u_xlat16_48.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_48.xy).x;
    u_xlat16_23.x = u_xlat16_13.z * 15.0 + (-u_xlat16_23.x);
    u_xlat16_43 = (-u_xlat16_40) + u_xlat16_20;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_43 + u_xlat16_40;
    u_xlat16_23.x = u_xlat16_28 * u_xlat16_23.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat60 * 0.5;
    u_xlat16_43 = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_23.x = u_xlat0.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat16_28 = (-u_xlat16_23.x) * 2.0 + 1.0;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_28 + u_xlat16_43;
    u_xlat16_23.x = u_xlat60 * u_xlat16_23.x;
    u_xlat16_23.x = min(u_xlat16_23.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat6.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat6.w * _albedoColor.w;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + u_xlat16_11.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_62)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * _emissiveColor.xyz;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_41 = u_xlat16_3.x * _Fresnel2Vector.x;
    u_xlat16_61 = u_xlat16_3.x * _FresnelVector.z;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_62 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_62;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel3Color.xyz;
    u_xlat16_8.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_41 = u_xlat16_61 * u_xlat16_8.y;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_41 = log2(u_xlat16_0.x);
    u_xlat16_41 = u_xlat16_41 * _FresnelVector.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_8.x * u_xlat16_41;
    u_xlat16_3.xyz = vec3(u_xlat16_41) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(_DirectionalDir1.xyz, _DirectionalDir1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity1);
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD4.xy).xy;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_2.xyz;
    u_xlat0.x = dot(_DirectionalDir2.xyz, _DirectionalDir2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalDir2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * _DirectionalColor2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_DirectionalIntensity2);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_4.yyy + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_DIRECT_SANSHE" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_DIRECT_SANSHE" }
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
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_DIRECT_SANSHE" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_DIRECT_SANSHE" }
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
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_DIRECT_SANSHE" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 129033
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_FlowMap_FresnelGUI"
}