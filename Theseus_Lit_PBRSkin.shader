//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Skin)" {
Properties {

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

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

_ACESLutTex ("ACES Lut", 2D) = "white" { }

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
  GpuProgramID 36856
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat70;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
float u_xlat91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
float u_xlat97;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = vec3(u_xlat16_84) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_85 = _sssIntensity * _sssIntensity;
    u_xlat16_85 = u_xlat16_2.x * u_xlat16_85;
    u_xlat16_87 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_88 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat16_12.xyz;
    u_xlat16_88 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_87);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_88 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_85);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_57) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat89 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat89);
    u_xlat89 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat16_32.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat89 * u_xlat89;
    u_xlat83 = u_xlat16_3.x + -1.0;
    u_xlat29 = u_xlat29 * u_xlat83 + 1.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat16_3.x / u_xlat29;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat89 = (-u_xlat16.x) * u_xlat16_3.x + u_xlat16.x;
    u_xlat89 = u_xlat16.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat16.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat90 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat90 = u_xlat2.x * u_xlat90 + u_xlat16_3.x;
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat2.x + u_xlat90;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat90 = u_xlat89 * u_xlat90;
    u_xlat90 = float(1.0) / u_xlat90;
    u_xlat91 = min(u_xlat90, 16.0);
    u_xlat70 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_32.x = u_xlat70 * u_xlat70;
    u_xlat16_32.x = u_xlat70 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat70 * u_xlat16_32.x;
    u_xlat16_87 = u_xlat70 * u_xlat16_32.x;
    u_xlat97 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat97 = min(max(u_xlat97, 0.0), 1.0);
#else
    u_xlat97 = clamp(u_xlat97, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_32.x) * u_xlat70 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat70);
    u_xlat17.xyz = vec3(u_xlat97) * vec3(u_xlat16_87) + u_xlat17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_32.x = sqrt(u_xlat16_30.x);
    u_xlat16_20.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_32.xxx * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-u_xlat2.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_57) * u_xlat16_19.xyz + u_xlat2.xxx;
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat29 = u_xlat29 * u_xlat91;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat29);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_87);
    u_xlat16_23.xyz = vec3(u_xlat16_92) * u_xlat22.xyz;
    u_xlat16_24.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_93 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_93);
    u_xlat16_93 = float(1.0) / float(u_xlat16_87);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_93;
    u_xlat16_87 = max(u_xlat16_24.x, u_xlat16_87);
    u_xlat16_87 = u_xlat16_92 * u_xlat16_87;
    u_xlat16_24.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat27.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xy = min(max(u_xlat27.xy, 0.0), 1.0);
#else
    u_xlat27.xy = clamp(u_xlat27.xy, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat10.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat22.xyz = u_xlat2.xxx * u_xlat22.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat83 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat91 = (-u_xlat29) * u_xlat16_3.x + u_xlat29;
    u_xlat91 = u_xlat29 * u_xlat91 + u_xlat16_3.x;
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat29 + u_xlat91;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat89 * u_xlat91;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat91 = min(u_xlat91, 16.0);
    u_xlat70 = (-u_xlat16_87) + 1.0;
    u_xlat16_87 = u_xlat70 * u_xlat70;
    u_xlat16_87 = u_xlat70 * u_xlat16_87;
    u_xlat16_87 = u_xlat70 * u_xlat16_87;
    u_xlat16_92 = u_xlat70 * u_xlat16_87;
    u_xlat70 = (-u_xlat16_87) * u_xlat70 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat70);
    u_xlat22.xyz = vec3(u_xlat97) * vec3(u_xlat16_92) + u_xlat22.xyz;
    u_xlat16_23.xyz = vec3(u_xlat29) * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_25.xy = u_xlat27.xy * u_xlat16_32.xx;
    u_xlat16_25.xzw = u_xlat16_25.xxx * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.xzw + (-vec3(u_xlat29));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat29);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat91;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xyz = min(max(u_xlat22.xyz, 0.0), 1.0);
#else
    u_xlat22.xyz = clamp(u_xlat22.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = vec3(u_xlat29) * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_24.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat27.xxx * u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_32.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat17.xyz;
    u_xlat16_25.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.zzz + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_92);
    u_xlat16_92 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_92;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_87 * u_xlat16_32.x;
    u_xlat16_25.xzw = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat10.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat83 + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat16_3.x / u_xlat27.x;
    u_xlat27.x = u_xlat27.x * 0.318309873;
    u_xlat27.x = min(u_xlat27.x, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat89;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_32.x = u_xlat83 * u_xlat16_84;
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xyz = vec3(u_xlat97) * u_xlat16_32.xxx + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_25.yyy * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xzw * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat27.x = u_xlat27.x * u_xlat29;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat27.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_25.xzw * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat27.yyy + u_xlat16_24.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat27.yyy + u_xlat16_21.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati27 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat20.y = u_xlat8.y;
    u_xlat20.xz = u_xlat16_20.xz;
    u_xlat54 = dot(u_xlat16_18.xyz, u_xlat20.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_21.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.www * u_xlat16_21.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_85) * u_xlat16_21.xyz + u_xlat16_4.xyz;
    u_xlat54 = min(u_xlat16_30.x, 1.0);
    u_xlat2.x = min(u_xlat54, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat2.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat2.xxx * u_xlat16_30.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat2.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_21.xyz * u_xlat2.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_21.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_85 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_11.xyz);
    u_xlat10.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat10.xyz = u_xlat16_3.xxx * u_xlat10.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_9.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_9.x = u_xlat16_85 * 16.0 + u_xlat16_9.y;
    u_xlat16_11.x = u_xlat16_32.x * 16.0 + u_xlat16_9.y;
    u_xlat16_32.xz = u_xlat16_9.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_11.y = u_xlat16_9.z;
    u_xlat16_32.xz = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27.x;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_88 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat54 * 0.5;
    u_xlat16_32.x = (-u_xlat54) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat54 * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat10.xz);
    u_xlat10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat10.xz);
    u_xlat10.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_32.xyz;
    u_xlat16.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_11.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat70;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
