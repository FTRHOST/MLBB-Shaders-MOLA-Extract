//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Skin_Sweat)" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_zwrite ("深度写入", Float) = 1.0

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

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

[Tex] _skinMap ("RG:SSS根据动态法线强度混合RG, B:changed roughness", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

[Tex] _sweatNormalMap ("RGB:第二套法线贴图", 2D) = "bump" { }

[Tex] _sweatMaskMap ("RGB:动态法线1/2/3遮罩, A:汗水遮罩", 2D) = "white" { }

[Tex] _sweatDetailMap ("RG:细节法线贴图, B:细节法线遮罩（深浅为强度）, A：青筋颜色遮罩", 2D) = "white" { }

_sweatNormalStrengthA ("动态法线1强度", Range(0, 2)) = 0.5

_sweatNormalStrengthB ("动态法线2强度", Range(0, 2)) = 0.5

_sweatNormalStrengthC ("动态法线3强度", Range(0, 2)) = 0.5

_sweatNormalColor ("青筋颜色", Color) = (0.4,0.6,0.7,1)

_sweatStrength ("汗水强度", Range(0, 1)) = 0.0

_detailNormalMapTiling ("xy:细节法线贴图缩放,z:细节法线贴图强度", Vector) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 12450
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump vec4 u_xlat16_8;
bool u_xlatb8;
vec2 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_35;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat56;
bool u_xlatb56;
float u_xlat57;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat80 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat80) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat80);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat6.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_26.xyz;
    u_xlat80 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = vec3(u_xlat80) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat16_29.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat16_7.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = u_xlat16_7.z + (-u_xlat16_8.x);
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56 = u_xlat16_77 + -1.0;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat81 = u_xlat6.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat6.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat9.x) * u_xlat16_77 + u_xlat9.x;
    u_xlat57 = u_xlat9.x * u_xlat57 + u_xlat16_77;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat9.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat57;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16_10.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_35 = u_xlat31.x * u_xlat16_10.x;
    u_xlat31.x = (-u_xlat16_10.x) * u_xlat31.x + 1.0;
    u_xlat16_10.x = u_xlat16_0.y * u_xlat16_1.x;
    u_xlat16_10.x = u_xlat16_10.x * _sweatNormalColor.w;
    u_xlat16_11.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.zxy * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat16_8.y * _metallicMultiplier;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat31.xxx * u_xlat16_12.xyz;
    u_xlat25 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_35) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_31.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xz = u_xlat16_31.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xz = min(max(u_xlat31.xz, 0.0), 1.0);
#else
    u_xlat31.xz = clamp(u_xlat31.xz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat31.xxx * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat82 * u_xlat82;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_13.x = u_xlat82 * u_xlat16_35;
    u_xlat82 = (-u_xlat16_35) * u_xlat82 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat15.xyz = vec3(u_xlat25) * u_xlat16_13.xxx + u_xlat15.xyz;
    u_xlat82 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat8 = (-u_xlat82) * u_xlat16_77 + u_xlat82;
    u_xlat8 = u_xlat82 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat82 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat8 = u_xlat57 * u_xlat8;
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat8 = min(u_xlat8, 16.0);
    u_xlat8 = u_xlat80 * u_xlat8;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat8);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat82) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_35);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat14.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat16_17.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat8 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat14.xyz = vec3(u_xlat8) * u_xlat14.xyz;
    u_xlat16_4.x = dot(u_xlat16_16.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat16_28.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat56 = u_xlat8 * u_xlat56 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_77 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat8 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat8 * u_xlat8;
    u_xlat16_4.x = u_xlat8 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat8 * u_xlat16_4.x;
    u_xlat16_88 = u_xlat8 * u_xlat16_4.x;
    u_xlat8 = (-u_xlat16_4.x) * u_xlat8 + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * vec3(u_xlat8);
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat25 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat8 = (-u_xlat25) * u_xlat16_77 + u_xlat25;
    u_xlat8 = u_xlat25 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat25 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat8;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat56 = u_xlat56 * u_xlat57;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat25) * u_xlat14.xyz;
    u_xlat16_88 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_88;
    u_xlat16_35 = max(u_xlat16_17.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_88);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_35;
    u_xlat16_16.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat14.xyz * u_xlat31.zzz + u_xlat16_13.xyz;
    u_xlat16_4.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x + u_xlat16_7.x;
    u_xlat16_4.x = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_4.xxx * u_xlat16_10.xzw;
    u_xlat16_4.x = sqrt(u_xlat16_1.x);
    u_xlat16_17.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.xxx * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_88 = (-u_xlat16_85) + u_xlat16_88;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_88 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat56 = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xz * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_4.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-u_xlat6.xxx);
    u_xlat16_19.xyz = u_xlat16_4.xxx * u_xlat16_19.xyz + u_xlat6.xxx;
    u_xlat16_19.xyz = u_xlat16_10.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = vec3(u_xlat82) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat25) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + (-vec3(u_xlat25));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat25);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-vec3(u_xlat82));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat82);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat25 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat6.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyw = vec3(u_xlat25) * u_xlat6.xyw + _sssColorBack.zxy;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat6.xyw = u_xlat6.xyw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xyw * u_xlat16_10.xyz + (-u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25 = min(u_xlat56, u_xlat16_8.z);
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat25) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat25) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_10.x = dot((-u_xlat16_29.xyz), u_xlat16_28.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat6.xyw = (-u_xlat16_28.xyz) * u_xlat16_10.xxx + (-u_xlat16_29.xyz);
    u_xlat25 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat6.xyw);
    u_xlat16_28.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51 = floor(u_xlat16_4.w);
    u_xlat16_76 = u_xlat16_51 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_4.x = u_xlat16_76 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_4.x = u_xlat16_51 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_51);
    u_xlat16_76 = (-u_xlat16_32) + u_xlat16_7.x;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76 + u_xlat16_32;
    u_xlat16_51 = u_xlat16_88 * u_xlat16_51;
    u_xlat25 = u_xlat25 * u_xlat16_51;
    u_xlat16_51 = u_xlat56 * 0.5;
    u_xlat16_76 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_51 = u_xlat25 * u_xlat16_76 + u_xlat16_51;
    u_xlat16_76 = u_xlat16_51 + u_xlat16_51;
    u_xlat16_28.x = (-u_xlat16_51) * 2.0 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_28.x + u_xlat16_76;
    u_xlat16_51 = u_xlat16_51 * u_xlat56;
    u_xlat16_51 = min(u_xlat16_51, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat9.y = u_xlat16_26.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_76);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_16.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_10.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_51) * u_xlat16_1.xyw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_10.yzx + u_xlat16_13.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_2.xyz;
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
    u_xlat75 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat2.x = u_xlat75 * 0.0625 + u_xlat2.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_25.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump vec4 u_xlat16_8;
bool u_xlatb8;
vec2 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_35;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat56;
bool u_xlatb56;
float u_xlat57;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat80 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat80) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat80);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat6.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_26.xyz;
    u_xlat80 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = vec3(u_xlat80) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat16_29.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat16_7.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = u_xlat16_7.z + (-u_xlat16_8.x);
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56 = u_xlat16_77 + -1.0;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat81 = u_xlat6.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat6.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat9.x) * u_xlat16_77 + u_xlat9.x;
    u_xlat57 = u_xlat9.x * u_xlat57 + u_xlat16_77;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat9.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat57;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16_10.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_35 = u_xlat31.x * u_xlat16_10.x;
    u_xlat31.x = (-u_xlat16_10.x) * u_xlat31.x + 1.0;
    u_xlat16_10.x = u_xlat16_0.y * u_xlat16_1.x;
    u_xlat16_10.x = u_xlat16_10.x * _sweatNormalColor.w;
    u_xlat16_11.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.zxy * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat16_8.y * _metallicMultiplier;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat31.xxx * u_xlat16_12.xyz;
    u_xlat25 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_35) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_31.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xz = u_xlat16_31.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xz = min(max(u_xlat31.xz, 0.0), 1.0);
#else
    u_xlat31.xz = clamp(u_xlat31.xz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat31.xxx * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat82 * u_xlat82;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_13.x = u_xlat82 * u_xlat16_35;
    u_xlat82 = (-u_xlat16_35) * u_xlat82 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat15.xyz = vec3(u_xlat25) * u_xlat16_13.xxx + u_xlat15.xyz;
    u_xlat82 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat8 = (-u_xlat82) * u_xlat16_77 + u_xlat82;
    u_xlat8 = u_xlat82 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat82 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat8 = u_xlat57 * u_xlat8;
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat8 = min(u_xlat8, 16.0);
    u_xlat8 = u_xlat80 * u_xlat8;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat8);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat82) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_35);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat14.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat16_17.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat8 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat14.xyz = vec3(u_xlat8) * u_xlat14.xyz;
    u_xlat16_4.x = dot(u_xlat16_16.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat16_28.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat56 = u_xlat8 * u_xlat56 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_77 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat8 = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat8 * u_xlat8;
    u_xlat16_4.x = u_xlat8 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat8 * u_xlat16_4.x;
    u_xlat16_88 = u_xlat8 * u_xlat16_4.x;
    u_xlat8 = (-u_xlat16_4.x) * u_xlat8 + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * vec3(u_xlat8);
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat25 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat8 = (-u_xlat25) * u_xlat16_77 + u_xlat25;
    u_xlat8 = u_xlat25 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat25 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat8;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat56 = u_xlat56 * u_xlat57;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat25) * u_xlat14.xyz;
    u_xlat16_88 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_88;
    u_xlat16_35 = max(u_xlat16_17.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_88);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_35;
    u_xlat16_16.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat14.xyz * u_xlat31.zzz + u_xlat16_13.xyz;
    u_xlat16_4.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x + u_xlat16_7.x;
    u_xlat16_4.x = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_4.xxx * u_xlat16_10.xzw;
    u_xlat16_4.x = sqrt(u_xlat16_1.x);
    u_xlat16_17.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.xxx * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_88 = (-u_xlat16_85) + u_xlat16_88;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_88 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat56 = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xz * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_4.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-u_xlat6.xxx);
    u_xlat16_19.xyz = u_xlat16_4.xxx * u_xlat16_19.xyz + u_xlat6.xxx;
    u_xlat16_19.xyz = u_xlat16_10.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = vec3(u_xlat82) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat25) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + (-vec3(u_xlat25));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat25);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-vec3(u_xlat82));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat82);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat25 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat6.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyw = vec3(u_xlat25) * u_xlat6.xyw + _sssColorBack.zxy;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat6.xyw = u_xlat6.xyw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xyw * u_xlat16_10.xyz + (-u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25 = min(u_xlat56, u_xlat16_8.z);
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat25) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat25) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_10.x = dot((-u_xlat16_29.xyz), u_xlat16_28.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat6.xyw = (-u_xlat16_28.xyz) * u_xlat16_10.xxx + (-u_xlat16_29.xyz);
    u_xlat25 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat6.xyw);
    u_xlat16_28.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51 = floor(u_xlat16_4.w);
    u_xlat16_76 = u_xlat16_51 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_4.x = u_xlat16_76 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_4.x = u_xlat16_51 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_51);
    u_xlat16_76 = (-u_xlat16_32) + u_xlat16_7.x;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76 + u_xlat16_32;
    u_xlat16_51 = u_xlat16_88 * u_xlat16_51;
    u_xlat25 = u_xlat25 * u_xlat16_51;
    u_xlat16_51 = u_xlat56 * 0.5;
    u_xlat16_76 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_51 = u_xlat25 * u_xlat16_76 + u_xlat16_51;
    u_xlat16_76 = u_xlat16_51 + u_xlat16_51;
    u_xlat16_28.x = (-u_xlat16_51) * 2.0 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_28.x + u_xlat16_76;
    u_xlat16_51 = u_xlat16_51 * u_xlat56;
    u_xlat16_51 = min(u_xlat16_51, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat9.y = u_xlat16_26.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_76);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_16.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_10.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_51) * u_xlat16_1.xyw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_10.yzx + u_xlat16_13.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_2.xyz;
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
    u_xlat75 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat2.x = u_xlat75 * 0.0625 + u_xlat2.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_25.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(13) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
