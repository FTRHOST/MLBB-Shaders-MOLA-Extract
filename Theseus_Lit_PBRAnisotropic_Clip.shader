//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_Clip" {
Properties {

_cull ("剔除模式", Float) = 2.0

_cutoff ("Clip阈值", Range(0, 1)) = 0.0

_cutoffOffset ("Clip阈值补偿", Range(0, 1)) = 0.0

[Tex] _SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

[Tex] _DfgTexture ("DFG贴图", 2D) = "black" { }

[Tex] _ACESLutTex ("ACESLut贴图", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("anisotropicMap", 2D) = "white" { }

_sunShift ("sunShift", Float) = 1.0

_sunShiftOffset ("sunShiftOffset", Float) = 1.0

_anisotropicMultiplier ("anisotropicMultiplier", Range(0, 1)) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_UseAO2U ("暗部表现贴图使用2U", Float) = 0.0

_darkMask ("暗部表现贴图", 2D) = "white" { }

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

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
  GpuProgramID 7139
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
mediump vec2 u_xlat16_68;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_90 = u_xlat16_89 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_14.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_96 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat28.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat17.xyz = u_xlat28.xxx * u_xlat17.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz;
    u_xlat56 = u_xlat16_89 * u_xlat16_87;
    u_xlat56 = max(u_xlat56, 0.00100000005);
    u_xlat93 = (-u_xlat16_90) + 1.0;
    u_xlat93 = u_xlat16_87 * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat66.x = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat94 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat97 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = u_xlat56 * u_xlat93;
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat94;
    u_xlat21.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat94 = u_xlat17.x * 0.318309873;
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat19.y = u_xlat56 * u_xlat66.x;
    u_xlat19.z = u_xlat93 * u_xlat95;
    u_xlat66.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat19.x;
    u_xlat66.x = u_xlat66.x + 6.10351563e-05;
    u_xlat18.y = u_xlat56 * u_xlat16_96;
    u_xlat18.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat18.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat45 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat46.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat46.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat28.x = u_xlat28.x * u_xlat95;
    u_xlat46.xyz = u_xlat46.xyz * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_89 = inversesqrt(u_xlat16_4.z);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat21.xyz;
    u_xlat16_24.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_24.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_24.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat21.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat95;
    u_xlat21.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat26.y = u_xlat56 * u_xlat16_96;
    u_xlat26.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat26.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat21.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat26.xxx * u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x * u_xlat95;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat26.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_24.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_60);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat11.xyz = u_xlat28.xxx * u_xlat11.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat93;
    u_xlat20.y = u_xlat56 * u_xlat10.x;
    u_xlat20.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat18.y = u_xlat56 * u_xlat16_89;
    u_xlat18.z = u_xlat93 * u_xlat11.x;
    u_xlat56 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat18.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat66.x * u_xlat56 + 6.10351563e-05;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat93 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat93 * u_xlat93;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_88 = u_xlat93 * u_xlat16_60;
    u_xlat93 = (-u_xlat16_60) * u_xlat93 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat10.xzw = vec3(u_xlat45) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.yyy * u_xlat16_23.xyz;
    u_xlat28.x = u_xlat56 * u_xlat28.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_22.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_23.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati28 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat56 = min(u_xlat16_32.x, 1.0);
    u_xlat93 = min(u_xlat56, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(u_xlat93) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * vec3(u_xlat93) + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz;
    u_xlati93 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati93].xyz;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_23.xyw;
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb28 = u_xlat16_90>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_90);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_90)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_68.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_68.xy = u_xlat16_68.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_68.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_91 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat56 * 0.5;
    u_xlat16_89 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat56 * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_24.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_24.xyz + u_xlat16_22.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _darkMask;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