float u_xlat91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
float u_xlat97;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = vec3(u_xlat16_84) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_85 = _sssIntensity * _sssIntensity;
    u_xlat16_85 = u_xlat16_2.x * u_xlat16_85;
    u_xlat16_87 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_88 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat16_12.xyz;
    u_xlat16_88 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_88 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 + -1.0;
    u_xlat16_88 = _occlusionScale * u_xlat16_88 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_87);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_88 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_85);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_57) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat89 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat89);
    u_xlat89 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat16_32.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat89 * u_xlat89;
    u_xlat83 = u_xlat16_3.x + -1.0;
    u_xlat29 = u_xlat29 * u_xlat83 + 1.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat16_3.x / u_xlat29;
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat89 = (-u_xlat16.x) * u_xlat16_3.x + u_xlat16.x;
    u_xlat89 = u_xlat16.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat16.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat90 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat90 = u_xlat2.x * u_xlat90 + u_xlat16_3.x;
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat2.x + u_xlat90;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat90 = u_xlat89 * u_xlat90;
    u_xlat90 = float(1.0) / u_xlat90;
    u_xlat91 = min(u_xlat90, 16.0);
    u_xlat70 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_32.x = u_xlat70 * u_xlat70;
    u_xlat16_32.x = u_xlat70 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat70 * u_xlat16_32.x;
    u_xlat16_87 = u_xlat70 * u_xlat16_32.x;
    u_xlat97 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat97 = min(max(u_xlat97, 0.0), 1.0);
#else
    u_xlat97 = clamp(u_xlat97, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_32.x) * u_xlat70 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat70);
    u_xlat17.xyz = vec3(u_xlat97) * vec3(u_xlat16_87) + u_xlat17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_32.x = sqrt(u_xlat16_30.x);
    u_xlat16_20.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_32.xxx * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-u_xlat2.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_57) * u_xlat16_19.xyz + u_xlat2.xxx;
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat29 = u_xlat29 * u_xlat91;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat29);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_87);
    u_xlat16_23.xyz = vec3(u_xlat16_92) * u_xlat22.xyz;
    u_xlat16_24.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_93 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_93);
    u_xlat16_93 = float(1.0) / float(u_xlat16_87);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_93;
    u_xlat16_87 = max(u_xlat16_24.x, u_xlat16_87);
    u_xlat16_87 = u_xlat16_92 * u_xlat16_87;
    u_xlat16_24.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat27.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xy = min(max(u_xlat27.xy, 0.0), 1.0);
#else
    u_xlat27.xy = clamp(u_xlat27.xy, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat10.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat22.xyz = u_xlat2.xxx * u_xlat22.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat83 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat91 = (-u_xlat29) * u_xlat16_3.x + u_xlat29;
    u_xlat91 = u_xlat29 * u_xlat91 + u_xlat16_3.x;
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat29 + u_xlat91;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat89 * u_xlat91;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat91 = min(u_xlat91, 16.0);
    u_xlat70 = (-u_xlat16_87) + 1.0;
    u_xlat16_87 = u_xlat70 * u_xlat70;
    u_xlat16_87 = u_xlat70 * u_xlat16_87;
    u_xlat16_87 = u_xlat70 * u_xlat16_87;
    u_xlat16_92 = u_xlat70 * u_xlat16_87;
    u_xlat70 = (-u_xlat16_87) * u_xlat70 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat70);
    u_xlat22.xyz = vec3(u_xlat97) * vec3(u_xlat16_92) + u_xlat22.xyz;
    u_xlat16_23.xyz = vec3(u_xlat29) * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_25.xy = u_xlat27.xy * u_xlat16_32.xx;
    u_xlat16_25.xzw = u_xlat16_25.xxx * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.xzw + (-vec3(u_xlat29));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat29);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat91;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xyz = min(max(u_xlat22.xyz, 0.0), 1.0);