int u_xlati28;
float u_xlat29;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_57;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat84;
float u_xlat85;
bool u_xlatb85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
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
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33 = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_33 = u_xlat16_28.z * _shadowStrength;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33 = max(u_xlat16_33, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_33;
    u_xlat16_14.xyz = vec3(u_xlat16_33) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_33 = u_xlat16_29.z + (-u_xlat16_2.x);
    u_xlat16_33 = u_xlat16_89 * u_xlat16_33 + u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_91 * u_xlat16_33;
    u_xlat16_43.x = u_xlat16_33 * _roughnessMultiplier;
    u_xlat16_33 = u_xlat16_43.x * u_xlat16_43.x;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat85 = (-u_xlat1.x) * u_xlat16_33 + u_xlat1.x;
    u_xlat85 = u_xlat1.x * u_xlat85 + u_xlat16_33;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat1.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_61 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_61);
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat4.x) * u_xlat16_33 + u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x + u_xlat16_33;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat4.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_13.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat9.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_91) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat88 = u_xlat16_33 + -1.0;
    u_xlat87 = u_xlat87 * u_xlat88 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_33 / u_xlat87;
    u_xlat87 = u_xlat87 * 0.318309873;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat85 = u_xlat85 * u_xlat87;
    u_xlat16_91 = u_xlat60 * u_xlat60;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_96 = u_xlat60 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat60 + 1.0;
    u_xlat16_91 = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_91 = u_xlat16_91 * _sweatNormalColor.w;
    u_xlat16_13.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_91) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_8.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_8.zxy * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_91 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat16_17.xyz;
    u_xlat86 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat85) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat28.xxx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat10.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_96 = u_xlat87 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat10.xyz = u_xlat16_17.xyz * vec3(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat10.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat87) * u_xlat16_33 + u_xlat87;
    u_xlat60 = u_xlat87 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat87 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat2.x * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat85 = u_xlat85 * u_xlat60;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = u_xlat9.xyz * vec3(u_xlat16_96);
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb85 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_20.xy = (bool(u_xlatb85)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_19.xyz;
    u_xlat85 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat3.xyz = vec3(u_xlat85) * u_xlat3.xyz;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat3.x = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat3.x * u_xlat3.x;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_96 = u_xlat3.x * u_xlat16_61;
    u_xlat3.x = (-u_xlat16_61) * u_xlat3.x + 1.0;
    u_xlat3.xyz = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat3.xyz;
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat60 = (-u_xlat86) * u_xlat16_33 + u_xlat86;
    u_xlat60 = u_xlat86 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat86 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat60;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.zxy;
    u_xlat3.xyz = vec3(u_xlat86) * u_xlat3.xyz;
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = float(1.0) / float(u_xlat16_91);
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_91 = max(u_xlat16_20.x, u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb85 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_96 = (u_xlatb85) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_19.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_20.xyz = vec3(u_xlat16_61) * u_xlat16_20.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_91 = (-u_xlat16_61) + u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_91 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_61;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_96 = sqrt(u_xlat16_61);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_61));
    u_xlat16_21.xyz = u_xlat16_12.xyz * vec3(u_xlat16_96);
    u_xlat16_22.xy = u_xlat28.xy * vec2(u_xlat16_96);
    u_xlat16_61 = (-u_xlat16_29.x) + u_xlat16_29.y;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat16_29.x;
    u_xlat16_89 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_89;
    u_xlat16_89 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat16_89) * u_xlat16_13.xyz;
    u_xlat16_89 = sqrt(u_xlat16_61);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_89) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_89) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat87) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_27.xyz * u_xlat16_21.xyz + (-vec3(u_xlat87));
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + vec3(u_xlat87);
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz + (-vec3(u_xlat86));
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(u_xlat86);
    u_xlat16_23.xyz = u_xlat16_13.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xzw + (-u_xlat1.xxx);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat1.xxx;
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat28.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_19.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat1.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat1.xyz = u_xlat28.xxx * u_xlat1.xyz + _sssColorBack.zxy;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_43.zzz * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_89 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_89 = u_xlat16_89 + u_xlat16_89;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_89) + (-u_xlat16_16.xyz);
    u_xlat1.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = dot(u_xlat16_20.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_43.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_89 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_89 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_89 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_89 = u_xlat16_7.z * 15.0 + (-u_xlat16_89);
    u_xlat16_7.x = (-u_xlat16_57) + u_xlat16_29.x;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_7.x + u_xlat16_57;
    u_xlat16_89 = u_xlat16_91 * u_xlat16_89;
    u_xlat1.x = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_7.x + u_xlat16_89;
    u_xlat16_7.x = u_xlat16_89 + u_xlat16_89;
    u_xlat16_35 = (-u_xlat16_89) * 2.0 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_35 + u_xlat16_7.x;
    u_xlat16_89 = u_xlat0.w * u_xlat16_89;
    u_xlat16_89 = min(u_xlat16_2.z, u_xlat16_89);
    u_xlat1.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_33) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_43.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_43.x);
    u_xlat4.y = u_xlat16_43.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_14.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_13.yzx + u_xlat16_18.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.zxy;
    u_xlat16_12.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_28.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_28.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_28.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_33;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(13) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
int u_xlati28;
float u_xlat29;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_57;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat84;
float u_xlat85;
bool u_xlatb85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
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
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33 = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_33 = u_xlat16_28.z * _shadowStrength;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33 = max(u_xlat16_33, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_33;
    u_xlat16_14.xyz = vec3(u_xlat16_33) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_33 = u_xlat16_29.z + (-u_xlat16_2.x);
    u_xlat16_33 = u_xlat16_89 * u_xlat16_33 + u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_91 * u_xlat16_33;
    u_xlat16_43.x = u_xlat16_33 * _roughnessMultiplier;
    u_xlat16_33 = u_xlat16_43.x * u_xlat16_43.x;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat85 = (-u_xlat1.x) * u_xlat16_33 + u_xlat1.x;
    u_xlat85 = u_xlat1.x * u_xlat85 + u_xlat16_33;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat1.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_61 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_61);
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat4.x) * u_xlat16_33 + u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x + u_xlat16_33;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat4.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_13.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat9.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_91) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat88 = u_xlat16_33 + -1.0;
    u_xlat87 = u_xlat87 * u_xlat88 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_33 / u_xlat87;
    u_xlat87 = u_xlat87 * 0.318309873;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat85 = u_xlat85 * u_xlat87;
    u_xlat16_91 = u_xlat60 * u_xlat60;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_96 = u_xlat60 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat60 + 1.0;
    u_xlat16_91 = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_91 = u_xlat16_91 * _sweatNormalColor.w;
    u_xlat16_13.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_91) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_8.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_8.zxy * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_91 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat16_17.xyz;
    u_xlat86 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat85) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat28.xxx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat10.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_96 = u_xlat87 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat10.xyz = u_xlat16_17.xyz * vec3(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat10.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat87) * u_xlat16_33 + u_xlat87;
    u_xlat60 = u_xlat87 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat87 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat2.x * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat85 = u_xlat85 * u_xlat60;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = u_xlat9.xyz * vec3(u_xlat16_96);
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb85 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_20.xy = (bool(u_xlatb85)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_19.xyz;
    u_xlat85 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat3.xyz = vec3(u_xlat85) * u_xlat3.xyz;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat3.x = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat3.x * u_xlat3.x;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_96 = u_xlat3.x * u_xlat16_61;
    u_xlat3.x = (-u_xlat16_61) * u_xlat3.x + 1.0;
    u_xlat3.xyz = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat3.xyz;
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat60 = (-u_xlat86) * u_xlat16_33 + u_xlat86;
    u_xlat60 = u_xlat86 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat86 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat60;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.zxy;
    u_xlat3.xyz = vec3(u_xlat86) * u_xlat3.xyz;
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = float(1.0) / float(u_xlat16_91);
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_91 = max(u_xlat16_20.x, u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb85 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_96 = (u_xlatb85) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_19.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_20.xyz = vec3(u_xlat16_61) * u_xlat16_20.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_91 = (-u_xlat16_61) + u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_91 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_61;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_96 = sqrt(u_xlat16_61);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_61));
    u_xlat16_21.xyz = u_xlat16_12.xyz * vec3(u_xlat16_96);
    u_xlat16_22.xy = u_xlat28.xy * vec2(u_xlat16_96);
    u_xlat16_61 = (-u_xlat16_29.x) + u_xlat16_29.y;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat16_29.x;
    u_xlat16_89 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_89;
    u_xlat16_89 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat16_89) * u_xlat16_13.xyz;
    u_xlat16_89 = sqrt(u_xlat16_61);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_89) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_89) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat87) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_27.xyz * u_xlat16_21.xyz + (-vec3(u_xlat87));
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + vec3(u_xlat87);
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz + (-vec3(u_xlat86));
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(u_xlat86);
    u_xlat16_23.xyz = u_xlat16_13.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xzw + (-u_xlat1.xxx);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat1.xxx;
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat28.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_19.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat1.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat1.xyz = u_xlat28.xxx * u_xlat1.xyz + _sssColorBack.zxy;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_43.zzz * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_89 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_89 = u_xlat16_89 + u_xlat16_89;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_89) + (-u_xlat16_16.xyz);
    u_xlat1.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = dot(u_xlat16_20.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_43.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_89 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_89 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_89 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_89 = u_xlat16_7.z * 15.0 + (-u_xlat16_89);
    u_xlat16_7.x = (-u_xlat16_57) + u_xlat16_29.x;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_7.x + u_xlat16_57;
    u_xlat16_89 = u_xlat16_91 * u_xlat16_89;
    u_xlat1.x = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_7.x + u_xlat16_89;
    u_xlat16_7.x = u_xlat16_89 + u_xlat16_89;
    u_xlat16_35 = (-u_xlat16_89) * 2.0 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_35 + u_xlat16_7.x;
    u_xlat16_89 = u_xlat0.w * u_xlat16_89;
    u_xlat16_89 = min(u_xlat16_2.z, u_xlat16_89);
    u_xlat1.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_33) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_43.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_43.x);
    u_xlat4.y = u_xlat16_43.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_14.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_13.yzx + u_xlat16_18.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.zxy;
    u_xlat16_12.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_28.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_28.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_28.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_33;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
int u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec3 u_xlat30;
ivec3 u_xlati30;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_35;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat56;
float u_xlat57;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat80 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat80) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat80);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat6.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_26.xyz;
    u_xlat80 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = vec3(u_xlat80) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat16_29.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat16_7.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = u_xlat16_7.z + (-u_xlat16_8.x);
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56 = u_xlat16_77 + -1.0;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat81 = u_xlat6.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat6.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat9.x) * u_xlat16_77 + u_xlat9.x;
    u_xlat57 = u_xlat9.x * u_xlat57 + u_xlat16_77;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat9.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat57;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16_10.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_35 = u_xlat31.x * u_xlat16_10.x;
    u_xlat31.x = (-u_xlat16_10.x) * u_xlat31.x + 1.0;
    u_xlat16_10.x = u_xlat16_0.y * u_xlat16_1.x;
    u_xlat16_10.x = u_xlat16_10.x * _sweatNormalColor.w;
    u_xlat16_11.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat16_8.y * _metallicMultiplier;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat31.xxx * u_xlat16_12.xyz;
    u_xlat25 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_35) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_31.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xz = u_xlat16_31.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xz = min(max(u_xlat31.xz, 0.0), 1.0);