mediump vec2 u_xlat16_68;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_90 = u_xlat16_89 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_14.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_96 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat28.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat17.xyz = u_xlat28.xxx * u_xlat17.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz;
    u_xlat56 = u_xlat16_89 * u_xlat16_87;
    u_xlat56 = max(u_xlat56, 0.00100000005);
    u_xlat93 = (-u_xlat16_90) + 1.0;
    u_xlat93 = u_xlat16_87 * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat66.x = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat94 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat97 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = u_xlat56 * u_xlat93;
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat94;
    u_xlat21.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat94 = u_xlat17.x * 0.318309873;
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat19.y = u_xlat56 * u_xlat66.x;
    u_xlat19.z = u_xlat93 * u_xlat95;
    u_xlat66.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat19.x;
    u_xlat66.x = u_xlat66.x + 6.10351563e-05;
    u_xlat18.y = u_xlat56 * u_xlat16_96;
    u_xlat18.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat18.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat45 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat46.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat46.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat28.x = u_xlat28.x * u_xlat95;
    u_xlat46.xyz = u_xlat46.xyz * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_89 = inversesqrt(u_xlat16_4.z);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat21.xyz;
    u_xlat16_24.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_24.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_24.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat21.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat95;
    u_xlat21.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat26.y = u_xlat56 * u_xlat16_96;
    u_xlat26.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat26.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat21.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat26.xxx * u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x * u_xlat95;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat26.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_24.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_60);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat11.xyz = u_xlat28.xxx * u_xlat11.xyz;
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat93;
    u_xlat20.y = u_xlat56 * u_xlat10.x;
    u_xlat20.z = u_xlat28.x * u_xlat17.x;
    u_xlat28.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat28.x = max(u_xlat28.x, 6.10351563e-05);
    u_xlat28.x = u_xlat17.x / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat94 * u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat18.y = u_xlat56 * u_xlat16_89;
    u_xlat18.z = u_xlat93 * u_xlat11.x;
    u_xlat56 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat18.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat66.x * u_xlat56 + 6.10351563e-05;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat93 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat93 * u_xlat93;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_88 = u_xlat93 * u_xlat16_60;
    u_xlat93 = (-u_xlat16_60) * u_xlat93 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat10.xzw = vec3(u_xlat45) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.yyy * u_xlat16_23.xyz;
    u_xlat28.x = u_xlat56 * u_xlat28.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat28.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_22.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_23.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati28 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat56 = min(u_xlat16_32.x, 1.0);
    u_xlat93 = min(u_xlat56, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(u_xlat93) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * vec3(u_xlat93) + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz;
    u_xlati93 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati93].xyz;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_23.xyw;
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb28 = u_xlat16_90>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_90);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_90)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_68.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_68.xy = u_xlat16_68.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_68.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_91 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat56 * 0.5;
    u_xlat16_89 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat56 * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_24.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_24.xyz + u_xlat16_22.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _darkMask;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
