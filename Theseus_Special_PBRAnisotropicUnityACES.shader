//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Special/PBR(Anisotropic)UnityACES" {
Properties {

_warning ("使用了UnityACES", Float) = 0.0

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "black" { }

_emissiveColor ("emissiveColor", Color) = (1,1,1,1)

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

_light_0_Color ("light_0_Color", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrength ("shadowStrength", Range(0, 1)) = 1.0

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

_anisotropicMap ("anisotropicMap", 2D) = "white" { }

_sunShift ("sunShift", Float) = 1.0

_sunShiftOffset ("sunShiftOffset", Float) = 1.0

_anisotropicMultiplier ("anisotropicMultiplier", Range(0, 1)) = 1.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

[Toggle(_LG_ON)] _LG_On ("流光开关", Float) = 0.0

_LGMask ("LGMask", 2D) = "white" { }

[Toggle] _LG_Use2U ("LG_Use2U", Float) = 0.0

_LGTexture ("LGTexture", 2D) = "black" { }

_LGColor ("LGColor", Color) = (1,1,1,1)

_LGVector ("LGVector", Vector) = (1,1,0,0)

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
  GpuProgramID 232
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump float u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_26;
float u_xlat29;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_39;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat67;
bool u_xlatb67;
float u_xlat69;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_59 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_59 * u_xlat16_3.x;
    u_xlat16_59 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_59));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_59);
#endif
    u_xlat16_4.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_4.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_3.xyz = u_xlat16_22.xyz * u_xlat16_4.yyy + u_xlat16_4.xzw;
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_3.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_59 = max(u_xlat16_59, u_xlat16_60);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_59;
    u_xlat16_4.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_59 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_5.xyz;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_60 = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_59 = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat57) * u_xlat16_8.xyz;
    u_xlat57 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat57) * vec3(u_xlat16_60) + u_xlat10.xyz;
    u_xlat16_9.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_63 = texture(_anisotropicMap, u_xlat16_9.xy).x;
    u_xlat63 = u_xlat16_63 * 2.0 + -1.0;
    u_xlat63 = u_xlat63 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat16_59 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.zxy;
    u_xlat16_59 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_11.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat12.x = max(u_xlat12.x, 1.17549435e-38);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat12.xyz = u_xlat16_11.yxz * u_xlat12.xxx;
    u_xlat13.xyz = u_xlat16_9.xyz * u_xlat12.yxz;
    u_xlat13.xyz = u_xlat16_9.zxy * u_xlat12.xzy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xyz * vs_TEXCOORD2.www;
    u_xlat14.y = u_xlat13.x;
    u_xlat14.x = u_xlat12.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat14.z = u_xlat16_9.y;
    u_xlat14.x = dot(u_xlat16_11.xyz, u_xlat14.xyz);
    u_xlat15.z = u_xlat16_9.z;
    u_xlat12.z = u_xlat16_9.x;
    u_xlat15.x = u_xlat12.y;
    u_xlat15.y = u_xlat13.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat14.z = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat14.y = dot(u_xlat16_11.xyz, u_xlat15.xyz);
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat12.x = max(u_xlat12.x, 1.17549435e-38);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xxx;
    u_xlat69 = dot(u_xlat12.zxy, u_xlat14.xyz);
    u_xlat12.xyz = (-u_xlat14.yzx) * vec3(u_xlat69) + u_xlat12.xyz;
    u_xlat69 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat12.xyz = vec3(u_xlat69) * u_xlat12.xyz;
    u_xlat16_9.xyz = u_xlat12.yzx * u_xlat14.xyz;
    u_xlat16_9.xyz = u_xlat14.zxy * u_xlat12.zxy + (-u_xlat16_9.xyz);
    u_xlat13.xyz = vec3(u_xlat67) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat63) * u_xlat14.xyz + u_xlat13.zxy;
    u_xlat16_11.xyz = vec3(u_xlat63) * vs_TEXCOORD1.yzx + u_xlat13.xyz;
    u_xlat16_59 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat63 = dot(u_xlat16_9.xyz, u_xlat16_3.xyz);
    u_xlat16_59 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_60 = u_xlat16_59 + -1.0;
    u_xlat67 = (-u_xlat16_60) + 1.0;
    u_xlat16_16.y = u_xlat16_6.x * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_16.y * u_xlat16_16.y;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat6.x = u_xlat67 * u_xlat16_61;
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat13.z = u_xlat63 * u_xlat6.x;
    u_xlat16_62 = dot(u_xlat12.zxy, u_xlat16_3.xyz);
    u_xlat16_13 = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat63 = u_xlat16_59 * u_xlat16_61;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat13.y = u_xlat16_62 * u_xlat63;
    u_xlat13.x = u_xlat16_13;
    u_xlat67 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat13.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat69 = dot(u_xlat16_9.xyz, u_xlat16_3.xyz);
    u_xlat15.z = u_xlat6.x * u_xlat69;
    u_xlat16_59 = dot(u_xlat12.zxy, u_xlat16_3.xyz);
    u_xlat15.y = u_xlat16_59 * u_xlat63;
    u_xlat16_16.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat16_16.x;
    u_xlat69 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat15.x;
    u_xlat16_32.xy = texture(_DfgTexture, u_xlat16_16.xy).xy;
    u_xlat32.xyz = u_xlat16_8.xyz * u_xlat16_32.xxx + u_xlat16_32.yyy;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat69 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat71 = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat15.y = u_xlat63 * u_xlat71;
    u_xlat71 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat72 = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat6.x * u_xlat71;
    u_xlat71 = u_xlat6.x * u_xlat63;
    u_xlat15.z = u_xlat72 * u_xlat71;
    u_xlat15.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat15.x = max(u_xlat15.x, 6.10351563e-05);
    u_xlat15.x = u_xlat71 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat34 = u_xlat71 * 0.318309873;
    u_xlat15.x = u_xlat34 * u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat67 = u_xlat67 * u_xlat15.x;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat67);
    u_xlat10.xyz = u_xlat13.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_4.xyz * u_xlat10.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_16.xzw = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat19 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(u_xlat19);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat67 = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat17.y = u_xlat63 * u_xlat67;
    u_xlat67 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat71 * u_xlat15.x;
    u_xlat17.x = u_xlat6.x * u_xlat67;
    u_xlat67 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat67 = max(u_xlat67, 6.10351563e-05);
    u_xlat67 = u_xlat71 / u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat34 * u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat15.x = dot(u_xlat16_9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.z = u_xlat6.x * u_xlat15.x;
    u_xlat16_1.x = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.y = u_xlat16_1.x * u_xlat63;
    u_xlat16_17 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat17.x = u_xlat16_17;
    u_xlat15.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x + u_xlat17.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat69 * u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat67 = u_xlat67 * u_xlat15.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat67);
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat17.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xzw, u_xlat16_16.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_16.xzw;
    u_xlat10.x = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat29 = dot(u_xlat16_9.xyz, u_xlat16_20.xyz);
    u_xlat18.z = u_xlat6.x * u_xlat29;
    u_xlat10.y = u_xlat63 * u_xlat10.x;
    u_xlat67 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat10.x = u_xlat6.x * u_xlat67;
    u_xlat6.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat16_20.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat67) + 1.0;
    u_xlat10.z = u_xlat6.x * u_xlat71;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6.x = max(u_xlat6.x, 6.10351563e-05);
    u_xlat6.x = u_xlat71 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat34 * u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat16_18 = dot(u_xlat14.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat18.y = u_xlat16_1.x * u_xlat63;
    u_xlat18.x = u_xlat16_18;
    u_xlat63 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat18.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat69 * u_xlat63 + 6.10351563e-05;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat6.x = u_xlat6.x * u_xlat63;
    u_xlat16_1.x = u_xlat67 * u_xlat67;
    u_xlat16_1.x = u_xlat67 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat67 * u_xlat16_1.x;
    u_xlat16_20.x = u_xlat67 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat67 + 1.0;
    u_xlat10.xyz = u_xlat16_8.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat57) * u_xlat16_20.xxx + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_1.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat13.xxx * u_xlat16_4.xyz;
    u_xlat6.xyw = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat17.xxx * u_xlat16_4.xyz;
    u_xlat6.xyw = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat6.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_4.xyz = (-u_xlat14.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_4.xyz + u_xlat14.xyz;
    u_xlat16_58 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_4.xyz = vec3(u_xlat16_58) * u_xlat16_4.xyz;
    u_xlat16_58 = dot(u_xlat16_4.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_58 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_58) + u_xlat16_59;
    u_xlat16_5.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_24.z = _occlusionScale * u_xlat16_5.x + 1.0;
    u_xlat16_59 = u_xlat16_24.z * u_xlat16_59 + u_xlat16_58;
    u_xlat16_59 = u_xlat16_24.z * u_xlat16_59;
    u_xlat16_5.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat16_5.x = _occlusionScale * u_xlat16_5.x + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_5.x;
    u_xlat16_7.x = min(u_xlat16_59, u_xlat16_6.z);
    u_xlat16_26.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_8.xyz = u_xlat16_26.xxx * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_9.xyz;
    u_xlat16_26.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + u_xlat16_26.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_8.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_8.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_8.y = u_xlat16_4.y;
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_8.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_8.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati57 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_8.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_60>=0.0);
#else
    u_xlatb0 = u_xlat16_60>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat12.xyz;
    u_xlat6.xyw = u_xlat16_3.xyz * u_xlat0.xyz;
    u_xlat6.xyw = u_xlat0.zxy * u_xlat16_3.yzx + (-u_xlat6.xyw);
    u_xlat10.xyz = u_xlat0.xyz * u_xlat6.xyw;
    u_xlat0.xyz = u_xlat6.wxy * u_xlat0.yzx + (-u_xlat10.xyz);
    u_xlat0.xyz = (-u_xlat14.xyz) + u_xlat0.xyz;
    u_xlat16_2.x = u_xlat16_61 * 8.0;
    u_xlat16_21.x = u_xlat16_61 * u_xlat16_61;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * abs(u_xlat16_60);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat14.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_2.xxx + (-u_xlat16_3.xyz);
    u_xlat6.xyw = (-u_xlat0.xyz) + u_xlat14.xyz;
    u_xlat6.xyw = u_xlat16_21.xxx * u_xlat6.xyw + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat6.xyw);
    u_xlat6.xyw = abs(vec3(u_xlat16_60)) * u_xlat10.xyz + u_xlat6.xyw;
    u_xlat16_2.x = -abs(u_xlat16_60) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_16.y * u_xlat16_2.x;
    u_xlat16_24.x = u_xlat16_16.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
    u_xlat16_24.y = u_xlat0.x * 0.5;
    u_xlat16_3.xyz = u_xlat16_24.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xw);
    u_xlat6.w = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xw);
    u_xlat6.x = u_xlat16_21.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat6.xyw, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyz = vec3(u_xlat16_64) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat32.xyz;
    u_xlat16_4.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_4.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_21.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_21.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_3.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_57 + (-u_xlat16_6.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_2.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_59 * 0.5;
    u_xlat16_21.x = (-u_xlat16_59) * 0.5 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_58 + u_xlat16_58;
    u_xlat16_21.x = (-u_xlat16_58) * 2.0 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = min(u_xlat16_58, u_xlat16_6.z);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat16_58) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = u_xlat0.xyz + (-vec3(u_xlat16_58));
    u_xlat16_59 = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_59 = float(1.0) / float(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz + vec3(u_xlat16_58);
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump float u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_26;
float u_xlat29;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_39;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat67;
bool u_xlatb67;
float u_xlat69;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_59 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_59 * u_xlat16_3.x;
    u_xlat16_59 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_59));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_59);