#else
    u_xlat22.xyz = clamp(u_xlat22.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = vec3(u_xlat29) * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_24.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat27.xxx * u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_32.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat17.xyz;
    u_xlat16_25.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.zzz + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_92);
    u_xlat16_92 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_92;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_87 * u_xlat16_32.x;
    u_xlat16_25.xzw = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat10.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat83 + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat16_3.x / u_xlat27.x;
    u_xlat27.x = u_xlat27.x * 0.318309873;
    u_xlat27.x = min(u_xlat27.x, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat89;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_32.x = u_xlat83 * u_xlat16_84;
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xyz = vec3(u_xlat97) * u_xlat16_32.xxx + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_18.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_25.yyy * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xzw * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat27.x = u_xlat27.x * u_xlat29;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat27.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_25.xzw * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat27.yyy + u_xlat16_24.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat27.yyy + u_xlat16_21.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati27 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat20.y = u_xlat8.y;
    u_xlat20.xz = u_xlat16_20.xz;
    u_xlat54 = dot(u_xlat16_18.xyz, u_xlat20.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_21.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.www * u_xlat16_21.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_85) * u_xlat16_21.xyz + u_xlat16_4.xyz;
    u_xlat54 = min(u_xlat16_30.x, 1.0);
    u_xlat2.x = min(u_xlat54, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat2.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat2.xxx * u_xlat16_30.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat2.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_21.xyz * u_xlat2.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_21.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_85 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_11.xyz);
    u_xlat10.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat10.xyz = u_xlat16_3.xxx * u_xlat10.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_9.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_9.x = u_xlat16_85 * 16.0 + u_xlat16_9.y;
    u_xlat16_11.x = u_xlat16_32.x * 16.0 + u_xlat16_9.y;
    u_xlat16_32.xz = u_xlat16_9.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_11.y = u_xlat16_9.z;
    u_xlat16_32.xz = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27.x;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_88 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat54 * 0.5;
    u_xlat16_32.x = (-u_xlat54) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat54 * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat10.xz);
    u_xlat10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat10.xz);
    u_xlat10.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_32.xyz;
    u_xlat16.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_11.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat64;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30) + u_xlat16_57;
    u_xlat16_30 = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_5.w * u_xlat16_30;
    u_xlat16_30 = u_xlat16_93 * u_xlat16_30;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29 = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat83 = (-u_xlat18.x) * u_xlat16_3.x + u_xlat18.x;
    u_xlat83 = u_xlat18.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat18.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_84) + 1.0;
    u_xlat16_32.x = u_xlat90 * u_xlat90;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_88 = u_xlat90 * u_xlat16_32.x;
    u_xlat64 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat90 = (-u_xlat16_32.x) * u_xlat90 + 1.0;
    u_xlat19.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat19.xyz = vec3(u_xlat64) * vec3(u_xlat16_88) + u_xlat19.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_32.x = sqrt(u_xlat16_30);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_32.xxx;
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = vec3(u_xlat16_94) * u_xlat20.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_25.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_94 * u_xlat16_88;
    u_xlat16_25.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_23.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat90 * u_xlat90;
    u_xlat16_88 = u_xlat90 * u_xlat16_88;
    u_xlat16_88 = u_xlat90 * u_xlat16_88;
    u_xlat16_94 = u_xlat90 * u_xlat16_88;
    u_xlat90 = (-u_xlat16_88) * u_xlat90 + 1.0;
    u_xlat20.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat20.xyz = vec3(u_xlat64) * vec3(u_xlat16_94) + u_xlat20.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = u_xlat16_32.xx * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + u_xlat2.xxx;
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.xyz;
    u_xlat20.xyz = u_xlat2.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_25.xyz * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10.xxx * u_xlat20.xyz;
    u_xlat16_21.xyz = u_xlat19.xyz * u_xlat16_21.xyz + u_xlat20.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_32.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat19.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_94;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x;
    u_xlat16_25.xyz = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat11.xyz = vec3(u_xlat54) * u_xlat11.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat83;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat83 * u_xlat83;
    u_xlat16_85 = u_xlat83 * u_xlat16_85;
    u_xlat16_85 = u_xlat83 * u_xlat16_85;
    u_xlat16_32.x = u_xlat83 * u_xlat16_85;
    u_xlat83 = (-u_xlat16_85) * u_xlat83 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xzw = vec3(u_xlat64) * u_xlat16_32.xxx + u_xlat11.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat54 = u_xlat54 * u_xlat29;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_16.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(vec2(u_xlat16_30), u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat27.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat27.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_23.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_16.xyw;
    u_xlat16_23.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_85 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_3.w);
    u_xlat16_59 = u_xlat16_32.x + 1.0;
    u_xlat16_59 = min(u_xlat16_59, 15.0);
    u_xlat16_86 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_3.x = u_xlat16_32.x * 16.0 + u_xlat16_3.y;
    u_xlat16_12.x = u_xlat16_59 * 16.0 + u_xlat16_3.y;
    u_xlat16_32.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_93 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat27.y * 0.5;
    u_xlat16_59 = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_59 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_86 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_86 + u_xlat16_59;
    u_xlat16_32.x = u_xlat27.y * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_59;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_85);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_85 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat18.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat64;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30) + u_xlat16_57;
    u_xlat16_30 = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_5.w * u_xlat16_30;
    u_xlat16_30 = u_xlat16_93 * u_xlat16_30;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29 = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat83 = (-u_xlat18.x) * u_xlat16_3.x + u_xlat18.x;
    u_xlat83 = u_xlat18.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat18.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_84) + 1.0;
    u_xlat16_32.x = u_xlat90 * u_xlat90;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_88 = u_xlat90 * u_xlat16_32.x;
    u_xlat64 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat90 = (-u_xlat16_32.x) * u_xlat90 + 1.0;
    u_xlat19.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat19.xyz = vec3(u_xlat64) * vec3(u_xlat16_88) + u_xlat19.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_32.x = sqrt(u_xlat16_30);
    u_xlat16_23.xyz = u_xlat16_21.xyz * u_xlat16_32.xxx;
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = vec3(u_xlat16_94) * u_xlat20.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_25.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_94 * u_xlat16_88;
    u_xlat16_25.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_23.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat90 * u_xlat90;
    u_xlat16_88 = u_xlat90 * u_xlat16_88;
    u_xlat16_88 = u_xlat90 * u_xlat16_88;
    u_xlat16_94 = u_xlat90 * u_xlat16_88;
    u_xlat90 = (-u_xlat16_88) * u_xlat90 + 1.0;
    u_xlat20.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat20.xyz = vec3(u_xlat64) * vec3(u_xlat16_94) + u_xlat20.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = u_xlat16_32.xx * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + u_xlat2.xxx;
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.xyz;
    u_xlat20.xyz = u_xlat2.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_25.xyz * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10.xxx * u_xlat20.xyz;
    u_xlat16_21.xyz = u_xlat19.xyz * u_xlat16_21.xyz + u_xlat20.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_32.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat19.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_94;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x;
    u_xlat16_25.xyz = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat11.xyz = vec3(u_xlat54) * u_xlat11.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat83;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat83 * u_xlat83;
    u_xlat16_85 = u_xlat83 * u_xlat16_85;
    u_xlat16_85 = u_xlat83 * u_xlat16_85;
    u_xlat16_32.x = u_xlat83 * u_xlat16_85;
    u_xlat83 = (-u_xlat16_85) * u_xlat83 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xzw = vec3(u_xlat64) * u_xlat16_32.xxx + u_xlat11.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat54 = u_xlat54 * u_xlat29;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_16.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(vec2(u_xlat16_30), u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat27.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat27.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_23.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_16.xyw;
    u_xlat16_23.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_85 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_3.w);
    u_xlat16_59 = u_xlat16_32.x + 1.0;
    u_xlat16_59 = min(u_xlat16_59, 15.0);
    u_xlat16_86 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_3.x = u_xlat16_32.x * 16.0 + u_xlat16_3.y;
    u_xlat16_12.x = u_xlat16_59 * 16.0 + u_xlat16_3.y;
    u_xlat16_32.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_93 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat27.y * 0.5;
    u_xlat16_59 = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_59 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_86 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_86 + u_xlat16_59;
    u_xlat16_32.x = u_xlat27.y * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_59;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_85);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_85 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat18.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