float u_xlat73;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
mediump float u_xlat16_98;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_88 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_12.xyz = vec3(u_xlat16_89) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_96 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_14.xyz = vec3(u_xlat16_96) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_96 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_15.xyz = vec3(u_xlat16_96) * u_xlat16_15.xyz;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_98 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_96 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat17.xyz = (bool(u_xlatb28)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat21;
    u_xlat19 = u_xlat17.yyyy * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat17.xxxx + u_xlat19;
    u_xlat17 = u_xlat20 * u_xlat17.zzzz + u_xlat18;
    u_xlat17 = u_xlat21 + u_xlat17;
    u_xlat28.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat17.z;
    u_xlat56 = max((-u_xlat17.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat17.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat17.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_60 = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat18.xy,u_xlat18.z);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_60) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_60;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_88 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat93 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat20.xyz = vec3(u_xlat93) * u_xlat20.xyz;
    u_xlat93 = u_xlat16_90 * u_xlat16_87;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat66.x = (-u_xlat16_91) + 1.0;
    u_xlat66.x = u_xlat16_87 * u_xlat66.x;
    u_xlat66.x = max(u_xlat66.x, 0.00100000005);
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat94 = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = u_xlat93 * u_xlat66.x;
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat95;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat95 = u_xlat45 * 0.318309873;
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat19.y = u_xlat93 * u_xlat94;
    u_xlat19.z = u_xlat66.x * u_xlat97;
    u_xlat94 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat19.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat18.y = u_xlat16_90 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat73 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat46.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat46.xyz;
    u_xlat16_22.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat28.xxx * u_xlat16_22.xyz + _shadowColor.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_88 = inversesqrt(u_xlat16_4.z);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat21.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat21.xyz = vec3(u_xlat56) * u_xlat21.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat97;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat27.y = u_xlat16_90 * u_xlat93;
    u_xlat27.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat27.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat21.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat27.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_25.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat46.xyz * u_xlat16_22.xyz + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_60);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat66.x;
    u_xlat20.y = u_xlat93 * u_xlat10.x;
    u_xlat20.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.y = u_xlat16_89 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat11.x;
    u_xlat93 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat93 + u_xlat18.x;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat94 * u_xlat93 + 6.10351563e-05;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat10.x * u_xlat10.x;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_88 = u_xlat10.x * u_xlat16_60;
    u_xlat10.x = (-u_xlat16_60) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.yyy * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_22.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati93 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat28.xy = min(u_xlat16_32.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat28.xxx + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * u_xlat28.xxx + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_96) * u_xlat16_24.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati93].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_91>=0.0);
#else
    u_xlatb28 = u_xlat16_91>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_91);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_91)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_91) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_14.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_96 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat28.y * 0.5;
    u_xlat16_89 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat28.y * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_22.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _darkMask;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
float u_xlat73;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
mediump float u_xlat16_98;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_88 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_12.xyz = vec3(u_xlat16_89) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_96 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_14.xyz = vec3(u_xlat16_96) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_96 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_15.xyz = vec3(u_xlat16_96) * u_xlat16_15.xyz;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_98 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_96 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat17.xyz = (bool(u_xlatb28)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat21;
    u_xlat19 = u_xlat17.yyyy * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat17.xxxx + u_xlat19;
    u_xlat17 = u_xlat20 * u_xlat17.zzzz + u_xlat18;
    u_xlat17 = u_xlat21 + u_xlat17;
    u_xlat28.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat17.z;
    u_xlat56 = max((-u_xlat17.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat17.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat17.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_60 = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat18.xy,u_xlat18.z);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_60) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_60;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_88 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat93 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat20.xyz = vec3(u_xlat93) * u_xlat20.xyz;
    u_xlat93 = u_xlat16_90 * u_xlat16_87;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat66.x = (-u_xlat16_91) + 1.0;
    u_xlat66.x = u_xlat16_87 * u_xlat66.x;
    u_xlat66.x = max(u_xlat66.x, 0.00100000005);
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat94 = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = u_xlat93 * u_xlat66.x;
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat95;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat95 = u_xlat45 * 0.318309873;
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat19.y = u_xlat93 * u_xlat94;
    u_xlat19.z = u_xlat66.x * u_xlat97;
    u_xlat94 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat19.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat18.y = u_xlat16_90 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat73 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat46.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat46.xyz;
    u_xlat16_22.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat28.xxx * u_xlat16_22.xyz + _shadowColor.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_88 = inversesqrt(u_xlat16_4.z);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat21.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat21.xyz = vec3(u_xlat56) * u_xlat21.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat97;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat27.y = u_xlat16_90 * u_xlat93;
    u_xlat27.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat27.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat21.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat27.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_25.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat46.xyz * u_xlat16_22.xyz + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_60);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat66.x;
    u_xlat20.y = u_xlat93 * u_xlat10.x;
    u_xlat20.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.y = u_xlat16_89 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat11.x;
    u_xlat93 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat93 + u_xlat18.x;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat94 * u_xlat93 + 6.10351563e-05;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat10.x * u_xlat10.x;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_88 = u_xlat10.x * u_xlat16_60;
    u_xlat10.x = (-u_xlat16_60) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.yyy * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_22.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati93 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat28.xy = min(u_xlat16_32.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat28.xxx + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * u_xlat28.xxx + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_96) * u_xlat16_24.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati93].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_91>=0.0);