#endif
    u_xlat16_4.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_4.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_3.xyz = u_xlat16_22.xyz * u_xlat16_4.yyy + u_xlat16_4.xzw;
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_3.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_59 = max(u_xlat16_59, u_xlat16_60);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_59;
    u_xlat16_4.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_59 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_5.xyz;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat57) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_60 = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_59 = u_xlat16_6.y * _metallicMultiplier;
    u_xlat16_8.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat57) * u_xlat16_8.xyz;
    u_xlat57 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat57) * vec3(u_xlat16_60) + u_xlat10.xyz;
    u_xlat16_9.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_63 = texture(_anisotropicMap, u_xlat16_9.xy).x;
    u_xlat63 = u_xlat16_63 * 2.0 + -1.0;
    u_xlat63 = u_xlat63 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat16_59 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.zxy;
    u_xlat16_59 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_11.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat12.x = max(u_xlat12.x, 1.17549435e-38);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat12.xyz = u_xlat16_11.yxz * u_xlat12.xxx;
    u_xlat13.xyz = u_xlat16_9.xyz * u_xlat12.yxz;
    u_xlat13.xyz = u_xlat16_9.zxy * u_xlat12.xzy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xyz * vs_TEXCOORD2.www;
    u_xlat14.y = u_xlat13.x;
    u_xlat14.x = u_xlat12.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat14.z = u_xlat16_9.y;
    u_xlat14.x = dot(u_xlat16_11.xyz, u_xlat14.xyz);
    u_xlat15.z = u_xlat16_9.z;
    u_xlat12.z = u_xlat16_9.x;
    u_xlat15.x = u_xlat12.y;
    u_xlat15.y = u_xlat13.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat14.z = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat14.y = dot(u_xlat16_11.xyz, u_xlat15.xyz);
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat12.x = max(u_xlat12.x, 1.17549435e-38);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xxx;
    u_xlat69 = dot(u_xlat12.zxy, u_xlat14.xyz);
    u_xlat12.xyz = (-u_xlat14.yzx) * vec3(u_xlat69) + u_xlat12.xyz;
    u_xlat69 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat12.xyz = vec3(u_xlat69) * u_xlat12.xyz;
    u_xlat16_9.xyz = u_xlat12.yzx * u_xlat14.xyz;
    u_xlat16_9.xyz = u_xlat14.zxy * u_xlat12.zxy + (-u_xlat16_9.xyz);
    u_xlat13.xyz = vec3(u_xlat67) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat63) * u_xlat14.xyz + u_xlat13.zxy;
    u_xlat16_11.xyz = vec3(u_xlat63) * vs_TEXCOORD1.yzx + u_xlat13.xyz;
    u_xlat16_59 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat63 = dot(u_xlat16_9.xyz, u_xlat16_3.xyz);
    u_xlat16_59 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_60 = u_xlat16_59 + -1.0;
    u_xlat67 = (-u_xlat16_60) + 1.0;
    u_xlat16_16.y = u_xlat16_6.x * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_16.y * u_xlat16_16.y;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat6.x = u_xlat67 * u_xlat16_61;
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat13.z = u_xlat63 * u_xlat6.x;
    u_xlat16_62 = dot(u_xlat12.zxy, u_xlat16_3.xyz);
    u_xlat16_13 = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat63 = u_xlat16_59 * u_xlat16_61;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat13.y = u_xlat16_62 * u_xlat63;
    u_xlat13.x = u_xlat16_13;
    u_xlat67 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat13.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat69 = dot(u_xlat16_9.xyz, u_xlat16_3.xyz);
    u_xlat15.z = u_xlat6.x * u_xlat69;
    u_xlat16_59 = dot(u_xlat12.zxy, u_xlat16_3.xyz);
    u_xlat15.y = u_xlat16_59 * u_xlat63;
    u_xlat16_16.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat16_16.x;
    u_xlat69 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat15.x;
    u_xlat16_32.xy = texture(_DfgTexture, u_xlat16_16.xy).xy;
    u_xlat32.xyz = u_xlat16_8.xyz * u_xlat16_32.xxx + u_xlat16_32.yyy;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat69 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat71 = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat15.y = u_xlat63 * u_xlat71;
    u_xlat71 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat72 = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat6.x * u_xlat71;
    u_xlat71 = u_xlat6.x * u_xlat63;
    u_xlat15.z = u_xlat72 * u_xlat71;
    u_xlat15.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat15.x = max(u_xlat15.x, 6.10351563e-05);
    u_xlat15.x = u_xlat71 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat34 = u_xlat71 * 0.318309873;
    u_xlat15.x = u_xlat34 * u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat67 = u_xlat67 * u_xlat15.x;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat67);
    u_xlat10.xyz = u_xlat13.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_4.xyz * u_xlat10.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_16.xzw = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat19 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(u_xlat19);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat67 = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat17.y = u_xlat63 * u_xlat67;
    u_xlat67 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat71 * u_xlat15.x;
    u_xlat17.x = u_xlat6.x * u_xlat67;
    u_xlat67 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat67 = max(u_xlat67, 6.10351563e-05);
    u_xlat67 = u_xlat71 / u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat34 * u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat15.x = dot(u_xlat16_9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.z = u_xlat6.x * u_xlat15.x;
    u_xlat16_1.x = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.y = u_xlat16_1.x * u_xlat63;
    u_xlat16_17 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat17.x = u_xlat16_17;
    u_xlat15.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x + u_xlat17.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat69 * u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat67 = u_xlat67 * u_xlat15.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat67);
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat17.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xzw, u_xlat16_16.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_16.xzw;
    u_xlat10.x = dot(u_xlat16_9.xyz, u_xlat16_5.xyz);
    u_xlat29 = dot(u_xlat16_9.xyz, u_xlat16_20.xyz);
    u_xlat18.z = u_xlat6.x * u_xlat29;
    u_xlat10.y = u_xlat63 * u_xlat10.x;
    u_xlat67 = dot(u_xlat12.zxy, u_xlat16_5.xyz);
    u_xlat10.x = u_xlat6.x * u_xlat67;
    u_xlat6.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat16_20.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat67) + 1.0;
    u_xlat10.z = u_xlat6.x * u_xlat71;
    u_xlat6.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6.x = max(u_xlat6.x, 6.10351563e-05);
    u_xlat6.x = u_xlat71 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat34 * u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat16_18 = dot(u_xlat14.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat18.y = u_xlat16_1.x * u_xlat63;
    u_xlat18.x = u_xlat16_18;
    u_xlat63 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat18.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat69 * u_xlat63 + 6.10351563e-05;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat6.x = u_xlat6.x * u_xlat63;
    u_xlat16_1.x = u_xlat67 * u_xlat67;
    u_xlat16_1.x = u_xlat67 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat67 * u_xlat16_1.x;
    u_xlat16_20.x = u_xlat67 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat67 + 1.0;
    u_xlat10.xyz = u_xlat16_8.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat57) * u_xlat16_20.xxx + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_1.x = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat13.xxx * u_xlat16_4.xyz;
    u_xlat6.xyw = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat17.xxx * u_xlat16_4.xyz;
    u_xlat6.xyw = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat6.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_4.xyz = (-u_xlat14.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_4.xyz + u_xlat14.xyz;
    u_xlat16_58 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_4.xyz = vec3(u_xlat16_58) * u_xlat16_4.xyz;
    u_xlat16_58 = dot(u_xlat16_4.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_58 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_58) + u_xlat16_59;
    u_xlat16_5.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_24.z = _occlusionScale * u_xlat16_5.x + 1.0;
    u_xlat16_59 = u_xlat16_24.z * u_xlat16_59 + u_xlat16_58;
    u_xlat16_59 = u_xlat16_24.z * u_xlat16_59;
    u_xlat16_5.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat16_5.x = _occlusionScale * u_xlat16_5.x + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_5.x;
    u_xlat16_7.x = min(u_xlat16_59, u_xlat16_6.z);
    u_xlat16_26.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_8.xyz = u_xlat16_26.xxx * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_9.xyz;
    u_xlat16_26.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + u_xlat16_26.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_8.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_8.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_8.y = u_xlat16_4.y;
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_8.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_8.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati57 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_8.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_8.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_60>=0.0);
#else
    u_xlatb0 = u_xlat16_60>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat12.xyz;
    u_xlat6.xyw = u_xlat16_3.xyz * u_xlat0.xyz;
    u_xlat6.xyw = u_xlat0.zxy * u_xlat16_3.yzx + (-u_xlat6.xyw);
    u_xlat10.xyz = u_xlat0.xyz * u_xlat6.xyw;
    u_xlat0.xyz = u_xlat6.wxy * u_xlat0.yzx + (-u_xlat10.xyz);
    u_xlat0.xyz = (-u_xlat14.xyz) + u_xlat0.xyz;
    u_xlat16_2.x = u_xlat16_61 * 8.0;
    u_xlat16_21.x = u_xlat16_61 * u_xlat16_61;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * abs(u_xlat16_60);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat14.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_2.xxx + (-u_xlat16_3.xyz);
    u_xlat6.xyw = (-u_xlat0.xyz) + u_xlat14.xyz;
    u_xlat6.xyw = u_xlat16_21.xxx * u_xlat6.xyw + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat6.xyw);
    u_xlat6.xyw = abs(vec3(u_xlat16_60)) * u_xlat10.xyz + u_xlat6.xyw;
    u_xlat16_2.x = -abs(u_xlat16_60) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_16.y * u_xlat16_2.x;
    u_xlat16_24.x = u_xlat16_16.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
    u_xlat16_24.y = u_xlat0.x * 0.5;
    u_xlat16_3.xyz = u_xlat16_24.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xw);
    u_xlat6.w = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xw);
    u_xlat6.x = u_xlat16_21.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat6.xyw, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyz = vec3(u_xlat16_64) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat32.xyz;
    u_xlat16_4.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_4.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_4.x = u_xlat16_21.x * 16.0 + u_xlat16_4.z;
    u_xlat16_21.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_21.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_3.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_57 + (-u_xlat16_6.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_2.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_59 * 0.5;
    u_xlat16_21.x = (-u_xlat16_59) * 0.5 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_58 + u_xlat16_58;
    u_xlat16_21.x = (-u_xlat16_58) * 2.0 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = min(u_xlat16_58, u_xlat16_6.z);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat16_58) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = u_xlat0.xyz + (-vec3(u_xlat16_58));
    u_xlat16_59 = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_59 = float(1.0) / float(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz + vec3(u_xlat16_58);
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
ivec4 u_xlati4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec4 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec4 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
vec4 u_xlat16;
mediump float u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_20;
float u_xlat21;
int u_xlati21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
float u_xlat34;
float u_xlat36;
float u_xlat37;
mediump vec2 u_xlat16_43;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
bool u_xlatb71;
float u_xlat73;
float u_xlat75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43.x;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
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
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat16_65 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_3.xyz = vec3(u_xlat16_65) * u_xlat16_3.xyz;
    u_xlat63 = dot(u_xlat16_22.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_66 = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_65 = u_xlat16_4.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat63) * u_xlat16_6.xyz;
    u_xlat63 = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat63) * vec3(u_xlat16_66) + u_xlat8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_67 = texture(_anisotropicMap, u_xlat16_7.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat67 = u_xlat67 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.zxy;
    u_xlat16_65 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_9.xyz = (-u_xlat16_7.zxy) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat10.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat10.x = max(u_xlat10.x, 1.17549435e-38);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat10.xyz = u_xlat16_9.yxz * u_xlat10.xxx;
    u_xlat11.xyz = u_xlat16_7.xyz * u_xlat10.yxz;
    u_xlat11.xyz = u_xlat16_7.zxy * u_xlat10.xzy + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.x = u_xlat10.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat10.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat10.y;
    u_xlat13.y = u_xlat11.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat10.x = max(u_xlat10.x, 1.17549435e-38);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat10.xxx;
    u_xlat73 = dot(u_xlat10.zxy, u_xlat12.xyz);
    u_xlat10.xyz = (-u_xlat12.yzx) * vec3(u_xlat73) + u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat16_7.xyz = u_xlat10.yzx * u_xlat12.xyz;
    u_xlat16_7.xyz = u_xlat12.zxy * u_xlat10.zxy + (-u_xlat16_7.xyz);
    u_xlat11.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat67) * u_xlat12.xyz + u_xlat11.zxy;
    u_xlat16_9.xyz = vec3(u_xlat67) * vs_TEXCOORD1.yzx + u_xlat11.xyz;
    u_xlat16_65 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7.xyz = vec3(u_xlat16_65) * u_xlat16_7.xyz;
    u_xlat67 = dot(u_xlat16_7.xyz, u_xlat16_22.xyz);
    u_xlat16_65 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_66 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_66) + 1.0;
    u_xlat16_14.y = u_xlat16_4.x * _roughnessMultiplier;
    u_xlat16_68 = u_xlat16_14.y * u_xlat16_14.y;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat4.x = u_xlat71 * u_xlat16_68;
    u_xlat4.x = max(u_xlat4.x, 0.00100000005);
    u_xlat11.z = u_xlat67 * u_xlat4.x;
    u_xlat16_69 = dot(u_xlat10.zxy, u_xlat16_22.xyz);
    u_xlat16_11 = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat16_65 * u_xlat16_68;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat11.y = u_xlat16_69 * u_xlat67;
    u_xlat11.x = u_xlat16_11;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat73 = dot(u_xlat16_7.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat4.x * u_xlat73;
    u_xlat16_65 = dot(u_xlat10.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_65 * u_xlat67;
    u_xlat16_14.x = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat16_14.x;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat16_32.xy = texture(_DfgTexture, u_xlat16_14.xy).xy;
    u_xlat32.xyz = u_xlat16_6.xyz * u_xlat16_32.xxx + u_xlat16_32.yyy;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat75 = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat13.y = u_xlat67 * u_xlat75;
    u_xlat75 = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat4.x * u_xlat75;
    u_xlat75 = u_xlat4.x * u_xlat67;
    u_xlat13.z = u_xlat76 * u_xlat75;
    u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat13.x = max(u_xlat13.x, 6.10351563e-05);
    u_xlat13.x = u_xlat75 / u_xlat13.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat34 = u_xlat75 * 0.318309873;
    u_xlat13.x = u_xlat34 * u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 16.0);
    u_xlat71 = u_xlat71 * u_xlat13.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat71);
    u_xlat8.xyz = u_xlat11.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb71 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xzw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat13.xzw, u_xlat13.xzw);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat13.xzw = u_xlat13.xzw * vec3(u_xlat19);
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat13.xzw);
    u_xlat13.x = (-u_xlat13.x) * u_xlat13.x + 1.0;
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * _ShadowBias.z;
    u_xlat13.xzw = (-u_xlat12.xyz) * u_xlat13.xxx + vs_TEXCOORD0.xyz;
    u_xlat13.xzw = (bool(u_xlatb71)) ? u_xlat13.xzw : vs_TEXCOORD0.xyz;
    u_xlat18 = u_xlat13.zzzz * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat13.xxxx + u_xlat18;
    u_xlat16 = u_xlat16 * u_xlat13.wwww + u_xlat17;
    u_xlat15 = u_xlat15 + u_xlat16;
    u_xlat71 = _ShadowBias.x / u_xlat15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat71) + u_xlat15.z;
    u_xlat13.x = max((-u_xlat15.w), u_xlat71);
    u_xlat13.x = (-u_xlat71) + u_xlat13.x;
    u_xlat15.z = _ShadowBias.y * u_xlat13.x + u_xlat71;
    u_xlat13.xzw = u_xlat15.xyz / u_xlat15.www;
    u_xlat15.xyz = u_xlat13.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat15.w = max(u_xlat15.z, 9.99999975e-05);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat13.xzw = u_xlat15.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat13.xz,u_xlat13.w);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat17.z = 0.0;
    u_xlat17.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec1 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat17.z = 0.0;
    u_xlat17.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec2 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat17.z = 0.0;
    u_xlat15.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat71 = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_65 = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat71 * u_xlat15.x + u_xlat16_65;
    u_xlat71 = (-u_xlat71) + 1.0;
    u_xlat71 = (-u_xlat71) * _shadowStrength + 1.0;
    u_xlat71 = max(u_xlat71, 0.0);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_65 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_3.xyz = vec3(u_xlat16_65) * u_xlat16_3.xyz;
    u_xlat15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat16_65 = u_xlat15.x * u_xlat15.x;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat36 = (-u_xlat16_65) * u_xlat15.x + 1.0;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat15.xyz = u_xlat16_6.xyz * vec3(u_xlat36);
    u_xlat15.xyz = vec3(u_xlat63) * vec3(u_xlat16_65) + u_xlat15.xyz;
    u_xlat78 = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16.y = u_xlat67 * u_xlat78;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat79 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat75 * u_xlat79;
    u_xlat16.x = u_xlat4.x * u_xlat78;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat75 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat34 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat16.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat4.x * u_xlat16.x;
    u_xlat16_65 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_65 * u_xlat67;
    u_xlat16_16 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_16;
    u_xlat37 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat16.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat73 * u_xlat37 + 6.10351563e-05;
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat78 = u_xlat78 * u_xlat37;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat78);
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat16.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat8.xyz = u_xlat15.xyz * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_24 = float(1.0) / float(u_xlat16_65);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xzw = vec3(u_xlat16_65) * u_xlat15.xyz;
    u_xlat16_65 = u_xlat16_3.x * u_xlat16_24;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb15 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (bool(u_xlatb15)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_3.xyz = u_xlat16_14.xzw * u_xlat16_3.yyy + u_xlat16_20.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_3.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb15 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_69;
    u_xlat16_14.xzw = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat63) * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat63 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat15.z = u_xlat4.x * u_xlat15.x;
    u_xlat17.y = u_xlat63 * u_xlat67;
    u_xlat63 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat78 = dot(u_xlat12.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat75 * u_xlat78;
    u_xlat17.x = u_xlat63 * u_xlat4.x;
    u_xlat63 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat63 = max(u_xlat63, 6.10351563e-05);
    u_xlat63 = u_xlat75 / u_xlat63;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat34 * u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat16_15 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat15.y = u_xlat16_1.x * u_xlat67;
    u_xlat15.x = u_xlat16_15;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat15.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat63);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_14.xzw + u_xlat8.xyz;
    u_xlat16_1.x = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xyz = vec3(u_xlat71) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat4.xyw = u_xlat16_5.xyz * u_xlat16.xxx + u_xlat4.xyw;
    u_xlat16_2.xyz = u_xlat16_14.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat15.xxx * u_xlat16_2.xyz;
    u_xlat4.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat4.xyw;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat4.xyw;
    u_xlat16_5.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat12.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_1.x) + u_xlat16_65;
    u_xlat16_6.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_65 = u_xlat16_27.z * u_xlat16_65 + u_xlat16_1.x;
    u_xlat16_65 = u_xlat16_27.z * u_xlat16_65;
    u_xlat16_6.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_6.x;
    u_xlat16_7.x = min(u_xlat16_65, u_xlat16_4.z);
    u_xlat16_28.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_14.xzw = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xzw = u_xlat16_28.xxx * u_xlat16_14.xzw;
    u_xlat16_20.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat16_28.xxx * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_14.xzw * u_xlat16_7.xxx + (-u_xlat16_28.xyz);
    u_xlat16_14.xzw = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_7.xyz = u_xlat16_14.xzw * u_xlat16_7.xxx + u_xlat16_28.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_20.y = u_xlat16_5.y;
    u_xlat0.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati4.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati21 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati63 = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_14.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_14.xzw;
    u_xlat16_14.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_14.xzw;
    u_xlat16_20.xyz = u_xlat16_14.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_14.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_66>=0.0);
