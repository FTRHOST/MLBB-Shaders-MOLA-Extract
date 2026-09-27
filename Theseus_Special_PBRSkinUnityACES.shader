//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Special/PBR(Skin)UnityACES" {
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

[Tex] _skinMap ("skinMap", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

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
  GpuProgramID 46792
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
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
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_27;
vec3 u_xlat29;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
bool u_xlatb63;
float u_xlat67;
float u_xlat69;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    SV_Target0.w = u_xlat16_6.w;
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
    u_xlat16_59 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.zxy;
    u_xlat16_59 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_11.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat63 = max(u_xlat63, 1.17549435e-38);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat13.xyz = u_xlat16_9.zxy * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xyz * vs_TEXCOORD2.www;
    u_xlat14.y = u_xlat13.y;
    u_xlat14.x = u_xlat12.x;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat14.z = u_xlat16_9.z;
    u_xlat14.y = dot(u_xlat16_11.xyz, u_xlat14.xyz);
    u_xlat15.z = u_xlat16_9.y;
    u_xlat16.z = u_xlat16_9.x;
    u_xlat15.x = u_xlat12.z;
    u_xlat16.x = u_xlat12.y;
    u_xlat15.y = u_xlat13.x;
    u_xlat16.y = u_xlat13.z;
    u_xlat14.z = dot(u_xlat16_11.xyz, u_xlat16.xyz);
    u_xlat14.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
    u_xlat16_59 = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_3.y = u_xlat16_6.x * _roughnessMultiplier;
    u_xlat16_41 = u_xlat16_3.y * u_xlat16_3.y;
    u_xlat16_41 = max(u_xlat16_41, 0.0078125);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = max(u_xlat16_41, 0.0078125);
    u_xlat6.x = (-u_xlat16_59) * u_xlat16_41 + u_xlat16_59;
    u_xlat6.x = u_xlat16_59 * u_xlat6.x + u_xlat16_41;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat16_59 + u_xlat6.x;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_3.x = dot(u_xlat14.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_3.x) * u_xlat16_41 + u_xlat16_3.x;
    u_xlat63 = u_xlat16_3.x * u_xlat63 + u_xlat16_41;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat6.w = u_xlat16_3.x + u_xlat63;
    u_xlat16_12.xy = texture(_DfgTexture, u_xlat16_3.xy).xy;
    u_xlat12.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx + u_xlat16_12.yyy;
    u_xlat6.xw = u_xlat6.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat6.x = u_xlat6.x * u_xlat6.w;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat67 = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat69 = u_xlat16_41 + -1.0;
    u_xlat67 = u_xlat67 * u_xlat69 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_41 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat6.x = u_xlat6.x * u_xlat67;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat6.xxx;
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_4.xyz * u_xlat10.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat69 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat16_41 / u_xlat19.x;
    u_xlat0.y = u_xlat19.x * 0.318309873;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat57) * u_xlat16_1.xxx + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) * u_xlat16_41 + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + u_xlat16_41;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat16_1.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat6.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_11.xyz;
    u_xlat6.x = dot(u_xlat16_20.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.x * u_xlat69 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_41 / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat16_20.x = dot(u_xlat14.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat16_39 = u_xlat6.x * u_xlat6.x;
    u_xlat16_39 = u_xlat6.x * u_xlat16_39;
    u_xlat16_39 = u_xlat6.x * u_xlat16_39;
    u_xlat16_58 = u_xlat6.x * u_xlat16_39;
    u_xlat6.x = (-u_xlat16_39) * u_xlat6.x + 1.0;
    u_xlat29.xyz = u_xlat16_8.xyz * u_xlat6.xxx;
    u_xlat29.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat29.xyz;
    u_xlat57 = (-u_xlat16_20.x) * u_xlat16_41 + u_xlat16_20.x;
    u_xlat57 = u_xlat16_20.x * u_xlat57 + u_xlat16_41;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat16_20.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat6.w;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat10.x;
    u_xlat10.xyz = u_xlat29.xyz * vec3(u_xlat57);
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat16_20.xxx * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = (-u_xlat14.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat14.xyz;
    u_xlat16_39 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_5.xyz = vec3(u_xlat16_39) * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_5.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_58 = (-u_xlat16_39) + u_xlat16_58;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_58 = u_xlat16_27.z * u_xlat16_58 + u_xlat16_39;
    u_xlat16_58 = u_xlat16_27.z * u_xlat16_58;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_3.x;
    u_xlat16_60 = sqrt(u_xlat16_58);
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_57 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_61 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
    u_xlat16_62 = sqrt(u_xlat16_61);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_62) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyw = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat10.xyz = vec3(u_xlat16_59) * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_59));
    u_xlat10.xyz = vec3(u_xlat16_62) * u_xlat10.xyz + vec3(u_xlat16_59);
    u_xlat16_17.xyz = u_xlat16_7.xyz * u_xlat10.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat6.xyw = u_xlat16_20.xxx * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat6.xyw = u_xlat6.xyw * u_xlat16_11.xyz + (-u_xlat16_20.xxx);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_11.xyz + (-u_xlat16_1.xxx);
    u_xlat10.xyz = vec3(u_xlat16_62) * u_xlat10.xyz + u_xlat16_1.xxx;
    u_xlat6.xyw = vec3(u_xlat16_62) * u_xlat6.xyw + u_xlat16_20.xxx;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_27.zzz * u_xlat16_4.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat14.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat14.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat14.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_11.y = u_xlat16_5.y;
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat19.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat19.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_7.xyz + (-u_xlat16_7.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_1.x = min(u_xlat16_58, u_xlat16_6.z);
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xxx;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat16_20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_11.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_11.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati57 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_11.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_20.x = dot((-u_xlat16_9.xyz), u_xlat14.xyz);
    u_xlat16_20.x = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat0.xyz = (-u_xlat14.xyz) * u_xlat16_20.xxx + (-u_xlat16_9.xyz);
    u_xlat6.xyw = (-u_xlat0.xyz) + u_xlat14.xyz;
    u_xlat6.xyw = vec3(u_xlat16_41) * u_xlat6.xyw + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_27.y = u_xlat0.x * 0.5;
    u_xlat16_27.x = u_xlat16_3.y * 1.09769487;
    u_xlat16_20.x = u_xlat16_3.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.y);
    u_xlat16_22.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_22.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_59 = floor(u_xlat16_0.w);
    u_xlat16_22.x = u_xlat16_59 + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_0.x = u_xlat16_22.x * 16.0 + u_xlat16_0.z;
    u_xlat16_22.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_0.x = u_xlat16_59 * 16.0 + u_xlat16_0.z;
    u_xlat16_22.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_59 = u_xlat16_22.z * 15.0 + (-u_xlat16_59);
    u_xlat16_22.x = (-u_xlat16_29) + u_xlat16_10;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_22.x + u_xlat16_29;
    u_xlat16_59 = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_59;
    u_xlat16_59 = u_xlat16_58 * 0.5;
    u_xlat16_3.x = (-u_xlat16_58) * 0.5 + 1.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_3.x + u_xlat16_59;
    u_xlat16_59 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_3.x = (-u_xlat16_39) * 2.0 + 1.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_3.x + u_xlat16_59;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_58;
    u_xlat16_39 = min(u_xlat16_39, u_xlat16_6.z);
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xw);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xw);
    u_xlat3.y = u_xlat6.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_1.xyw * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * vec3(u_xlat16_39) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat6.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat6.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_58)) + u_xlat6.xyz;
    u_xlat16_59 = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_59 = float(1.0) / float(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_4.xyz / u_xlat16_2.xyz;
    u_xlat6.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb63 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb63)) ? u_xlat6.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
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
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_27;
vec3 u_xlat29;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
bool u_xlatb63;
float u_xlat67;
float u_xlat69;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    SV_Target0.w = u_xlat16_6.w;
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
    u_xlat16_59 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_9.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.zxy;
    u_xlat16_59 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_11.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat63 = max(u_xlat63, 1.17549435e-38);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat13.xyz = u_xlat16_9.zxy * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xyz * vs_TEXCOORD2.www;
    u_xlat14.y = u_xlat13.y;
    u_xlat14.x = u_xlat12.x;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat14.z = u_xlat16_9.z;
    u_xlat14.y = dot(u_xlat16_11.xyz, u_xlat14.xyz);
    u_xlat15.z = u_xlat16_9.y;
    u_xlat16.z = u_xlat16_9.x;
    u_xlat15.x = u_xlat12.z;
    u_xlat16.x = u_xlat12.y;
    u_xlat15.y = u_xlat13.x;
    u_xlat16.y = u_xlat13.z;
    u_xlat14.z = dot(u_xlat16_11.xyz, u_xlat16.xyz);
    u_xlat14.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
    u_xlat16_59 = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_3.y = u_xlat16_6.x * _roughnessMultiplier;
    u_xlat16_41 = u_xlat16_3.y * u_xlat16_3.y;
    u_xlat16_41 = max(u_xlat16_41, 0.0078125);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = max(u_xlat16_41, 0.0078125);
    u_xlat6.x = (-u_xlat16_59) * u_xlat16_41 + u_xlat16_59;
    u_xlat6.x = u_xlat16_59 * u_xlat6.x + u_xlat16_41;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat16_59 + u_xlat6.x;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_3.x = dot(u_xlat14.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_3.x) * u_xlat16_41 + u_xlat16_3.x;
    u_xlat63 = u_xlat16_3.x * u_xlat63 + u_xlat16_41;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat6.w = u_xlat16_3.x + u_xlat63;
    u_xlat16_12.xy = texture(_DfgTexture, u_xlat16_3.xy).xy;
    u_xlat12.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx + u_xlat16_12.yyy;
    u_xlat6.xw = u_xlat6.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat6.x = u_xlat6.x * u_xlat6.w;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat67 = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat69 = u_xlat16_41 + -1.0;
    u_xlat67 = u_xlat67 * u_xlat69 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_41 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat6.x = u_xlat6.x * u_xlat67;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat6.xxx;
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_4.xyz * u_xlat10.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat69 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat16_41 / u_xlat19.x;
    u_xlat0.y = u_xlat19.x * 0.318309873;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat0.x + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat57) * u_xlat16_1.xxx + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) * u_xlat16_41 + u_xlat16_1.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + u_xlat16_41;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat16_1.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat6.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat16_3.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_11.xyz;
    u_xlat6.x = dot(u_xlat16_20.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat14.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.x * u_xlat69 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_41 / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat16_20.x = dot(u_xlat14.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat16_39 = u_xlat6.x * u_xlat6.x;
    u_xlat16_39 = u_xlat6.x * u_xlat16_39;
    u_xlat16_39 = u_xlat6.x * u_xlat16_39;
    u_xlat16_58 = u_xlat6.x * u_xlat16_39;
    u_xlat6.x = (-u_xlat16_39) * u_xlat6.x + 1.0;
    u_xlat29.xyz = u_xlat16_8.xyz * u_xlat6.xxx;
    u_xlat29.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat29.xyz;
    u_xlat57 = (-u_xlat16_20.x) * u_xlat16_41 + u_xlat16_20.x;
    u_xlat57 = u_xlat16_20.x * u_xlat57 + u_xlat16_41;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat16_20.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat6.w;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat10.x;
    u_xlat10.xyz = u_xlat29.xyz * vec3(u_xlat57);
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat16_20.xxx * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = (-u_xlat14.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat14.xyz;
    u_xlat16_39 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_5.xyz = vec3(u_xlat16_39) * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_5.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_58 = (-u_xlat16_39) + u_xlat16_58;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_58 = u_xlat16_27.z * u_xlat16_58 + u_xlat16_39;
    u_xlat16_58 = u_xlat16_27.z * u_xlat16_58;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_3.x;
    u_xlat16_60 = sqrt(u_xlat16_58);
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_57 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_61 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
    u_xlat16_62 = sqrt(u_xlat16_61);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_62) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyw = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat10.xyz = vec3(u_xlat16_59) * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_59));
    u_xlat10.xyz = vec3(u_xlat16_62) * u_xlat10.xyz + vec3(u_xlat16_59);
    u_xlat16_17.xyz = u_xlat16_7.xyz * u_xlat10.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat6.xyw = u_xlat16_20.xxx * u_xlat6.xyw + u_xlat16_18.xyz;
    u_xlat6.xyw = u_xlat6.xyw * u_xlat16_11.xyz + (-u_xlat16_20.xxx);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_11.xyz + (-u_xlat16_1.xxx);
    u_xlat10.xyz = vec3(u_xlat16_62) * u_xlat10.xyz + u_xlat16_1.xxx;
    u_xlat6.xyw = vec3(u_xlat16_62) * u_xlat6.xyw + u_xlat16_20.xxx;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat6.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_27.zzz * u_xlat16_4.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat14.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat14.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat14.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_11.y = u_xlat16_5.y;
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat19.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat19.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_7.xyz + (-u_xlat16_7.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_1.x = min(u_xlat16_58, u_xlat16_6.z);
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xxx;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat16_20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_11.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_11.xyz = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati19 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati57 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_11.xyz = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_20.x = dot((-u_xlat16_9.xyz), u_xlat14.xyz);
    u_xlat16_20.x = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat0.xyz = (-u_xlat14.xyz) * u_xlat16_20.xxx + (-u_xlat16_9.xyz);
    u_xlat6.xyw = (-u_xlat0.xyz) + u_xlat14.xyz;
    u_xlat6.xyw = vec3(u_xlat16_41) * u_xlat6.xyw + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_27.y = u_xlat0.x * 0.5;
    u_xlat16_27.x = u_xlat16_3.y * 1.09769487;
    u_xlat16_20.x = u_xlat16_3.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.y);
    u_xlat16_22.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_22.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_59 = floor(u_xlat16_0.w);
    u_xlat16_22.x = u_xlat16_59 + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_0.x = u_xlat16_22.x * 16.0 + u_xlat16_0.z;
    u_xlat16_22.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_0.x = u_xlat16_59 * 16.0 + u_xlat16_0.z;
    u_xlat16_22.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_59 = u_xlat16_22.z * 15.0 + (-u_xlat16_59);
    u_xlat16_22.x = (-u_xlat16_29) + u_xlat16_10;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_22.x + u_xlat16_29;
    u_xlat16_59 = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_59;
    u_xlat16_59 = u_xlat16_58 * 0.5;
    u_xlat16_3.x = (-u_xlat16_58) * 0.5 + 1.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_3.x + u_xlat16_59;
    u_xlat16_59 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_3.x = (-u_xlat16_39) * 2.0 + 1.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_3.x + u_xlat16_59;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_58;
    u_xlat16_39 = min(u_xlat16_39, u_xlat16_6.z);
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xw);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xw);
    u_xlat3.y = u_xlat6.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_1.xyw * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * vec3(u_xlat16_39) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat6.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat6.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_58)) + u_xlat6.xyz;
    u_xlat16_59 = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_59 = float(1.0) / float(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_4.xyz / u_xlat16_2.xyz;
    u_xlat6.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb63 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb63)) ? u_xlat6.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
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
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
ivec3 u_xlati4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat26;
vec2 u_xlat27;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_39;
float u_xlat44;
mediump float u_xlat16_45;
float u_xlat49;
mediump float u_xlat16_59;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
float u_xlat71;
bool u_xlatb71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat0.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_7.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_1.x = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.zxy) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xxx;
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat16_7.zxy * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat10.y;
    u_xlat11.x = u_xlat9.x;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.z = u_xlat16_7.z;
    u_xlat11.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = u_xlat16_7.y;
    u_xlat13.z = u_xlat16_7.x;
    u_xlat12.x = u_xlat9.z;
    u_xlat13.x = u_xlat9.y;
    u_xlat12.y = u_xlat10.x;
    u_xlat13.y = u_xlat10.z;
    u_xlat11.z = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat9.xyz = vec3(u_xlat75) * u_xlat9.xyz;
    u_xlat9.x = dot(u_xlat11.xyz, u_xlat9.xyz);
    u_xlat9.x = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat11.xyz) * u_xlat9.xxx + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb66)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat9.yyyy;
    u_xlat5 = u_xlat5 * u_xlat9.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat9.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat66 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat66);
    u_xlat4.x = (-u_xlat66) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat66;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_1.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_1.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_7.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_29.xyz = u_xlat22.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_7.x;
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_8.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_8.x);
    u_xlat16_8.xzw = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * u_xlat16_8.yyy + u_xlat16_8.xzw;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_73);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68;
    u_xlat16_8.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat11.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat26 = dot(u_xlat11.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_7.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_29.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat4.x = (-u_xlat16_7.x) * u_xlat4.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw;
    SV_Target0.w = u_xlat16_3.w;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_7.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_14.xyz;
    u_xlat16_74 = u_xlat16_3.y * _metallicMultiplier;
    u_xlat16_14.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat5.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat4.xzw = u_xlat5.xxx * u_xlat16_29.xxx + u_xlat4.xzw;
    u_xlat16_15.y = u_xlat16_3.x * _roughnessMultiplier;
    u_xlat16_29.x = u_xlat16_15.y * u_xlat16_15.y;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat27.x = (-u_xlat16_68) * u_xlat16_29.x + u_xlat16_68;
    u_xlat27.x = u_xlat16_68 * u_xlat27.x + u_xlat16_29.x;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat16_68 + u_xlat27.x;
    u_xlat16_16.xyz = u_xlat22.xyz * u_xlat16_1.xxx;
    u_xlat16_15.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat16_15.x) * u_xlat16_29.x + u_xlat16_15.x;
    u_xlat49 = u_xlat16_15.x * u_xlat49 + u_xlat16_29.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat27.y = u_xlat49 + u_xlat16_15.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat16_15.xy).xy;
    u_xlat6.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat27.xy = u_xlat27.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat27.x = u_xlat27.x * u_xlat27.y;
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = min(u_xlat27.x, 16.0);
    u_xlat71 = u_xlat16_29.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat71 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_29.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat26 = u_xlat27.x * u_xlat26;
    u_xlat4.xyz = u_xlat4.xzw * vec3(u_xlat26);
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_8.xyz * u_xlat4.xyz;
    u_xlat16_15.xzw = u_xlat22.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_17.xyz = u_xlat22.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xzw, u_xlat16_15.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_15.xzw = u_xlat16_1.xxx * u_xlat16_15.xzw;
    u_xlat22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat11.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat71 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_29.x / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.x = (-u_xlat22.x) + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat66 = (-u_xlat16_1.x) * u_xlat22.x + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat66);
    u_xlat9.xyz = u_xlat5.xxx * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat22.x = (-u_xlat16_1.x) * u_xlat16_29.x + u_xlat16_1.x;
    u_xlat22.x = u_xlat16_1.x * u_xlat22.x + u_xlat16_29.x;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat16_1.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat22.x * u_xlat27.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.xyz = u_xlat9.xyz * u_xlat22.xxx;
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = u_xlat16_1.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xzw = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat16_23.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat26 = dot(u_xlat11.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat71 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_29.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_23.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_45 = u_xlat4.x * u_xlat4.x;
    u_xlat16_45 = u_xlat4.x * u_xlat16_45;
    u_xlat16_45 = u_xlat4.x * u_xlat16_45;
    u_xlat16_67 = u_xlat4.x * u_xlat16_45;
    u_xlat4.x = (-u_xlat16_45) * u_xlat4.x + 1.0;
    u_xlat4.xzw = u_xlat16_14.xyz * u_xlat4.xxx;
    u_xlat4.xzw = u_xlat5.xxx * vec3(u_xlat16_67) + u_xlat4.xzw;
    u_xlat5.x = (-u_xlat16_23.x) * u_xlat16_29.x + u_xlat16_23.x;
    u_xlat5.x = u_xlat16_23.x * u_xlat5.x + u_xlat16_29.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat16_23.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat27.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat26 = u_xlat26 * u_xlat5.x;
    u_xlat4.xyz = u_xlat4.xzw * vec3(u_xlat26);
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat16_23.xxx * u_xlat4.xyz;
    u_xlat22.xyz = u_xlat4.xyz * u_xlat16_2.xyz + u_xlat22.xyz;
    u_xlat16_14.xyz = (-u_xlat11.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_45 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_45 = inversesqrt(u_xlat16_45);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_45 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_45 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_45) + u_xlat16_67;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_67 = u_xlat16_39.z * u_xlat16_67 + u_xlat16_45;
    u_xlat16_67 = u_xlat16_39.z * u_xlat16_67;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_74;
    u_xlat16_80 = sqrt(u_xlat16_67);
    u_xlat16_15.x = u_xlat0.x * u_xlat16_80;
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_59 = _sssIntensity * _sssIntensity;
    u_xlat16_59 = u_xlat16_4 * u_xlat16_59;
    u_xlat16_81 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_59 = u_xlat16_81 * u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(u_xlat16_81);
    u_xlat16_81 = sqrt(u_xlat16_59);
    u_xlat16_18.xyz = vec3(u_xlat16_81) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_81) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_81) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat16_19.xyz + (-u_xlat16_21.xyz);
    u_xlat5.xyz = u_xlat16_1.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz + (-u_xlat16_1.xxx);
    u_xlat5.xyz = vec3(u_xlat16_81) * u_xlat5.xyz + u_xlat16_1.xxx;
    u_xlat16_19.xyz = u_xlat16_7.xzw * u_xlat5.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat5.xyz = vec3(u_xlat16_68) * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat16_23.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_18.xyz + (-u_xlat16_23.xxx);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_18.xyz + (-vec3(u_xlat16_68));
    u_xlat5.xyz = vec3(u_xlat16_81) * u_xlat5.xyz + vec3(u_xlat16_68);
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat16_23.xxx;
    u_xlat16_18.xyz = u_xlat16_7.xzw * u_xlat4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_7.xzw * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat22.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_39.zzz * u_xlat16_8.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat11.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_7.xzw + (-u_xlat16_7.xzw);
    u_xlat16_7.xzw = vec3(u_xlat16_59) * u_xlat16_8.xyz + u_xlat16_7.xzw;
    u_xlat16_8.xyz = u_xlat16_7.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xzw = u_xlat16_7.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_1.x = min(u_xlat16_67, u_xlat16_3.z);
    u_xlat16_23.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_15.xzw = u_xlat16_15.xzw * u_xlat16_23.xxx;
    u_xlat16_19.xyz = u_xlat16_7.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat16_23.xxx * u_xlat16_19.xyz;
    u_xlat16_15.xzw = u_xlat16_15.xzw * u_xlat16_1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_15.xzw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = vec3(u_xlat16_74) * u_xlat0.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_15.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati22 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati66 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_15.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_15.xzw;
    u_xlat16_18.xyz = u_xlat16_15.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_15.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_23.x = dot((-u_xlat16_16.xyz), u_xlat11.xyz);
    u_xlat16_23.x = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat0.xyz = (-u_xlat11.xyz) * u_xlat16_23.xxx + (-u_xlat16_16.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) + u_xlat11.xyz;
    u_xlat4.xyz = u_xlat16_29.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
    u_xlat16_39.y = u_xlat0.x * 0.5;
    u_xlat16_39.x = u_xlat16_15.y * 1.09769487;
    u_xlat16_23.x = u_xlat16_15.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_15.y);
    u_xlat16_7.xyz = u_xlat16_39.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_0.w);
    u_xlat16_7.x = u_xlat16_68 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_0.x = u_xlat16_7.x * 16.0 + u_xlat16_0.z;
    u_xlat16_7.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_0.x = u_xlat16_68 * 16.0 + u_xlat16_0.z;
    u_xlat16_7.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_68 = u_xlat16_7.z * 15.0 + (-u_xlat16_68);
    u_xlat16_7.x = (-u_xlat16_27) + u_xlat16_5.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_7.x + u_xlat16_27;
    u_xlat16_68 = u_xlat16_74 * u_xlat16_68;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_67 * 0.5;
    u_xlat16_7.x = (-u_xlat16_67) * 0.5 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_7.x + u_xlat16_68;
    u_xlat16_68 = u_xlat16_45 + u_xlat16_45;
    u_xlat16_7.x = (-u_xlat16_45) * 2.0 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_7.x + u_xlat16_68;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_67;
    u_xlat16_45 = min(u_xlat16_45, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat7.y = u_xlat4.y;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_23.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat16_1.xyw * u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * vec3(u_xlat16_45) + u_xlat16_2.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat5.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_67 = dot(u_xlat5.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_67)) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_67 * 5.4453001 + 6.9972105;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = u_xlat16_68 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_68) * u_xlat16_2.xyz + vec3(u_xlat16_67);
    u_xlat16_8.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_8.xyz / u_xlat16_2.xyz;
    u_xlat5.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb71 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb71)) ? u_xlat5.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
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
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
ivec3 u_xlati4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat26;
vec2 u_xlat27;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_39;
float u_xlat44;
mediump float u_xlat16_45;
float u_xlat49;
mediump float u_xlat16_59;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
float u_xlat71;
bool u_xlatb71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat0.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_7.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_1.x = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.zxy) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xxx;
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat16_7.zxy * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat10.y;
    u_xlat11.x = u_xlat9.x;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.z = u_xlat16_7.z;
    u_xlat11.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = u_xlat16_7.y;
    u_xlat13.z = u_xlat16_7.x;
    u_xlat12.x = u_xlat9.z;
    u_xlat13.x = u_xlat9.y;
    u_xlat12.y = u_xlat10.x;
    u_xlat13.y = u_xlat10.z;
    u_xlat11.z = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat9.xyz = vec3(u_xlat75) * u_xlat9.xyz;
    u_xlat9.x = dot(u_xlat11.xyz, u_xlat9.xyz);
    u_xlat9.x = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat11.xyz) * u_xlat9.xxx + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb66)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat9.yyyy;
    u_xlat5 = u_xlat5 * u_xlat9.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat9.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat66 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat66);
    u_xlat4.x = (-u_xlat66) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat66;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat0.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_1.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_1.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_68 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_7.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_29.xyz = u_xlat22.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_7.x;
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_8.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_8.x);
    u_xlat16_8.xzw = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * u_xlat16_8.yyy + u_xlat16_8.xzw;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_73);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68;
    u_xlat16_8.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat11.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat26 = dot(u_xlat11.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_7.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_29.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat4.x = (-u_xlat16_7.x) * u_xlat4.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw;
    SV_Target0.w = u_xlat16_3.w;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_7.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_14.xyz;
    u_xlat16_74 = u_xlat16_3.y * _metallicMultiplier;
    u_xlat16_14.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat5.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat4.xzw = u_xlat5.xxx * u_xlat16_29.xxx + u_xlat4.xzw;
    u_xlat16_15.y = u_xlat16_3.x * _roughnessMultiplier;
    u_xlat16_29.x = u_xlat16_15.y * u_xlat16_15.y;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat27.x = (-u_xlat16_68) * u_xlat16_29.x + u_xlat16_68;
    u_xlat27.x = u_xlat16_68 * u_xlat27.x + u_xlat16_29.x;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat16_68 + u_xlat27.x;
    u_xlat16_16.xyz = u_xlat22.xyz * u_xlat16_1.xxx;
    u_xlat16_15.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat16_15.x) * u_xlat16_29.x + u_xlat16_15.x;
    u_xlat49 = u_xlat16_15.x * u_xlat49 + u_xlat16_29.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat27.y = u_xlat49 + u_xlat16_15.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat16_15.xy).xy;
    u_xlat6.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat27.xy = u_xlat27.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat27.x = u_xlat27.x * u_xlat27.y;
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = min(u_xlat27.x, 16.0);
    u_xlat71 = u_xlat16_29.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat71 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_29.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat26 = u_xlat27.x * u_xlat26;
    u_xlat4.xyz = u_xlat4.xzw * vec3(u_xlat26);
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_8.xyz * u_xlat4.xyz;
    u_xlat16_15.xzw = u_xlat22.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_17.xyz = u_xlat22.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xzw, u_xlat16_15.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_15.xzw = u_xlat16_1.xxx * u_xlat16_15.xzw;
    u_xlat22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat11.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat71 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_29.x / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.x = (-u_xlat22.x) + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat66 = (-u_xlat16_1.x) * u_xlat22.x + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat66);
    u_xlat9.xyz = u_xlat5.xxx * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat22.x = (-u_xlat16_1.x) * u_xlat16_29.x + u_xlat16_1.x;
    u_xlat22.x = u_xlat16_1.x * u_xlat22.x + u_xlat16_29.x;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat16_1.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat22.x * u_xlat27.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.xyz = u_xlat9.xyz * u_xlat22.xxx;
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = u_xlat16_1.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xzw = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat16_23.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat26 = dot(u_xlat11.xyz, u_xlat16_15.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat71 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_29.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_23.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_45 = u_xlat4.x * u_xlat4.x;
    u_xlat16_45 = u_xlat4.x * u_xlat16_45;
    u_xlat16_45 = u_xlat4.x * u_xlat16_45;
    u_xlat16_67 = u_xlat4.x * u_xlat16_45;
    u_xlat4.x = (-u_xlat16_45) * u_xlat4.x + 1.0;
    u_xlat4.xzw = u_xlat16_14.xyz * u_xlat4.xxx;
    u_xlat4.xzw = u_xlat5.xxx * vec3(u_xlat16_67) + u_xlat4.xzw;
    u_xlat5.x = (-u_xlat16_23.x) * u_xlat16_29.x + u_xlat16_23.x;
    u_xlat5.x = u_xlat16_23.x * u_xlat5.x + u_xlat16_29.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat16_23.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat27.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat26 = u_xlat26 * u_xlat5.x;
    u_xlat4.xyz = u_xlat4.xzw * vec3(u_xlat26);
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat16_23.xxx * u_xlat4.xyz;
    u_xlat22.xyz = u_xlat4.xyz * u_xlat16_2.xyz + u_xlat22.xyz;
    u_xlat16_14.xyz = (-u_xlat11.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_45 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_45 = inversesqrt(u_xlat16_45);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_45 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_45 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_45) + u_xlat16_67;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_67 = u_xlat16_39.z * u_xlat16_67 + u_xlat16_45;
    u_xlat16_67 = u_xlat16_39.z * u_xlat16_67;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_74;
    u_xlat16_80 = sqrt(u_xlat16_67);
    u_xlat16_15.x = u_xlat0.x * u_xlat16_80;
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_59 = _sssIntensity * _sssIntensity;
    u_xlat16_59 = u_xlat16_4 * u_xlat16_59;
    u_xlat16_81 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_59 = u_xlat16_81 * u_xlat16_59;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(u_xlat16_81);
    u_xlat16_81 = sqrt(u_xlat16_59);
    u_xlat16_18.xyz = vec3(u_xlat16_81) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_81) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_81) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat16_19.xyz + (-u_xlat16_21.xyz);
    u_xlat5.xyz = u_xlat16_1.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz + (-u_xlat16_1.xxx);
    u_xlat5.xyz = vec3(u_xlat16_81) * u_xlat5.xyz + u_xlat16_1.xxx;
    u_xlat16_19.xyz = u_xlat16_7.xzw * u_xlat5.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat5.xyz = vec3(u_xlat16_68) * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat16_23.xxx * u_xlat4.xyz + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_18.xyz + (-u_xlat16_23.xxx);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_18.xyz + (-vec3(u_xlat16_68));
    u_xlat5.xyz = vec3(u_xlat16_81) * u_xlat5.xyz + vec3(u_xlat16_68);
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat16_23.xxx;
    u_xlat16_18.xyz = u_xlat16_7.xzw * u_xlat4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_7.xzw * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat22.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_39.zzz * u_xlat16_8.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat11.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_7.xzw + (-u_xlat16_7.xzw);
    u_xlat16_7.xzw = vec3(u_xlat16_59) * u_xlat16_8.xyz + u_xlat16_7.xzw;
    u_xlat16_8.xyz = u_xlat16_7.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xzw = u_xlat16_7.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_1.x = min(u_xlat16_67, u_xlat16_3.z);
    u_xlat16_23.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_15.xzw = u_xlat16_15.xzw * u_xlat16_23.xxx;
    u_xlat16_19.xyz = u_xlat16_7.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat16_23.xxx * u_xlat16_19.xyz;
    u_xlat16_15.xzw = u_xlat16_15.xzw * u_xlat16_1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_15.xzw;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = vec3(u_xlat16_74) * u_xlat0.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_15.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati22 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati66 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_15.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_15.xzw;
    u_xlat16_18.xyz = u_xlat16_15.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_15.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_23.x = dot((-u_xlat16_16.xyz), u_xlat11.xyz);
    u_xlat16_23.x = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat0.xyz = (-u_xlat11.xyz) * u_xlat16_23.xxx + (-u_xlat16_16.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) + u_xlat11.xyz;
    u_xlat4.xyz = u_xlat16_29.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
    u_xlat16_39.y = u_xlat0.x * 0.5;
    u_xlat16_39.x = u_xlat16_15.y * 1.09769487;
    u_xlat16_23.x = u_xlat16_15.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_15.y);
    u_xlat16_7.xyz = u_xlat16_39.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_0.w);
    u_xlat16_7.x = u_xlat16_68 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_0.x = u_xlat16_7.x * 16.0 + u_xlat16_0.z;
    u_xlat16_7.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_0.x = u_xlat16_68 * 16.0 + u_xlat16_0.z;
    u_xlat16_7.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_68 = u_xlat16_7.z * 15.0 + (-u_xlat16_68);
    u_xlat16_7.x = (-u_xlat16_27) + u_xlat16_5.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_7.x + u_xlat16_27;
    u_xlat16_68 = u_xlat16_74 * u_xlat16_68;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_67 * 0.5;
    u_xlat16_7.x = (-u_xlat16_67) * 0.5 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_7.x + u_xlat16_68;
    u_xlat16_68 = u_xlat16_45 + u_xlat16_45;
    u_xlat16_7.x = (-u_xlat16_45) * 2.0 + 1.0;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_7.x + u_xlat16_68;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_67;
    u_xlat16_45 = min(u_xlat16_45, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat7.y = u_xlat4.y;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_23.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat16_1.xyw * u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * vec3(u_xlat16_45) + u_xlat16_2.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat5.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_67 = dot(u_xlat5.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_67)) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_67 * 5.4453001 + 6.9972105;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = u_xlat16_68 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_68) * u_xlat16_2.xyz + vec3(u_xlat16_67);
    u_xlat16_8.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_8.xyz / u_xlat16_2.xyz;
    u_xlat5.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb71 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb71)) ? u_xlat5.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
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
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat39;
mediump float u_xlat16_43;
float u_xlat51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
int u_xlati56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
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
    u_xlat16_18.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18.x = max(u_xlat16_18.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18.x);
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
    u_xlat16_52 = u_xlat16_18.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18.x = float(1.0) / float(u_xlat16_18.x);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18.x = u_xlat16_52 * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_35.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18.x;
    u_xlat16_18.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_18.xyz;
    u_xlat16_52 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * vs_TEXCOORD1.zxy;
    u_xlat16_52 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.zxy) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat16_3.zxy * u_xlat0.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat5.y;
    u_xlat6.x = u_xlat0.x;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.z = u_xlat16_3.z;
    u_xlat6.y = dot(u_xlat16_4.xyz, u_xlat6.xyz);
    u_xlat7.z = u_xlat16_3.y;
    u_xlat8.z = u_xlat16_3.x;
    u_xlat7.x = u_xlat0.z;
    u_xlat8.x = u_xlat0.y;
    u_xlat7.y = u_xlat5.x;
    u_xlat8.y = u_xlat5.z;
    u_xlat6.z = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat6.x = dot(u_xlat16_4.xyz, u_xlat7.xyz);
    u_xlat16_52 = dot(u_xlat6.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_53 = _sssIntensity * _sssIntensity;
    u_xlat16_53 = u_xlat16_0.x * u_xlat16_53;
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.x = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.x = sqrt(u_xlat16_53);
    u_xlat16_2.xyz = u_xlat16_4.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_4.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat16_2.xyz + (-u_xlat16_21.xyz);
    u_xlat7.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat16_2.xyz = (-u_xlat6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_9.x * 0.5 + 0.5;
    u_xlat16_26 = (-u_xlat16_9.x) + u_xlat16_26;
    u_xlat16_43 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_43 + 1.0;
    u_xlat16_26 = u_xlat16_27.z * u_xlat16_26 + u_xlat16_9.x;
    u_xlat16_26 = u_xlat16_27.z * u_xlat16_26;
    u_xlat16_43 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 + -1.0;
    u_xlat16_43 = _occlusionScale * u_xlat16_43 + 1.0;
    u_xlat16_26 = u_xlat16_43 * u_xlat16_26;
    u_xlat16_60 = sqrt(u_xlat16_26);
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_52));
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(u_xlat16_52);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    SV_Target0.w = u_xlat16_8.w;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat7.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_52 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_52));
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(u_xlat16_52);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat7.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_15.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_63 = dot(u_xlat6.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_62);
    u_xlat16_62 = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_10.x = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_62 = (-u_xlat16_62) * u_xlat16_62 + 1.0;
    u_xlat16_62 = max(u_xlat16_62, 0.0);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_62;
    u_xlat16_10.x = max(u_xlat16_15.x, u_xlat16_10.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = vec3(u_xlat16_63) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_63));
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz + vec3(u_xlat16_63);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat5.xyz;
    u_xlat16_4.xyz = u_xlat16_14.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_0.y * _metallicMultiplier;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17 = u_xlat16_4.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_55 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_55) * u_xlat5.xyz;
    u_xlat16_55 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat22.x = (-u_xlat51) + 1.0;
    u_xlat16_55 = u_xlat22.x * u_xlat22.x;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat39 = (-u_xlat16_55) * u_xlat22.x + 1.0;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat22.xyz = u_xlat16_4.xyz * vec3(u_xlat39);
    u_xlat22.xyz = vec3(u_xlat17) * vec3(u_xlat16_55) + u_xlat22.xyz;
    u_xlat16_11.x = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.y = u_xlat16_0.x * _roughnessMultiplier;
    u_xlat16_55 = u_xlat16_11.y * u_xlat16_11.y;
    u_xlat16_55 = max(u_xlat16_55, 0.0078125);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_55 = max(u_xlat16_55, 0.0078125);
    u_xlat57 = (-u_xlat16_11.x) * u_xlat16_55 + u_xlat16_11.x;
    u_xlat57 = u_xlat16_11.x * u_xlat57 + u_xlat16_55;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat16_11.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat16_11.xy).xy;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat58 = (-u_xlat16_52) * u_xlat16_55 + u_xlat16_52;
    u_xlat8.x = u_xlat16_52 * u_xlat58 + u_xlat16_55;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat16_52 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat8.x;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat8.x = u_xlat16_55 + -1.0;
    u_xlat5.x = u_xlat5.x * u_xlat8.x + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_55 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat5.x = u_xlat57 * u_xlat5.x;
    u_xlat5.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat16_52) * u_xlat5.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_27.zzz * u_xlat16_4.xyz + _sssColorOcc.xyz;
    u_xlat5.y = u_xlat6.y;
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat6.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat6.xz);
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_14.y = u_xlat16_2.y;
    u_xlat5.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat16_4.xyz = u_xlat5.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xzw = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_52 = min(u_xlat16_0.z, u_xlat16_26);
    u_xlat16_53 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_53);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_52) + (-u_xlat16_15.xyz);
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(u_xlat16_52) + u_xlat16_13.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * _localDiffuseGI.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat5.xyz = vec3(u_xlat16_43) * u_xlat5.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat5.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlati22 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati56 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_13.xyz = u_xlat5.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat5.zzz * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_11.xzw + u_xlat16_1.xyz;
    u_xlat16_53 = dot((-u_xlat16_12.xyz), u_xlat6.xyz);
    u_xlat16_53 = u_xlat16_53 + u_xlat16_53;
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_53) + (-u_xlat16_12.xyz);
    u_xlat6.xyz = (-u_xlat5.xyz) + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat16_55) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat16_27.y = u_xlat5.x * 0.5;
    u_xlat16_27.x = u_xlat16_11.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_11.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.y);
    u_xlat16_19.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_19.x * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_19.x = u_xlat16_19.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_36 = (-u_xlat16_22) + u_xlat16_5.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_36 + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_43 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_9.x * u_xlat16_19.x;
    u_xlat16_36 = u_xlat16_26 * 0.5;
    u_xlat16_53 = (-u_xlat16_26) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_36 = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_53 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_26;
    u_xlat16_19.x = min(u_xlat16_0.z, u_xlat16_19.x);
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat16_4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat4.y = u_xlat6.y;
    u_xlat4.xz = u_xlat16_4.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = vec3(u_xlat16_52) * u_xlat16_2.xzw;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat7.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * u_xlat16_19.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * _emissiveColor.xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat5.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_52 = dot(u_xlat5.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_52)) + u_xlat5.xyz;
    u_xlat16_53 = u_xlat16_52 * 5.4453001 + 6.9972105;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz + vec3(u_xlat16_52);
    u_xlat16_9.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_9.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xyz;
    u_xlat5.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb56 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb56)) ? u_xlat5.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
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
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat39;
mediump float u_xlat16_43;
float u_xlat51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
int u_xlati56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
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
    u_xlat16_18.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18.x = max(u_xlat16_18.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18.x);
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
    u_xlat16_52 = u_xlat16_18.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18.x = float(1.0) / float(u_xlat16_18.x);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18.x = u_xlat16_52 * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_35.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18.x;
    u_xlat16_18.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_18.xyz;
    u_xlat16_52 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * vs_TEXCOORD1.zxy;
    u_xlat16_52 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.zxy) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat16_3.zxy * u_xlat0.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat5.y;
    u_xlat6.x = u_xlat0.x;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.z = u_xlat16_3.z;
    u_xlat6.y = dot(u_xlat16_4.xyz, u_xlat6.xyz);
    u_xlat7.z = u_xlat16_3.y;
    u_xlat8.z = u_xlat16_3.x;
    u_xlat7.x = u_xlat0.z;
    u_xlat8.x = u_xlat0.y;
    u_xlat7.y = u_xlat5.x;
    u_xlat8.y = u_xlat5.z;
    u_xlat6.z = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat6.x = dot(u_xlat16_4.xyz, u_xlat7.xyz);
    u_xlat16_52 = dot(u_xlat6.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_53 = _sssIntensity * _sssIntensity;
    u_xlat16_53 = u_xlat16_0.x * u_xlat16_53;
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.x = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_4.x = sqrt(u_xlat16_53);
    u_xlat16_2.xyz = u_xlat16_4.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_4.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat16_2.xyz + (-u_xlat16_21.xyz);
    u_xlat7.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat16_2.xyz = (-u_xlat6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_9.x * 0.5 + 0.5;
    u_xlat16_26 = (-u_xlat16_9.x) + u_xlat16_26;
    u_xlat16_43 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_43 + 1.0;
    u_xlat16_26 = u_xlat16_27.z * u_xlat16_26 + u_xlat16_9.x;
    u_xlat16_26 = u_xlat16_27.z * u_xlat16_26;
    u_xlat16_43 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 + -1.0;
    u_xlat16_43 = _occlusionScale * u_xlat16_43 + 1.0;
    u_xlat16_26 = u_xlat16_43 * u_xlat16_26;
    u_xlat16_60 = sqrt(u_xlat16_26);
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_52));
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(u_xlat16_52);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    SV_Target0.w = u_xlat16_8.w;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat7.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_52 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_52));
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(u_xlat16_52);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_10.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat7.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_15.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_63 = dot(u_xlat6.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_62);
    u_xlat16_62 = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_10.x = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_62 = (-u_xlat16_62) * u_xlat16_62 + 1.0;
    u_xlat16_62 = max(u_xlat16_62, 0.0);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_62;
    u_xlat16_10.x = max(u_xlat16_15.x, u_xlat16_10.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = vec3(u_xlat16_63) * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_11.xyz + (-vec3(u_xlat16_63));
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz + vec3(u_xlat16_63);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat5.xyz;
    u_xlat16_4.xyz = u_xlat16_14.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_0.y * _metallicMultiplier;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17 = u_xlat16_4.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_55 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_55) * u_xlat5.xyz;
    u_xlat16_55 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat22.x = (-u_xlat51) + 1.0;
    u_xlat16_55 = u_xlat22.x * u_xlat22.x;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat39 = (-u_xlat16_55) * u_xlat22.x + 1.0;
    u_xlat16_55 = u_xlat22.x * u_xlat16_55;
    u_xlat22.xyz = u_xlat16_4.xyz * vec3(u_xlat39);
    u_xlat22.xyz = vec3(u_xlat17) * vec3(u_xlat16_55) + u_xlat22.xyz;
    u_xlat16_11.x = dot(u_xlat6.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.y = u_xlat16_0.x * _roughnessMultiplier;
    u_xlat16_55 = u_xlat16_11.y * u_xlat16_11.y;
    u_xlat16_55 = max(u_xlat16_55, 0.0078125);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_55 = max(u_xlat16_55, 0.0078125);
    u_xlat57 = (-u_xlat16_11.x) * u_xlat16_55 + u_xlat16_11.x;
    u_xlat57 = u_xlat16_11.x * u_xlat57 + u_xlat16_55;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat16_11.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat16_11.xy).xy;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat58 = (-u_xlat16_52) * u_xlat16_55 + u_xlat16_52;
    u_xlat8.x = u_xlat16_52 * u_xlat58 + u_xlat16_55;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat16_52 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat8.x;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat8.x = u_xlat16_55 + -1.0;
    u_xlat5.x = u_xlat5.x * u_xlat8.x + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_55 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat5.x = u_xlat57 * u_xlat5.x;
    u_xlat5.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat16_52) * u_xlat5.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_27.zzz * u_xlat16_4.xyz + _sssColorOcc.xyz;
    u_xlat5.y = u_xlat6.y;
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat6.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat6.xz);
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_14.y = u_xlat16_2.y;
    u_xlat5.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat16_4.xyz = u_xlat5.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xzw = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_52 = min(u_xlat16_0.z, u_xlat16_26);
    u_xlat16_53 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_53);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_52) + (-u_xlat16_15.xyz);
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(u_xlat16_52) + u_xlat16_13.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * _localDiffuseGI.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat5.xyz = vec3(u_xlat16_43) * u_xlat5.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat5.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlati22 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati56 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_13.xyz = u_xlat5.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat5.zzz * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_11.xzw + u_xlat16_1.xyz;
    u_xlat16_53 = dot((-u_xlat16_12.xyz), u_xlat6.xyz);
    u_xlat16_53 = u_xlat16_53 + u_xlat16_53;
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_53) + (-u_xlat16_12.xyz);
    u_xlat6.xyz = (-u_xlat5.xyz) + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat16_55) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat16_27.y = u_xlat5.x * 0.5;
    u_xlat16_27.x = u_xlat16_11.y * 1.09769487;
    u_xlat16_2.x = u_xlat16_11.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.y);
    u_xlat16_19.xyz = u_xlat16_27.xyz + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_19.x * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_19.x = u_xlat16_19.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_36 = (-u_xlat16_22) + u_xlat16_5.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_36 + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_43 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_9.x * u_xlat16_19.x;
    u_xlat16_36 = u_xlat16_26 * 0.5;
    u_xlat16_53 = (-u_xlat16_26) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_36 = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_53 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_53 + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_26;
    u_xlat16_19.x = min(u_xlat16_0.z, u_xlat16_19.x);
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat16_4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat4.y = u_xlat6.y;
    u_xlat4.xz = u_xlat16_4.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xzw = vec3(u_xlat16_52) * u_xlat16_2.xzw;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat7.xyz;
    u_xlat16_1.xyz = u_xlat5.xyz * u_xlat16_19.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * _emissiveColor.xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat5.xyz = min(u_xlat16_2.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_52 = dot(u_xlat5.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_2.xyz = (-vec3(u_xlat16_52)) + u_xlat5.xyz;
    u_xlat16_53 = u_xlat16_52 * 5.4453001 + 6.9972105;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 + 0.800000012;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz + vec3(u_xlat16_52);
    u_xlat16_9.xyz = u_xlat16_2.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_9.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xyz;
    u_xlat5.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb56 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb56)) ? u_xlat5.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