#else
    u_xlatb28 = u_xlat16_91>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_91);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_91)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_91) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_14.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_96 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat28.y * 0.5;
    u_xlat16_89 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat28.y * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_22.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
mediump vec2 u_xlat16_68;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_90 = u_xlat16_89 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_14.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_96 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat28 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat17.xyz = vec3(u_xlat28) * u_xlat17.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz;
    u_xlat56 = u_xlat16_89 * u_xlat16_87;
    u_xlat56 = max(u_xlat56, 0.00100000005);
    u_xlat93 = (-u_xlat16_90) + 1.0;
    u_xlat93 = u_xlat16_87 * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat66.x = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat94 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat97 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = u_xlat56 * u_xlat93;
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat94;
    u_xlat21.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat94 = u_xlat17.x * 0.318309873;
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat19.y = u_xlat56 * u_xlat66.x;
    u_xlat19.z = u_xlat93 * u_xlat95;
    u_xlat66.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat19.x;
    u_xlat66.x = u_xlat66.x + 6.10351563e-05;
    u_xlat18.y = u_xlat56 * u_xlat16_96;
    u_xlat18.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat18.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat45 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat46.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat46.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat28 = u_xlat28 * u_xlat95;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_89 = inversesqrt(u_xlat16_4.z);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat21.xyz;
    u_xlat16_24.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_24.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_24.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat21.xyz = vec3(u_xlat28) * u_xlat21.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat95;
    u_xlat21.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat26.y = u_xlat56 * u_xlat16_96;
    u_xlat26.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat26.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat21.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat26.xxx * u_xlat16_23.xyz;
    u_xlat28 = u_xlat28 * u_xlat95;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat26.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_24.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_60);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat93;
    u_xlat20.y = u_xlat56 * u_xlat10.x;
    u_xlat20.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat18.y = u_xlat56 * u_xlat16_89;
    u_xlat18.z = u_xlat93 * u_xlat11.x;
    u_xlat56 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat18.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat66.x * u_xlat56 + 6.10351563e-05;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat93 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat93 * u_xlat93;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_88 = u_xlat93 * u_xlat16_60;
    u_xlat93 = (-u_xlat16_60) * u_xlat93 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat10.xzw = vec3(u_xlat45) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.yyy * u_xlat16_23.xyz;
    u_xlat28 = u_xlat56 * u_xlat28;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_22.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_23.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati28 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat56 = min(u_xlat16_32.x, 1.0);
    u_xlat93 = min(u_xlat56, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(u_xlat93) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * vec3(u_xlat93) + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz;
    u_xlati93 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati93].xyz;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_23.xyw;
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat10.xyz = vec3(u_xlat28) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb28 = u_xlat16_90>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_90);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat30.xyz = vec3(u_xlat28) * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_90)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_68.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_68.xy = u_xlat16_68.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_68.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_91 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat56 * 0.5;
    u_xlat16_89 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat56 * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_24.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_24.xyz + u_xlat16_22.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _cutoff;
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
mediump vec2 u_xlat16_68;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_90 = u_xlat16_89 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_14.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_96 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat28 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat17.xyz = vec3(u_xlat28) * u_xlat17.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz;
    u_xlat56 = u_xlat16_89 * u_xlat16_87;
    u_xlat56 = max(u_xlat56, 0.00100000005);
    u_xlat93 = (-u_xlat16_90) + 1.0;
    u_xlat93 = u_xlat16_87 * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat66.x = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat94 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat97 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = u_xlat56 * u_xlat93;
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat94;
    u_xlat21.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat94 = u_xlat17.x * 0.318309873;
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat19.y = u_xlat56 * u_xlat66.x;
    u_xlat19.z = u_xlat93 * u_xlat95;
    u_xlat66.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat19.x;
    u_xlat66.x = u_xlat66.x + 6.10351563e-05;
    u_xlat18.y = u_xlat56 * u_xlat16_96;
    u_xlat18.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat18.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat45 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat46.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat46.xyz;
    u_xlat16_22.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat28 = u_xlat28 * u_xlat95;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_89 = inversesqrt(u_xlat16_4.z);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat21.xyz;
    u_xlat16_24.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_24.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_24.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat21.xyz = vec3(u_xlat28) * u_xlat21.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_96 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat21.x = u_xlat16_89 * u_xlat93;
    u_xlat21.y = u_xlat56 * u_xlat95;
    u_xlat21.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat26.y = u_xlat56 * u_xlat16_96;
    u_xlat26.z = u_xlat93 * u_xlat97;
    u_xlat95 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat26.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat66.x * u_xlat95 + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat97 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat97 * u_xlat97;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_60 = u_xlat97 * u_xlat16_60;
    u_xlat16_89 = u_xlat97 * u_xlat16_60;
    u_xlat97 = (-u_xlat16_60) * u_xlat97 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat21.xyz = vec3(u_xlat45) * vec3(u_xlat16_89) + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat26.xxx * u_xlat16_23.xyz;
    u_xlat28 = u_xlat28 * u_xlat95;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat26.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_24.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb28 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_89 = inversesqrt(u_xlat16_60);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb28)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb28 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_96);
    u_xlat16_96 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_96;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_89 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat28 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
    u_xlat28 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_23.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_23.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat93;
    u_xlat20.y = u_xlat56 * u_xlat10.x;
    u_xlat20.z = u_xlat28 * u_xlat17.x;
    u_xlat28 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat17.x / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat94 * u_xlat28;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat18.y = u_xlat56 * u_xlat16_89;
    u_xlat18.z = u_xlat93 * u_xlat11.x;
    u_xlat56 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat18.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat56 = u_xlat66.x * u_xlat56 + 6.10351563e-05;
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat93 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat93 * u_xlat93;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_60 = u_xlat93 * u_xlat16_60;
    u_xlat16_88 = u_xlat93 * u_xlat16_60;
    u_xlat93 = (-u_xlat16_60) * u_xlat93 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat10.xzw = vec3(u_xlat45) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.yyy * u_xlat16_23.xyz;
    u_xlat28 = u_xlat56 * u_xlat28;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat28);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_22.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_23.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati28 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat56 = min(u_xlat16_32.x, 1.0);
    u_xlat93 = min(u_xlat56, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_32.xyz = vec3(u_xlat93) * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(u_xlat93) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * vec3(u_xlat93) + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz;
    u_xlati93 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati93].xyz;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_23.xyw;
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat10.xyz = vec3(u_xlat28) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb28 = u_xlat16_90>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_90);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat30.xyz = vec3(u_xlat28) * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_90)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_68.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_68.xy = u_xlat16_68.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_68.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_91 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat56 * 0.5;
    u_xlat16_89 = (-u_xlat56) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat56 * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_24.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_24.xyz + u_xlat16_22.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