#else
    u_xlatb0 = u_xlat16_66>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10.xyz;
    u_xlat4.xyw = u_xlat16_22.xyz * u_xlat0.xyz;
    u_xlat4.xyw = u_xlat0.zxy * u_xlat16_22.yzx + (-u_xlat4.xyw);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat4.xyw;
    u_xlat0.xyz = u_xlat4.wxy * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat12.xyz) + u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_68 * 8.0;
    u_xlat16_24 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_24, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_66) * u_xlat16_7.x;
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat0.xyz = vec3(u_xlat63) * u_xlat0.xyz;
    u_xlat16_7.x = dot((-u_xlat16_22.xyz), u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_7.xxx + (-u_xlat16_22.xyz);
    u_xlat4.xyw = (-u_xlat0.xyz) + u_xlat12.xyz;
    u_xlat4.xyw = vec3(u_xlat16_68) * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat8.xyz = u_xlat0.xyz + (-u_xlat4.xyw);
    u_xlat4.xyw = abs(vec3(u_xlat16_66)) * u_xlat8.xyz + u_xlat4.xyw;
    u_xlat16_22.x = -abs(u_xlat16_66) * 0.800000012 + 1.0;
    u_xlat16_22.x = u_xlat16_14.y * u_xlat16_22.x;
    u_xlat16_27.x = u_xlat16_14.y * 1.09769487;
    u_xlat16_22.x = u_xlat16_22.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_22.x);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_27.y = u_xlat0.x * 0.5;
    u_xlat16_5.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_43.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xw);
    u_xlat4.w = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xw);
    u_xlat4.x = u_xlat16_43.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyw, u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = vec3(u_xlat16_70) * u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * u_xlat32.xyz;
    u_xlat16_3.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_22.x = floor(u_xlat16_3.w);
    u_xlat16_43.x = u_xlat16_22.x + 1.0;
    u_xlat16_43.x = min(u_xlat16_43.x, 15.0);
    u_xlat16_3.x = u_xlat16_43.x * 16.0 + u_xlat16_3.z;
    u_xlat16_43.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_43.xy = u_xlat16_43.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_43.xy).x;
    u_xlat16_3.x = u_xlat16_22.x * 16.0 + u_xlat16_3.z;
    u_xlat16_43.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_43.xy = u_xlat16_43.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_43.xy).x;
    u_xlat16_22.x = u_xlat16_5.z * 15.0 + (-u_xlat16_22.x);
    u_xlat16_43.x = u_xlat16_63 + (-u_xlat16_4.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_43.x + u_xlat16_4.x;
    u_xlat16_22.x = u_xlat16_6.x * u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_65 * 0.5;
    u_xlat16_43.x = (-u_xlat16_65) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_43.x + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_43.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_43.x + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_4.z);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = u_xlat0.xyz + (-vec3(u_xlat16_64));
    u_xlat16_65 = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz + vec3(u_xlat16_64);
    u_xlat16_5.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb63 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb63)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