float u_xlat27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_30;
float u_xlat50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat66;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
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
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_79 = _sssIntensity * _sssIntensity;
    u_xlat16_79 = u_xlat16_2.x * u_xlat16_79;
    u_xlat16_81 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_82 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_12.xyz = vec3(u_xlat16_82) * u_xlat16_12.xyz;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_81);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_28.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_28.x * 0.5 + 0.5;
    u_xlat16_53 = (-u_xlat16_28.x) + u_xlat16_53;
    u_xlat16_28.x = u_xlat16_5.w * u_xlat16_53 + u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_5.w * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_82 * u_xlat16_28.x;
    u_xlat16_53 = sqrt(u_xlat16_79);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat83 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat83);
    u_xlat83 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat83 * u_xlat83;
    u_xlat77 = u_xlat16_3.x + -1.0;
    u_xlat27 = u_xlat27 * u_xlat77 + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat16_3.x / u_xlat27;
    u_xlat27 = u_xlat27 * 0.318309873;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat83 = (-u_xlat16.x) * u_xlat16_3.x + u_xlat16.x;
    u_xlat83 = u_xlat16.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat16.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat84 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat84 = u_xlat2.x * u_xlat84 + u_xlat16_3.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat2.x + u_xlat84;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat83 * u_xlat84;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_30.x = u_xlat85 * u_xlat85;
    u_xlat16_30.x = u_xlat85 * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat85 * u_xlat16_30.x;
    u_xlat16_81 = u_xlat85 * u_xlat16_30.x;
    u_xlat66 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat16_30.x) * u_xlat85 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat85);
    u_xlat17.xyz = vec3(u_xlat66) * vec3(u_xlat16_81) + u_xlat17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_30.x = sqrt(u_xlat16_28.x);
    u_xlat16_19.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_30.xxx * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + (-u_xlat2.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_53) * u_xlat16_18.xyz + u_xlat2.xxx;
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = vec3(u_xlat16_86) * u_xlat21.xyz;
    u_xlat16_22.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_87);
    u_xlat16_87 = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
    u_xlat16_81 = max(u_xlat16_22.x, u_xlat16_81);
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat16_22.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat16_20.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat27 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat77 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat84 = (-u_xlat27) * u_xlat16_3.x + u_xlat27;
    u_xlat84 = u_xlat27 * u_xlat84 + u_xlat16_3.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat27 + u_xlat84;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat83 * u_xlat84;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat85 * u_xlat85;
    u_xlat16_81 = u_xlat85 * u_xlat16_81;
    u_xlat16_81 = u_xlat85 * u_xlat16_81;
    u_xlat16_86 = u_xlat85 * u_xlat16_81;
    u_xlat85 = (-u_xlat16_81) * u_xlat85 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat85);
    u_xlat21.xyz = vec3(u_xlat66) * vec3(u_xlat16_86) + u_xlat21.xyz;
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_23.xy = u_xlat25.xy * u_xlat16_30.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.xzw + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_53) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat84;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat27) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_22.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat25.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_20.xyz;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_30.x = max(u_xlat16_30.x, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_30.x);
    u_xlat16_20.xyz = vec3(u_xlat16_81) * u_xlat17.xyz;
    u_xlat16_23.xz = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.zzz + u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_86 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_86 = u_xlat16_86 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_86);
    u_xlat16_86 = float(1.0) / float(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_86;
    u_xlat16_30.x = max(u_xlat16_23.x, u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_81 * u_xlat16_30.x;
    u_xlat16_23.xzw = u_xlat16_30.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat25.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat10.xyz = u_xlat25.xxx * u_xlat10.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_20.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat77 + 1.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat16_3.x / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * 0.318309873;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat27 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat27 = u_xlat2.x * u_xlat27 + u_xlat16_3.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 + u_xlat2.x;
    u_xlat27 = u_xlat27 + 6.10351563e-05;
    u_xlat27 = u_xlat27 * u_xlat83;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat77 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat77 * u_xlat77;
    u_xlat16_78 = u_xlat77 * u_xlat16_78;
    u_xlat16_78 = u_xlat77 * u_xlat16_78;
    u_xlat16_30.x = u_xlat77 * u_xlat16_78;
    u_xlat77 = (-u_xlat16_78) * u_xlat77 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat66) * u_xlat16_30.xxx + u_xlat10.xyz;
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_23.yyy * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz + u_xlat2.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_23.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat25.x = u_xlat25.x * u_xlat27;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_23.xzw * u_xlat2.xyw;
    u_xlat16_14.xyz = u_xlat2.xyw * u_xlat25.yyy + u_xlat16_22.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat25.yyy + u_xlat16_18.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati25 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat50 = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat50) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_5.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz + u_xlat16_4.xyz;
    u_xlat50 = min(u_xlat16_28.x, 1.0);
    u_xlat2.x = min(u_xlat50, u_xlat16_2.z);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_28.xyz = u_xlat2.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat2.xxx * u_xlat16_28.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat2.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_28.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_82) * u_xlat16_15.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyz;
    u_xlati25 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_15.xyw;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_79 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_79 = u_xlat16_79 + u_xlat16_79;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_79) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyw);
    u_xlat16_30.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_30.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_10.w);
    u_xlat16_30.x = u_xlat16_79 + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_55 = u_xlat16_30.z * 15.0 + (-u_xlat16_79);
    u_xlat16_10.x = u_xlat16_79 * 16.0 + u_xlat16_10.y;
    u_xlat16_11.x = u_xlat16_30.x * 16.0 + u_xlat16_10.y;
    u_xlat16_30.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_11.y = u_xlat16_10.z;
    u_xlat16_30.xz = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_79 = (-u_xlat16_0.x) + u_xlat16_25.x;
    u_xlat16_79 = u_xlat16_55 * u_xlat16_79 + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_82 * u_xlat16_79;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_79;
    u_xlat16_79 = u_xlat50 * 0.5;
    u_xlat16_30.x = (-u_xlat50) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_30.x + u_xlat16_79;
    u_xlat16_30.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_55 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_55 + u_xlat16_30.x;
    u_xlat16_79 = u_xlat50 * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_2.z, u_xlat16_79);
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_30.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_30.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_30.xyz;
    u_xlat16.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_76;
    u_xlat16_11.xyz = u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_76 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