float u_xlat73;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
mediump float u_xlat16_98;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_88 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_12.xyz = vec3(u_xlat16_89) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_96 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_14.xyz = vec3(u_xlat16_96) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_96 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_15.xyz = vec3(u_xlat16_96) * u_xlat16_15.xyz;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_98 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_96 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat17.xyz = (bool(u_xlatb28)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat21;
    u_xlat19 = u_xlat17.yyyy * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat17.xxxx + u_xlat19;
    u_xlat17 = u_xlat20 * u_xlat17.zzzz + u_xlat18;
    u_xlat17 = u_xlat21 + u_xlat17;
    u_xlat28.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat17.z;
    u_xlat56 = max((-u_xlat17.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat17.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat17.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_60 = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat18.xy,u_xlat18.z);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_60) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_60;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_88 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat93 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat20.xyz = vec3(u_xlat93) * u_xlat20.xyz;
    u_xlat93 = u_xlat16_90 * u_xlat16_87;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat66.x = (-u_xlat16_91) + 1.0;
    u_xlat66.x = u_xlat16_87 * u_xlat66.x;
    u_xlat66.x = max(u_xlat66.x, 0.00100000005);
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat94 = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = u_xlat93 * u_xlat66.x;
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat95;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat95 = u_xlat45 * 0.318309873;
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat19.y = u_xlat93 * u_xlat94;
    u_xlat19.z = u_xlat66.x * u_xlat97;
    u_xlat94 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat19.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat18.y = u_xlat16_90 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat73 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat46.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat46.xyz;
    u_xlat16_22.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat28.xxx * u_xlat16_22.xyz + _shadowColor.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_88 = inversesqrt(u_xlat16_4.z);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat21.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat21.xyz = vec3(u_xlat56) * u_xlat21.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat97;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat27.y = u_xlat16_90 * u_xlat93;
    u_xlat27.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat27.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat21.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat27.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_25.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat46.xyz * u_xlat16_22.xyz + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_60);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat66.x;
    u_xlat20.y = u_xlat93 * u_xlat10.x;
    u_xlat20.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.y = u_xlat16_89 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat11.x;
    u_xlat93 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat93 + u_xlat18.x;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat94 * u_xlat93 + 6.10351563e-05;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat10.x * u_xlat10.x;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_88 = u_xlat10.x * u_xlat16_60;
    u_xlat10.x = (-u_xlat16_60) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.yyy * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_22.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati93 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat28.xy = min(u_xlat16_32.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat28.xxx + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * u_xlat28.xxx + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_96) * u_xlat16_24.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati93].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_91>=0.0);