#else
    u_xlat31.xz = clamp(u_xlat31.xz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat31.xxx * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat82 * u_xlat82;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_13.x = u_xlat82 * u_xlat16_35;
    u_xlat82 = (-u_xlat16_35) * u_xlat82 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat15.xyz = vec3(u_xlat25) * u_xlat16_13.xxx + u_xlat15.xyz;
    u_xlat82 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat8 = (-u_xlat82) * u_xlat16_77 + u_xlat82;
    u_xlat8 = u_xlat82 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat82 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat8 = u_xlat57 * u_xlat8;
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat8 = min(u_xlat8, 16.0);
    u_xlat80 = u_xlat80 * u_xlat8;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat82) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_35);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat14.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat16_17.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat5.xyz = vec3(u_xlat80) * u_xlat5.xyz;
    u_xlat16_4.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat56 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_77 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat30.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat30.x * u_xlat30.x;
    u_xlat16_4.x = u_xlat30.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat30.x * u_xlat16_4.x;
    u_xlat16_88 = u_xlat30.x * u_xlat16_4.x;
    u_xlat30.x = (-u_xlat16_4.x) * u_xlat30.x + 1.0;
    u_xlat30.xyz = u_xlat16_12.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat25) * vec3(u_xlat16_88) + u_xlat30.xyz;
    u_xlat25 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat56 = (-u_xlat25) * u_xlat16_77 + u_xlat25;
    u_xlat56 = u_xlat25 * u_xlat56 + u_xlat16_77;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat25 + u_xlat56;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat56 * u_xlat57;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat5.x = u_xlat5.x * u_xlat56;
    u_xlat5.xyz = u_xlat30.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
    u_xlat16_88 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_88;
    u_xlat16_35 = max(u_xlat16_17.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_88);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_35;
    u_xlat16_16.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * u_xlat31.zzz + u_xlat16_13.xyz;
    u_xlat16_4.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x + u_xlat16_7.x;
    u_xlat16_4.x = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_4.xxx * u_xlat16_10.xzw;
    u_xlat16_4.x = sqrt(u_xlat16_1.x);
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.xxx * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_88 = (-u_xlat16_85) + u_xlat16_88;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_88 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat5.x = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xz * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_4.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-u_xlat6.xxx);
    u_xlat16_19.xyz = u_xlat16_4.xxx * u_xlat16_19.xyz + u_xlat6.xxx;
    u_xlat16_19.xyz = u_xlat16_10.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = vec3(u_xlat82) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat25) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + (-vec3(u_xlat25));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat25);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-vec3(u_xlat82));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat82);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat25 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat30.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat30.xyz = vec3(u_xlat25) * u_xlat30.xyz + _sssColorBack.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat30.xyz * u_xlat16_10.xyz + (-u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25 = min(u_xlat5.x, u_xlat16_8.z);
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat25) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat25) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati30.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati30.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati30.x) & 1u));
    u_xlati30.x = (u_xlati30.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati30.x].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat16_29.xyz), u_xlat16_28.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat30.xyz = (-u_xlat16_28.xyz) * u_xlat16_4.xxx + (-u_xlat16_29.xyz);
    u_xlat25 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat30.xyz);
    u_xlat16_28.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51 = floor(u_xlat16_4.w);
    u_xlat16_76 = u_xlat16_51 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_4.x = u_xlat16_76 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_4.x = u_xlat16_51 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_51);
    u_xlat16_76 = (-u_xlat16_31.x) + u_xlat16_6;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76 + u_xlat16_31.x;
    u_xlat16_51 = u_xlat16_88 * u_xlat16_51;
    u_xlat25 = u_xlat25 * u_xlat16_51;
    u_xlat16_51 = u_xlat5.x * 0.5;
    u_xlat16_76 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_51 = u_xlat25 * u_xlat16_76 + u_xlat16_51;
    u_xlat16_76 = u_xlat16_51 + u_xlat16_51;
    u_xlat16_28.x = (-u_xlat16_51) * 2.0 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_28.x + u_xlat16_76;
    u_xlat16_51 = u_xlat16_51 * u_xlat5.x;
    u_xlat16_51 = min(u_xlat16_51, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat30.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat0.xyz + u_xlat30.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat9.y = u_xlat16_26.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_4.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_76);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_51) * u_xlat16_1.xyw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
int u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec3 u_xlat30;
ivec3 u_xlati30;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_35;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat56;
float u_xlat57;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat80 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat80) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat80);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat6.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_26.xyz;
    u_xlat80 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat6.xyz = vec3(u_xlat80) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat16_29.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat16_7.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = u_xlat16_7.z + (-u_xlat16_8.x);
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56 = u_xlat16_77 + -1.0;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat81 = u_xlat6.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat6.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat9.x) * u_xlat16_77 + u_xlat9.x;
    u_xlat57 = u_xlat9.x * u_xlat57 + u_xlat16_77;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat9.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat57;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16_10.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat31.x * u_xlat16_10.x;
    u_xlat16_35 = u_xlat31.x * u_xlat16_10.x;
    u_xlat31.x = (-u_xlat16_10.x) * u_xlat31.x + 1.0;
    u_xlat16_10.x = u_xlat16_0.y * u_xlat16_1.x;
    u_xlat16_10.x = u_xlat16_10.x * _sweatNormalColor.w;
    u_xlat16_11.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat16_8.y * _metallicMultiplier;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat31.xxx * u_xlat16_12.xyz;
    u_xlat25 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat25) * vec3(u_xlat16_35) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_31.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xz = u_xlat16_31.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xz = min(max(u_xlat31.xz, 0.0), 1.0);
#else
    u_xlat31.xz = clamp(u_xlat31.xz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat31.xxx * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat16_28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat56 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_77 / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat82 * u_xlat82;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_35 = u_xlat82 * u_xlat16_35;
    u_xlat16_13.x = u_xlat82 * u_xlat16_35;
    u_xlat82 = (-u_xlat16_35) * u_xlat82 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat15.xyz = vec3(u_xlat25) * u_xlat16_13.xxx + u_xlat15.xyz;
    u_xlat82 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat8 = (-u_xlat82) * u_xlat16_77 + u_xlat82;
    u_xlat8 = u_xlat82 * u_xlat8 + u_xlat16_77;
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = u_xlat82 + u_xlat8;
    u_xlat8 = u_xlat8 + 6.10351563e-05;
    u_xlat8 = u_xlat57 * u_xlat8;
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat8 = min(u_xlat8, 16.0);
    u_xlat80 = u_xlat80 * u_xlat8;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat82) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_35);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat14.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat16_17.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat5.xyz = vec3(u_xlat80) * u_xlat5.xyz;
    u_xlat16_4.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat56 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_77 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat30.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat30.x * u_xlat30.x;
    u_xlat16_4.x = u_xlat30.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat30.x * u_xlat16_4.x;
    u_xlat16_88 = u_xlat30.x * u_xlat16_4.x;
    u_xlat30.x = (-u_xlat16_4.x) * u_xlat30.x + 1.0;
    u_xlat30.xyz = u_xlat16_12.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat25) * vec3(u_xlat16_88) + u_xlat30.xyz;
    u_xlat25 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat56 = (-u_xlat25) * u_xlat16_77 + u_xlat25;
    u_xlat56 = u_xlat25 * u_xlat56 + u_xlat16_77;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat25 + u_xlat56;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat56 * u_xlat57;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat5.x = u_xlat5.x * u_xlat56;
    u_xlat5.xyz = u_xlat30.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
    u_xlat16_88 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_88;
    u_xlat16_35 = max(u_xlat16_17.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_88);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_35;
    u_xlat16_16.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * u_xlat31.zzz + u_xlat16_13.xyz;
    u_xlat16_4.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x + u_xlat16_7.x;
    u_xlat16_4.x = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_4.xxx * u_xlat16_10.xzw;
    u_xlat16_4.x = sqrt(u_xlat16_1.x);
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.xxx * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_88 = (-u_xlat16_85) + u_xlat16_88;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_88 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat5.x = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xz * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_4.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-u_xlat6.xxx);
    u_xlat16_19.xyz = u_xlat16_4.xxx * u_xlat16_19.xyz + u_xlat6.xxx;
    u_xlat16_19.xyz = u_xlat16_10.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = vec3(u_xlat82) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat25) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + (-vec3(u_xlat25));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat25);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-vec3(u_xlat82));
    u_xlat16_17.xyz = u_xlat16_4.xxx * u_xlat16_17.xyz + vec3(u_xlat82);
    u_xlat16_17.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat25 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat30.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat30.xyz = vec3(u_xlat25) * u_xlat30.xyz + _sssColorBack.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat30.xyz * u_xlat16_10.xyz + (-u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25 = min(u_xlat5.x, u_xlat16_8.z);
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat25) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat25) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat25) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati30.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati30.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati30.x) & 1u));
    u_xlati30.x = (u_xlati30.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati30.x].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat16_29.xyz), u_xlat16_28.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat30.xyz = (-u_xlat16_28.xyz) * u_xlat16_4.xxx + (-u_xlat16_29.xyz);
    u_xlat25 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat30.xyz);
    u_xlat16_28.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51 = floor(u_xlat16_4.w);
    u_xlat16_76 = u_xlat16_51 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_4.x = u_xlat16_76 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_4.x = u_xlat16_51 * 16.0 + u_xlat16_4.z;
    u_xlat16_28.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_51);
    u_xlat16_76 = (-u_xlat16_31.x) + u_xlat16_6;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76 + u_xlat16_31.x;
    u_xlat16_51 = u_xlat16_88 * u_xlat16_51;
    u_xlat25 = u_xlat25 * u_xlat16_51;
    u_xlat16_51 = u_xlat5.x * 0.5;
    u_xlat16_76 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_51 = u_xlat25 * u_xlat16_76 + u_xlat16_51;
    u_xlat16_76 = u_xlat16_51 + u_xlat16_51;
    u_xlat16_28.x = (-u_xlat16_51) * 2.0 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_28.x + u_xlat16_76;
    u_xlat16_51 = u_xlat16_51 * u_xlat5.x;
    u_xlat16_51 = min(u_xlat16_51, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat30.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat0.xyz + u_xlat30.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat9.y = u_xlat16_26.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_4.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_76);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_10.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_51) * u_xlat16_1.xyw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