ivec4 u_xlati4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec4 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec4 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
vec4 u_xlat16;
mediump float u_xlat16_16;
vec4 u_xlat17;
vec4 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_20;
float u_xlat21;
int u_xlati21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
float u_xlat34;
float u_xlat36;
float u_xlat37;
mediump vec2 u_xlat16_43;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
bool u_xlatb71;
float u_xlat73;
float u_xlat75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43.x;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
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
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat16_65 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_3.xyz = vec3(u_xlat16_65) * u_xlat16_3.xyz;
    u_xlat63 = dot(u_xlat16_22.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_66 = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_65 = u_xlat16_4.y * _metallicMultiplier;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat63) * u_xlat16_6.xyz;
    u_xlat63 = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat63) * vec3(u_xlat16_66) + u_xlat8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_67 = texture(_anisotropicMap, u_xlat16_7.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat67 = u_xlat67 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.zxy;
    u_xlat16_65 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_9.xyz = (-u_xlat16_7.zxy) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat10.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat10.x = max(u_xlat10.x, 1.17549435e-38);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat10.xyz = u_xlat16_9.yxz * u_xlat10.xxx;
    u_xlat11.xyz = u_xlat16_7.xyz * u_xlat10.yxz;
    u_xlat11.xyz = u_xlat16_7.zxy * u_xlat10.xzy + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.x = u_xlat10.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat10.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat10.y;
    u_xlat13.y = u_xlat11.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat10.x = max(u_xlat10.x, 1.17549435e-38);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat10.xxx;
    u_xlat73 = dot(u_xlat10.zxy, u_xlat12.xyz);
    u_xlat10.xyz = (-u_xlat12.yzx) * vec3(u_xlat73) + u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat16_7.xyz = u_xlat10.yzx * u_xlat12.xyz;
    u_xlat16_7.xyz = u_xlat12.zxy * u_xlat10.zxy + (-u_xlat16_7.xyz);
    u_xlat11.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat67) * u_xlat12.xyz + u_xlat11.zxy;
    u_xlat16_9.xyz = vec3(u_xlat67) * vs_TEXCOORD1.yzx + u_xlat11.xyz;
    u_xlat16_65 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7.xyz = vec3(u_xlat16_65) * u_xlat16_7.xyz;
    u_xlat67 = dot(u_xlat16_7.xyz, u_xlat16_22.xyz);
    u_xlat16_65 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_66 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_66) + 1.0;
    u_xlat16_14.y = u_xlat16_4.x * _roughnessMultiplier;
    u_xlat16_68 = u_xlat16_14.y * u_xlat16_14.y;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat4.x = u_xlat71 * u_xlat16_68;
    u_xlat4.x = max(u_xlat4.x, 0.00100000005);
    u_xlat11.z = u_xlat67 * u_xlat4.x;
    u_xlat16_69 = dot(u_xlat10.zxy, u_xlat16_22.xyz);
    u_xlat16_11 = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat16_65 * u_xlat16_68;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat11.y = u_xlat16_69 * u_xlat67;
    u_xlat11.x = u_xlat16_11;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat73 = dot(u_xlat16_7.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat4.x * u_xlat73;
    u_xlat16_65 = dot(u_xlat10.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_65 * u_xlat67;
    u_xlat16_14.x = dot(u_xlat12.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat16_14.x;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat16_32.xy = texture(_DfgTexture, u_xlat16_14.xy).xy;
    u_xlat32.xyz = u_xlat16_6.xyz * u_xlat16_32.xxx + u_xlat16_32.yyy;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat75 = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat13.y = u_xlat67 * u_xlat75;
    u_xlat75 = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat4.x * u_xlat75;
    u_xlat75 = u_xlat4.x * u_xlat67;
    u_xlat13.z = u_xlat76 * u_xlat75;
    u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat13.x = max(u_xlat13.x, 6.10351563e-05);
    u_xlat13.x = u_xlat75 / u_xlat13.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat34 = u_xlat75 * 0.318309873;
    u_xlat13.x = u_xlat34 * u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 16.0);
    u_xlat71 = u_xlat71 * u_xlat13.x;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat71);
    u_xlat8.xyz = u_xlat11.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb71 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xzw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat13.xzw, u_xlat13.xzw);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat13.xzw = u_xlat13.xzw * vec3(u_xlat19);
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat13.xzw);
    u_xlat13.x = (-u_xlat13.x) * u_xlat13.x + 1.0;
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat13.x = u_xlat13.x * _ShadowBias.z;
    u_xlat13.xzw = (-u_xlat12.xyz) * u_xlat13.xxx + vs_TEXCOORD0.xyz;
    u_xlat13.xzw = (bool(u_xlatb71)) ? u_xlat13.xzw : vs_TEXCOORD0.xyz;
    u_xlat18 = u_xlat13.zzzz * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat13.xxxx + u_xlat18;
    u_xlat16 = u_xlat16 * u_xlat13.wwww + u_xlat17;
    u_xlat15 = u_xlat15 + u_xlat16;
    u_xlat71 = _ShadowBias.x / u_xlat15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat71) + u_xlat15.z;
    u_xlat13.x = max((-u_xlat15.w), u_xlat71);
    u_xlat13.x = (-u_xlat71) + u_xlat13.x;
    u_xlat15.z = _ShadowBias.y * u_xlat13.x + u_xlat71;
    u_xlat13.xzw = u_xlat15.xyz / u_xlat15.www;
    u_xlat15.xyz = u_xlat13.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat15.w = max(u_xlat15.z, 9.99999975e-05);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat13.xzw = u_xlat15.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat13.xz,u_xlat13.w);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat17.z = 0.0;
    u_xlat17.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec1 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat17.z = 0.0;
    u_xlat17.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec2 = vec3(u_xlat17.xy,u_xlat17.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat17.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat17.z = 0.0;
    u_xlat15.xyz = u_xlat15.xyw + u_xlat17.xyz;
    vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat71 = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_65 = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat71 * u_xlat15.x + u_xlat16_65;
    u_xlat71 = (-u_xlat71) + 1.0;
    u_xlat71 = (-u_xlat71) * _shadowStrength + 1.0;
    u_xlat71 = max(u_xlat71, 0.0);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_65 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_3.xyz = vec3(u_xlat16_65) * u_xlat16_3.xyz;
    u_xlat15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat16_65 = u_xlat15.x * u_xlat15.x;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat36 = (-u_xlat16_65) * u_xlat15.x + 1.0;
    u_xlat16_65 = u_xlat15.x * u_xlat16_65;
    u_xlat15.xyz = u_xlat16_6.xyz * vec3(u_xlat36);
    u_xlat15.xyz = vec3(u_xlat63) * vec3(u_xlat16_65) + u_xlat15.xyz;
    u_xlat78 = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16.y = u_xlat67 * u_xlat78;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat79 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat75 * u_xlat79;
    u_xlat16.x = u_xlat4.x * u_xlat78;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat75 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat34 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat16.x = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat4.x * u_xlat16.x;
    u_xlat16_65 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_65 * u_xlat67;
    u_xlat16_16 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_16;
    u_xlat37 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat16.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat73 * u_xlat37 + 6.10351563e-05;
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat78 = u_xlat78 * u_xlat37;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat78);
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat16.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat8.xyz = u_xlat15.xyz * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_24 = float(1.0) / float(u_xlat16_65);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xzw = vec3(u_xlat16_65) * u_xlat15.xyz;
    u_xlat16_65 = u_xlat16_3.x * u_xlat16_24;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb15 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (bool(u_xlatb15)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_3.xyz = u_xlat16_14.xzw * u_xlat16_3.yyy + u_xlat16_20.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_3.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb15 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_69;
    u_xlat16_14.xzw = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat63) * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat63 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat15.z = u_xlat4.x * u_xlat15.x;
    u_xlat17.y = u_xlat63 * u_xlat67;
    u_xlat63 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat78 = dot(u_xlat12.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat75 * u_xlat78;
    u_xlat17.x = u_xlat63 * u_xlat4.x;
    u_xlat63 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat63 = max(u_xlat63, 6.10351563e-05);
    u_xlat63 = u_xlat75 / u_xlat63;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat34 * u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_3.xyz);
    u_xlat16_15 = dot(u_xlat12.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat15.y = u_xlat16_1.x * u_xlat67;
    u_xlat15.x = u_xlat16_15;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat15.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat63);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_14.xzw + u_xlat8.xyz;
    u_xlat16_1.x = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xyz = vec3(u_xlat71) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat4.xyw = u_xlat16_5.xyz * u_xlat16.xxx + u_xlat4.xyw;
    u_xlat16_2.xyz = u_xlat16_14.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat15.xxx * u_xlat16_2.xyz;
    u_xlat4.xyw = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat4.xyw;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat4.xyw;
    u_xlat16_5.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat12.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_1.x) + u_xlat16_65;
    u_xlat16_6.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_65 = u_xlat16_27.z * u_xlat16_65 + u_xlat16_1.x;
    u_xlat16_65 = u_xlat16_27.z * u_xlat16_65;
    u_xlat16_6.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_6.x;
    u_xlat16_7.x = min(u_xlat16_65, u_xlat16_4.z);
    u_xlat16_28.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_14.xzw = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xzw = u_xlat16_28.xxx * u_xlat16_14.xzw;
    u_xlat16_20.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat16_28.xxx * u_xlat16_20.xyz;
    u_xlat16_28.xyz = u_xlat16_14.xzw * u_xlat16_7.xxx + (-u_xlat16_28.xyz);
    u_xlat16_14.xzw = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_7.xyz = u_xlat16_14.xzw * u_xlat16_7.xxx + u_xlat16_28.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_20.y = u_xlat16_5.y;
    u_xlat0.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati4.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati21 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati63 = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_14.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_14.xzw;
    u_xlat16_14.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_14.xzw;
    u_xlat16_20.xyz = u_xlat16_14.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_14.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_66>=0.0);