#else
    u_xlatb28 = u_xlat16_91>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_91);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_91)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_91) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_14.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_96 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat28.y * 0.5;
    u_xlat16_89 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat28.y * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_22.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
uniform 	mediump float _cutoffOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _UseAO2U;
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
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _darkMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
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
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_44;
float u_xlat45;
vec3 u_xlat46;
float u_xlat56;
bool u_xlatb56;
mediump vec2 u_xlat16_59;
mediump float u_xlat16_60;
vec2 u_xlat66;
float u_xlat73;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
bool u_xlatb92;
float u_xlat93;
int u_xlati93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
mediump float u_xlat16_98;
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
    u_xlat16_85 = (-_cutoffOffset) + _cutoff;
    u_xlat16_85 = max(u_xlat16_85, 0.0500000007);
    u_xlat16_85 = u_xlat16_0.w + (-u_xlat16_85);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_85<0.0);
#else
    u_xlatb0 = u_xlat16_85<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAO2U>=0.5);
#else
    u_xlatb2 = _UseAO2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb2)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb2)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_59.xy + u_xlat16_3.xy;
    u_xlat16_2.x = texture(_materialParamsMap, u_xlat16_3.xy).z;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_59.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_30.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat30.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat30.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat30.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat30.y;
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
    u_xlat16_88 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_12.xyz = vec3(u_xlat16_89) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb56 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat56 = (u_xlatb56) ? 1.0 : -1.0;
    u_xlat56 = u_xlat56 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.5<_anisoUse2U);
#else
    u_xlatb92 = 0.5<_anisoUse2U;