int u_xlati28;
float u_xlat29;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_57;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat85;
bool u_xlatb85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
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
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33 = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_33 = u_xlat16_28.z * _shadowStrength;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33 = max(u_xlat16_33, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_33;
    u_xlat16_14.xyz = vec3(u_xlat16_33) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_33 = u_xlat16_29.z + (-u_xlat16_2.x);
    u_xlat16_33 = u_xlat16_89 * u_xlat16_33 + u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_91 * u_xlat16_33;
    u_xlat16_43.x = u_xlat16_33 * _roughnessMultiplier;
    u_xlat16_33 = u_xlat16_43.x * u_xlat16_43.x;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat85 = (-u_xlat1.x) * u_xlat16_33 + u_xlat1.x;
    u_xlat85 = u_xlat1.x * u_xlat85 + u_xlat16_33;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat1.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_61 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_61);
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat4.x) * u_xlat16_33 + u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x + u_xlat16_33;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat4.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_13.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat9.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_91) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat88 = u_xlat16_33 + -1.0;
    u_xlat87 = u_xlat87 * u_xlat88 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_33 / u_xlat87;
    u_xlat87 = u_xlat87 * 0.318309873;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat85 = u_xlat85 * u_xlat87;
    u_xlat16_91 = u_xlat60 * u_xlat60;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_96 = u_xlat60 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat60 + 1.0;
    u_xlat16_91 = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_91 = u_xlat16_91 * _sweatNormalColor.w;
    u_xlat16_13.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_91) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_8.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_8.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_91 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat16_17.xyz;
    u_xlat86 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat85) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat28.xxx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat10.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_96 = u_xlat87 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat10.xyz = u_xlat16_17.xyz * vec3(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat10.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat87) * u_xlat16_33 + u_xlat87;
    u_xlat60 = u_xlat87 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat87 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat2.x * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat85 = u_xlat85 * u_xlat60;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = u_xlat9.xyz * vec3(u_xlat16_96);
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb85 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_20.xy = (bool(u_xlatb85)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_19.xyz;
    u_xlat85 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat3.xyz = vec3(u_xlat85) * u_xlat3.xyz;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat3.x = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat3.x * u_xlat3.x;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_96 = u_xlat3.x * u_xlat16_61;
    u_xlat3.x = (-u_xlat16_61) * u_xlat3.x + 1.0;
    u_xlat3.xyz = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat3.xyz;
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat60 = (-u_xlat86) * u_xlat16_33 + u_xlat86;
    u_xlat60 = u_xlat86 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat86 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat60;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat86) * u_xlat3.xyz;
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = float(1.0) / float(u_xlat16_91);
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_91 = max(u_xlat16_20.x, u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb85 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_96 = (u_xlatb85) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_19.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_20.xyz = vec3(u_xlat16_61) * u_xlat16_20.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_91 = (-u_xlat16_61) + u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_91 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_61;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_96 = sqrt(u_xlat16_61);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_61));
    u_xlat16_21.xyz = u_xlat16_12.xyz * vec3(u_xlat16_96);
    u_xlat16_22.xy = u_xlat28.xy * vec2(u_xlat16_96);
    u_xlat16_61 = (-u_xlat16_29.x) + u_xlat16_29.y;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat16_29.x;
    u_xlat16_89 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_89;
    u_xlat16_89 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat16_89) * u_xlat16_13.xyz;
    u_xlat16_89 = sqrt(u_xlat16_61);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_89) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_89) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat87) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_27.xyz * u_xlat16_21.xyz + (-vec3(u_xlat87));
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + vec3(u_xlat87);
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz + (-vec3(u_xlat86));
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(u_xlat86);
    u_xlat16_23.xyz = u_xlat16_13.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xzw + (-u_xlat1.xxx);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat1.xxx;
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat28.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_19.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = u_xlat28.xxx * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_43.zzz * u_xlat16_14.xyz + _sssColorOcc.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_89 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_89 = u_xlat16_89 + u_xlat16_89;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_89) + (-u_xlat16_16.xyz);
    u_xlat1.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = dot(u_xlat16_20.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_43.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_89 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_89 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_89 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_89 = u_xlat16_7.z * 15.0 + (-u_xlat16_89);
    u_xlat16_7.x = (-u_xlat16_57) + u_xlat16_29.x;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_7.x + u_xlat16_57;
    u_xlat16_89 = u_xlat16_91 * u_xlat16_89;
    u_xlat1.x = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_7.x + u_xlat16_89;
    u_xlat16_7.x = u_xlat16_89 + u_xlat16_89;
    u_xlat16_35 = (-u_xlat16_89) * 2.0 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_35 + u_xlat16_7.x;
    u_xlat16_89 = u_xlat0.w * u_xlat16_89;
    u_xlat16_89 = min(u_xlat16_2.z, u_xlat16_89);
    u_xlat1.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_33) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_43.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_43.x);
    u_xlat4.y = u_xlat16_43.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_14.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_18.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_33;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
int u_xlati28;
float u_xlat29;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_43;
mediump float u_xlat16_57;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat85;
bool u_xlatb85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
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
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33 = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_33 = u_xlat16_28.z * _shadowStrength;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33 = max(u_xlat16_33, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33 = u_xlat16_61 * u_xlat16_33;
    u_xlat16_14.xyz = vec3(u_xlat16_33) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_33 = u_xlat16_29.z + (-u_xlat16_2.x);
    u_xlat16_33 = u_xlat16_89 * u_xlat16_33 + u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_91 * u_xlat16_33;
    u_xlat16_43.x = u_xlat16_33 * _roughnessMultiplier;
    u_xlat16_33 = u_xlat16_43.x * u_xlat16_43.x;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat85 = (-u_xlat1.x) * u_xlat16_33 + u_xlat1.x;
    u_xlat85 = u_xlat1.x * u_xlat85 + u_xlat16_33;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat1.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_61 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_61);
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat4.x) * u_xlat16_33 + u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x + u_xlat16_33;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat4.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_13.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat9.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_91) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat88 = u_xlat16_33 + -1.0;
    u_xlat87 = u_xlat87 * u_xlat88 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_33 / u_xlat87;
    u_xlat87 = u_xlat87 * 0.318309873;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat85 = u_xlat85 * u_xlat87;
    u_xlat16_91 = u_xlat60 * u_xlat60;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_91 = u_xlat60 * u_xlat16_91;
    u_xlat16_96 = u_xlat60 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat60 + 1.0;
    u_xlat16_91 = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_91 = u_xlat16_91 * _sweatNormalColor.w;
    u_xlat16_13.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_91) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_8.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_8.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_91 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat87) * u_xlat16_17.xyz;
    u_xlat86 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat85) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat28.xxx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat10.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_96 = u_xlat87 * u_xlat16_91;
    u_xlat87 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat10.xyz = u_xlat16_17.xyz * vec3(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat10.xyz;
    u_xlat87 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat87) * u_xlat16_33 + u_xlat87;
    u_xlat60 = u_xlat87 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat87 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat2.x * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat85 = u_xlat85 * u_xlat60;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = u_xlat9.xyz * vec3(u_xlat16_96);
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb85 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_20.xy = (bool(u_xlatb85)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_61) + u_xlat16_19.xyz;
    u_xlat85 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat3.xyz = vec3(u_xlat85) * u_xlat3.xyz;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat16_7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat85 * u_xlat88 + 1.0;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat85 = u_xlat16_33 / u_xlat85;
    u_xlat85 = u_xlat85 * 0.318309873;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat3.x = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat3.x * u_xlat3.x;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_61 = u_xlat3.x * u_xlat16_61;
    u_xlat16_96 = u_xlat3.x * u_xlat16_61;
    u_xlat3.x = (-u_xlat16_61) * u_xlat3.x + 1.0;
    u_xlat3.xyz = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyz = vec3(u_xlat86) * vec3(u_xlat16_96) + u_xlat3.xyz;
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat60 = (-u_xlat86) * u_xlat16_33 + u_xlat86;
    u_xlat60 = u_xlat86 * u_xlat60 + u_xlat16_33;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat86 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat60;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat85 = u_xlat85 * u_xlat2.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat85);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat86) * u_xlat3.xyz;
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = float(1.0) / float(u_xlat16_91);
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_91 = max(u_xlat16_20.x, u_xlat16_91);
#ifdef UNITY_ADRENO_ES3
    u_xlatb85 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb85 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_96 = (u_xlatb85) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_19.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_occlusionScale) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_20.xyz = vec3(u_xlat16_61) * u_xlat16_20.xyz;
    u_xlat16_61 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_91 = (-u_xlat16_61) + u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_91 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_43.z * u_xlat16_61;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_91;
    u_xlat16_96 = sqrt(u_xlat16_61);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_61));
    u_xlat16_21.xyz = u_xlat16_12.xyz * vec3(u_xlat16_96);
    u_xlat16_22.xy = u_xlat28.xy * vec2(u_xlat16_96);
    u_xlat16_61 = (-u_xlat16_29.x) + u_xlat16_29.y;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat16_29.x;
    u_xlat16_89 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_89;
    u_xlat16_89 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = vec3(u_xlat16_89) * u_xlat16_13.xyz;
    u_xlat16_89 = sqrt(u_xlat16_61);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_89) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_89) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat87) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_27.xyz * u_xlat16_21.xyz + (-vec3(u_xlat87));
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + vec3(u_xlat87);
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz + (-vec3(u_xlat86));
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_23.xyz + vec3(u_xlat86);
    u_xlat16_23.xyz = u_xlat16_13.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xzw + (-u_xlat1.xxx);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat1.xxx;
    u_xlat16_21.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat28.yyy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_19.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = u_xlat28.xxx * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_43.zzz * u_xlat16_14.xyz + _sssColorOcc.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_89 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_89 = u_xlat16_89 + u_xlat16_89;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_89) + (-u_xlat16_16.xyz);
    u_xlat1.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = dot(u_xlat16_20.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_43.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_89 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_89 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_89 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_89 = u_xlat16_7.z * 15.0 + (-u_xlat16_89);
    u_xlat16_7.x = (-u_xlat16_57) + u_xlat16_29.x;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_7.x + u_xlat16_57;
    u_xlat16_89 = u_xlat16_91 * u_xlat16_89;
    u_xlat1.x = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_7.x + u_xlat16_89;
    u_xlat16_7.x = u_xlat16_89 + u_xlat16_89;
    u_xlat16_35 = (-u_xlat16_89) * 2.0 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_35 + u_xlat16_7.x;
    u_xlat16_89 = u_xlat0.w * u_xlat16_89;
    u_xlat16_89 = min(u_xlat16_2.z, u_xlat16_89);
    u_xlat1.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_33) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_43.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_43.x);
    u_xlat4.y = u_xlat16_43.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_14.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_18.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_33;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec4 u_xlat7;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_19;
int u_xlati19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_58 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_58 = min(u_xlat16_58, 1.0);
    u_xlat16_58 = (-u_xlat16_58) + 1.0;
    u_xlat16_58 = sqrt(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_59 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_41 = u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_59) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_41 * u_xlat16_58 + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_59 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat62) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.x = (-u_xlat16_24.x) + u_xlat16_24.y;
    u_xlat16_4.x = u_xlat16_58 * u_xlat16_4.x + u_xlat16_24.x;
    u_xlat16_23.x = _sssIntensity * _sssIntensity;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_23.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.x = u_xlat16_23.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_42 = sqrt(u_xlat16_4.x);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_42) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat16_22.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_61) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_65 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_61;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_65;
    u_xlat16_66 = sqrt(u_xlat16_61);
    u_xlat24 = min(u_xlat16_61, 1.0);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xy = u_xlat7.xy * vec2(u_xlat16_66);
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_42) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xzw = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xzw + (-u_xlat5.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + u_xlat5.xxx;
    u_xlat16_61 = u_xlat16_0.y * u_xlat16_58;
    u_xlat16_61 = u_xlat16_61 * _sweatNormalColor.w;
    u_xlat16_12.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_14.zxy * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_23.xxx * u_xlat16_17.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat7.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat5.xxx * u_xlat16_1.xyz;
    u_xlat19 = dot(u_xlat16_22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + (-vec3(u_xlat19));
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + vec3(u_xlat19);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_23.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_61);
    u_xlat16_9.xyz = u_xlat7.xzw * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.yyy + u_xlat16_17.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_9.x;
    u_xlat16_61 = max(u_xlat16_13.x, u_xlat16_61);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_61;
    u_xlat16_9.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + (-u_xlat5.xxx);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + u_xlat5.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_2.x = u_xlat16_24.z + (-u_xlat16_6.x);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x + u_xlat16_6.x;
    u_xlat16_58 = u_xlat16_59 * u_xlat16_58;
    u_xlat16_30.x = u_xlat16_58 * _roughnessMultiplier;
    u_xlat16_58 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat5.x = (-u_xlat19) * u_xlat16_58 + u_xlat19;
    u_xlat5.x = u_xlat19 * u_xlat5.x + u_xlat16_58;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat19 + u_xlat5.x;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_21.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat18.x) * u_xlat16_58 + u_xlat18.x;
    u_xlat43 = u_xlat18.x * u_xlat43 + u_xlat16_58;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat5.z = u_xlat43 + u_xlat18.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat43 = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_2.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_2.x) + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat6.x = u_xlat16_58 + -1.0;
    u_xlat43 = u_xlat43 * u_xlat6.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat16_58 / u_xlat43;
    u_xlat5.z = u_xlat43 * 0.318309873;
    u_xlat5.xz = min(u_xlat5.xz, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat16_2.x = u_xlat62 * u_xlat62;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_23.x = u_xlat62 * u_xlat16_2.x;
    u_xlat43 = (-u_xlat16_2.x) * u_xlat62 + 1.0;
    u_xlat16_2.x = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_8.xyz;
    u_xlat43 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_23.xxx + u_xlat6.xyw;
    u_xlat5.xzw = u_xlat5.xxx * u_xlat6.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.zxy;
    u_xlat5.xzw = vec3(u_xlat19) * u_xlat5.xzw;
    u_xlat16_1.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_9.y = u_xlat16_22.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_12.y = u_xlat16_10.y;
    u_xlat19 = dot(u_xlat16_12.xyz, u_xlat16_9.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat6.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyw = vec3(u_xlat19) * u_xlat6.xyw + _sssColorBack.zxy;
    u_xlat16_23.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_30.zzz * u_xlat16_23.xyz + _sssColorOcc.zxy;
    u_xlat6.xyw = u_xlat16_23.xyz * u_xlat6.xyw;
    u_xlat16_23.xyz = u_xlat6.xyw * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_23.xyz + u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat19 = min(u_xlat24, u_xlat16_6.z);
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat19) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_13.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_21.xyz), u_xlat16_22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat6.xyw = (-u_xlat16_22.xyz) * u_xlat16_4.xxx + (-u_xlat16_21.xyz);
    u_xlat19 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_30.y = dot(u_xlat16_10.xyz, u_xlat6.xyw);
    u_xlat16_21.xyz = u_xlat16_30.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_40 = u_xlat16_21.x + 1.0;
    u_xlat16_40 = min(u_xlat16_40, 15.0);
    u_xlat16_4.x = u_xlat16_40 * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_21.x = u_xlat16_21.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_40 = (-u_xlat16_26) + u_xlat16_7.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_40 + u_xlat16_26;
    u_xlat16_21.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat19 = u_xlat19 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat24 * 0.5;
    u_xlat16_40 = (-u_xlat24) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat19 * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_40 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_59 = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_59 + u_xlat16_40;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat24;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_6.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_58) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_58 = u_xlat16_30.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_30.x);
    u_xlat18.y = u_xlat16_30.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_58);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_2.xzw : u_xlat16_8.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xxx * u_xlat16_2.xzw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat5.zwx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_14.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat3.x = u_xlat57 * 0.0625 + u_xlat3.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_19.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec4 u_xlat7;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_19;