#else
    u_xlatb0 = u_xlat16_66>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10.xyz;
    u_xlat4.xyw = u_xlat16_22.xyz * u_xlat0.xyz;
    u_xlat4.xyw = u_xlat0.zxy * u_xlat16_22.yzx + (-u_xlat4.xyw);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat4.xyw;
    u_xlat0.xyz = u_xlat4.wxy * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat12.xyz) + u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_68 * 8.0;
    u_xlat16_24 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_24, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_66) * u_xlat16_7.x;
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat63 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat0.xyz = vec3(u_xlat63) * u_xlat0.xyz;
    u_xlat16_7.x = dot((-u_xlat16_22.xyz), u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_7.xxx + (-u_xlat16_22.xyz);
    u_xlat4.xyw = (-u_xlat0.xyz) + u_xlat12.xyz;
    u_xlat4.xyw = vec3(u_xlat16_68) * u_xlat4.xyw + u_xlat0.xyz;
    u_xlat8.xyz = u_xlat0.xyz + (-u_xlat4.xyw);
    u_xlat4.xyw = abs(vec3(u_xlat16_66)) * u_xlat8.xyz + u_xlat4.xyw;
    u_xlat16_22.x = -abs(u_xlat16_66) * 0.800000012 + 1.0;
    u_xlat16_22.x = u_xlat16_14.y * u_xlat16_22.x;
    u_xlat16_27.x = u_xlat16_14.y * 1.09769487;
    u_xlat16_22.x = u_xlat16_22.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_22.x);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_27.y = u_xlat0.x * 0.5;
    u_xlat16_5.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_43.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xw);
    u_xlat4.w = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xw);
    u_xlat4.x = u_xlat16_43.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyw, u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = vec3(u_xlat16_70) * u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * u_xlat32.xyz;
    u_xlat16_3.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_22.x = floor(u_xlat16_3.w);
    u_xlat16_43.x = u_xlat16_22.x + 1.0;
    u_xlat16_43.x = min(u_xlat16_43.x, 15.0);
    u_xlat16_3.x = u_xlat16_43.x * 16.0 + u_xlat16_3.z;
    u_xlat16_43.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_43.xy = u_xlat16_43.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_43.xy).x;
    u_xlat16_3.x = u_xlat16_22.x * 16.0 + u_xlat16_3.z;
    u_xlat16_43.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_43.xy = u_xlat16_43.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_43.xy).x;
    u_xlat16_22.x = u_xlat16_5.z * 15.0 + (-u_xlat16_22.x);
    u_xlat16_43.x = u_xlat16_63 + (-u_xlat16_4.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_43.x + u_xlat16_4.x;
    u_xlat16_22.x = u_xlat16_6.x * u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_65 * 0.5;
    u_xlat16_43.x = (-u_xlat16_65) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_43.x + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_43.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_43.x + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_4.z);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = u_xlat0.xyz + (-vec3(u_xlat16_64));
    u_xlat16_65 = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz + vec3(u_xlat16_64);
    u_xlat16_5.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb63 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb63)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