#endif
    u_xlat66.xy = (bool(u_xlatb92)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat66.xy = u_xlat66.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_92 = texture(_anisotropicMap, u_xlat66.xy).x;
    u_xlat92 = u_xlat16_92 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.xx);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat92 = u_xlat92 * _sunShift + _sunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat93 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat93) + u_xlat30.xyz;
    u_xlat93 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat93);
    u_xlat13.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat16_96 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_14.xyz = vec3(u_xlat16_96) * vs_TEXCOORD1.yzx;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_96 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_96 = inversesqrt(u_xlat16_96);
    u_xlat16_15.xyz = vec3(u_xlat16_96) * u_xlat16_15.xyz;
    u_xlat16_96 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_98 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_59.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_87 = max(u_xlat16_87, 0.0078125);
    u_xlat16_4.x = u_xlat16_87 * u_xlat16_87;
    u_xlat16_32.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_32.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_32.x) + u_xlat16_60;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_60 + u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat16_96 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat17.xyz = (bool(u_xlatb28)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat21;
    u_xlat19 = u_xlat17.yyyy * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat17.xxxx + u_xlat19;
    u_xlat17 = u_xlat20 * u_xlat17.zzzz + u_xlat18;
    u_xlat17 = u_xlat21 + u_xlat17;
    u_xlat28.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat17.z;
    u_xlat56 = max((-u_xlat17.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat17.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat17.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
    u_xlat16_60 = (-_ShadowBias.w) + 1.0;
    u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat18.z = 0.0;
    u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
    vec3 txVec0 = vec3(u_xlat18.xy,u_xlat18.z);
    u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec1 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat19.z = 0.0;
    u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
    vec3 txVec3 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_60) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_60;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_88 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat17.xyz = vec3(u_xlat56) * u_xlat17.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat93 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat93 = inversesqrt(u_xlat93);
    u_xlat20.xyz = vec3(u_xlat93) * u_xlat20.xyz;
    u_xlat93 = u_xlat16_90 * u_xlat16_87;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat66.x = (-u_xlat16_91) + 1.0;
    u_xlat66.x = u_xlat16_87 * u_xlat66.x;
    u_xlat66.x = max(u_xlat66.x, 0.00100000005);
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat17.xyz);
    u_xlat94 = dot(u_xlat30.zxy, u_xlat16_12.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = u_xlat93 * u_xlat66.x;
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat95;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat95 = u_xlat45 * 0.318309873;
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat19.y = u_xlat93 * u_xlat94;
    u_xlat19.z = u_xlat66.x * u_xlat97;
    u_xlat94 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat19.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat18.y = u_xlat16_90 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat18.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat73 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat46.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat46.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat46.xyz;
    u_xlat16_22.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat28.xxx * u_xlat16_22.xyz + _shadowColor.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat46.xyz = u_xlat46.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat46.xyz * _directSpecularColor.xyz;
    u_xlat46.xyz = u_xlat18.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_4.z = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_4.xz = max(u_xlat16_4.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_88 = inversesqrt(u_xlat16_4.z);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat21.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_4.z);
    u_xlat16_60 = u_xlat16_4.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat21.xyz = vec3(u_xlat56) * u_xlat21.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat21.xyz);
    u_xlat16_90 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat97 = dot(u_xlat20.xyz, u_xlat21.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_88 * u_xlat66.x;
    u_xlat21.y = u_xlat93 * u_xlat97;
    u_xlat21.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat27.y = u_xlat16_90 * u_xlat93;
    u_xlat27.z = u_xlat66.x * u_xlat17.x;
    u_xlat97 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat27.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat17.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat17.x * u_xlat17.x;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_60 = u_xlat17.x * u_xlat16_60;
    u_xlat16_88 = u_xlat17.x * u_xlat16_60;
    u_xlat17.x = (-u_xlat16_60) * u_xlat17.x + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * u_xlat17.xxx;
    u_xlat21.xyz = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat21.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat27.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat97;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat27.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_25.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat10.xxx * u_xlat21.xyz;
    u_xlat16_22.xyz = u_xlat46.xyz * u_xlat16_22.xyz + u_xlat21.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat18.xxx + u_xlat16_24.xyz;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_60 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_60);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat18.xyz;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_90);
    u_xlat16_90 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_90;
    u_xlat16_60 = max(u_xlat16_25.x, u_xlat16_60);
    u_xlat16_60 = u_xlat16_88 * u_xlat16_60;
    u_xlat16_25.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_89) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat30.zxy, u_xlat11.xyz);
    u_xlat16_89 = dot(u_xlat30.zxy, u_xlat16_24.xyz);
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_24.xyz);
    u_xlat20.x = u_xlat16_88 * u_xlat66.x;
    u_xlat20.y = u_xlat93 * u_xlat10.x;
    u_xlat20.z = u_xlat56 * u_xlat45;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat45 / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat95 * u_xlat56;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.y = u_xlat16_89 * u_xlat93;
    u_xlat18.z = u_xlat66.x * u_xlat11.x;
    u_xlat93 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat93 + u_xlat18.x;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat94 * u_xlat93 + 6.10351563e-05;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat10.x * u_xlat10.x;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_60 = u_xlat10.x * u_xlat16_60;
    u_xlat16_88 = u_xlat10.x * u_xlat16_60;
    u_xlat10.x = (-u_xlat16_60) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat73) * vec3(u_xlat16_88) + u_xlat10.xzw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.yyy * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat18.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_22.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati93 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat28.xy = min(u_xlat16_32.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.x);
    u_xlat16_32.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat28.xxx * u_xlat16_32.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat28.xxx + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_32.xyz = u_xlat16_25.xyz * u_xlat28.xxx + u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_96) * u_xlat16_24.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati93].xyz + u_xlat16_25.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat10.xyz = u_xlat28.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_91>=0.0);