int u_xlati19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_58 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_58 = min(u_xlat16_58, 1.0);
    u_xlat16_58 = (-u_xlat16_58) + 1.0;
    u_xlat16_58 = sqrt(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_59 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_41 = u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_59) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_41 * u_xlat16_58 + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_59 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat62) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.x = (-u_xlat16_24.x) + u_xlat16_24.y;
    u_xlat16_4.x = u_xlat16_58 * u_xlat16_4.x + u_xlat16_24.x;
    u_xlat16_23.x = _sssIntensity * _sssIntensity;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_23.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.x = u_xlat16_23.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_42 = sqrt(u_xlat16_4.x);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_42) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat16_22.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_61) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_65 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_61;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_65;
    u_xlat16_66 = sqrt(u_xlat16_61);
    u_xlat24 = min(u_xlat16_61, 1.0);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xy = u_xlat7.xy * vec2(u_xlat16_66);
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_42) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xzw = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xzw + (-u_xlat5.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + u_xlat5.xxx;
    u_xlat16_61 = u_xlat16_0.y * u_xlat16_58;
    u_xlat16_61 = u_xlat16_61 * _sweatNormalColor.w;
    u_xlat16_12.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_14.zxy * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_23.xxx * u_xlat16_17.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat7.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat5.xxx * u_xlat16_1.xyz;
    u_xlat19 = dot(u_xlat16_22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + (-vec3(u_xlat19));
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + vec3(u_xlat19);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_23.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_61);
    u_xlat16_9.xyz = u_xlat7.xzw * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.yyy + u_xlat16_17.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_9.x;
    u_xlat16_61 = max(u_xlat16_13.x, u_xlat16_61);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_61;
    u_xlat16_9.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + (-u_xlat5.xxx);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + u_xlat5.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_2.x = u_xlat16_24.z + (-u_xlat16_6.x);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x + u_xlat16_6.x;
    u_xlat16_58 = u_xlat16_59 * u_xlat16_58;
    u_xlat16_30.x = u_xlat16_58 * _roughnessMultiplier;
    u_xlat16_58 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat5.x = (-u_xlat19) * u_xlat16_58 + u_xlat19;
    u_xlat5.x = u_xlat19 * u_xlat5.x + u_xlat16_58;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat19 + u_xlat5.x;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_21.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat18.x) * u_xlat16_58 + u_xlat18.x;
    u_xlat43 = u_xlat18.x * u_xlat43 + u_xlat16_58;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat5.z = u_xlat43 + u_xlat18.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat43 = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_2.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_2.x) + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat6.x = u_xlat16_58 + -1.0;
    u_xlat43 = u_xlat43 * u_xlat6.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat16_58 / u_xlat43;
    u_xlat5.z = u_xlat43 * 0.318309873;
    u_xlat5.xz = min(u_xlat5.xz, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat16_2.x = u_xlat62 * u_xlat62;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_23.x = u_xlat62 * u_xlat16_2.x;
    u_xlat43 = (-u_xlat16_2.x) * u_xlat62 + 1.0;
    u_xlat16_2.x = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_8.xyz;
    u_xlat43 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_23.xxx + u_xlat6.xyw;
    u_xlat5.xzw = u_xlat5.xxx * u_xlat6.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.zxy;
    u_xlat5.xzw = vec3(u_xlat19) * u_xlat5.xzw;
    u_xlat16_1.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_9.y = u_xlat16_22.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_12.y = u_xlat16_10.y;
    u_xlat19 = dot(u_xlat16_12.xyz, u_xlat16_9.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat6.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyw = vec3(u_xlat19) * u_xlat6.xyw + _sssColorBack.zxy;
    u_xlat16_23.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_30.zzz * u_xlat16_23.xyz + _sssColorOcc.zxy;
    u_xlat6.xyw = u_xlat16_23.xyz * u_xlat6.xyw;
    u_xlat16_23.xyz = u_xlat6.xyw * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_23.xyz + u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat19 = min(u_xlat24, u_xlat16_6.z);
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat19) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_13.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_21.xyz), u_xlat16_22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat6.xyw = (-u_xlat16_22.xyz) * u_xlat16_4.xxx + (-u_xlat16_21.xyz);
    u_xlat19 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_30.y = dot(u_xlat16_10.xyz, u_xlat6.xyw);
    u_xlat16_21.xyz = u_xlat16_30.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_40 = u_xlat16_21.x + 1.0;
    u_xlat16_40 = min(u_xlat16_40, 15.0);
    u_xlat16_4.x = u_xlat16_40 * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_21.x = u_xlat16_21.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_40 = (-u_xlat16_26) + u_xlat16_7.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_40 + u_xlat16_26;
    u_xlat16_21.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat19 = u_xlat19 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat24 * 0.5;
    u_xlat16_40 = (-u_xlat24) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat19 * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_40 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_59 = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_59 + u_xlat16_40;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat24;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_6.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_58) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_58 = u_xlat16_30.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_30.x);
    u_xlat18.y = u_xlat16_30.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_58);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_2.xzw : u_xlat16_8.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xxx * u_xlat16_2.xzw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat5.zwx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_14.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat3.x = u_xlat57 * 0.0625 + u_xlat3.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_19.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(13) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
vec3 u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_39;
float u_xlat50;
float u_xlat51;
mediump float u_xlat16_55;
mediump vec2 u_xlat16_66;
float u_xlat75;
float u_xlat76;
float u_xlat79;
bool u_xlatb79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
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
    u_xlat79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat4.xyz = vec3(u_xlat79) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_55 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_55 = min(u_xlat16_55, 1.0);
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = sqrt(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_80 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_80) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_55 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_80 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_82 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_80) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat79) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat10.xyz = vec3(u_xlat79) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xzw = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb79 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb79)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat16_30 = (-_ShadowBias.w) + 1.0;
    u_xlat25.x = (-u_xlat16_30) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_30;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_30 = u_xlat16_25.z * _shadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_30 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_30) + u_xlat16_55;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_30 = u_xlat16_39.z * u_xlat16_55 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_39.z * u_xlat16_30;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_30 = u_xlat16_55 * u_xlat16_30;
    u_xlat16_87 = sqrt(u_xlat16_30);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_30));
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(u_xlat16_87);
    u_xlat16_16.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_17.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30 = (-u_xlat16_1.x) + u_xlat16_1.y;
    u_xlat16_30 = u_xlat16_80 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_87;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_87 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_88 = sqrt(u_xlat16_30);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_19.xyz + (-u_xlat16_20.xyz);
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz + (-u_xlat1.xxx);
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz + u_xlat1.xxx;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_6.y;
    u_xlat16_14.x = u_xlat16_14.x * _sweatNormalColor.w;
    u_xlat16_21.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_14.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_3.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_3.zxy * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_87 = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_90 = inversesqrt(u_xlat16_14.x);
    u_xlat16_23.xyz = u_xlat3.xyz * vec3(u_xlat16_90);
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_66.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_66.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_66.yyy + u_xlat16_24.xyz;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat26.x = dot(u_xlat16_7.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_90);
    u_xlat16_90 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_90;
    u_xlat16_14.x = max(u_xlat16_66.x, u_xlat16_14.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x;
    u_xlat16_23.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_24.xyz = u_xlat26.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-u_xlat26.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_16.xyz + u_xlat26.xxx;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat25.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_90 = inversesqrt(u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_90);
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_18.xy = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.yyy + u_xlat16_23.xyz;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat25.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_90);
    u_xlat16_90 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_90;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x;
    u_xlat16_16.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_18.xyz = u_xlat25.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-u_xlat25.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + u_xlat25.xxx;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat25.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat25.xxx + u_xlat16_15.xyz;
    u_xlat16_87 = u_xlat16_1.z + (-u_xlat16_2.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_87 + u_xlat16_2.x;
    u_xlat16_80 = u_xlat16_82 * u_xlat16_80;
    u_xlat16_39.x = u_xlat16_80 * _roughnessMultiplier;
    u_xlat16_80 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat25.x = (-u_xlat1.x) * u_xlat16_80 + u_xlat1.x;
    u_xlat25.x = u_xlat1.x * u_xlat25.x + u_xlat16_80;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat1.x;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_82 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_16.xyz = u_xlat26.xyz * vec3(u_xlat16_82);
    u_xlat26.xyz = u_xlat26.xyz * vec3(u_xlat16_82) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat50 = u_xlat3.x * u_xlat50 + u_xlat16_80;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat25.y = u_xlat50 + u_xlat3.x;
    u_xlat25.xy = u_xlat25.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat50 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat26.xyz = vec3(u_xlat50) * u_xlat26.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_82 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_82) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat51 = u_xlat16_80 + -1.0;
    u_xlat50 = u_xlat50 * u_xlat51 + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat16_80 / u_xlat50;
    u_xlat25.y = u_xlat50 * 0.318309873;
    u_xlat25.xy = min(u_xlat25.xy, vec2(16.0, 16.0));
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat16_82 = u_xlat26.x * u_xlat26.x;
    u_xlat16_82 = u_xlat26.x * u_xlat16_82;
    u_xlat16_82 = u_xlat26.x * u_xlat16_82;
    u_xlat16_87 = u_xlat26.x * u_xlat16_82;
    u_xlat50 = (-u_xlat16_82) * u_xlat26.x + 1.0;
    u_xlat16_82 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat50) * u_xlat16_17.xyz;
    u_xlat50 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat50) * vec3(u_xlat16_87) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat25.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat26.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_19.y = u_xlat16_13.y;
    u_xlat25.x = dot(u_xlat16_19.xyz, u_xlat16_18.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat2.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat2.xyw = u_xlat25.xxx * u_xlat2.xyw + _sssColorBack.zxy;
    u_xlat16_18.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_39.zzz * u_xlat16_18.xyz + _sssColorOcc.zxy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat16_22.xyz + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_18.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_55) * u_xlat16_21.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_30 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_82 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_82) + (-u_xlat16_16.xyz);
    u_xlat76 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_39.y = dot(u_xlat16_13.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_7.x = floor(u_xlat16_4.w);
    u_xlat16_32.x = u_xlat16_7.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_4.x = u_xlat16_32.x * 16.0 + u_xlat16_4.z;
    u_xlat16_32.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_4.x = u_xlat16_7.x * 16.0 + u_xlat16_4.z;
    u_xlat16_32.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_7.x = u_xlat16_7.z * 15.0 + (-u_xlat16_7.x);
    u_xlat16_32.x = (-u_xlat16_27) + u_xlat16_2.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_32.x + u_xlat16_27;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_7.x;
    u_xlat76 = u_xlat76 * u_xlat16_55;
    u_xlat16_55 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_55 = u_xlat76 * u_xlat16_7.x + u_xlat16_55;
    u_xlat16_7.x = u_xlat16_55 + u_xlat16_55;
    u_xlat16_32.x = (-u_xlat16_55) * 2.0 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_32.x + u_xlat16_7.x;
    u_xlat16_55 = u_xlat0.w * u_xlat16_55;
    u_xlat16_55 = min(u_xlat16_2.z, u_xlat16_55);
    u_xlat2.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_80) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat3.y = u_xlat16_39.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyw = vec3(u_xlat16_30) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyw = (bool(u_xlatb0)) ? u_xlat16_5.xyw : u_xlat16_14.xyz;
    u_xlat16_5.xyw = u_xlat16_5.xyw * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_55) * u_xlat16_5.xyw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat1.yzx * u_xlat16_12.yzx + u_xlat16_5.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.zxy;
    u_xlat16_12.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_30;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(13) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