bool u_xlatb19;
mediump vec2 u_xlat16_20;
vec2 u_xlat22;
int u_xlati22;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_31;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat16_0.xy).x;
    u_xlat1 = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1 = u_xlat1 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_54 = dot(vs_TEXCOORD2.zxy, u_xlat16_0.xyz);
    u_xlat16_2.xyz = (-u_xlat16_0.zxy) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat37 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat37 = max(u_xlat37, 1.17549435e-38);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_2.yxz;
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat3.yxz;
    u_xlat4.xyz = u_xlat16_0.zxy * u_xlat3.xzy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = u_xlat3.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.z = u_xlat16_0.y;
    u_xlat5.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat6.z = u_xlat16_0.z;
    u_xlat3.z = u_xlat16_0.x;
    u_xlat6.x = u_xlat3.y;
    u_xlat6.y = u_xlat4.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat5.z = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.y = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_0.xxx + vs_TEXCOORD2.yzx;
    u_xlat37 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat37 = max(u_xlat37, 1.17549435e-38);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(u_xlat37);
    u_xlat37 = dot(u_xlat3.zxy, u_xlat5.xyz);
    u_xlat3.xyz = (-u_xlat5.yzx) * vec3(u_xlat37) + u_xlat3.xyz;
    u_xlat37 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat3.yzx * u_xlat5.xyz;
    u_xlat16_0.xyz = u_xlat5.zxy * u_xlat3.zxy + (-u_xlat16_0.xyz);
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat1) * u_xlat5.xyz + u_xlat19.zxy;
    u_xlat16_2.xyz = vec3(u_xlat1) * vs_TEXCOORD1.yzx + u_xlat19.xyz;
    u_xlat16_54 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_0.xyz = vec3(u_xlat16_54) * u_xlat16_0.xyz;
    u_xlat57 = dot(u_xlat16_0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_7.x = u_xlat16_56 + -1.0;
    u_xlat4.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_8.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_25 = u_xlat16_8.y * u_xlat16_8.y;
    u_xlat16_25 = max(u_xlat16_25, 0.0078125);
    u_xlat4.x = u_xlat4.x * u_xlat16_25;
    u_xlat4.x = max(u_xlat4.x, 0.00100000005);
    u_xlat6.z = u_xlat57 * u_xlat4.x;
    u_xlat16_43 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = u_xlat16_56 * u_xlat16_25;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat6.y = u_xlat16_43 * u_xlat57;
    u_xlat16_6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat16_6.x;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat6.x;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_56 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat24.xyz;
    u_xlat16_10.xyz = u_xlat24.xyz * vec3(u_xlat16_56) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat16_0.xyz, u_xlat16_9.xyz);
    u_xlat11.z = u_xlat40 * u_xlat4.x;
    u_xlat16_56 = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat11.y = u_xlat16_56 * u_xlat57;
    u_xlat16_8.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat16_8.x;
    u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat22.y = u_xlat40 + u_xlat11.x;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat16_8.xy).xy;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.y * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat16_56 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xzw = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat40 = dot(u_xlat16_0.xyz, u_xlat16_8.xzw);
    u_xlat11.y = u_xlat57 * u_xlat40;
    u_xlat57 = u_xlat4.x * u_xlat57;
    u_xlat40 = dot(u_xlat3.zxy, u_xlat16_8.xzw);
    u_xlat11.x = u_xlat40 * u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat11.z = u_xlat57 * u_xlat4.x;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat57 / u_xlat4.x;
    u_xlat57 = u_xlat57 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat57 = u_xlat57 * u_xlat4.x;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat22.x;
    u_xlat16_56 = u_xlat40 * u_xlat40;
    u_xlat16_56 = u_xlat40 * u_xlat16_56;
    u_xlat16_56 = u_xlat40 * u_xlat16_56;
    u_xlat16_43 = u_xlat40 * u_xlat16_56;
    u_xlat4.x = (-u_xlat16_56) * u_xlat40 + 1.0;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_10.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_1.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_56 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_10.xyz;
    u_xlat58 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat16_10.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat4.xyz = vec3(u_xlat58) * vec3(u_xlat16_43) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat6.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_56 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_43);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat11.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_12.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_63 = dot(u_xlat5.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_61);
    u_xlat16_61 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = float(1.0) / float(u_xlat16_43);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_43 = max(u_xlat16_12.x, u_xlat16_43);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_43;
    u_xlat16_10.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat16_56 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xzw = vec3(u_xlat16_56) * u_xlat16_8.xzw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_8.xzw;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_8.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat6.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_43);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat14.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_12.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_63 = dot(u_xlat5.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_61);
    u_xlat16_61 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = float(1.0) / float(u_xlat16_43);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_43 = max(u_xlat16_12.x, u_xlat16_43);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_43;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_10.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat11.xyz;
    u_xlat16_10.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat5.xyz;
    u_xlat16_56 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyz;
    u_xlat16_56 = dot(u_xlat16_12.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_56) + u_xlat16_43;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_31.z = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_43 = u_xlat16_31.z * u_xlat16_43 + u_xlat16_56;
    u_xlat16_43 = u_xlat16_31.z * u_xlat16_43;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_63 = min(u_xlat16_1.z, u_xlat16_43);
    u_xlat16_64 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_15.xyz = u_xlat16_8.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_8.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_8.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_16.y = u_xlat16_12.y;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat4.xyz = vec3(u_xlat16_61) * u_xlat4.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_16.xyz = u_xlat4.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlati22 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat4.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat4.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_17.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_15.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_7.x>=0.0);
#else
    u_xlatb57 = u_xlat16_7.x>=0.0;
#endif
    u_xlat3.xyz = (bool(u_xlatb57)) ? u_xlat16_2.xyz : u_xlat3.xyz;
    u_xlat4.xyz = u_xlat16_9.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.zxy * u_xlat16_9.yzx + (-u_xlat4.xyz);
    u_xlat11.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat11.xyz);
    u_xlat3.xyz = (-u_xlat5.xyz) + u_xlat3.xyz;
    u_xlat16_2.x = u_xlat16_25 * 8.0;
    u_xlat16_20.x = u_xlat16_25 * u_xlat16_25;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * abs(u_xlat16_7.x);
    u_xlat3.xyz = u_xlat16_2.xxx * u_xlat3.xyz + u_xlat5.xyz;
    u_xlat57 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat3.xyz = vec3(u_xlat57) * u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_9.xyz), u_xlat3.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_2.xxx + (-u_xlat16_9.xyz);
    u_xlat4.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_7.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_2.x = -abs(u_xlat16_7.x) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_31.x = u_xlat16_8.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat3.x = dot(u_xlat16_12.xyz, u_xlat3.xyz);
    u_xlat16_31.y = u_xlat3.x * 0.5;
    u_xlat16_9.xyz = u_xlat16_31.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_20.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyz = vec3(u_xlat16_63) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat24.xyz;
    u_xlat16_0.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_0.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_0.x = u_xlat16_20.x * 16.0 + u_xlat16_0.z;
    u_xlat16_20.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_20.xy = u_xlat16_20.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_20.xy).x;
    u_xlat16_0.x = u_xlat16_2.x * 16.0 + u_xlat16_0.z;
    u_xlat16_20.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_20.xy = u_xlat16_20.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4 = texture(_SpecularOcclusionLut3D, u_xlat16_20.xy).x;
    u_xlat16_2.x = u_xlat16_9.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_57 + (-u_xlat16_4);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_4;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_56 * u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_43 * 0.5;
    u_xlat16_38 = (-u_xlat16_43) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_43;
    u_xlat16_2.x = min(u_xlat16_1.z, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat3.xyz * u_xlat16_2.xxx + u_xlat16_8.xzw;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat3.xyz = min(u_xlat16_7.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_56 = dot(u_xlat3.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_7.xyz = (-vec3(u_xlat16_56)) + u_xlat3.xyz;
    u_xlat16_61 = u_xlat16_56 * 5.4453001 + 6.9972105;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + 0.800000012;
    u_xlat16_7.xyz = vec3(u_xlat16_61) * u_xlat16_7.xyz + vec3(u_xlat16_56);
    u_xlat16_8.xyz = u_xlat16_7.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_7.xyz = u_xlat16_8.xyz / u_xlat16_7.xyz;
    u_xlat3.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat3.xyz : u_xlat16_2.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
bool u_xlatb19;
mediump vec2 u_xlat16_20;
vec2 u_xlat22;
int u_xlati22;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_31;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat16_0.xy).x;
    u_xlat1 = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1 = u_xlat1 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_54 = dot(vs_TEXCOORD2.zxy, u_xlat16_0.xyz);
    u_xlat16_2.xyz = (-u_xlat16_0.zxy) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat37 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat37 = max(u_xlat37, 1.17549435e-38);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_2.yxz;
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat3.yxz;
    u_xlat4.xyz = u_xlat16_0.zxy * u_xlat3.xzy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = u_xlat3.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.z = u_xlat16_0.y;
    u_xlat5.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat6.z = u_xlat16_0.z;
    u_xlat3.z = u_xlat16_0.x;
    u_xlat6.x = u_xlat3.y;
    u_xlat6.y = u_xlat4.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat5.z = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.y = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_0.xxx + vs_TEXCOORD2.yzx;
    u_xlat37 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat37 = max(u_xlat37, 1.17549435e-38);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(u_xlat37);
    u_xlat37 = dot(u_xlat3.zxy, u_xlat5.xyz);
    u_xlat3.xyz = (-u_xlat5.yzx) * vec3(u_xlat37) + u_xlat3.xyz;
    u_xlat37 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat3.yzx * u_xlat5.xyz;
    u_xlat16_0.xyz = u_xlat5.zxy * u_xlat3.zxy + (-u_xlat16_0.xyz);
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat1) * u_xlat5.xyz + u_xlat19.zxy;
    u_xlat16_2.xyz = vec3(u_xlat1) * vs_TEXCOORD1.yzx + u_xlat19.xyz;
    u_xlat16_54 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_0.xyz = vec3(u_xlat16_54) * u_xlat16_0.xyz;
    u_xlat57 = dot(u_xlat16_0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_7.x = u_xlat16_56 + -1.0;
    u_xlat4.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_8.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_25 = u_xlat16_8.y * u_xlat16_8.y;
    u_xlat16_25 = max(u_xlat16_25, 0.0078125);
    u_xlat4.x = u_xlat4.x * u_xlat16_25;
    u_xlat4.x = max(u_xlat4.x, 0.00100000005);
    u_xlat6.z = u_xlat57 * u_xlat4.x;
    u_xlat16_43 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57 = u_xlat16_56 * u_xlat16_25;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat6.y = u_xlat16_43 * u_xlat57;
    u_xlat16_6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat16_6.x;
    u_xlat22.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat6.x;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_56 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat24.xyz;
    u_xlat16_10.xyz = u_xlat24.xyz * vec3(u_xlat16_56) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat16_0.xyz, u_xlat16_9.xyz);
    u_xlat11.z = u_xlat40 * u_xlat4.x;
    u_xlat16_56 = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat11.y = u_xlat16_56 * u_xlat57;
    u_xlat16_8.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat16_8.x;
    u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat22.y = u_xlat40 + u_xlat11.x;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat16_8.xy).xy;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.y * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat16_56 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xzw = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat40 = dot(u_xlat16_0.xyz, u_xlat16_8.xzw);
    u_xlat11.y = u_xlat57 * u_xlat40;
    u_xlat57 = u_xlat4.x * u_xlat57;
    u_xlat40 = dot(u_xlat3.zxy, u_xlat16_8.xzw);
    u_xlat11.x = u_xlat40 * u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat11.z = u_xlat57 * u_xlat4.x;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat57 / u_xlat4.x;
    u_xlat57 = u_xlat57 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat57 = u_xlat57 * u_xlat4.x;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat22.x;
    u_xlat16_56 = u_xlat40 * u_xlat40;
    u_xlat16_56 = u_xlat40 * u_xlat16_56;
    u_xlat16_56 = u_xlat40 * u_xlat16_56;
    u_xlat16_43 = u_xlat40 * u_xlat16_56;
    u_xlat4.x = (-u_xlat16_56) * u_xlat40 + 1.0;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_10.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_1.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_56 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_10.xyz;
    u_xlat58 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat16_10.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat4.xyz = vec3(u_xlat58) * vec3(u_xlat16_43) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat6.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_56 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_43);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat11.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_12.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_63 = dot(u_xlat5.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_61);
    u_xlat16_61 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = float(1.0) / float(u_xlat16_43);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_43 = max(u_xlat16_12.x, u_xlat16_43);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_43;
    u_xlat16_10.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat16_56 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xzw = vec3(u_xlat16_56) * u_xlat16_8.xzw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_8.xzw;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_8.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat6.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_43);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat14.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_12.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_63 = dot(u_xlat5.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_61);
    u_xlat16_61 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = float(1.0) / float(u_xlat16_43);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_43 = max(u_xlat16_12.x, u_xlat16_43);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_43;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_10.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat11.xyz;
    u_xlat16_10.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat5.xyz;
    u_xlat16_56 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyz;
    u_xlat16_56 = dot(u_xlat16_12.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_56) + u_xlat16_43;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_31.z = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_43 = u_xlat16_31.z * u_xlat16_43 + u_xlat16_56;
    u_xlat16_43 = u_xlat16_31.z * u_xlat16_43;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_43 = u_xlat16_61 * u_xlat16_43;
    u_xlat16_63 = min(u_xlat16_1.z, u_xlat16_43);
    u_xlat16_64 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_15.xyz = u_xlat16_8.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_8.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_8.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_16.y = u_xlat16_12.y;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat4.xyz = vec3(u_xlat16_61) * u_xlat4.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_16.xyz = u_xlat4.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlati22 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat4.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat4.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_17.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_15.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_7.x>=0.0);