float u_xlat23;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat44;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_71;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_5.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_71 = dot(vs_TEXCOORD2.zxy, u_xlat16_5.xyz);
    u_xlat16_6.xyz = (-u_xlat16_5.zxy) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat16_6.xyz * u_xlat7.xxx;
    u_xlat8.xyz = u_xlat16_5.xyz * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat16_5.zxy * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.y;
    u_xlat9.x = u_xlat7.x;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.z = u_xlat16_5.z;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat10.xyz = u_xlat7.xxx * u_xlat10.xyz;
    u_xlat11.z = u_xlat16_5.y;
    u_xlat12.z = u_xlat16_5.x;
    u_xlat11.x = u_xlat7.z;
    u_xlat12.x = u_xlat7.y;
    u_xlat11.y = u_xlat8.x;
    u_xlat12.y = u_xlat8.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat12.xyz);
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat11.xyz);
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat9.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb66)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat7.yyyy;
    u_xlat3 = u_xlat3 * u_xlat7.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat7.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-u_xlat9.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat16_71 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_5.xyz = vec3(u_xlat16_71) * u_xlat16_5.xyz;
    u_xlat16_71 = dot(u_xlat16_5.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_6.x = (-u_xlat16_71) + u_xlat16_6.x;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_28.z = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_6.x = u_xlat16_28.z * u_xlat16_6.x + u_xlat16_71;
    u_xlat16_6.x = u_xlat16_28.z * u_xlat16_6.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13.x;
    u_xlat16_35 = sqrt(u_xlat16_6.x);
    u_xlat16_57 = u_xlat0.x * u_xlat16_35;
    u_xlat16_14.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_79 = _sssIntensity * _sssIntensity;
    u_xlat16_79 = u_xlat16_22 * u_xlat16_79;
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_80 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_15.x = sqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat16_15.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_37.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_37.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_35) * u_xlat16_37.xyz + u_xlat16_14.xyz;
    u_xlat16_35 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_37.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_37.xyz = u_xlat16_15.xxx * u_xlat16_37.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat22.xyz = u_xlat16_37.xyz + (-u_xlat16_17.xyz);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_16.xyz + (-vec3(u_xlat16_35));
    u_xlat2.xyz = u_xlat16_15.xxx * u_xlat2.xyz + vec3(u_xlat16_35);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_37.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat16_3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_37.xyz = u_xlat16_3.xyz * u_xlat16_37.xyz;
    SV_Target0.w = u_xlat16_3.w;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xyz * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_57 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_80 = max(u_xlat16_80, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_20.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_82);
    u_xlat16_82 = u_xlat16_80 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_80 = float(1.0) / float(u_xlat16_80);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_20.x, u_xlat16_80);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_80;
    u_xlat16_19.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_19.xyz = vec3(u_xlat16_57) * u_xlat16_19.xyz;
    u_xlat2.xyz = vec3(u_xlat16_83) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz + (-vec3(u_xlat16_83));
    u_xlat2.xyz = u_xlat16_15.xxx * u_xlat2.xyz + vec3(u_xlat16_83);
    u_xlat16_20.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_80 = max(u_xlat16_80, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_20.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_82);
    u_xlat16_82 = u_xlat16_80 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_80 = float(1.0) / float(u_xlat16_80);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_20.x, u_xlat16_80);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_80;
    u_xlat16_19.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat22.xyz = vec3(u_xlat16_83) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_14.xyz + (-vec3(u_xlat16_83));
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + vec3(u_xlat16_83);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_57 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_37.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.x = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_17.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlat44 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat44 = (-u_xlat44) + 1.0;
    u_xlat16_57 = u_xlat44 * u_xlat44;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat23 = (-u_xlat16_57) * u_xlat44 + 1.0;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat23);
    u_xlat2.xyz = u_xlat22.xxx * vec3(u_xlat16_57) + u_xlat2.xyz;
    u_xlat16_17.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_57 = u_xlat16_17.y * u_xlat16_17.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat22.x = (-u_xlat16_17.x) * u_xlat16_57 + u_xlat16_17.x;
    u_xlat22.x = u_xlat16_17.x * u_xlat22.x + u_xlat16_57;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat16_17.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16_17.xy).xy;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat44 = (-u_xlat16_35) * u_xlat16_57 + u_xlat16_35;
    u_xlat44 = u_xlat16_35 * u_xlat44 + u_xlat16_57;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat16_35;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.y * u_xlat22.x;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = u_xlat16_57 + -1.0;
    u_xlat44 = u_xlat66 * u_xlat44 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_57 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.xyz = u_xlat2.xyz * u_xlat22.xxx;
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = vec3(u_xlat16_35) * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_28.zzz * u_xlat16_15.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat9.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_19.y = u_xlat16_5.y;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_79) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xzw = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_35 = min(u_xlat16_6.x, u_xlat16_1.z);
    u_xlat16_79 = u_xlat16_35 * u_xlat16_35;
    u_xlat16_17.xzw = u_xlat16_17.xzw * vec3(u_xlat16_79);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_20.xyz;
    u_xlat16_17.xzw = u_xlat16_17.xzw * vec3(u_xlat16_35) + (-u_xlat16_20.xyz);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_35) + u_xlat16_17.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_13.xxx * u_xlat0.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati22 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati66 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_17.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_17.xzw;
    u_xlat16_17.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_17.xzw;
    u_xlat16_19.xyz = u_xlat16_17.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_35 = dot(u_xlat16_17.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_79 = dot((-u_xlat16_18.xyz), u_xlat9.xyz);
    u_xlat16_79 = u_xlat16_79 + u_xlat16_79;
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_79) + (-u_xlat16_18.xyz);
    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat2.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_28.y = u_xlat0.x * 0.5;
    u_xlat16_28.x = u_xlat16_17.y * 1.09769487;
    u_xlat16_5.x = u_xlat16_17.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_17.y);
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_27 = floor(u_xlat16_0.w);
    u_xlat16_49 = u_xlat16_27 + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_0.x = u_xlat16_49 * 16.0 + u_xlat16_0.z;
    u_xlat16_28.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_68 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_0.x = u_xlat16_27 * 16.0 + u_xlat16_0.z;
    u_xlat16_28.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_27 = u_xlat16_28.z * 15.0 + (-u_xlat16_27);
    u_xlat16_49 = u_xlat16_68 + (-u_xlat16_3.x);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_49 + u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_13.x * u_xlat16_27;
    u_xlat16_27 = u_xlat16_71 * u_xlat16_27;
    u_xlat16_49 = u_xlat16_6.x * 0.5;
    u_xlat16_71 = (-u_xlat16_6.x) * 0.5 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_71 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_27 + u_xlat16_27;
    u_xlat16_71 = (-u_xlat16_27) * 2.0 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_71 + u_xlat16_49;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_6.x;
    u_xlat16_27 = min(u_xlat16_1.z, u_xlat16_27);
    u_xlat16_6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat6.y = u_xlat2.y;
    u_xlat6.xz = u_xlat16_6.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_5.x);
    u_xlat16_5.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat16_5.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xzw = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_35) * u_xlat16_5.xzw;
    u_xlat1.xyz = u_xlat1.xyw * u_xlat16_5.xzw;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(u_xlat16_27) + u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_13.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat1.xyz = min(u_xlat16_13.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_71 = dot(u_xlat1.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_13.xyz = u_xlat1.xyz + (-vec3(u_xlat16_71));
    u_xlat16_79 = u_xlat16_71 * 5.4453001 + 6.9972105;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = u_xlat16_79 + 0.800000012;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz + vec3(u_xlat16_71);
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_13.xyz = u_xlat16_14.xyz / u_xlat16_13.xyz;
    u_xlat1.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb67 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb67)) ? u_xlat1.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