vec3 u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_39;
float u_xlat50;
float u_xlat51;
mediump float u_xlat16_55;
mediump vec2 u_xlat16_66;
float u_xlat75;
float u_xlat76;
float u_xlat79;
bool u_xlatb79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
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
    u_xlat79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat4.xyz = vec3(u_xlat79) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_55 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_55 = min(u_xlat16_55, 1.0);
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = sqrt(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_80 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_80) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_55 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_80 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_82 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_80) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat79) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat10.xyz = vec3(u_xlat79) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xzw = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb79 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb79)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat16_30 = (-_ShadowBias.w) + 1.0;
    u_xlat25.x = (-u_xlat16_30) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_30;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_30 = u_xlat16_25.z * _shadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_30 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_30) + u_xlat16_55;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_30 = u_xlat16_39.z * u_xlat16_55 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_39.z * u_xlat16_30;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_30 = u_xlat16_55 * u_xlat16_30;
    u_xlat16_87 = sqrt(u_xlat16_30);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_30));
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(u_xlat16_87);
    u_xlat16_16.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_17.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30 = (-u_xlat16_1.x) + u_xlat16_1.y;
    u_xlat16_30 = u_xlat16_80 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_87;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_87 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_88 = sqrt(u_xlat16_30);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_19.xyz + (-u_xlat16_20.xyz);
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz + (-u_xlat1.xxx);
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz + u_xlat1.xxx;
    u_xlat16_14.x = u_xlat16_80 * u_xlat16_6.y;
    u_xlat16_14.x = u_xlat16_14.x * _sweatNormalColor.w;
    u_xlat16_21.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_14.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_3.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_3.zxy * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_87 = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_90 = inversesqrt(u_xlat16_14.x);
    u_xlat16_23.xyz = u_xlat3.xyz * vec3(u_xlat16_90);
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_66.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_66.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_66.yyy + u_xlat16_24.xyz;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat26.x = dot(u_xlat16_7.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_90);
    u_xlat16_90 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_90;
    u_xlat16_14.x = max(u_xlat16_66.x, u_xlat16_14.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x;
    u_xlat16_23.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_24.xyz = u_xlat26.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-u_xlat26.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_16.xyz + u_xlat26.xxx;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat25.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_90 = inversesqrt(u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat3.xyz * vec3(u_xlat16_90);
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_18.xy = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.yyy + u_xlat16_23.xyz;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat25.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_90);
    u_xlat16_90 = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_90;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x;
    u_xlat16_16.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_18.xyz = u_xlat25.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-u_xlat25.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + u_xlat25.xxx;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat25.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat25.xxx + u_xlat16_15.xyz;
    u_xlat16_87 = u_xlat16_1.z + (-u_xlat16_2.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_87 + u_xlat16_2.x;
    u_xlat16_80 = u_xlat16_82 * u_xlat16_80;
    u_xlat16_39.x = u_xlat16_80 * _roughnessMultiplier;
    u_xlat16_80 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat25.x = (-u_xlat1.x) * u_xlat16_80 + u_xlat1.x;
    u_xlat25.x = u_xlat1.x * u_xlat25.x + u_xlat16_80;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat1.x;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_82 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_16.xyz = u_xlat26.xyz * vec3(u_xlat16_82);
    u_xlat26.xyz = u_xlat26.xyz * vec3(u_xlat16_82) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat50 = u_xlat3.x * u_xlat50 + u_xlat16_80;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat25.y = u_xlat50 + u_xlat3.x;
    u_xlat25.xy = u_xlat25.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat50 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat26.xyz = vec3(u_xlat50) * u_xlat26.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_82 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_82) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat51 = u_xlat16_80 + -1.0;
    u_xlat50 = u_xlat50 * u_xlat51 + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat16_80 / u_xlat50;
    u_xlat25.y = u_xlat50 * 0.318309873;
    u_xlat25.xy = min(u_xlat25.xy, vec2(16.0, 16.0));
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat16_82 = u_xlat26.x * u_xlat26.x;
    u_xlat16_82 = u_xlat26.x * u_xlat16_82;
    u_xlat16_82 = u_xlat26.x * u_xlat16_82;
    u_xlat16_87 = u_xlat26.x * u_xlat16_82;
    u_xlat50 = (-u_xlat16_82) * u_xlat26.x + 1.0;
    u_xlat16_82 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat50) * u_xlat16_17.xyz;
    u_xlat50 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat50) * vec3(u_xlat16_87) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat25.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat26.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_19.y = u_xlat16_13.y;
    u_xlat25.x = dot(u_xlat16_19.xyz, u_xlat16_18.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat2.xyw = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat2.xyw = u_xlat25.xxx * u_xlat2.xyw + _sssColorBack.zxy;
    u_xlat16_18.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_39.zzz * u_xlat16_18.xyz + _sssColorOcc.zxy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat16_22.xyz + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_18.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_55) * u_xlat16_21.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_30 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_82 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_82) + (-u_xlat16_16.xyz);
    u_xlat76 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_39.y = dot(u_xlat16_13.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_7.x = floor(u_xlat16_4.w);
    u_xlat16_32.x = u_xlat16_7.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_4.x = u_xlat16_32.x * 16.0 + u_xlat16_4.z;
    u_xlat16_32.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_4.x = u_xlat16_7.x * 16.0 + u_xlat16_4.z;
    u_xlat16_32.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_7.x = u_xlat16_7.z * 15.0 + (-u_xlat16_7.x);
    u_xlat16_32.x = (-u_xlat16_27) + u_xlat16_2.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_32.x + u_xlat16_27;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_7.x;
    u_xlat76 = u_xlat76 * u_xlat16_55;
    u_xlat16_55 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_55 = u_xlat76 * u_xlat16_7.x + u_xlat16_55;
    u_xlat16_7.x = u_xlat16_55 + u_xlat16_55;
    u_xlat16_32.x = (-u_xlat16_55) * 2.0 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_32.x + u_xlat16_7.x;
    u_xlat16_55 = u_xlat0.w * u_xlat16_55;
    u_xlat16_55 = min(u_xlat16_2.z, u_xlat16_55);
    u_xlat2.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_80) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_5.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat3.y = u_xlat16_39.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_5.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyw = vec3(u_xlat16_30) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xyw = (bool(u_xlatb0)) ? u_xlat16_5.xyw : u_xlat16_14.xyz;
    u_xlat16_5.xyw = u_xlat16_5.xyw * u_xlat16_13.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_55) * u_xlat16_5.xyw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat1.yzx * u_xlat16_12.yzx + u_xlat16_5.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + _FogCol.zxy;
    u_xlat16_12.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_30;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec4 u_xlat7;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
float u_xlat19;
int u_xlati19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat43;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_58 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_58 = min(u_xlat16_58, 1.0);
    u_xlat16_58 = (-u_xlat16_58) + 1.0;
    u_xlat16_58 = sqrt(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_59 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_41 = u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_59) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_41 * u_xlat16_58 + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_59 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat62) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.x = (-u_xlat16_24.x) + u_xlat16_24.y;
    u_xlat16_4.x = u_xlat16_58 * u_xlat16_4.x + u_xlat16_24.x;
    u_xlat16_23.x = _sssIntensity * _sssIntensity;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_23.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.x = u_xlat16_23.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_42 = sqrt(u_xlat16_4.x);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_42) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat16_22.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_61) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_65 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_61;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_65;
    u_xlat16_66 = sqrt(u_xlat16_61);
    u_xlat24 = min(u_xlat16_61, 1.0);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xy = u_xlat7.xy * vec2(u_xlat16_66);
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_42) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xzw = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xzw + (-u_xlat5.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + u_xlat5.xxx;
    u_xlat16_61 = u_xlat16_0.y * u_xlat16_58;
    u_xlat16_61 = u_xlat16_61 * _sweatNormalColor.w;
    u_xlat16_12.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_23.xxx * u_xlat16_17.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat7.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat5.xxx * u_xlat16_1.xyz;
    u_xlat19 = dot(u_xlat16_22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + (-vec3(u_xlat19));
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + vec3(u_xlat19);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_23.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_61);
    u_xlat16_9.xyz = u_xlat7.xzw * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.yyy + u_xlat16_17.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_9.x;
    u_xlat16_61 = max(u_xlat16_13.x, u_xlat16_61);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_61;
    u_xlat16_9.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + (-u_xlat5.xxx);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + u_xlat5.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_2.x = u_xlat16_24.z + (-u_xlat16_6.x);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x + u_xlat16_6.x;
    u_xlat16_58 = u_xlat16_59 * u_xlat16_58;
    u_xlat16_30.x = u_xlat16_58 * _roughnessMultiplier;
    u_xlat16_58 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat5.x = (-u_xlat19) * u_xlat16_58 + u_xlat19;
    u_xlat5.x = u_xlat19 * u_xlat5.x + u_xlat16_58;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat19 + u_xlat5.x;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_21.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat18.x) * u_xlat16_58 + u_xlat18.x;
    u_xlat43 = u_xlat18.x * u_xlat43 + u_xlat16_58;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat5.z = u_xlat43 + u_xlat18.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat43 = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_2.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_2.x) + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat6.x = u_xlat16_58 + -1.0;
    u_xlat43 = u_xlat43 * u_xlat6.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat16_58 / u_xlat43;
    u_xlat5.z = u_xlat43 * 0.318309873;
    u_xlat5.xz = min(u_xlat5.xz, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat16_2.x = u_xlat62 * u_xlat62;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_23.x = u_xlat62 * u_xlat16_2.x;
    u_xlat43 = (-u_xlat16_2.x) * u_xlat62 + 1.0;
    u_xlat16_2.x = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_8.xyz;
    u_xlat43 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_23.xxx + u_xlat6.xyw;
    u_xlat5.xzw = u_xlat5.xxx * u_xlat6.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.xyz;
    u_xlat5.xzw = vec3(u_xlat19) * u_xlat5.xzw;
    u_xlat16_1.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_9.y = u_xlat16_22.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_12.y = u_xlat16_10.y;
    u_xlat19 = dot(u_xlat16_12.xyz, u_xlat16_9.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat6.xyw = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat6.xyw = vec3(u_xlat19) * u_xlat6.xyw + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_30.zzz * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat6.xyw = u_xlat16_23.xyz * u_xlat6.xyw;
    u_xlat16_23.xyz = u_xlat6.xyw * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_23.xyz + u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat19 = min(u_xlat24, u_xlat16_6.z);
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat19) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_13.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_21.xyz), u_xlat16_22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat6.xyw = (-u_xlat16_22.xyz) * u_xlat16_4.xxx + (-u_xlat16_21.xyz);
    u_xlat19 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_30.y = dot(u_xlat16_10.xyz, u_xlat6.xyw);
    u_xlat16_21.xyz = u_xlat16_30.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_40 = u_xlat16_21.x + 1.0;
    u_xlat16_40 = min(u_xlat16_40, 15.0);
    u_xlat16_4.x = u_xlat16_40 * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_21.x = u_xlat16_21.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_40 = (-u_xlat16_26) + u_xlat16_7.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_40 + u_xlat16_26;
    u_xlat16_21.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat19 = u_xlat19 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat24 * 0.5;
    u_xlat16_40 = (-u_xlat24) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat19 * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_40 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_59 = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_59 + u_xlat16_40;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat24;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_6.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_58) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_58 = u_xlat16_30.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_30.x);
    u_xlat18.y = u_xlat16_30.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_58);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_2.xzw : u_xlat16_8.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xxx * u_xlat16_2.xzw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_14.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec4 u_xlat7;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