#else
    u_xlatb57 = u_xlat16_7.x>=0.0;
#endif
    u_xlat3.xyz = (bool(u_xlatb57)) ? u_xlat16_2.xyz : u_xlat3.xyz;
    u_xlat4.xyz = u_xlat16_9.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.zxy * u_xlat16_9.yzx + (-u_xlat4.xyz);
    u_xlat11.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat11.xyz);
    u_xlat3.xyz = (-u_xlat5.xyz) + u_xlat3.xyz;
    u_xlat16_2.x = u_xlat16_25 * 8.0;
    u_xlat16_20.x = u_xlat16_25 * u_xlat16_25;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * abs(u_xlat16_7.x);
    u_xlat3.xyz = u_xlat16_2.xxx * u_xlat3.xyz + u_xlat5.xyz;
    u_xlat57 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat3.xyz = vec3(u_xlat57) * u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_9.xyz), u_xlat3.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat16_2.xxx + (-u_xlat16_9.xyz);
    u_xlat4.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_7.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_2.x = -abs(u_xlat16_7.x) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_31.x = u_xlat16_8.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat3.x = dot(u_xlat16_12.xyz, u_xlat3.xyz);
    u_xlat16_31.y = u_xlat3.x * 0.5;
    u_xlat16_9.xyz = u_xlat16_31.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_20.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyz = vec3(u_xlat16_63) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat24.xyz;
    u_xlat16_0.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_0.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_0.x = u_xlat16_20.x * 16.0 + u_xlat16_0.z;
    u_xlat16_20.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_20.xy = u_xlat16_20.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_20.xy).x;
    u_xlat16_0.x = u_xlat16_2.x * 16.0 + u_xlat16_0.z;
    u_xlat16_20.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_20.xy = u_xlat16_20.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4 = texture(_SpecularOcclusionLut3D, u_xlat16_20.xy).x;
    u_xlat16_2.x = u_xlat16_9.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_57 + (-u_xlat16_4);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_4;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_56 * u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_43 * 0.5;
    u_xlat16_38 = (-u_xlat16_43) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_43;
    u_xlat16_2.x = min(u_xlat16_1.z, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat3.xyz * u_xlat16_2.xxx + u_xlat16_8.xzw;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat3.xyz = min(u_xlat16_7.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_56 = dot(u_xlat3.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_7.xyz = (-vec3(u_xlat16_56)) + u_xlat3.xyz;
    u_xlat16_61 = u_xlat16_56 * 5.4453001 + 6.9972105;
    u_xlat16_61 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + 0.800000012;
    u_xlat16_7.xyz = vec3(u_xlat16_61) * u_xlat16_7.xyz + vec3(u_xlat16_56);
    u_xlat16_8.xyz = u_xlat16_7.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_7.xyz = u_xlat16_8.xyz / u_xlat16_7.xyz;
    u_xlat3.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat3.xyz : u_xlat16_2.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
int u_xlati19;
bool u_xlatb19;
float u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
float u_xlat58;
mediump float u_xlat16_58;
bool u_xlatb58;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat0.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb57 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_5.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_62 = dot(vs_TEXCOORD2.zxy, u_xlat16_5.xyz);
    u_xlat16_6.xyz = (-u_xlat16_5.zxy) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat16_6.yxz * u_xlat7.xxx;
    u_xlat8.xyz = u_xlat16_5.xyz * u_xlat7.yxz;
    u_xlat8.xyz = u_xlat16_5.zxy * u_xlat7.xzy + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.z = u_xlat16_5.y;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.z = u_xlat16_5.z;
    u_xlat7.z = u_xlat16_5.x;
    u_xlat10.x = u_xlat7.y;
    u_xlat10.y = u_xlat8.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat7.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat9.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb57)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat7.yyyy;
    u_xlat3 = u_xlat3 * u_xlat7.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat7.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat57 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat57) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat57);
    u_xlat2.x = (-u_xlat57) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat57;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat0.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat0.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat1.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat0.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_62 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_62 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = u_xlat19.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_13.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_12.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_68);
    u_xlat16_68 = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_13.x, u_xlat16_63);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_31.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_31.xyz = vec3(u_xlat16_62) * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_6.xyz * u_xlat16_31.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_31.xyz;
    u_xlat19.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_62 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat16_11.xyz * vec3(u_xlat16_62) + u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_30.xyz = u_xlat2.xyz * u_xlat16_30.xxx;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_31.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_30.x = dot(u_xlat9.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_31.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_49);
    u_xlat16_49 = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_11.x = u_xlat16_49 * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_12.x, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_11.x;
    u_xlat16_11.xzw = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_11.xzw = u_xlat16_6.xyz * u_xlat16_11.xzw;
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xzw;
    u_xlat19.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat19.xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_58 = texture(_anisotropicMap, u_xlat16_11.xy).x;
    u_xlat58 = u_xlat16_58 * 2.0 + -1.0;
    u_xlat58 = u_xlat58 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb2 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat2.x = (u_xlatb2) ? 1.0 : -1.0;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD2.w;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat3.x = dot(u_xlat21.zxy, u_xlat9.xyz);
    u_xlat21.xyz = (-u_xlat9.yzx) * u_xlat3.xxx + u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat3.xxx;
    u_xlat16_11.xyz = u_xlat21.yzx * u_xlat9.xyz;
    u_xlat16_11.xyz = u_xlat9.zxy * u_xlat21.zxy + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat2.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat3.zxy;
    u_xlat16_12.xyz = vec3(u_xlat58) * vs_TEXCOORD1.yzx + u_xlat3.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat58 = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_63 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_68 = u_xlat16_63 + -1.0;
    u_xlat2.x = (-u_xlat16_68) + 1.0;
    u_xlat16_13.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_69 = u_xlat16_13.y * u_xlat16_13.y;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat1.x = u_xlat2.x * u_xlat16_69;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat3.z = u_xlat58 * u_xlat1.x;
    u_xlat16_51 = dot(u_xlat21.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat58 = u_xlat16_63 * u_xlat16_69;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat3.y = u_xlat16_51 * u_xlat58;
    u_xlat3.x = u_xlat16_62;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat3.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat22.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat16_11.xyz, u_xlat16_14.xyz);
    u_xlat4.z = u_xlat1.x * u_xlat22.x;
    u_xlat16_62 = dot(u_xlat21.zxy, u_xlat16_14.xyz);
    u_xlat4.y = u_xlat58 * u_xlat16_62;
    u_xlat16_13.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat16_13.x;
    u_xlat22.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat4.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat16_13.xy).xy;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat2.x = u_xlat22.x * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_13.xzw = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat22.x = dot(u_xlat16_11.xyz, u_xlat16_13.xzw);
    u_xlat4.y = u_xlat58 * u_xlat22.x;
    u_xlat58 = u_xlat1.x * u_xlat58;
    u_xlat22.x = dot(u_xlat21.zxy, u_xlat16_13.xzw);
    u_xlat4.x = u_xlat1.x * u_xlat22.x;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_13.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_13.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = (-u_xlat22.x) + 1.0;
    u_xlat4.z = u_xlat1.x * u_xlat58;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat58 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat16_62 = u_xlat22.x * u_xlat22.x;
    u_xlat16_62 = u_xlat22.x * u_xlat16_62;
    u_xlat16_62 = u_xlat22.x * u_xlat16_62;
    u_xlat16_63 = u_xlat22.x * u_xlat16_62;
    u_xlat58 = (-u_xlat16_62) * u_xlat22.x + 1.0;
    u_xlat16_62 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_5.xyz = vec3(u_xlat16_62) * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat20 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat4.xyz = vec3(u_xlat20) * vec3(u_xlat16_63) + u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = u_xlat3.xxx * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat1.xyw * u_xlat0.xxx + u_xlat19.xyz;
    u_xlat16_11.xyz = (-u_xlat9.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat9.xyz;
    u_xlat16_62 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
    u_xlat16_62 = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63 + u_xlat16_62;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_13.x;
    u_xlat16_51 = min(u_xlat16_1.z, u_xlat16_63);
    u_xlat16_70 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_16.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_51) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_51) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_13.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_17.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati57 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz + u_xlat16_5.xyz;
    u_xlat16_6.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_68>=0.0);