float u_xlat27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_30;
float u_xlat50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat66;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
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
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_79 = _sssIntensity * _sssIntensity;
    u_xlat16_79 = u_xlat16_2.x * u_xlat16_79;
    u_xlat16_81 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_82 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_12.xyz = vec3(u_xlat16_82) * u_xlat16_12.xyz;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_81);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_28.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_28.x * 0.5 + 0.5;
    u_xlat16_53 = (-u_xlat16_28.x) + u_xlat16_53;
    u_xlat16_28.x = u_xlat16_5.w * u_xlat16_53 + u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_5.w * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_82 * u_xlat16_28.x;
    u_xlat16_53 = sqrt(u_xlat16_79);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat83 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat83);
    u_xlat83 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat16_30.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat83 * u_xlat83;
    u_xlat77 = u_xlat16_3.x + -1.0;
    u_xlat27 = u_xlat27 * u_xlat77 + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat16_3.x / u_xlat27;
    u_xlat27 = u_xlat27 * 0.318309873;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat83 = (-u_xlat16.x) * u_xlat16_3.x + u_xlat16.x;
    u_xlat83 = u_xlat16.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat16.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat84 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat84 = u_xlat2.x * u_xlat84 + u_xlat16_3.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat2.x + u_xlat84;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat83 * u_xlat84;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_30.x = u_xlat85 * u_xlat85;
    u_xlat16_30.x = u_xlat85 * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat85 * u_xlat16_30.x;
    u_xlat16_81 = u_xlat85 * u_xlat16_30.x;
    u_xlat66 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat16_30.x) * u_xlat85 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat85);
    u_xlat17.xyz = vec3(u_xlat66) * vec3(u_xlat16_81) + u_xlat17.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_30.x = sqrt(u_xlat16_28.x);
    u_xlat16_19.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_30.xxx * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.xyz + (-u_xlat2.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_53) * u_xlat16_18.xyz + u_xlat2.xxx;
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = vec3(u_xlat16_86) * u_xlat21.xyz;
    u_xlat16_22.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_87);
    u_xlat16_87 = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
    u_xlat16_81 = max(u_xlat16_22.x, u_xlat16_81);
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat16_22.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat16_20.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat27 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat77 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat84 = (-u_xlat27) * u_xlat16_3.x + u_xlat27;
    u_xlat84 = u_xlat27 * u_xlat84 + u_xlat16_3.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat27 + u_xlat84;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat83 * u_xlat84;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat85 * u_xlat85;
    u_xlat16_81 = u_xlat85 * u_xlat16_81;
    u_xlat16_81 = u_xlat85 * u_xlat16_81;
    u_xlat16_86 = u_xlat85 * u_xlat16_81;
    u_xlat85 = (-u_xlat16_81) * u_xlat85 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat85);
    u_xlat21.xyz = vec3(u_xlat66) * vec3(u_xlat16_86) + u_xlat21.xyz;
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_23.xy = u_xlat25.xy * u_xlat16_30.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.xzw + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_53) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat84;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat27) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_22.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat25.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_20.xyz;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_30.x = max(u_xlat16_30.x, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_30.x);
    u_xlat16_20.xyz = vec3(u_xlat16_81) * u_xlat17.xyz;
    u_xlat16_23.xz = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.zzz + u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_86 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_86 = u_xlat16_86 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_86);
    u_xlat16_86 = float(1.0) / float(u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_86;
    u_xlat16_30.x = max(u_xlat16_23.x, u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_81 * u_xlat16_30.x;
    u_xlat16_23.xzw = u_xlat16_30.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat25.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat10.xyz = u_xlat25.xxx * u_xlat10.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_20.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat77 + 1.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat16_3.x / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * 0.318309873;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat27 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat27 = u_xlat2.x * u_xlat27 + u_xlat16_3.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 + u_xlat2.x;
    u_xlat27 = u_xlat27 + 6.10351563e-05;
    u_xlat27 = u_xlat27 * u_xlat83;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat77 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat77 * u_xlat77;
    u_xlat16_78 = u_xlat77 * u_xlat16_78;
    u_xlat16_78 = u_xlat77 * u_xlat16_78;
    u_xlat16_30.x = u_xlat77 * u_xlat16_78;
    u_xlat77 = (-u_xlat16_78) * u_xlat77 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat66) * u_xlat16_30.xxx + u_xlat10.xyz;
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_23.yyy * u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz + u_xlat2.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_23.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat25.x = u_xlat25.x * u_xlat27;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_23.xzw * u_xlat2.xyw;
    u_xlat16_14.xyz = u_xlat2.xyw * u_xlat25.yyy + u_xlat16_22.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat25.yyy + u_xlat16_18.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati25 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat50 = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat50) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_5.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz + u_xlat16_4.xyz;
    u_xlat50 = min(u_xlat16_28.x, 1.0);
    u_xlat2.x = min(u_xlat50, u_xlat16_2.z);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_28.xyz = u_xlat2.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat2.xxx * u_xlat16_28.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat2.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_28.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_82) * u_xlat16_15.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_19.xyz;
    u_xlati25 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_15.xyw;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_79 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_79 = u_xlat16_79 + u_xlat16_79;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_79) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyw);
    u_xlat16_30.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_30.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_10.w);
    u_xlat16_30.x = u_xlat16_79 + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_55 = u_xlat16_30.z * 15.0 + (-u_xlat16_79);
    u_xlat16_10.x = u_xlat16_79 * 16.0 + u_xlat16_10.y;
    u_xlat16_11.x = u_xlat16_30.x * 16.0 + u_xlat16_10.y;
    u_xlat16_30.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_11.y = u_xlat16_10.z;
    u_xlat16_30.xz = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_79 = (-u_xlat16_0.x) + u_xlat16_25.x;
    u_xlat16_79 = u_xlat16_55 * u_xlat16_79 + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_82 * u_xlat16_79;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_79;
    u_xlat16_79 = u_xlat50 * 0.5;
    u_xlat16_30.x = (-u_xlat50) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_30.x + u_xlat16_79;
    u_xlat16_30.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_55 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_55 + u_xlat16_30.x;
    u_xlat16_79 = u_xlat50 * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_2.z, u_xlat16_79);
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_30.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_30.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_30.xyz;
    u_xlat16.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_76;
    u_xlat16_11.xyz = u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_76 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_76) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat64;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29 = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat83 = (-u_xlat17.x) * u_xlat16_3.x + u_xlat17.x;
    u_xlat83 = u_xlat17.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat17.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat90 * u_xlat90;
    u_xlat16_84 = u_xlat90 * u_xlat16_84;
    u_xlat16_84 = u_xlat90 * u_xlat16_84;
    u_xlat16_32.x = u_xlat90 * u_xlat16_84;
    u_xlat64 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat90 = (-u_xlat16_84) * u_xlat90 + 1.0;
    u_xlat18.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat18.xyz = vec3(u_xlat64) * u_xlat16_32.xxx + u_xlat18.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat19.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_94;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x;
    u_xlat16_25.xyz = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat19.xyz = vec3(u_xlat54) * u_xlat19.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_32.x = dot(u_xlat16_23.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_32.x = u_xlat90 * u_xlat90;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_88 = u_xlat90 * u_xlat16_32.x;
    u_xlat90 = (-u_xlat16_32.x) * u_xlat90 + 1.0;
    u_xlat19.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat19.xyz = vec3(u_xlat64) * vec3(u_xlat16_88) + u_xlat19.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + u_xlat2.xxx;
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat16_25.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat10.xxx * u_xlat19.xyz;
    u_xlat16_21.xyz = u_xlat18.xyz * u_xlat16_21.xyz + u_xlat19.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_32.x * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat11.xyz = vec3(u_xlat54) * u_xlat11.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat83;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xzw = vec3(u_xlat64) * vec3(u_xlat16_85) + u_xlat11.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat54 = u_xlat54 * u_xlat29;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_16.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_16.xyw;
    u_xlat16_22.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat17.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
float u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat64;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29 = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat83 = (-u_xlat17.x) * u_xlat16_3.x + u_xlat17.x;
    u_xlat83 = u_xlat17.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat17.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat90 * u_xlat90;
    u_xlat16_84 = u_xlat90 * u_xlat16_84;
    u_xlat16_84 = u_xlat90 * u_xlat16_84;
    u_xlat16_32.x = u_xlat90 * u_xlat16_84;
    u_xlat64 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat90 = (-u_xlat16_84) * u_xlat90 + 1.0;
    u_xlat18.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat18.xyz = vec3(u_xlat64) * u_xlat16_32.xxx + u_xlat18.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_32.x = max(u_xlat16_32.x, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_32.x);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat19.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_94;
    u_xlat16_32.x = max(u_xlat16_25.x, u_xlat16_32.x);
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x;
    u_xlat16_25.xyz = u_xlat16_32.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat19.xyz = vec3(u_xlat54) * u_xlat19.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_32.x = dot(u_xlat16_23.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat83 * u_xlat89;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat89 = min(u_xlat89, 16.0);
    u_xlat90 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_32.x = u_xlat90 * u_xlat90;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat90 * u_xlat16_32.x;
    u_xlat16_88 = u_xlat90 * u_xlat16_32.x;
    u_xlat90 = (-u_xlat16_32.x) * u_xlat90 + 1.0;
    u_xlat19.xyz = u_xlat16_1.xyz * vec3(u_xlat90);
    u_xlat19.xyz = vec3(u_xlat64) * vec3(u_xlat16_88) + u_xlat19.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + u_xlat2.xxx;
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat54 = u_xlat54 * u_xlat89;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _directSpecularColor.xyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat16_25.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat10.xxx * u_xlat19.xyz;
    u_xlat16_21.xyz = u_xlat18.xyz * u_xlat16_21.xyz + u_xlat19.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_32.x * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_85) + u_xlat16_23.xyz;
    u_xlat54 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat11.xyz = vec3(u_xlat54) * u_xlat11.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat29 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat29 = u_xlat2.x * u_xlat29 + u_xlat16_3.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat2.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat29 = u_xlat29 * u_xlat83;
    u_xlat29 = float(1.0) / u_xlat29;
    u_xlat29 = min(u_xlat29, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat10.xzw = vec3(u_xlat64) * vec3(u_xlat16_85) + u_xlat11.xyz;
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-u_xlat2.xxx);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + u_xlat2.xxx;
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat54 = u_xlat54 * u_xlat29;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_15.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_16.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_93) * u_xlat16_16.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_16.xyw;
    u_xlat16_22.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat17.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat40;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat58;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
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
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_11.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_2.x * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat80);
    u_xlat80 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat80 * u_xlat80;
    u_xlat74 = u_xlat16_3.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat74 + 1.0;
    u_xlat80 = u_xlat26 * u_xlat26;
    u_xlat80 = u_xlat16_3.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat81 = u_xlat10.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat58 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat58 = u_xlat2.x * u_xlat58 + u_xlat16_3.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat2.x + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat58 * u_xlat58;
    u_xlat16_29.x = u_xlat58 * u_xlat16_75;
    u_xlat16_29.x = u_xlat58 * u_xlat16_29.x;
    u_xlat16_78 = u_xlat58 * u_xlat16_29.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat40.x = (-u_xlat16_29.x) * u_xlat58 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * u_xlat40.xxx;
    u_xlat16.xyz = u_xlat16.xxx * vec3(u_xlat16_78) + u_xlat40.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27);
    u_xlat16_18.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_29.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + (-u_xlat2.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat2.xxx;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat2.xxx * u_xlat16.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = vec3(u_xlat16_83) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_22.xzw + (-vec3(u_xlat80));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat80);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_19.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = vec3(u_xlat16_78) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat24.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.yyy * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat24.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + u_xlat24.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_21.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat24.xxx + u_xlat16_17.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati20.x) & 1u));
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat15.y = u_xlat8.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat15.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat23.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat23.xyz = vec3(u_xlat48) * u_xlat23.xyz + _sssColorBack.xyz;
    u_xlat16_17.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_5.www * u_xlat16_17.xyz + _sssColorOcc.xyz;
    u_xlat23.xyz = u_xlat16_17.xyz * u_xlat23.xyz;
    u_xlat16_17.xyz = u_xlat23.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27, 1.0);
    u_xlat80 = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat80) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat80) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat80) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat80) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz;
    u_xlati80 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati80].xyz;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_14.xyw;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat20.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat20.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat20.xyz;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat20.xyz);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_3.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_3.x = u_xlat16_29.x * 16.0 + u_xlat16_3.y;
    u_xlat16_11.x = u_xlat16_53 * 16.0 + u_xlat16_3.y;
    u_xlat16_29.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_11.y = u_xlat16_3.z;
    u_xlat16_29.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_0.x;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat48 * 0.5;
    u_xlat16_53 = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat48 * u_xlat16_29.x;
    u_xlat16_29.x = min(u_xlat16_2.z, u_xlat16_29.x);
    u_xlat16_53 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_53;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_76);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_11.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat24.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat24.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat24.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat24.xyz + u_xlat16_8.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat40;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat58;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
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
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_11.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_2.x * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat80);
    u_xlat80 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat80 * u_xlat80;
    u_xlat74 = u_xlat16_3.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat74 + 1.0;
    u_xlat80 = u_xlat26 * u_xlat26;
    u_xlat80 = u_xlat16_3.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat81 = u_xlat10.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat58 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat58 = u_xlat2.x * u_xlat58 + u_xlat16_3.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat2.x + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat58 * u_xlat58;
    u_xlat16_29.x = u_xlat58 * u_xlat16_75;
    u_xlat16_29.x = u_xlat58 * u_xlat16_29.x;
    u_xlat16_78 = u_xlat58 * u_xlat16_29.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat40.x = (-u_xlat16_29.x) * u_xlat58 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * u_xlat40.xxx;
    u_xlat16.xyz = u_xlat16.xxx * vec3(u_xlat16_78) + u_xlat40.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27);
    u_xlat16_18.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_29.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + (-u_xlat2.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat2.xxx;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat2.xxx * u_xlat16.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = vec3(u_xlat16_83) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_22.xzw + (-vec3(u_xlat80));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat80);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_19.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = vec3(u_xlat16_78) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat24.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.yyy * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat24.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + u_xlat24.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_21.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat24.xxx + u_xlat16_17.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati20.x) & 1u));
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat15.y = u_xlat8.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat15.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat23.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat23.xyz = vec3(u_xlat48) * u_xlat23.xyz + _sssColorBack.xyz;
    u_xlat16_17.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_5.www * u_xlat16_17.xyz + _sssColorOcc.xyz;
    u_xlat23.xyz = u_xlat16_17.xyz * u_xlat23.xyz;
    u_xlat16_17.xyz = u_xlat23.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27, 1.0);
    u_xlat80 = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat80) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat80) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat80) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat80) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz;
    u_xlati80 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati80].xyz;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_14.xyw;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat20.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat20.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat20.xyz;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat20.xyz);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_3.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_3.x = u_xlat16_29.x * 16.0 + u_xlat16_3.y;
    u_xlat16_11.x = u_xlat16_53 * 16.0 + u_xlat16_3.y;
    u_xlat16_29.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_11.y = u_xlat16_3.z;
    u_xlat16_29.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_0.x;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat48 * 0.5;
    u_xlat16_53 = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat48 * u_xlat16_29.x;
    u_xlat16_29.x = min(u_xlat16_2.z, u_xlat16_29.x);
    u_xlat16_53 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_53;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_76);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_11.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat24.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat24.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat24.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat24.xyz + u_xlat16_8.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