float u_xlat19;
int u_xlati19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_30;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat43;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_0.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_58 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_58 = min(u_xlat16_58, 1.0);
    u_xlat16_58 = (-u_xlat16_58) + 1.0;
    u_xlat16_58 = sqrt(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_0.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_59 = u_xlat16_0.x * _detailNormalMapTiling.z;
    u_xlat16_41 = u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_59) * u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_41 * u_xlat16_58 + 1.0;
    u_xlat0.xzw = u_xlat16_4.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_5.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_5 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(u_xlat16_5.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_59 = _sweatStrength * (-u_xlat16_5.w) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat0.xzw);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat5.zzz;
    u_xlat0.xzw = vec3(u_xlat62) * u_xlat5.xyz + (-u_xlat0.xzw);
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xzw, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xzw, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xzw, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xzw * u_xlat16_3.xxx;
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.x = (-u_xlat16_24.x) + u_xlat16_24.y;
    u_xlat16_4.x = u_xlat16_58 * u_xlat16_4.x + u_xlat16_24.x;
    u_xlat16_23.x = _sssIntensity * _sssIntensity;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_23.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.x = u_xlat16_23.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_42 = sqrt(u_xlat16_4.x);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_42) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat16_22.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_61) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_65 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_30.z * u_xlat16_61;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_65;
    u_xlat16_66 = sqrt(u_xlat16_61);
    u_xlat24 = min(u_xlat16_61, 1.0);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xy = u_xlat7.xy * vec2(u_xlat16_66);
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_42) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xzw = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xzw + (-u_xlat5.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + u_xlat5.xxx;
    u_xlat16_61 = u_xlat16_0.y * u_xlat16_58;
    u_xlat16_61 = u_xlat16_61 * _sweatNormalColor.w;
    u_xlat16_12.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_23.xxx * u_xlat16_17.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat7.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat5.xxx * u_xlat16_1.xyz;
    u_xlat19 = dot(u_xlat16_22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + (-vec3(u_xlat19));
    u_xlat16_9.xyz = vec3(u_xlat16_42) * u_xlat16_9.xyz + vec3(u_xlat19);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_23.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_61);
    u_xlat16_9.xyz = u_xlat7.xzw * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.yyy + u_xlat16_17.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_9.xyz);
    u_xlat5.x = dot(u_xlat16_22.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_9.x;
    u_xlat16_61 = max(u_xlat16_13.x, u_xlat16_61);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_61;
    u_xlat16_9.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + (-u_xlat5.xxx);
    u_xlat16_2.xyz = vec3(u_xlat16_42) * u_xlat16_2.xyz + u_xlat5.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_2.x = u_xlat16_24.z + (-u_xlat16_6.x);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x + u_xlat16_6.x;
    u_xlat16_58 = u_xlat16_59 * u_xlat16_58;
    u_xlat16_30.x = u_xlat16_58 * _roughnessMultiplier;
    u_xlat16_58 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = max(u_xlat16_58, 0.0078125);
    u_xlat5.x = (-u_xlat19) * u_xlat16_58 + u_xlat19;
    u_xlat5.x = u_xlat19 * u_xlat5.x + u_xlat16_58;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat19 + u_xlat5.x;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_21.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat18.x) * u_xlat16_58 + u_xlat18.x;
    u_xlat43 = u_xlat18.x * u_xlat43 + u_xlat16_58;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat5.z = u_xlat43 + u_xlat18.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat43 = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_2.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_2.x) + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat6.x = u_xlat16_58 + -1.0;
    u_xlat43 = u_xlat43 * u_xlat6.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat16_58 / u_xlat43;
    u_xlat5.z = u_xlat43 * 0.318309873;
    u_xlat5.xz = min(u_xlat5.xz, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.z;
    u_xlat16_2.x = u_xlat62 * u_xlat62;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat62 * u_xlat16_2.x;
    u_xlat16_23.x = u_xlat62 * u_xlat16_2.x;
    u_xlat43 = (-u_xlat16_2.x) * u_xlat62 + 1.0;
    u_xlat16_2.x = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_8.xyz;
    u_xlat43 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.xyw = vec3(u_xlat43) * u_xlat16_23.xxx + u_xlat6.xyw;
    u_xlat5.xzw = u_xlat5.xxx * u_xlat6.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.xyz;
    u_xlat5.xzw = vec3(u_xlat19) * u_xlat5.xzw;
    u_xlat16_1.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_9.y = u_xlat16_22.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_12.y = u_xlat16_10.y;
    u_xlat19 = dot(u_xlat16_12.xyz, u_xlat16_9.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat6.xyw = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat6.xyw = vec3(u_xlat19) * u_xlat6.xyw + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_30.zzz * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat6.xyw = u_xlat16_23.xyz * u_xlat6.xyw;
    u_xlat16_23.xyz = u_xlat6.xyw * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_23.xyz + u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat19 = min(u_xlat24, u_xlat16_6.z);
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat19) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat19) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat19) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_13.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_21.xyz), u_xlat16_22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat6.xyw = (-u_xlat16_22.xyz) * u_xlat16_4.xxx + (-u_xlat16_21.xyz);
    u_xlat19 = dot(u_xlat16_10.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_30.y = dot(u_xlat16_10.xyz, u_xlat6.xyw);
    u_xlat16_21.xyz = u_xlat16_30.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21.x = floor(u_xlat16_4.w);
    u_xlat16_40 = u_xlat16_21.x + 1.0;
    u_xlat16_40 = min(u_xlat16_40, 15.0);
    u_xlat16_4.x = u_xlat16_40 * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_22.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_21.x = u_xlat16_21.z * 15.0 + (-u_xlat16_21.x);
    u_xlat16_40 = (-u_xlat16_26) + u_xlat16_7.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_40 + u_xlat16_26;
    u_xlat16_21.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat19 = u_xlat19 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat24 * 0.5;
    u_xlat16_40 = (-u_xlat24) * 0.5 + 1.0;
    u_xlat16_21.x = u_xlat19 * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_40 = u_xlat16_21.x + u_xlat16_21.x;
    u_xlat16_59 = (-u_xlat16_21.x) * 2.0 + 1.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_59 + u_xlat16_40;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat24;
    u_xlat16_21.x = min(u_xlat16_21.x, u_xlat16_6.z);
    u_xlat0.xyz = u_xlat0.xzw * u_xlat16_3.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = vec3(u_xlat16_58) * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_58 = u_xlat16_30.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_30.x);
    u_xlat18.y = u_xlat16_30.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_58);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_2.xzw : u_xlat16_8.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xxx * u_xlat16_2.xzw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_14.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
vec3 u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
mediump vec3 u_xlat16_40;
mediump vec3 u_xlat16_42;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_55;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_66;
mediump float u_xlat16_68;
float u_xlat79;
float u_xlat82;
bool u_xlatb82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
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
    u_xlat82 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat4.xyz = vec3(u_xlat82) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_57 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_57 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = sqrt(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_83 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_83) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_57 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_83 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_85 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_83) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat82 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat82) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat82 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat82 = max(u_xlat82, 1.17549435e-38);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat10.xyz = vec3(u_xlat82) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat82 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat82 = max(u_xlat82, 1.17549435e-38);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xzw = vec3(u_xlat82) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb82 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb82)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27.x = (-u_xlat1.x) + u_xlat27.x;
    u_xlat0.z = _ShadowBias.y * u_xlat27.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_31 = (-_ShadowBias.w) + 1.0;
    u_xlat26.x = (-u_xlat16_31) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_31;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_31 = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_31 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_31 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_13.xyz = vec3(u_xlat16_31) * u_xlat16_13.xyz;
    u_xlat16_31 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_31 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_31) + u_xlat16_57;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_31 = u_xlat16_40.z * u_xlat16_57 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_40.z * u_xlat16_31;
    u_xlat16_90 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 + -1.0;
    u_xlat16_90 = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_91 = u_xlat16_31 * u_xlat16_90;
    u_xlat16_14.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_14.xxx;
    u_xlat16_16.xy = u_xlat26.xy * u_xlat16_14.xx;
    u_xlat16_17.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = (-u_xlat16_1.x) + u_xlat16_1.y;
    u_xlat16_91 = u_xlat16_83 * u_xlat16_91 + u_xlat16_1.x;
    u_xlat16_14.x = _sssIntensity * _sssIntensity;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_14.x;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_93 = sqrt(u_xlat16_91);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_93) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_93) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_19.xyz + (-u_xlat16_20.xyz);
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz + (-u_xlat1.xxx);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz + u_xlat1.xxx;
    u_xlat16_68 = u_xlat16_83 * u_xlat16_6.y;
    u_xlat16_68 = u_xlat16_68 * _sweatNormalColor.w;
    u_xlat16_21.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_14.xxx * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_14.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_68);
    u_xlat16_23.xyz = u_xlat3.xyz * vec3(u_xlat16_94);
    u_xlat16_94 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_94));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_94);
#endif
    u_xlat16_24.xy = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat27.x = dot(u_xlat16_7.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_94);
    u_xlat16_94 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_94 = (-u_xlat16_94) * u_xlat16_94 + 1.0;
    u_xlat16_94 = max(u_xlat16_94, 0.0);
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_68 = u_xlat16_94 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_24.x, u_xlat16_68);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_68;
    u_xlat16_23.xyz = u_xlat16_14.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-u_xlat27.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz + u_xlat27.xxx;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat27.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_14.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_42.xyz = u_xlat3.xyz * u_xlat16_42.xxx;
    u_xlat16_95 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_95));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_95);