#else
    u_xlatb0 = u_xlat16_68>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat21.xyz;
    u_xlat1.xyw = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat1.xyw = u_xlat0.zxy * u_xlat16_14.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat1.wxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat9.xyz) + u_xlat0.xyz;
    u_xlat16_6.x = u_xlat16_69 * 8.0;
    u_xlat16_25.x = u_xlat16_69 * u_xlat16_69;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * abs(u_xlat16_68);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat16_6.x = dot((-u_xlat16_14.xyz), u_xlat0.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_6.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyw = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat1.xyw = u_xlat16_25.xxx * u_xlat1.xyw + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyw);
    u_xlat1.xyw = abs(vec3(u_xlat16_68)) * u_xlat2.xyz + u_xlat1.xyw;
    u_xlat16_6.x = -abs(u_xlat16_68) * 0.800000012 + 1.0;
    u_xlat16_6.x = u_xlat16_13.y * u_xlat16_6.x;
    u_xlat16_34.x = u_xlat16_13.y * 1.09769487;
    u_xlat16_6.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat16_34.y = u_xlat0.x * 0.5;
    u_xlat16_11.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat1.w = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat1.x = u_xlat16_25.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyw, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat16_6.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_25.x = u_xlat16_6.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_2.x = u_xlat16_25.x * 16.0 + u_xlat16_2.z;
    u_xlat16_25.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_25.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_6.x = u_xlat16_11.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_25.x = u_xlat16_57 + (-u_xlat16_1.x);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_13.x * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_63 * 0.5;
    u_xlat16_25.x = (-u_xlat16_63) * 0.5 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_25.x + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_62 + u_xlat16_62;
    u_xlat16_25.x = (-u_xlat16_62) * 2.0 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_25.x + u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = min(u_xlat16_1.z, u_xlat16_62);
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_6.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_62 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_6.xyz = u_xlat0.xyz + (-vec3(u_xlat16_62));
    u_xlat16_63 = u_xlat16_62 * 5.4453001 + 6.9972105;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 + 0.800000012;
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz + vec3(u_xlat16_62);
    u_xlat16_11.xyz = u_xlat16_6.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_12.xyz = u_xlat16_6.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_6.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec3 _light_0_Color;
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
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
int u_xlati19;
bool u_xlatb19;
float u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
float u_xlat58;
mediump float u_xlat16_58;
bool u_xlatb58;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat0.z = 0.0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb57 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_5.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_62 = dot(vs_TEXCOORD2.zxy, u_xlat16_5.xyz);
    u_xlat16_6.xyz = (-u_xlat16_5.zxy) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat16_6.yxz * u_xlat7.xxx;
    u_xlat8.xyz = u_xlat16_5.xyz * u_xlat7.yxz;
    u_xlat8.xyz = u_xlat16_5.zxy * u_xlat7.xzy + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.z = u_xlat16_5.y;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.z = u_xlat16_5.z;
    u_xlat7.z = u_xlat16_5.x;
    u_xlat10.x = u_xlat7.y;
    u_xlat10.y = u_xlat8.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat7.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat9.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb57)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat7.yyyy;
    u_xlat3 = u_xlat3 * u_xlat7.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat7.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat57 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat57) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat57);
    u_xlat2.x = (-u_xlat57) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat57;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyw;
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat0.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat0.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat1.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat0.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_62 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_62 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = u_xlat19.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_13.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_12.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_68);
    u_xlat16_68 = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_63 = max(u_xlat16_13.x, u_xlat16_63);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_31.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_31.xyz = vec3(u_xlat16_62) * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_6.xyz * u_xlat16_31.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_31.xyz;
    u_xlat19.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_62 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat16_11.xyz * vec3(u_xlat16_62) + u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_30.xyz = u_xlat2.xyz * u_xlat16_30.xxx;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_31.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_30.x = dot(u_xlat9.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_31.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_49);
    u_xlat16_49 = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_11.x = u_xlat16_49 * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_12.x, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_11.x;
    u_xlat16_11.xzw = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_11.xzw = u_xlat16_6.xyz * u_xlat16_11.xzw;
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xzw;
    u_xlat19.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat19.xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_58 = texture(_anisotropicMap, u_xlat16_11.xy).x;
    u_xlat58 = u_xlat16_58 * 2.0 + -1.0;
    u_xlat58 = u_xlat58 * _sunShift + _sunShiftOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb2 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat2.x = (u_xlatb2) ? 1.0 : -1.0;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD2.w;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_11.xyz;
    u_xlat3.x = dot(u_xlat21.zxy, u_xlat9.xyz);
    u_xlat21.xyz = (-u_xlat9.yzx) * u_xlat3.xxx + u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat3.xxx;
    u_xlat16_11.xyz = u_xlat21.yzx * u_xlat9.xyz;
    u_xlat16_11.xyz = u_xlat9.zxy * u_xlat21.zxy + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat2.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat3.zxy;
    u_xlat16_12.xyz = vec3(u_xlat58) * vs_TEXCOORD1.yzx + u_xlat3.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat58 = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_63 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_68 = u_xlat16_63 + -1.0;
    u_xlat2.x = (-u_xlat16_68) + 1.0;
    u_xlat16_13.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_69 = u_xlat16_13.y * u_xlat16_13.y;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat1.x = u_xlat2.x * u_xlat16_69;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat3.z = u_xlat58 * u_xlat1.x;
    u_xlat16_51 = dot(u_xlat21.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat58 = u_xlat16_63 * u_xlat16_69;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat3.y = u_xlat16_51 * u_xlat58;
    u_xlat3.x = u_xlat16_62;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat3.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat22.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat16_11.xyz, u_xlat16_14.xyz);
    u_xlat4.z = u_xlat1.x * u_xlat22.x;
    u_xlat16_62 = dot(u_xlat21.zxy, u_xlat16_14.xyz);
    u_xlat4.y = u_xlat58 * u_xlat16_62;
    u_xlat16_13.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat16_13.x;
    u_xlat22.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat4.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat16_13.xy).xy;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat2.x = u_xlat22.x * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_13.xzw = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat22.x = dot(u_xlat16_11.xyz, u_xlat16_13.xzw);
    u_xlat4.y = u_xlat58 * u_xlat22.x;
    u_xlat58 = u_xlat1.x * u_xlat58;
    u_xlat22.x = dot(u_xlat21.zxy, u_xlat16_13.xzw);
    u_xlat4.x = u_xlat1.x * u_xlat22.x;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_13.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_13.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = (-u_xlat22.x) + 1.0;
    u_xlat4.z = u_xlat1.x * u_xlat58;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat58 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat16_62 = u_xlat22.x * u_xlat22.x;
    u_xlat16_62 = u_xlat22.x * u_xlat16_62;
    u_xlat16_62 = u_xlat22.x * u_xlat16_62;
    u_xlat16_63 = u_xlat22.x * u_xlat16_62;
    u_xlat58 = (-u_xlat16_62) * u_xlat22.x + 1.0;
    u_xlat16_62 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_5.xyz = vec3(u_xlat16_62) * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat20 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat4.xyz = vec3(u_xlat20) * vec3(u_xlat16_63) + u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = u_xlat3.xxx * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat1.xyw * u_xlat0.xxx + u_xlat19.xyz;
    u_xlat16_11.xyz = (-u_xlat9.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat9.xyz;
    u_xlat16_62 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
    u_xlat16_62 = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63 + u_xlat16_62;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_13.x;
    u_xlat16_51 = min(u_xlat16_1.z, u_xlat16_63);
    u_xlat16_70 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_16.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_51) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_51) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_13.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_17.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati57 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz + u_xlat16_5.xyz;
    u_xlat16_6.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_68>=0.0);
#else
    u_xlatb0 = u_xlat16_68>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat21.xyz;
    u_xlat1.xyw = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat1.xyw = u_xlat0.zxy * u_xlat16_14.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat1.wxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat9.xyz) + u_xlat0.xyz;
    u_xlat16_6.x = u_xlat16_69 * 8.0;
    u_xlat16_25.x = u_xlat16_69 * u_xlat16_69;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * abs(u_xlat16_68);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat16_6.x = dot((-u_xlat16_14.xyz), u_xlat0.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_6.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyw = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat1.xyw = u_xlat16_25.xxx * u_xlat1.xyw + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat1.xyw);
    u_xlat1.xyw = abs(vec3(u_xlat16_68)) * u_xlat2.xyz + u_xlat1.xyw;
    u_xlat16_6.x = -abs(u_xlat16_68) * 0.800000012 + 1.0;
    u_xlat16_6.x = u_xlat16_13.y * u_xlat16_6.x;
    u_xlat16_34.x = u_xlat16_13.y * 1.09769487;
    u_xlat16_6.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat16_34.y = u_xlat0.x * 0.5;
    u_xlat16_11.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat1.w = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat1.x = u_xlat16_25.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyw, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat22.xyz * u_xlat16_6.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_25.x = u_xlat16_6.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_2.x = u_xlat16_25.x * 16.0 + u_xlat16_2.z;
    u_xlat16_25.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_25.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_6.x = u_xlat16_11.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_25.x = u_xlat16_57 + (-u_xlat16_1.x);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_13.x * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_63 * 0.5;
    u_xlat16_25.x = (-u_xlat16_63) * 0.5 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_25.x + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_62 + u_xlat16_62;
    u_xlat16_25.x = (-u_xlat16_62) * 2.0 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_25.x + u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = min(u_xlat16_1.z, u_xlat16_62);
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat0.xyz = min(u_xlat16_6.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_62 = dot(u_xlat0.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_6.xyz = u_xlat0.xyz + (-vec3(u_xlat16_62));
    u_xlat16_63 = u_xlat16_62 * 5.4453001 + 6.9972105;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 + 0.800000012;
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz + vec3(u_xlat16_62);
    u_xlat16_11.xyz = u_xlat16_6.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_12.xyz = u_xlat16_6.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_6.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb57 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
  GpuProgramID 72310
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
}
}
}
CustomEditor "HeroShowRenderingGUI.HeroShowShaderGUI"
}