int u_xlati89;
float u_xlat90;
mediump float u_xlat16_93;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29.x = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29.x = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat29.x = u_xlat11.x * u_xlat29.x + u_xlat16_3.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat11.x;
    u_xlat83 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat83 = u_xlat2.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat29.z = u_xlat83 + u_xlat2.x;
    u_xlat29.xz = u_xlat29.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat89 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat17.xyz = vec3(u_xlat89) * vec3(u_xlat16_85) + u_xlat17.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat29.x;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat17.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_25.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-vec3(u_xlat54));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat54);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-vec3(u_xlat54));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(u_xlat54);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat10.yyy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat54) + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_15.y = u_xlat16_13.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati89 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat16.y = u_xlat8.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat90 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
    u_xlat90 = max(u_xlat90, 0.0);
    u_xlat17.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat17.xyz = vec3(u_xlat90) * u_xlat17.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati89].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_15.xyw;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
float u_xlat81;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
int u_xlati89;
float u_xlat90;
mediump float u_xlat16_93;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29.x = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29.x = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat29.x = u_xlat11.x * u_xlat29.x + u_xlat16_3.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat11.x;
    u_xlat83 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat83 = u_xlat2.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat29.z = u_xlat83 + u_xlat2.x;
    u_xlat29.xz = u_xlat29.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat89 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat17.xyz = vec3(u_xlat89) * vec3(u_xlat16_85) + u_xlat17.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat29.x;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat17.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_25.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-vec3(u_xlat54));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat54);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-vec3(u_xlat54));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(u_xlat54);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat10.yyy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat54) + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_15.y = u_xlat16_13.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati89 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat16.y = u_xlat8.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat90 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
    u_xlat90 = max(u_xlat90, 0.0);
    u_xlat17.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat17.xyz = vec3(u_xlat90) * u_xlat17.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati89].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_15.xyw;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat40;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat58;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_83;
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
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_11.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_2.x * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat80);
    u_xlat80 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat81 = u_xlat16_3.x + -1.0;
    u_xlat80 = u_xlat80 * u_xlat81 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_3.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat81 = u_xlat10.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat58 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat58 = u_xlat2.x * u_xlat58 + u_xlat16_3.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat16.x = u_xlat2.x + u_xlat58;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat16.x;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat16.x * u_xlat16.x;
    u_xlat16_75 = u_xlat16.x * u_xlat16_75;
    u_xlat16_75 = u_xlat16.x * u_xlat16_75;
    u_xlat16_29.x = u_xlat16.x * u_xlat16_75;
    u_xlat40 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_75) * u_xlat16.x + 1.0;
    u_xlat16.xzw = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat40) * u_xlat16_29.xxx + u_xlat16.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_75 = sqrt(u_xlat16_27.x);
    u_xlat16_18.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + (-u_xlat2.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat2.xxx;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat2.xxx * u_xlat16.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_29.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = vec3(u_xlat16_78) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_78 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xy = u_xlat24.xy * vec2(u_xlat16_75);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_22.xzw + (-vec3(u_xlat80));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat80);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_19.xyz;
    u_xlat16_75 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_75));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_75);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_75);
    u_xlat16_19.xyz = u_xlat16_29.xxx * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_78 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_78);
    u_xlat16_78 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_78;
    u_xlat16_75 = max(u_xlat16_21.x, u_xlat16_75);
    u_xlat16_75 = u_xlat16_29.x * u_xlat16_75;
    u_xlat16_21.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat24.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.yyy * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat24.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + u_xlat24.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_21.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat24.xxx + u_xlat16_17.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati20.x) & 1u));
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat15.y = u_xlat8.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat15.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat23.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat23.xyz = vec3(u_xlat48) * u_xlat23.xyz + _sssColorBack.xyz;
    u_xlat16_17.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_5.www * u_xlat16_17.xyz + _sssColorOcc.xyz;
    u_xlat23.xyz = u_xlat16_17.xyz * u_xlat23.xyz;
    u_xlat16_17.xyz = u_xlat23.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat80 = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = vec3(u_xlat80) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat80) * u_xlat16_27.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat80) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(u_xlat80) + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz;
    u_xlati80 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati80].xyz;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyz;
    u_xlati24 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_14.xyw;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat20.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat20.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat20.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat20.xyz);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_11.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_11.x = u_xlat16_76 * 16.0 + u_xlat16_11.y;
    u_xlat16_17.x = u_xlat16_29.x * 16.0 + u_xlat16_11.y;
    u_xlat16_29.xz = u_xlat16_11.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_17.y = u_xlat16_11.z;
    u_xlat16_29.xz = u_xlat16_17.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_29.xyz;
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat40;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat58;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_83;
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
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_11.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_2.x * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_13.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat80);
    u_xlat80 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat81 = u_xlat16_3.x + -1.0;
    u_xlat80 = u_xlat80 * u_xlat81 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_3.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat81 = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat81 = u_xlat10.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat58 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat58 = u_xlat2.x * u_xlat58 + u_xlat16_3.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat16.x = u_xlat2.x + u_xlat58;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat16.x;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat16.x * u_xlat16.x;
    u_xlat16_75 = u_xlat16.x * u_xlat16_75;
    u_xlat16_75 = u_xlat16.x * u_xlat16_75;
    u_xlat16_29.x = u_xlat16.x * u_xlat16_75;
    u_xlat40 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_75) * u_xlat16.x + 1.0;
    u_xlat16.xzw = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat40) * u_xlat16_29.xxx + u_xlat16.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_14.xyz);
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_75 = sqrt(u_xlat16_27.x);
    u_xlat16_18.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + (-u_xlat2.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat2.xxx;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat80 = u_xlat80 * u_xlat81;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat2.xxx * u_xlat16.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb80 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_29.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = vec3(u_xlat16_78) * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb80)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb80 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_78 = (u_xlatb80) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xy = u_xlat24.xy * vec2(u_xlat16_75);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_22.xzw + (-vec3(u_xlat80));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat80);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_19.xyz;
    u_xlat16_75 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_75));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_75);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_75);
    u_xlat16_19.xyz = u_xlat16_29.xxx * u_xlat20.xyz;
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_78 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_78);
    u_xlat16_78 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_78;
    u_xlat16_75 = max(u_xlat16_21.x, u_xlat16_75);
    u_xlat16_75 = u_xlat16_29.x * u_xlat16_75;
    u_xlat16_21.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat24.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.yyy * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat24.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_13.xyz + u_xlat24.xxx;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_21.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat24.xxx + u_xlat16_17.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_14.y = u_xlat16_12.y;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati20.x) & 1u));
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat15.y = u_xlat8.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat15.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat23.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat23.xyz = vec3(u_xlat48) * u_xlat23.xyz + _sssColorBack.xyz;
    u_xlat16_17.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_5.www * u_xlat16_17.xyz + _sssColorOcc.xyz;
    u_xlat23.xyz = u_xlat16_17.xyz * u_xlat23.xyz;
    u_xlat16_17.xyz = u_xlat23.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat80 = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = vec3(u_xlat80) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat80) * u_xlat16_27.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat80) * u_xlat16_17.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat80) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(u_xlat80) + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz;
    u_xlati80 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati80].xyz;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyz;
    u_xlati24 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_14.xyw;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat20.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat20.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat20.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat20.xyz);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_11.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_11.x = u_xlat16_76 * 16.0 + u_xlat16_11.y;
    u_xlat16_17.x = u_xlat16_29.x * 16.0 + u_xlat16_11.y;
    u_xlat16_29.xz = u_xlat16_11.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_17.y = u_xlat16_11.z;
    u_xlat16_29.xz = u_xlat16_17.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_29.xyz;
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_11.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
int u_xlati89;
float u_xlat90;
mediump float u_xlat16_93;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29.x = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29.x = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat29.x = u_xlat11.x * u_xlat29.x + u_xlat16_3.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat11.x;
    u_xlat83 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat83 = u_xlat2.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat29.z = u_xlat83 + u_xlat2.x;
    u_xlat29.xz = u_xlat29.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat89 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat17.xyz = vec3(u_xlat89) * vec3(u_xlat16_85) + u_xlat17.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat29.x;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat17.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_25.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-vec3(u_xlat54));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat54);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-vec3(u_xlat54));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(u_xlat54);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat10.yyy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat54) + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_15.y = u_xlat16_13.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati89 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat16.y = u_xlat8.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat90 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
    u_xlat90 = max(u_xlat90, 0.0);
    u_xlat17.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat17.xyz = vec3(u_xlat90) * u_xlat17.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati89].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_15.xyw;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