#else
    u_xlatb28 = u_xlat16_91>=0.0;
#endif
    u_xlat30.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat30.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat30.xyz * u_xlat10.xyz;
    u_xlat30.xyz = u_xlat10.zxy * u_xlat30.yzx + (-u_xlat11.xyz);
    u_xlat16_87 = u_xlat16_87 * 8.0;
    u_xlat16_87 = min(u_xlat16_87, 1.0);
    u_xlat16_87 = u_xlat16_87 * abs(u_xlat16_91);
    u_xlat30.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat16_87) * u_xlat30.xyz + u_xlat8.xyz;
    u_xlat28.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat30.xyz = u_xlat28.xxx * u_xlat30.xyz;
    u_xlat16_87 = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_87 = u_xlat16_87 + u_xlat16_87;
    u_xlat30.xyz = (-u_xlat30.xyz) * vec3(u_xlat16_87) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat30.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat9.xyz + u_xlat30.xyz;
    u_xlat10.xyz = u_xlat30.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_91)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_87 = -abs(u_xlat16_91) * 0.800000012 + 1.0;
    u_xlat16_87 = u_xlat16_59.x * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_87);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
    u_xlat16_44.x = u_xlat16_59.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_10.w);
    u_xlat16_89 = u_xlat16_4.x + 1.0;
    u_xlat16_89 = min(u_xlat16_89, 15.0);
    u_xlat16_90 = u_xlat16_12.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_10.x = u_xlat16_4.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_89 * 16.0 + u_xlat16_10.y;
    u_xlat16_14.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_4.x = u_xlat16_90 * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_96 * u_xlat16_4.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat28.y * 0.5;
    u_xlat16_89 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat0.x * u_xlat16_89 + u_xlat16_4.x;
    u_xlat16_89 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_90 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_90 + u_xlat16_89;
    u_xlat16_4.x = u_xlat28.y * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_2.x, u_xlat16_4.x);
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_89;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_87);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_87) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat19.y = u_xlat16_59.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_22.xyz;
    u_xlat16_59.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_59.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_59.x : u_xlat16_85;
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_32.xyz + u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_darkMask, u_xlat16_3.xy).x;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 120504
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_ClipGUI"
}