#endif
    u_xlat16_18.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_42.xyz = u_xlat16_42.xyz * u_xlat16_18.yyy + u_xlat16_23.xyz;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_42.xyz);
    u_xlat26.x = dot(u_xlat16_7.xyz, u_xlat16_42.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_42.x = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_42.x = min(max(u_xlat16_42.x, 0.0), 1.0);
#else
    u_xlat16_42.x = clamp(u_xlat16_42.x, 0.0, 1.0);
#endif
    u_xlat16_42.x = u_xlat16_42.x * u_xlat16_42.x;
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_42.x);
    u_xlat16_42.x = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_42.x = (-u_xlat16_42.x) * u_xlat16_42.x + 1.0;
    u_xlat16_42.x = max(u_xlat16_42.x, 0.0);
    u_xlat16_42.x = u_xlat16_42.x * u_xlat16_42.x;
    u_xlat16_16.x = u_xlat16_42.x * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_18.x, u_xlat16_16.x);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_16.x;
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_18.xyz = u_xlat26.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-u_xlat26.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_17.xyz + u_xlat26.xxx;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat26.xxx + u_xlat16_15.xyz;
    u_xlat16_14.x = u_xlat16_1.z + (-u_xlat16_2.x);
    u_xlat16_14.x = u_xlat16_83 * u_xlat16_14.x + u_xlat16_2.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_14.x;
    u_xlat16_40.x = u_xlat16_85 * _roughnessMultiplier;
    u_xlat16_85 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_85 = max(u_xlat16_85, 0.0078125);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_14.x = max(u_xlat16_85, 0.0078125);
    u_xlat26.x = (-u_xlat1.x) * u_xlat16_14.x + u_xlat1.x;
    u_xlat26.x = u_xlat1.x * u_xlat26.x + u_xlat16_14.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat1.x;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_93 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_16.xyz = u_xlat27.xyz * vec3(u_xlat16_93);
    u_xlat27.xyz = u_xlat27.xyz * vec3(u_xlat16_93) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat52 = u_xlat3.x * u_xlat52 + u_xlat16_14.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat26.y = u_xlat52 + u_xlat3.x;
    u_xlat26.xy = u_xlat26.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat52 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat27.xyz = vec3(u_xlat52) * u_xlat27.xyz;
    u_xlat52 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_93) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat53 = u_xlat16_14.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat53 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_14.x / u_xlat52;
    u_xlat26.y = u_xlat52 * 0.318309873;
    u_xlat26.xy = min(u_xlat26.xy, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat16_93 = u_xlat27.x * u_xlat27.x;
    u_xlat16_93 = u_xlat27.x * u_xlat16_93;
    u_xlat16_93 = u_xlat27.x * u_xlat16_93;
    u_xlat16_94 = u_xlat27.x * u_xlat16_93;
    u_xlat52 = (-u_xlat16_93) * u_xlat27.x + 1.0;
    u_xlat16_93 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat52) * u_xlat16_17.xyz;
    u_xlat52 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat52) * vec3(u_xlat16_94) + u_xlat27.xyz;
    u_xlat27.xyz = u_xlat26.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_19.y = u_xlat16_13.y;
    u_xlat26.x = dot(u_xlat16_19.xyz, u_xlat16_18.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat4.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat4.xyz = u_xlat26.xxx * u_xlat4.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_40.zzz * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_22.xyz + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_90) * u_xlat16_21.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_91 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_93 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_93 = u_xlat16_93 + u_xlat16_93;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_93) + (-u_xlat16_16.xyz);
    u_xlat79 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_40.y = dot(u_xlat16_13.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_39 = u_xlat16_13.x + 1.0;
    u_xlat16_39 = min(u_xlat16_39, 15.0);
    u_xlat16_4.x = u_xlat16_39 * 16.0 + u_xlat16_4.z;
    u_xlat16_66.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_66.xy = u_xlat16_66.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_66.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_66.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_66.xy = u_xlat16_66.xy * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_66.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_39 = u_xlat16_55 + (-u_xlat16_32);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_39 + u_xlat16_32;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_13.x;
    u_xlat79 = u_xlat79 * u_xlat16_90;
    u_xlat16_90 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_90 = u_xlat79 * u_xlat16_13.x + u_xlat16_90;
    u_xlat16_13.x = u_xlat16_90 + u_xlat16_90;
    u_xlat16_39 = (-u_xlat16_90) * 2.0 + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_39 + u_xlat16_13.x;
    u_xlat16_90 = u_xlat0.w * u_xlat16_90;
    u_xlat16_90 = min(u_xlat16_2.z, u_xlat16_90);
    u_xlat6.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_14.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_14.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat3.y = u_xlat16_40.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_40.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_40.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_90) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_38;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
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
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
vec3 u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
mediump vec3 u_xlat16_40;
mediump vec3 u_xlat16_42;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_55;
mediump float u_xlat16_57;
mediump vec2 u_xlat16_66;
mediump float u_xlat16_68;
float u_xlat79;
float u_xlat82;
bool u_xlatb82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
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
    u_xlat82 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat4.xyz = vec3(u_xlat82) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_57 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_57 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = sqrt(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_83 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_83) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_57 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_83 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_85 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_83) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat82 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat82) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat82 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat82 = max(u_xlat82, 1.17549435e-38);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat10.xyz = vec3(u_xlat82) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat82 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat82 = max(u_xlat82, 1.17549435e-38);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xzw = vec3(u_xlat82) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb82 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb82)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27.x = (-u_xlat1.x) + u_xlat27.x;
    u_xlat0.z = _ShadowBias.y * u_xlat27.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_31 = (-_ShadowBias.w) + 1.0;
    u_xlat26.x = (-u_xlat16_31) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_31;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_31 = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_31 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_31 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_13.xyz = vec3(u_xlat16_31) * u_xlat16_13.xyz;
    u_xlat16_31 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_31 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_31) + u_xlat16_57;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_31 = u_xlat16_40.z * u_xlat16_57 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_40.z * u_xlat16_31;
    u_xlat16_90 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 + -1.0;
    u_xlat16_90 = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_91 = u_xlat16_31 * u_xlat16_90;
    u_xlat16_14.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_14.xxx;
    u_xlat16_16.xy = u_xlat26.xy * u_xlat16_14.xx;
    u_xlat16_17.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = (-u_xlat16_1.x) + u_xlat16_1.y;
    u_xlat16_91 = u_xlat16_83 * u_xlat16_91 + u_xlat16_1.x;
    u_xlat16_14.x = _sssIntensity * _sssIntensity;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_14.x;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_93 = sqrt(u_xlat16_91);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = (-u_xlat16_17.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_93) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_93) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_19.xyz + (-u_xlat16_20.xyz);
    u_xlat16_21.xyz = u_xlat1.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz + (-u_xlat1.xxx);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz + u_xlat1.xxx;
    u_xlat16_68 = u_xlat16_83 * u_xlat16_6.y;
    u_xlat16_68 = u_xlat16_68 * _sweatNormalColor.w;
    u_xlat16_21.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_14.xxx * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_14.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_68);
    u_xlat16_23.xyz = u_xlat3.xyz * vec3(u_xlat16_94);
    u_xlat16_94 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_94));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_94);
#endif
    u_xlat16_24.xy = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat27.x = dot(u_xlat16_7.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_94);
    u_xlat16_94 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_94 = (-u_xlat16_94) * u_xlat16_94 + 1.0;
    u_xlat16_94 = max(u_xlat16_94, 0.0);
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_68 = u_xlat16_94 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_24.x, u_xlat16_68);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_68;
    u_xlat16_23.xyz = u_xlat16_14.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.yyy * u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-u_xlat27.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz + u_xlat27.xxx;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat27.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_14.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_42.xyz = u_xlat3.xyz * u_xlat16_42.xxx;
    u_xlat16_95 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_95));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_95);
#endif
    u_xlat16_18.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_42.xyz = u_xlat16_42.xyz * u_xlat16_18.yyy + u_xlat16_23.xyz;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_42.xyz);
    u_xlat26.x = dot(u_xlat16_7.xyz, u_xlat16_42.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_42.x = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_42.x = min(max(u_xlat16_42.x, 0.0), 1.0);
#else
    u_xlat16_42.x = clamp(u_xlat16_42.x, 0.0, 1.0);
#endif
    u_xlat16_42.x = u_xlat16_42.x * u_xlat16_42.x;
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_42.x);
    u_xlat16_42.x = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_42.x = (-u_xlat16_42.x) * u_xlat16_42.x + 1.0;
    u_xlat16_42.x = max(u_xlat16_42.x, 0.0);
    u_xlat16_42.x = u_xlat16_42.x * u_xlat16_42.x;
    u_xlat16_16.x = u_xlat16_42.x * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_18.x, u_xlat16_16.x);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_16.x;
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_18.xyz = u_xlat26.xxx * u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + (-u_xlat26.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_17.xyz + u_xlat26.xxx;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat26.xxx + u_xlat16_15.xyz;
    u_xlat16_14.x = u_xlat16_1.z + (-u_xlat16_2.x);
    u_xlat16_14.x = u_xlat16_83 * u_xlat16_14.x + u_xlat16_2.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_14.x;
    u_xlat16_40.x = u_xlat16_85 * _roughnessMultiplier;
    u_xlat16_85 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_85 = max(u_xlat16_85, 0.0078125);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_14.x = max(u_xlat16_85, 0.0078125);
    u_xlat26.x = (-u_xlat1.x) * u_xlat16_14.x + u_xlat1.x;
    u_xlat26.x = u_xlat1.x * u_xlat26.x + u_xlat16_14.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat1.x;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_93 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_16.xyz = u_xlat27.xyz * vec3(u_xlat16_93);
    u_xlat27.xyz = u_xlat27.xyz * vec3(u_xlat16_93) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat52 = u_xlat3.x * u_xlat52 + u_xlat16_14.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat26.y = u_xlat52 + u_xlat3.x;
    u_xlat26.xy = u_xlat26.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat52 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat27.xyz = vec3(u_xlat52) * u_xlat27.xyz;
    u_xlat52 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_93) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat53 = u_xlat16_14.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat53 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_14.x / u_xlat52;
    u_xlat26.y = u_xlat52 * 0.318309873;
    u_xlat26.xy = min(u_xlat26.xy, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat16_93 = u_xlat27.x * u_xlat27.x;
    u_xlat16_93 = u_xlat27.x * u_xlat16_93;
    u_xlat16_93 = u_xlat27.x * u_xlat16_93;
    u_xlat16_94 = u_xlat27.x * u_xlat16_93;
    u_xlat52 = (-u_xlat16_93) * u_xlat27.x + 1.0;
    u_xlat16_93 = u_xlat16_2.y * _metallicMultiplier;
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat16_21.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat52) * u_xlat16_17.xyz;
    u_xlat52 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat52) * vec3(u_xlat16_94) + u_xlat27.xyz;
    u_xlat27.xyz = u_xlat26.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_19.y = u_xlat16_13.y;
    u_xlat26.x = dot(u_xlat16_19.xyz, u_xlat16_18.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat4.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat4.xyz = u_xlat26.xxx * u_xlat4.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_40.zzz * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_22.xyz + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = vec3(u_xlat16_91) * u_xlat16_18.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_90) * u_xlat16_21.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_19.xyw;
    u_xlat16_21.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_91 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_93 = dot((-u_xlat16_16.xyz), u_xlat16_7.xyz);
    u_xlat16_93 = u_xlat16_93 + u_xlat16_93;
    u_xlat0.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_93) + (-u_xlat16_16.xyz);
    u_xlat79 = dot(u_xlat16_13.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_40.y = dot(u_xlat16_13.xyz, u_xlat0.xyz);
    u_xlat16_13.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_39 = u_xlat16_13.x + 1.0;
    u_xlat16_39 = min(u_xlat16_39, 15.0);
    u_xlat16_4.x = u_xlat16_39 * 16.0 + u_xlat16_4.z;
    u_xlat16_66.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_66.xy = u_xlat16_66.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_66.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_66.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_66.xy = u_xlat16_66.xy * vec2(0.00390625, 0.0625);
    u_xlat16_32 = texture(_SpecularOcclusionLut3D, u_xlat16_66.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_39 = u_xlat16_55 + (-u_xlat16_32);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_39 + u_xlat16_32;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_13.x;
    u_xlat79 = u_xlat79 * u_xlat16_90;
    u_xlat16_90 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_90 = u_xlat79 * u_xlat16_13.x + u_xlat16_90;
    u_xlat16_13.x = u_xlat16_90 + u_xlat16_90;
    u_xlat16_39 = (-u_xlat16_90) * 2.0 + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_39 + u_xlat16_13.x;
    u_xlat16_90 = u_xlat0.w * u_xlat16_90;
    u_xlat16_90 = min(u_xlat16_2.z, u_xlat16_90);
    u_xlat6.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_14.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_14.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat3.y = u_xlat16_40.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_40.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_40.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_90) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_12.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_38;
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
  GpuProgramID 112962
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Skin_SweatGUI"
}