int u_xlati89;
float u_xlat90;
mediump float u_xlat16_93;
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
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
    u_xlat16_27 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_27 * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_93 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_13.xyz = vec3(u_xlat16_93) * u_xlat16_13.xyz;
    u_xlat16_93 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_93 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_14.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb27)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat2.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat2.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat2.wwww + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat27.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat17.z;
    u_xlat54 = max((-u_xlat17.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat17.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat2.xyw = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_32.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat2.xyw = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_32.x) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_32.x;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat29.x = u_xlat16_3.x + -1.0;
    u_xlat54 = u_xlat54 * u_xlat29.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_3.x / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat29.x = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat29.x = u_xlat11.x * u_xlat29.x + u_xlat16_3.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x + u_xlat11.x;
    u_xlat83 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat83 = u_xlat2.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat29.z = u_xlat83 + u_xlat2.x;
    u_xlat29.xz = u_xlat29.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat83 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat83 * u_xlat83;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_84 = u_xlat83 * u_xlat16_84;
    u_xlat16_85 = u_xlat83 * u_xlat16_84;
    u_xlat89 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_84) * u_xlat83 + 1.0;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(u_xlat83);
    u_xlat17.xyz = vec3(u_xlat89) * vec3(u_xlat16_85) + u_xlat17.xyz;
    u_xlat16_21.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat27.xxx * u_xlat16_21.xyz + _shadowColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz + (-u_xlat16_15.xyz);
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(u_xlat16_84);
    u_xlat16_24.xyz = (-u_xlat16_16.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat54 = u_xlat54 * u_xlat29.x;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat17.xyz;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_23.xyz = u_xlat16_32.xxx * u_xlat17.xyz;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_25.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_26.xzw + (-vec3(u_xlat54));
    u_xlat16_23.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz + vec3(u_xlat54);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat54) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_25.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_25.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat54) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_26.yyy * u_xlat16_24.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + (-vec3(u_xlat54));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz + vec3(u_xlat54);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat10.yyy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat54) + u_xlat16_22.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_15.y = u_xlat16_13.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati89 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat16.y = u_xlat8.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat90 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
    u_xlat90 = max(u_xlat90, 0.0);
    u_xlat17.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat17.xyz = vec3(u_xlat90) * u_xlat17.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat16_15.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati89].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_15.xyw;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xyz);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_10.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_10.x = u_xlat16_85 * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xz = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_93 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_32.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
  GpuProgramID 121064
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
CustomEditor "HeroShowRenderingGUI.HeroShowShaderGUI"
}