float u_xlat23;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat44;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_71;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_5.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vs_TEXCOORD1.zxy;
    u_xlat16_71 = dot(vs_TEXCOORD2.zxy, u_xlat16_5.xyz);
    u_xlat16_6.xyz = (-u_xlat16_5.zxy) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat16_6.xyz * u_xlat7.xxx;
    u_xlat8.xyz = u_xlat16_5.xyz * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat16_5.zxy * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.y;
    u_xlat9.x = u_xlat7.x;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.z = u_xlat16_5.z;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat10.xyz = u_xlat7.xxx * u_xlat10.xyz;
    u_xlat11.z = u_xlat16_5.y;
    u_xlat12.z = u_xlat16_5.x;
    u_xlat11.x = u_xlat7.z;
    u_xlat12.x = u_xlat7.y;
    u_xlat11.y = u_xlat8.x;
    u_xlat12.y = u_xlat8.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat12.xyz);
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat11.xyz);
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat9.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb66)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat7.yyyy;
    u_xlat3 = u_xlat3 * u_xlat7.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat7.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-u_xlat9.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_5.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat16_71 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_5.xyz = vec3(u_xlat16_71) * u_xlat16_5.xyz;
    u_xlat16_71 = dot(u_xlat16_5.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_6.x = (-u_xlat16_71) + u_xlat16_6.x;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_28.z = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_6.x = u_xlat16_28.z * u_xlat16_6.x + u_xlat16_71;
    u_xlat16_6.x = u_xlat16_28.z * u_xlat16_6.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13.x;
    u_xlat16_35 = sqrt(u_xlat16_6.x);
    u_xlat16_57 = u_xlat0.x * u_xlat16_35;
    u_xlat16_14.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_79 = _sssIntensity * _sssIntensity;
    u_xlat16_79 = u_xlat16_22 * u_xlat16_79;
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_80 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_15.x = sqrt(u_xlat16_79);
    u_xlat16_14.xyz = u_xlat16_15.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_37.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_37.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_35) * u_xlat16_37.xyz + u_xlat16_14.xyz;
    u_xlat16_35 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_37.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_37.xyz = u_xlat16_15.xxx * u_xlat16_37.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat22.xyz = u_xlat16_37.xyz + (-u_xlat16_17.xyz);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_16.xyz + (-vec3(u_xlat16_35));
    u_xlat2.xyz = u_xlat16_15.xxx * u_xlat2.xyz + vec3(u_xlat16_35);
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_37.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat16_3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_37.xyz = u_xlat16_3.xyz * u_xlat16_37.xyz;
    SV_Target0.w = u_xlat16_3.w;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xyz * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_57 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_80 = max(u_xlat16_80, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_20.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_82);
    u_xlat16_82 = u_xlat16_80 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_80 = float(1.0) / float(u_xlat16_80);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_20.x, u_xlat16_80);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_80;
    u_xlat16_19.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_19.xyz = vec3(u_xlat16_57) * u_xlat16_19.xyz;
    u_xlat2.xyz = vec3(u_xlat16_83) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz + (-vec3(u_xlat16_83));
    u_xlat2.xyz = u_xlat16_15.xxx * u_xlat2.xyz + vec3(u_xlat16_83);
    u_xlat16_20.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_80 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_80 = max(u_xlat16_80, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = u_xlat2.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_20.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_82);
    u_xlat16_82 = u_xlat16_80 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_80 = float(1.0) / float(u_xlat16_80);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_20.x, u_xlat16_80);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_80;
    u_xlat16_19.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat22.xyz = vec3(u_xlat16_83) * u_xlat22.xyz + u_xlat16_17.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_14.xyz + (-vec3(u_xlat16_83));
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + vec3(u_xlat16_83);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_57 = u_xlat16_1.y * _metallicMultiplier;
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_37.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.x = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_17.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlat44 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat44 = (-u_xlat44) + 1.0;
    u_xlat16_57 = u_xlat44 * u_xlat44;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat23 = (-u_xlat16_57) * u_xlat44 + 1.0;
    u_xlat16_57 = u_xlat44 * u_xlat16_57;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat23);
    u_xlat2.xyz = u_xlat22.xxx * vec3(u_xlat16_57) + u_xlat2.xyz;
    u_xlat16_17.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.y = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_57 = u_xlat16_17.y * u_xlat16_17.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat22.x = (-u_xlat16_17.x) * u_xlat16_57 + u_xlat16_17.x;
    u_xlat22.x = u_xlat16_17.x * u_xlat22.x + u_xlat16_57;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat16_17.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat16_17.xy).xy;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat44 = (-u_xlat16_35) * u_xlat16_57 + u_xlat16_35;
    u_xlat44 = u_xlat16_35 * u_xlat44 + u_xlat16_57;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat16_35;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.y * u_xlat22.x;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = u_xlat16_57 + -1.0;
    u_xlat44 = u_xlat66 * u_xlat44 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_57 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.xyz = u_xlat2.xyz * u_xlat22.xxx;
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = vec3(u_xlat16_35) * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_28.zzz * u_xlat16_15.xyz + _sssColorOcc.xyz;
    u_xlat0.y = u_xlat9.y;
    u_xlat16_0.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_0.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat0.xz = u_xlat16_0.xz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_5.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_5.xz);
    u_xlat16_19.y = u_xlat16_5.y;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_79) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xzw = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_35 = min(u_xlat16_6.x, u_xlat16_1.z);
    u_xlat16_79 = u_xlat16_35 * u_xlat16_35;
    u_xlat16_17.xzw = u_xlat16_17.xzw * vec3(u_xlat16_79);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_20.xyz;
    u_xlat16_17.xzw = u_xlat16_17.xzw * vec3(u_xlat16_35) + (-u_xlat16_20.xyz);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_35) + u_xlat16_17.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = u_xlat16_13.xxx * u_xlat0.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xzw = u_xlat0.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati22 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati66 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_17.xzw = u_xlat0.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_17.xzw;
    u_xlat16_17.xzw = u_xlat0.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_17.xzw;
    u_xlat16_19.xyz = u_xlat16_17.xzw * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_35 = dot(u_xlat16_17.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_79 = dot((-u_xlat16_18.xyz), u_xlat9.xyz);
    u_xlat16_79 = u_xlat16_79 + u_xlat16_79;
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_79) + (-u_xlat16_18.xyz);
    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat2.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat16_28.y = u_xlat0.x * 0.5;
    u_xlat16_28.x = u_xlat16_17.y * 1.09769487;
    u_xlat16_5.x = u_xlat16_17.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_17.y);
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_27 = floor(u_xlat16_0.w);
    u_xlat16_49 = u_xlat16_27 + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_0.x = u_xlat16_49 * 16.0 + u_xlat16_0.z;
    u_xlat16_28.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_68 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_0.x = u_xlat16_27 * 16.0 + u_xlat16_0.z;
    u_xlat16_28.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_27 = u_xlat16_28.z * 15.0 + (-u_xlat16_27);
    u_xlat16_49 = u_xlat16_68 + (-u_xlat16_3.x);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_49 + u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_13.x * u_xlat16_27;
    u_xlat16_27 = u_xlat16_71 * u_xlat16_27;
    u_xlat16_49 = u_xlat16_6.x * 0.5;
    u_xlat16_71 = (-u_xlat16_6.x) * 0.5 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_71 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_27 + u_xlat16_27;
    u_xlat16_71 = (-u_xlat16_27) * 2.0 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_71 + u_xlat16_49;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_6.x;
    u_xlat16_27 = min(u_xlat16_1.z, u_xlat16_27);
    u_xlat16_6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat6.y = u_xlat2.y;
    u_xlat6.xz = u_xlat16_6.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_5.x);
    u_xlat16_5.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat16_5.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xzw = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_35) * u_xlat16_5.xzw;
    u_xlat1.xyz = u_xlat1.xyw * u_xlat16_5.xzw;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(u_xlat16_27) + u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_13.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat1.xyz = min(u_xlat16_13.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_71 = dot(u_xlat1.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_13.xyz = u_xlat1.xyz + (-vec3(u_xlat16_71));
    u_xlat16_79 = u_xlat16_71 * 5.4453001 + 6.9972105;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = u_xlat16_79 + 0.800000012;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz + vec3(u_xlat16_71);
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_13.xyz = u_xlat16_14.xyz / u_xlat16_13.xyz;
    u_xlat1.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb67 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb67)) ? u_xlat1.xyz : u_xlat16_5.xyz;
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
  GpuProgramID 94700
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