//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/Lit/PBR(Skirt)" {
Properties {

_albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

_emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

_emissiveBreathe ("emissiveBreath", Vector) = (0,0,0,0)

_normalMap ("normalMap", 2D) = "bump" { }

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

_LaserMask ("镭射遮罩", 2D) = "white" { }

_LaserRamp ("镭射渐变图", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (1,1,1,1)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_maskTex ("Mask贴图:R-水浪区域 G-镭射区域 B-闪光区域 ", 2D) = "white" { }

_glitterMap ("闪光贴图", 2D) = "white" { }

_glitteryControl ("闪光控制", Vector) = (0.329,10.96,2.67,10)

_glitterySPColor ("闪光颜色", Color) = (0,0,0,0)

_spPow ("闪光强度", Range(-1, 1)) = 0.0

_Flow01NoiseMap ("波纹形状贴图", 2D) = "white" { }

_FlowColor ("波纹叠色", Color) = (1,1,1,1)

_TxFlow01Offset ("uv偏移：xy第一层，zw第二层", Vector) = (3,0.15,0,0)

_TxFlowSpeed ("流动速度：xy第一层，zw第二层", Vector) = (0,0.2,0,0.1)

_DistortionMap ("波纹扰动贴图", 2D) = "white" { }

_FlowLineDist ("波纹扰动强度uv", Vector) = (0,0.2,0,0)

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
  GpuProgramID 6504
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
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
uniform 	mediump vec4 _glitteryControl;
uniform 	mediump vec4 _glitterySPColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _maskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _glitterMap;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
ivec3 u_xlati9;
vec2 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_24;
float u_xlat27;
vec3 u_xlat29;
vec3 u_xlat31;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump float u_xlat16_44;
mediump float u_xlat16_48;
float u_xlat49;
float u_xlat50;
float u_xlat60;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
int u_xlati64;
float u_xlat65;
mediump float u_xlat16_68;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_73;
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat60 = _FlowLineDist.z * _Time.x;
    u_xlat60 = fract(u_xlat60);
    u_xlat6.xy = vec2(u_xlat60) + vs_TEXCOORD3.xy;
    u_xlat6.xy = u_xlat6.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_6.xy = texture(_DistortionMap, u_xlat6.xy).xy;
    u_xlat16_7.xyz = texture(_maskTex, vs_TEXCOORD3.zw).xyz;
    u_xlat16_1.x = u_xlat16_7.y * _FlowLineDist.w;
    u_xlat16_1.x = u_xlat16_1.x * 0.00999999978;
    u_xlat16_3.xy = u_xlat16_6.xy * u_xlat16_1.xx + vs_TEXCOORD3.xy;
    u_xlat16_6.xy = texture(_normalMap, u_xlat16_3.xy).xw;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_8.xy, u_xlat16_8.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_8.z = max(u_xlat16_1.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat64 = dot(u_xlat4.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_materialParamsMap, u_xlat16_3.xy);
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat5.x = (-u_xlat64) * u_xlat16_1.x + u_xlat64;
    u_xlat5.x = u_xlat64 * u_xlat5.x + u_xlat16_1.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat64 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat9.xyz;
    u_xlat10.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat10.x) * u_xlat16_1.x + u_xlat10.x;
    u_xlat27 = u_xlat10.x * u_xlat27 + u_xlat16_1.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 + u_xlat10.x;
    u_xlat69 = u_xlat27 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat69;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat16_62) + u_xlat16_21.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat11.xyz = vec3(u_xlat50) * u_xlat11.xyz;
    u_xlat50 = dot(u_xlat4.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_21.x) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat11.x = u_xlat16_1.x + -1.0;
    u_xlat50 = u_xlat50 * u_xlat11.x + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat16_1.x / u_xlat50;
    u_xlat50 = u_xlat50 * 0.318309873;
    u_xlat50 = min(u_xlat50, 16.0);
    u_xlat5.x = u_xlat5.x * u_xlat50;
    u_xlat16_21.x = u_xlat70 * u_xlat70;
    u_xlat16_21.x = u_xlat70 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat70 * u_xlat16_21.x;
    u_xlat16_41.x = u_xlat70 * u_xlat16_21.x;
    u_xlat50 = (-u_xlat16_21.x) * u_xlat70 + 1.0;
    u_xlat16_12 = texture(_albedoMap, u_xlat16_3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_6.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat31.xyz = vec3(u_xlat50) * u_xlat16_14.xyz;
    u_xlat65 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat31.xyz = vec3(u_xlat65) * u_xlat16_41.xxx + u_xlat31.xyz;
    u_xlat31.xyz = u_xlat5.xxx * u_xlat31.xyz;
    u_xlat31.xyz = u_xlat31.xyz * _directSpecularColor.xyz;
    u_xlat31.xyz = vec3(u_xlat64) * u_xlat31.xyz;
    u_xlat31.xyz = u_xlat16_2.xyz * u_xlat31.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_21.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16_21.x) + 1.0;
    u_xlat12.x = max(u_xlat5.x, 0.0);
    u_xlat29.x = min(u_xlat12.x, 1.0);
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat11.x + 1.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat16_1.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * 0.318309873;
    u_xlat49 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat49) * u_xlat16_1.x + u_xlat49;
    u_xlat50 = u_xlat49 * u_xlat50 + u_xlat16_1.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat49 + u_xlat50;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat50;
    u_xlat29.z = float(1.0) / u_xlat69;
    u_xlat29.xz = min(u_xlat29.xz, vec2(16.0, 16.0));
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat9.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat16_41.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat9.x = (-u_xlat16_21.x) * u_xlat9.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat9.xxx;
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16_41.xxx + u_xlat16.xyz;
    u_xlat9.xyw = u_xlat29.xxx * u_xlat16.xyz;
    u_xlat9.xyw = u_xlat9.xyw * _directSpecularColor.xyz;
    u_xlat9.xyw = vec3(u_xlat49) * u_xlat9.xyw;
    u_xlat16_21.xyz = u_xlat9.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat31.xyz;
    u_xlat16_62 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat64) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat49) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_15.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_62) + u_xlat16_43;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_6.w * u_xlat16_43 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_6.w * u_xlat16_62;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_68;
    u_xlat16_73 = min(u_xlat16_62, u_xlat16_5.z);
    u_xlat16_74 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_74) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat16_73) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_19.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati9.x = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati9.x].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_13.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat9.xyz = (-u_xlat4.xyz) * u_xlat16_13.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat16_13.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_11.w);
    u_xlat16_48 = u_xlat16_8.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_11.x = u_xlat16_48 * 16.0 + u_xlat16_11.z;
    u_xlat16_13.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_11.x = u_xlat16_8.x * 16.0 + u_xlat16_11.z;
    u_xlat16_13.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_8.x = u_xlat16_13.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_48 = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_48 + u_xlat16_44;
    u_xlat16_8.x = u_xlat16_68 * u_xlat16_8.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_62 * 0.5;
    u_xlat16_48 = (-u_xlat16_62) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat4.x * u_xlat16_48 + u_xlat16_8.x;
    u_xlat16_48 = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_68 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_68 + u_xlat16_48;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_8.x;
    u_xlat16_62 = min(u_xlat16_62, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60) + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_1.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat10.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_8.xzw = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xzw * vec3(u_xlat16_62) + u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_12.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat20 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = u_xlat20 * abs(u_xlat0.x);
    u_xlat16_4 = texture(_emissiveMap, u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_4.w>=0.5);
#else
    u_xlatb20 = u_xlat16_4.w>=0.5;
#endif
    u_xlat16_8.xzw = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat0.x = u_xlatb20 ? u_xlat0.x : float(0.0);
    u_xlat0.x = u_xlat0.x + _emissiveBreathe.z;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xzw + u_xlat16_2.xyz;
    u_xlat16_41.xy = u_xlat16_3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_0.xy = texture(_LaserMask, u_xlat16_41.xy).xy;
    u_xlat12.y = u_xlat16_0.y;
    u_xlat16_41.x = u_xlat16_0.x * _LaserRampIntensity;
    u_xlat0.xy = u_xlat12.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_0.xyz = texture(_LaserRamp, u_xlat0.xy).xyz;
    u_xlat16_8.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat16_41.xxx * u_xlat16_8.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_8.xzw * _LaserColor.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_2 = u_xlat16_4.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat2 = u_xlat16_2 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat2 = u_xlat2 + _TxFlow01Offset;
    u_xlat4 = _TxFlowSpeed * _Time.yyyy;
    u_xlat4 = fract(u_xlat4);
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat16_60 = texture(_Flow01NoiseMap, u_xlat2.xy).x;
    u_xlat16_4.x = texture(_Flow01NoiseMap, u_xlat2.zw).y;
    u_xlat16_41.x = u_xlat16_60 * 0.305306017 + 0.682171106;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x + 0.0125228781;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_61 = u_xlat16_4.x * 0.305306017 + 0.682171106;
    u_xlat16_61 = u_xlat16_4.x * u_xlat16_61 + 0.0125228781;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_4.x;
    u_xlat16_41.x = max(u_xlat16_61, u_xlat16_41.x);
    u_xlat16_8.xzw = u_xlat16_41.xxx * _FlowColor.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _FlowColor.www;
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw;
    u_xlat16_41.x = (-u_xlat16_7.z) + 1.0;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_8.xzw + u_xlat0.xyz;
    u_xlat16_14.xyz = (-u_xlat16_8.xzw) + _FogCol.xyz;
    u_xlat16_8.xzw = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_8.xzw;
    u_xlat0.xyz = u_xlat16_8.xzw * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_8.xzw;
    u_xlat4.xyz = u_xlat16_8.xzw * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_8.xzw * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat4.xyz;
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
    u_xlat16_8.xz = vs_TEXCOORD1.yz * vs_TEXCOORD2.zx;
    u_xlat16_8.xz = vs_TEXCOORD2.yz * vs_TEXCOORD1.zx + (-u_xlat16_8.xz);
    u_xlat16_8.xz = u_xlat16_8.xz * vs_TEXCOORD2.ww;
    u_xlat4.xy = u_xlat16_8.yy * u_xlat16_8.xz;
    u_xlat4.xy = u_xlat4.xy * _glitteryControl.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_3.xy;
    u_xlat16_8.xy = _glitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat60 = u_xlat16_8.y * _glitteryControl.y;
    u_xlat44.xy = u_xlat16_3.xy * u_xlat16_8.xx;
    u_xlat44.xy = u_xlat44.xy * _glitteryControl.yy;
    u_xlat16_9.xyz = texture(_glitterMap, u_xlat44.xy).xyz;
    u_xlat4.xy = vec2(u_xlat60) * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_glitterMap, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_9.xyz * u_xlat16_4.xyz + (-u_xlat16_41.xxx);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz * _glitteryControl.www;
    u_xlat4.xyz = u_xlat4.xyz * _glitterySPColor.xyz;
    SV_Target0.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat0.xyz;
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
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
uniform 	mediump vec4 _glitteryControl;
uniform 	mediump vec4 _glitterySPColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _maskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _glitterMap;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
ivec3 u_xlati9;
vec2 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_24;
float u_xlat27;
vec3 u_xlat29;
vec3 u_xlat31;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump float u_xlat16_44;
mediump float u_xlat16_48;
float u_xlat49;
float u_xlat50;
float u_xlat60;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
int u_xlati64;
float u_xlat65;
mediump float u_xlat16_68;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_73;
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat60 = _FlowLineDist.z * _Time.x;
    u_xlat60 = fract(u_xlat60);
    u_xlat6.xy = vec2(u_xlat60) + vs_TEXCOORD3.xy;
    u_xlat6.xy = u_xlat6.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_6.xy = texture(_DistortionMap, u_xlat6.xy).xy;
    u_xlat16_7.xyz = texture(_maskTex, vs_TEXCOORD3.zw).xyz;
    u_xlat16_1.x = u_xlat16_7.y * _FlowLineDist.w;
    u_xlat16_1.x = u_xlat16_1.x * 0.00999999978;
    u_xlat16_3.xy = u_xlat16_6.xy * u_xlat16_1.xx + vs_TEXCOORD3.xy;
    u_xlat16_6.xy = texture(_normalMap, u_xlat16_3.xy).xw;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_8.xy, u_xlat16_8.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_8.z = max(u_xlat16_1.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat64 = dot(u_xlat4.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_materialParamsMap, u_xlat16_3.xy);
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0078125);
    u_xlat5.x = (-u_xlat64) * u_xlat16_1.x + u_xlat64;
    u_xlat5.x = u_xlat64 * u_xlat5.x + u_xlat16_1.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat64 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat9.xyz;
    u_xlat10.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat27 = (-u_xlat10.x) * u_xlat16_1.x + u_xlat10.x;
    u_xlat27 = u_xlat10.x * u_xlat27 + u_xlat16_1.x;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 + u_xlat10.x;
    u_xlat69 = u_xlat27 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat69;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat16_62) + u_xlat16_21.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat11.xyz = vec3(u_xlat50) * u_xlat11.xyz;
    u_xlat50 = dot(u_xlat4.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_21.x) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat11.x = u_xlat16_1.x + -1.0;
    u_xlat50 = u_xlat50 * u_xlat11.x + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat16_1.x / u_xlat50;
    u_xlat50 = u_xlat50 * 0.318309873;
    u_xlat50 = min(u_xlat50, 16.0);
    u_xlat5.x = u_xlat5.x * u_xlat50;
    u_xlat16_21.x = u_xlat70 * u_xlat70;
    u_xlat16_21.x = u_xlat70 * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat70 * u_xlat16_21.x;
    u_xlat16_41.x = u_xlat70 * u_xlat16_21.x;
    u_xlat50 = (-u_xlat16_21.x) * u_xlat70 + 1.0;
    u_xlat16_12 = texture(_albedoMap, u_xlat16_3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_6.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat31.xyz = vec3(u_xlat50) * u_xlat16_14.xyz;
    u_xlat65 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat31.xyz = vec3(u_xlat65) * u_xlat16_41.xxx + u_xlat31.xyz;
    u_xlat31.xyz = u_xlat5.xxx * u_xlat31.xyz;
    u_xlat31.xyz = u_xlat31.xyz * _directSpecularColor.xyz;
    u_xlat31.xyz = vec3(u_xlat64) * u_xlat31.xyz;
    u_xlat31.xyz = u_xlat16_2.xyz * u_xlat31.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_21.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16_21.x) + 1.0;
    u_xlat12.x = max(u_xlat5.x, 0.0);
    u_xlat29.x = min(u_xlat12.x, 1.0);
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat29.x * u_xlat11.x + 1.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat16_1.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * 0.318309873;
    u_xlat49 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat49) * u_xlat16_1.x + u_xlat49;
    u_xlat50 = u_xlat49 * u_xlat50 + u_xlat16_1.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat49 + u_xlat50;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat50;
    u_xlat29.z = float(1.0) / u_xlat69;
    u_xlat29.xz = min(u_xlat29.xz, vec2(16.0, 16.0));
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat9.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat16_41.x = u_xlat9.x * u_xlat16_21.x;
    u_xlat9.x = (-u_xlat16_21.x) * u_xlat9.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat9.xxx;
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16_41.xxx + u_xlat16.xyz;
    u_xlat9.xyw = u_xlat29.xxx * u_xlat16.xyz;
    u_xlat9.xyw = u_xlat9.xyw * _directSpecularColor.xyz;
    u_xlat9.xyw = vec3(u_xlat49) * u_xlat9.xyw;
    u_xlat16_21.xyz = u_xlat9.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat31.xyz;
    u_xlat16_62 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat64) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat49) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_15.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_62 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_62) + u_xlat16_43;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_6.w * u_xlat16_43 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_6.w * u_xlat16_62;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_68;
    u_xlat16_73 = min(u_xlat16_62, u_xlat16_5.z);
    u_xlat16_74 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_74) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat16_73) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_19.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati9.x = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati9.x].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_13.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat9.xyz = (-u_xlat4.xyz) * u_xlat16_13.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat16_13.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_11.w);
    u_xlat16_48 = u_xlat16_8.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_11.x = u_xlat16_48 * 16.0 + u_xlat16_11.z;
    u_xlat16_13.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_11.x = u_xlat16_8.x * 16.0 + u_xlat16_11.z;
    u_xlat16_13.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_8.x = u_xlat16_13.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_48 = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_48 + u_xlat16_44;
    u_xlat16_8.x = u_xlat16_68 * u_xlat16_8.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_62 * 0.5;
    u_xlat16_48 = (-u_xlat16_62) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat4.x * u_xlat16_48 + u_xlat16_8.x;
    u_xlat16_48 = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_68 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_68 + u_xlat16_48;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_8.x;
    u_xlat16_62 = min(u_xlat16_62, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60) + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_1.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat10.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_8.xzw = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xzw * vec3(u_xlat16_62) + u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_12.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat20 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = u_xlat20 * abs(u_xlat0.x);
    u_xlat16_4 = texture(_emissiveMap, u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_4.w>=0.5);
#else
    u_xlatb20 = u_xlat16_4.w>=0.5;
#endif
    u_xlat16_8.xzw = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat0.x = u_xlatb20 ? u_xlat0.x : float(0.0);
    u_xlat0.x = u_xlat0.x + _emissiveBreathe.z;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xzw + u_xlat16_2.xyz;
    u_xlat16_41.xy = u_xlat16_3.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_0.xy = texture(_LaserMask, u_xlat16_41.xy).xy;
    u_xlat12.y = u_xlat16_0.y;
    u_xlat16_41.x = u_xlat16_0.x * _LaserRampIntensity;
    u_xlat0.xy = u_xlat12.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_0.xyz = texture(_LaserRamp, u_xlat0.xy).xyz;
    u_xlat16_8.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_0.xyz * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat16_41.xxx * u_xlat16_8.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_8.xzw * _LaserColor.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_2 = u_xlat16_4.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat2 = u_xlat16_2 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat2 = u_xlat2 + _TxFlow01Offset;
    u_xlat4 = _TxFlowSpeed * _Time.yyyy;
    u_xlat4 = fract(u_xlat4);
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat16_60 = texture(_Flow01NoiseMap, u_xlat2.xy).x;
    u_xlat16_4.x = texture(_Flow01NoiseMap, u_xlat2.zw).y;
    u_xlat16_41.x = u_xlat16_60 * 0.305306017 + 0.682171106;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x + 0.0125228781;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_61 = u_xlat16_4.x * 0.305306017 + 0.682171106;
    u_xlat16_61 = u_xlat16_4.x * u_xlat16_61 + 0.0125228781;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_4.x;
    u_xlat16_41.x = max(u_xlat16_61, u_xlat16_41.x);
    u_xlat16_8.xzw = u_xlat16_41.xxx * _FlowColor.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _FlowColor.www;
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw;
    u_xlat16_41.x = (-u_xlat16_7.z) + 1.0;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_8.xzw + u_xlat0.xyz;
    u_xlat16_14.xyz = (-u_xlat16_8.xzw) + _FogCol.xyz;
    u_xlat16_8.xzw = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_8.xzw;
    u_xlat0.xyz = u_xlat16_8.xzw * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_8.xzw;
    u_xlat4.xyz = u_xlat16_8.xzw * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_8.xzw * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat4.xyz;
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
    u_xlat16_8.xz = vs_TEXCOORD1.yz * vs_TEXCOORD2.zx;
    u_xlat16_8.xz = vs_TEXCOORD2.yz * vs_TEXCOORD1.zx + (-u_xlat16_8.xz);
    u_xlat16_8.xz = u_xlat16_8.xz * vs_TEXCOORD2.ww;
    u_xlat4.xy = u_xlat16_8.yy * u_xlat16_8.xz;
    u_xlat4.xy = u_xlat4.xy * _glitteryControl.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_3.xy;
    u_xlat16_8.xy = _glitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat60 = u_xlat16_8.y * _glitteryControl.y;
    u_xlat44.xy = u_xlat16_3.xy * u_xlat16_8.xx;
    u_xlat44.xy = u_xlat44.xy * _glitteryControl.yy;
    u_xlat16_9.xyz = texture(_glitterMap, u_xlat44.xy).xyz;
    u_xlat4.xy = vec2(u_xlat60) * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_glitterMap, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_9.xyz * u_xlat16_4.xyz + (-u_xlat16_41.xxx);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz * _glitteryControl.www;
    u_xlat4.xyz = u_xlat4.xyz * _glitterySPColor.xyz;
    SV_Target0.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat0.xyz;
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
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
uniform 	mediump vec4 _glitteryControl;
uniform 	mediump vec4 _glitterySPColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _maskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _glitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
vec3 u_xlat24;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
mediump vec3 u_xlat16_33;
float u_xlat41;
float u_xlat43;
vec2 u_xlat44;
mediump float u_xlat16_44;
mediump float u_xlat16_46;
mediump float u_xlat16_52;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
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
    u_xlat65 = _FlowLineDist.z * _Time.x;
    u_xlat65 = fract(u_xlat65);
    u_xlat9.xy = vec2(u_xlat65) + vs_TEXCOORD3.xy;
    u_xlat9.xy = u_xlat9.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_9.xy = texture(_DistortionMap, u_xlat9.xy).xy;
    u_xlat16_10.xyz = texture(_maskTex, vs_TEXCOORD3.zw).xyz;
    u_xlat16_6.x = u_xlat16_10.y * _FlowLineDist.w;
    u_xlat16_6.x = u_xlat16_6.x * 0.00999999978;
    u_xlat16_6.xy = u_xlat16_9.xy * u_xlat16_6.xx + vs_TEXCOORD3.xy;
    u_xlat16_9.xy = texture(_normalMap, u_xlat16_6.xy).xw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_46 = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_46 = min(u_xlat16_46, 1.0);
    u_xlat16_46 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = sqrt(u_xlat16_46);
    u_xlat16_11.z = max(u_xlat16_46, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
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
    u_xlat16_46 = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_46) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat21.x + u_xlat16_46;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) * _shadowStrength + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_11.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_12.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_46 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_46 = max(u_xlat16_46, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_46 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_71 = float(1.0) / float(u_xlat16_46);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_46);
    u_xlat16_46 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_46 = max(u_xlat16_46, u_xlat16_13.x);
    u_xlat16_13.xzw = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_13.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_46 = u_xlat16_66 * u_xlat16_46;
    u_xlat16_13.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_0 = texture(_materialParamsMap, u_xlat16_6.xy);
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_46 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat21.x = (-u_xlat1.x) * u_xlat16_46 + u_xlat1.x;
    u_xlat21.x = u_xlat1.x * u_xlat21.x + u_xlat16_46;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat4.x) * u_xlat16_46 + u_xlat4.x;
    u_xlat41 = u_xlat4.x * u_xlat41 + u_xlat16_46;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat4.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.y;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat8.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_12.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat8.xyz;
    u_xlat61 = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat44.x = u_xlat16_46 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat44.x + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_46 / u_xlat61;
    u_xlat21.z = u_xlat61 * 0.318309873;
    u_xlat21.xz = min(u_xlat21.xz, vec2(16.0, 16.0));
    u_xlat21.x = u_xlat21.x * u_xlat21.z;
    u_xlat16_66 = u_xlat63 * u_xlat63;
    u_xlat16_66 = u_xlat63 * u_xlat16_66;
    u_xlat16_66 = u_xlat63 * u_xlat16_66;
    u_xlat16_71 = u_xlat63 * u_xlat16_66;
    u_xlat61 = (-u_xlat16_66) * u_xlat63 + 1.0;
    u_xlat16_8 = texture(_albedoMap, u_xlat16_6.xy);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_2.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_15.xyz;
    u_xlat61 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat61) * vec3(u_xlat16_71) + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_13.xyz * u_xlat8.xyz;
    u_xlat21.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat3.xyz = u_xlat21.xxx * u_xlat3.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat3.xyz);
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_66) + 1.0;
    u_xlat9.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = min(u_xlat9.x, 1.0);
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat44.x + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_46 / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat23) * u_xlat16_46 + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_46;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat41 = u_xlat21.y * u_xlat43;
    u_xlat21.y = float(1.0) / u_xlat41;
    u_xlat21.xy = min(u_xlat21.xy, vec2(16.0, 16.0));
    u_xlat21.x = u_xlat21.y * u_xlat21.x;
    u_xlat16_66 = u_xlat3.x * u_xlat3.x;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_71 = u_xlat3.x * u_xlat16_66;
    u_xlat41 = (-u_xlat16_66) * u_xlat3.x + 1.0;
    u_xlat3.xzw = u_xlat16_15.xyz * vec3(u_xlat41);
    u_xlat3.xzw = vec3(u_xlat61) * vec3(u_xlat16_71) + u_xlat3.xzw;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat3.xzw;
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat23) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_66 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_13.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_13.xyz;
    u_xlat16_66 = dot(u_xlat16_13.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_73 = min(u_xlat16_0.z, u_xlat16_71);
    u_xlat16_74 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_74) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat16_73) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_18.y = u_xlat16_13.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati21 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat1.xyz);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_3.w);
    u_xlat16_32 = u_xlat16_12.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_3.x = u_xlat16_32 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_12.x * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_32 = (-u_xlat16_64) + u_xlat16_44;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_32 + u_xlat16_64;
    u_xlat16_12.x = u_xlat16_72 * u_xlat16_12.x;
    u_xlat61 = u_xlat61 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_71 * 0.5;
    u_xlat16_32 = (-u_xlat16_71) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat61 * u_xlat16_32 + u_xlat16_12.x;
    u_xlat16_32 = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_52 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_52 + u_xlat16_32;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_12.x;
    u_xlat16_71 = min(u_xlat16_0.z, u_xlat16_71);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_46) * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat12.y = u_xlat1.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_13.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat4.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xzw = u_xlat16_15.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(u_xlat16_71) + u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_71) + u_xlat16_16.xyz;
    u_xlat16_71 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_8.w * _albedoColor.w + u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_8.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat21.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat21.x * abs(u_xlat1.x);
    u_xlat16_0 = texture(_emissiveMap, u_xlat16_6.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb21 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_33.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat1.x = u_xlatb21 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _emissiveBreathe.z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_33.xyz;
    u_xlat16_33.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_33.xyz = u_xlat1.xyz * u_xlat16_33.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_33.xyz + u_xlat16_11.xyz;
    u_xlat16_33.xy = u_xlat16_6.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_1.xy = texture(_LaserMask, u_xlat16_33.xy).xy;
    u_xlat9.y = u_xlat16_1.y;
    u_xlat16_33.x = u_xlat16_1.x * _LaserRampIntensity;
    u_xlat1.xy = u_xlat9.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_1.xyz = texture(_LaserRamp, u_xlat1.xy).xyz;
    u_xlat16_14.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xzw = u_xlat16_1.xyz * u_xlat16_14.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xzw = u_xlat16_1.xyz * u_xlat16_14.xzw;
    u_xlat16_33.xyz = u_xlat16_33.xxx * u_xlat16_14.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_33.xyz * _LaserColor.xyz + u_xlat16_11.xyz;
    u_xlat16_4.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_0 = u_xlat16_4.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat0 = u_xlat16_0 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat0 = u_xlat0 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat16_61 = texture(_Flow01NoiseMap, u_xlat0.xy).x;
    u_xlat16_4.x = texture(_Flow01NoiseMap, u_xlat0.zw).y;
    u_xlat16_11.x = u_xlat16_61 * 0.305306017 + 0.682171106;
    u_xlat16_11.x = u_xlat16_61 * u_xlat16_11.x + 0.0125228781;
    u_xlat16_11.x = u_xlat16_61 * u_xlat16_11.x;
    u_xlat16_31 = u_xlat16_4.x * 0.305306017 + 0.682171106;
    u_xlat16_31 = u_xlat16_4.x * u_xlat16_31 + 0.0125228781;
    u_xlat16_31 = u_xlat16_4.x * u_xlat16_31;
    u_xlat16_11.x = max(u_xlat16_31, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FlowColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowColor.www;
    u_xlat16_11.xyz = u_xlat16_10.xxx * u_xlat16_11.xyz;
    u_xlat16_33.x = (-u_xlat16_10.z) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz + u_xlat1.xyz;
    u_xlat16_14.xzw = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_14.xzw + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_11.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat4.xyz;
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
    u_xlat16_11.xy = vs_TEXCOORD1.yz * vs_TEXCOORD2.zx;
    u_xlat16_11.xy = vs_TEXCOORD2.yz * vs_TEXCOORD1.zx + (-u_xlat16_11.xy);
    u_xlat16_11.xy = u_xlat16_11.xy * vs_TEXCOORD2.ww;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat16_11.xy;
    u_xlat4.xy = u_xlat4.xy * _glitteryControl.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_6.xy;
    u_xlat16_11.xy = _glitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat61 = u_xlat16_11.y * _glitteryControl.y;
    u_xlat44.xy = u_xlat16_6.xy * u_xlat16_11.xx;
    u_xlat44.xy = u_xlat44.xy * _glitteryControl.yy;
    u_xlat16_5.xyz = texture(_glitterMap, u_xlat44.xy).xyz;
    u_xlat4.xy = vec2(u_xlat61) * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_glitterMap, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat16_4.xyz + (-u_xlat16_33.xxx);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz * _glitteryControl.www;
    u_xlat4.xyz = u_xlat4.xyz * _glitterySPColor.xyz;
    SV_Target0.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_71 : u_xlat16_13.x;
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
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserMask_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
uniform 	mediump vec4 _glitteryControl;
uniform 	mediump vec4 _glitterySPColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _maskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _glitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
vec3 u_xlat24;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
mediump vec3 u_xlat16_33;
float u_xlat41;
float u_xlat43;
vec2 u_xlat44;
mediump float u_xlat16_44;
mediump float u_xlat16_46;
mediump float u_xlat16_52;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
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
    u_xlat65 = _FlowLineDist.z * _Time.x;
    u_xlat65 = fract(u_xlat65);
    u_xlat9.xy = vec2(u_xlat65) + vs_TEXCOORD3.xy;
    u_xlat9.xy = u_xlat9.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_9.xy = texture(_DistortionMap, u_xlat9.xy).xy;
    u_xlat16_10.xyz = texture(_maskTex, vs_TEXCOORD3.zw).xyz;
    u_xlat16_6.x = u_xlat16_10.y * _FlowLineDist.w;
    u_xlat16_6.x = u_xlat16_6.x * 0.00999999978;
    u_xlat16_6.xy = u_xlat16_9.xy * u_xlat16_6.xx + vs_TEXCOORD3.xy;
    u_xlat16_9.xy = texture(_normalMap, u_xlat16_6.xy).xw;
    u_xlat16_11.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_46 = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_46 = min(u_xlat16_46, 1.0);
    u_xlat16_46 = (-u_xlat16_46) + 1.0;
    u_xlat16_46 = sqrt(u_xlat16_46);
    u_xlat16_11.z = max(u_xlat16_46, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
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
    u_xlat16_46 = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_46) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat21.x + u_xlat16_46;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) * _shadowStrength + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_11.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_12.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_46 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_46 = max(u_xlat16_46, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_46 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_71 = float(1.0) / float(u_xlat16_46);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_46);
    u_xlat16_46 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_13.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_46 = max(u_xlat16_46, u_xlat16_13.x);
    u_xlat16_13.xzw = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_13.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_46 = u_xlat16_66 * u_xlat16_46;
    u_xlat16_13.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_0 = texture(_materialParamsMap, u_xlat16_6.xy);
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_46 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat21.x = (-u_xlat1.x) * u_xlat16_46 + u_xlat1.x;
    u_xlat21.x = u_xlat1.x * u_xlat21.x + u_xlat16_46;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat4.x) * u_xlat16_46 + u_xlat4.x;
    u_xlat41 = u_xlat4.x * u_xlat41 + u_xlat16_46;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat4.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.y;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat8.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_12.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat8.xyz;
    u_xlat61 = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat44.x = u_xlat16_46 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat44.x + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_46 / u_xlat61;
    u_xlat21.z = u_xlat61 * 0.318309873;
    u_xlat21.xz = min(u_xlat21.xz, vec2(16.0, 16.0));
    u_xlat21.x = u_xlat21.x * u_xlat21.z;
    u_xlat16_66 = u_xlat63 * u_xlat63;
    u_xlat16_66 = u_xlat63 * u_xlat16_66;
    u_xlat16_66 = u_xlat63 * u_xlat16_66;
    u_xlat16_71 = u_xlat63 * u_xlat16_66;
    u_xlat61 = (-u_xlat16_66) * u_xlat63 + 1.0;
    u_xlat16_8 = texture(_albedoMap, u_xlat16_6.xy);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_2.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_15.xyz;
    u_xlat61 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat61) * vec3(u_xlat16_71) + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_13.xyz * u_xlat8.xyz;
    u_xlat21.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat3.xyz = u_xlat21.xxx * u_xlat3.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat3.xyz);
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_66) + 1.0;
    u_xlat9.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = min(u_xlat9.x, 1.0);
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat44.x + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_46 / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat23) * u_xlat16_46 + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_46;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat41 = u_xlat21.y * u_xlat43;
    u_xlat21.y = float(1.0) / u_xlat41;
    u_xlat21.xy = min(u_xlat21.xy, vec2(16.0, 16.0));
    u_xlat21.x = u_xlat21.y * u_xlat21.x;
    u_xlat16_66 = u_xlat3.x * u_xlat3.x;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_71 = u_xlat3.x * u_xlat16_66;
    u_xlat41 = (-u_xlat16_66) * u_xlat3.x + 1.0;
    u_xlat3.xzw = u_xlat16_15.xyz * vec3(u_xlat41);
    u_xlat3.xzw = vec3(u_xlat61) * vec3(u_xlat16_71) + u_xlat3.xzw;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat3.xzw;
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat23) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat16_66 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_13.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_13.xyz;
    u_xlat16_66 = dot(u_xlat16_13.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_73 = min(u_xlat16_0.z, u_xlat16_71);
    u_xlat16_74 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat16_74) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_74) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_73) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat16_73) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_18.y = u_xlat16_13.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati21 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat1.xyz);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_3.w);
    u_xlat16_32 = u_xlat16_12.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_3.x = u_xlat16_32 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_12.x * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_32 = (-u_xlat16_64) + u_xlat16_44;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_32 + u_xlat16_64;
    u_xlat16_12.x = u_xlat16_72 * u_xlat16_12.x;
    u_xlat61 = u_xlat61 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_71 * 0.5;
    u_xlat16_32 = (-u_xlat16_71) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat61 * u_xlat16_32 + u_xlat16_12.x;
    u_xlat16_32 = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_52 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_52 + u_xlat16_32;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_12.x;
    u_xlat16_71 = min(u_xlat16_0.z, u_xlat16_71);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_46) * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat12.y = u_xlat1.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_13.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat4.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xzw = u_xlat16_15.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(u_xlat16_71) + u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_71) + u_xlat16_16.xyz;
    u_xlat16_71 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_8.w * _albedoColor.w + u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_8.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat21.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat21.x * abs(u_xlat1.x);
    u_xlat16_0 = texture(_emissiveMap, u_xlat16_6.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb21 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_33.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat1.x = u_xlatb21 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _emissiveBreathe.z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_33.xyz;
    u_xlat16_33.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_33.xyz = u_xlat1.xyz * u_xlat16_33.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_33.xyz + u_xlat16_11.xyz;
    u_xlat16_33.xy = u_xlat16_6.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_1.xy = texture(_LaserMask, u_xlat16_33.xy).xy;
    u_xlat9.y = u_xlat16_1.y;
    u_xlat16_33.x = u_xlat16_1.x * _LaserRampIntensity;
    u_xlat1.xy = u_xlat9.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_1.xyz = texture(_LaserRamp, u_xlat1.xy).xyz;
    u_xlat16_14.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xzw = u_xlat16_1.xyz * u_xlat16_14.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xzw = u_xlat16_1.xyz * u_xlat16_14.xzw;
    u_xlat16_33.xyz = u_xlat16_33.xxx * u_xlat16_14.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_33.xyz * _LaserColor.xyz + u_xlat16_11.xyz;
    u_xlat16_4.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_0 = u_xlat16_4.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat0 = u_xlat16_0 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat0 = u_xlat0 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat16_61 = texture(_Flow01NoiseMap, u_xlat0.xy).x;
    u_xlat16_4.x = texture(_Flow01NoiseMap, u_xlat0.zw).y;
    u_xlat16_11.x = u_xlat16_61 * 0.305306017 + 0.682171106;
    u_xlat16_11.x = u_xlat16_61 * u_xlat16_11.x + 0.0125228781;
    u_xlat16_11.x = u_xlat16_61 * u_xlat16_11.x;
    u_xlat16_31 = u_xlat16_4.x * 0.305306017 + 0.682171106;
    u_xlat16_31 = u_xlat16_4.x * u_xlat16_31 + 0.0125228781;
    u_xlat16_31 = u_xlat16_4.x * u_xlat16_31;
    u_xlat16_11.x = max(u_xlat16_31, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FlowColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowColor.www;
    u_xlat16_11.xyz = u_xlat16_10.xxx * u_xlat16_11.xyz;
    u_xlat16_33.x = (-u_xlat16_10.z) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz + u_xlat1.xyz;
    u_xlat16_14.xzw = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_14.xzw + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_11.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat4.xyz;
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
    u_xlat16_11.xy = vs_TEXCOORD1.yz * vs_TEXCOORD2.zx;
    u_xlat16_11.xy = vs_TEXCOORD2.yz * vs_TEXCOORD1.zx + (-u_xlat16_11.xy);
    u_xlat16_11.xy = u_xlat16_11.xy * vs_TEXCOORD2.ww;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat16_11.xy;
    u_xlat4.xy = u_xlat4.xy * _glitteryControl.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_6.xy;
    u_xlat16_11.xy = _glitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat61 = u_xlat16_11.y * _glitteryControl.y;
    u_xlat44.xy = u_xlat16_6.xy * u_xlat16_11.xx;
    u_xlat44.xy = u_xlat44.xy * _glitteryControl.yy;
    u_xlat16_5.xyz = texture(_glitterMap, u_xlat44.xy).xyz;
    u_xlat4.xy = vec2(u_xlat61) * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_glitterMap, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat16_4.xyz + (-u_xlat16_33.xxx);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz * _glitteryControl.www;
    u_xlat4.xyz = u_xlat4.xyz * _glitterySPColor.xyz;
    SV_Target0.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_71 : u_xlat16_13.x;
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
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _maskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat26;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat56;
int u_xlati56;
float u_xlat57;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat54 = _FlowLineDist.z * _Time.x;
    u_xlat54 = fract(u_xlat54);
    u_xlat4.xy = vec2(u_xlat54) + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_4.xy = texture(_DistortionMap, u_xlat4.xy).xy;
    u_xlat16_40.xy = texture(_maskTex, vs_TEXCOORD3.zw).xy;
    u_xlat16_1.x = u_xlat16_40.y * _FlowLineDist.w;
    u_xlat16_1.x = u_xlat16_1.x * 0.00999999978;
    u_xlat16_1.xy = u_xlat16_4.xy * u_xlat16_1.xx + vs_TEXCOORD3.xy;
    u_xlat16_4.xy = texture(_normalMap, u_xlat16_1.xy).xw;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_37 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_37 = min(u_xlat16_37, 1.0);
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = sqrt(u_xlat16_37);
    u_xlat16_5.z = max(u_xlat16_37, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat56 = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_materialParamsMap, u_xlat16_1.xy);
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_6.x = max(u_xlat16_37, 0.0078125);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0078125);
    u_xlat3.x = (-u_xlat56) * u_xlat16_6.x + u_xlat56;
    u_xlat3.x = u_xlat56 * u_xlat3.x + u_xlat16_6.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat56 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat4.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24.x = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_7.xyz = u_xlat4.xyw * u_xlat16_24.xxx;
    u_xlat8.xyz = u_xlat4.xyw * u_xlat16_24.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat2.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat9.x) * u_xlat16_6.x + u_xlat9.x;
    u_xlat62 = u_xlat9.x * u_xlat62 + u_xlat16_6.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat9.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat62;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat62 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_24.x) + 1.0;
    u_xlat10.x = max(u_xlat62, 0.0);
    u_xlat26 = min(u_xlat10.x, 1.0);
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat44 = u_xlat16_6.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat44 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_6.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat26;
    u_xlat16_24.x = u_xlat8.x * u_xlat8.x;
    u_xlat16_24.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat16_42.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat8.x = (-u_xlat16_24.x) * u_xlat8.x + 1.0;
    u_xlat16_11 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_13.xyz;
    u_xlat57 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat57) * u_xlat16_42.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_24.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_14.xyz = u_xlat16_42.xxx * u_xlat11.xyz;
    u_xlat16_42.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_42.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_42.x);
#endif
    u_xlat16_42.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_42.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_42.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_23 = max(u_xlat16_23, u_xlat16_60);
    u_xlat16_60 = u_xlat16_24.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_24.x = u_xlat16_60 * u_xlat16_24.x;
    u_xlat16_24.x = max(u_xlat16_42.x, u_xlat16_24.x);
    u_xlat16_23 = u_xlat16_23 * u_xlat16_24.x;
    u_xlat16_24.xyz = vec3(u_xlat16_23) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_23 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_23) * u_xlat16_12.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_12.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat3.xxx * u_xlat16_24.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(u_xlat56) + u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_24.xyz;
    u_xlat16_14.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat16_23 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_14.xyz = vec3(u_xlat16_23) * u_xlat16_14.xyz;
    u_xlat16_23 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_23 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_23) + u_xlat16_61;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_23 = u_xlat16_5.w * u_xlat16_61 + u_xlat16_23;
    u_xlat16_23 = u_xlat16_5.w * u_xlat16_23;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_61;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_23);
    u_xlat16_67 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_66) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_66) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlati56 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati3.x = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati3.x].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_24.xyz;
    u_xlat16_12.x = dot((-u_xlat16_7.xyz), u_xlat2.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat3.xyw = (-u_xlat2.xyz) * u_xlat16_12.xxx + (-u_xlat16_7.xyz);
    u_xlat2.x = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat3.xyw);
    u_xlat16_7.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_41.x = floor(u_xlat16_14.w);
    u_xlat16_59 = u_xlat16_41.x + 1.0;
    u_xlat16_59 = min(u_xlat16_59, 15.0);
    u_xlat16_14.x = u_xlat16_59 * 16.0 + u_xlat16_14.z;
    u_xlat16_7.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_14.x = u_xlat16_41.x * 16.0 + u_xlat16_14.z;
    u_xlat16_7.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_41.x = u_xlat16_7.z * 15.0 + (-u_xlat16_41.x);
    u_xlat16_59 = (-u_xlat16_38) + u_xlat16_20;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59 + u_xlat16_38;
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_41.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_23 * 0.5;
    u_xlat16_59 = (-u_xlat16_23) * 0.5 + 1.0;
    u_xlat16_41.x = u_xlat2.x * u_xlat16_59 + u_xlat16_41.x;
    u_xlat16_59 = u_xlat16_41.x + u_xlat16_41.x;
    u_xlat16_7.x = (-u_xlat16_41.x) * 2.0 + 1.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_7.x + u_xlat16_59;
    u_xlat16_23 = u_xlat16_41.x * u_xlat16_23;
    u_xlat16_23 = min(u_xlat16_3.z, u_xlat16_23);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat3.xyw);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_41.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat9.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_41.x);
    u_xlat16_5.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_5.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_5.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xzw;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_12.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * vec3(u_xlat16_23) + u_xlat16_24.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xzw;
    u_xlat16_5.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_11.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat18 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = u_xlat18 * abs(u_xlat0.x);
    u_xlat16_2 = texture(_emissiveMap, u_xlat16_1.xy);
    u_xlat16_41.xy = u_xlat16_1.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_18.xy = texture(_LaserMask, u_xlat16_41.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb54 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_12.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat0.x = u_xlatb54 ? u_xlat0.x : float(0.0);
    u_xlat0.x = u_xlat0.x + _emissiveBreathe.z;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat10.y = u_xlat16_18.y;
    u_xlat16_41.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat0.xy = u_xlat10.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_0.xyz = texture(_LaserRamp, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_41.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_12.xyz * _LaserColor.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1 = u_xlat16_2.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat1 = u_xlat16_1 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat1 = u_xlat1 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat16_54 = texture(_Flow01NoiseMap, u_xlat1.xy).x;
    u_xlat16_2.x = texture(_Flow01NoiseMap, u_xlat1.zw).y;
    u_xlat16_41.x = u_xlat16_54 * 0.305306017 + 0.682171106;
    u_xlat16_41.x = u_xlat16_54 * u_xlat16_41.x + 0.0125228781;
    u_xlat16_41.x = u_xlat16_54 * u_xlat16_41.x;
    u_xlat16_59 = u_xlat16_2.x * 0.305306017 + 0.682171106;
    u_xlat16_59 = u_xlat16_2.x * u_xlat16_59 + 0.0125228781;
    u_xlat16_59 = u_xlat16_2.x * u_xlat16_59;
    u_xlat16_41.x = max(u_xlat16_59, u_xlat16_41.x);
    u_xlat16_6.xyz = u_xlat16_41.xxx * _FlowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _FlowColor.www;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz + u_xlat0.xyz;
    u_xlat16_12.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_23;
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
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _maskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat26;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat56;
int u_xlati56;
float u_xlat57;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat54 = _FlowLineDist.z * _Time.x;
    u_xlat54 = fract(u_xlat54);
    u_xlat4.xy = vec2(u_xlat54) + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_4.xy = texture(_DistortionMap, u_xlat4.xy).xy;
    u_xlat16_40.xy = texture(_maskTex, vs_TEXCOORD3.zw).xy;
    u_xlat16_1.x = u_xlat16_40.y * _FlowLineDist.w;
    u_xlat16_1.x = u_xlat16_1.x * 0.00999999978;
    u_xlat16_1.xy = u_xlat16_4.xy * u_xlat16_1.xx + vs_TEXCOORD3.xy;
    u_xlat16_4.xy = texture(_normalMap, u_xlat16_1.xy).xw;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_37 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_37 = min(u_xlat16_37, 1.0);
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = sqrt(u_xlat16_37);
    u_xlat16_5.z = max(u_xlat16_37, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat56 = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_materialParamsMap, u_xlat16_1.xy);
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_6.x = max(u_xlat16_37, 0.0078125);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0078125);
    u_xlat3.x = (-u_xlat56) * u_xlat16_6.x + u_xlat56;
    u_xlat3.x = u_xlat56 * u_xlat3.x + u_xlat16_6.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat56 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat4.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24.x = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_7.xyz = u_xlat4.xyw * u_xlat16_24.xxx;
    u_xlat8.xyz = u_xlat4.xyw * u_xlat16_24.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat2.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat9.x) * u_xlat16_6.x + u_xlat9.x;
    u_xlat62 = u_xlat9.x * u_xlat62 + u_xlat16_6.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat9.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat62;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat62 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_24.x) + 1.0;
    u_xlat10.x = max(u_xlat62, 0.0);
    u_xlat26 = min(u_xlat10.x, 1.0);
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat44 = u_xlat16_6.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat44 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_6.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat26;
    u_xlat16_24.x = u_xlat8.x * u_xlat8.x;
    u_xlat16_24.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat16_42.x = u_xlat8.x * u_xlat16_24.x;
    u_xlat8.x = (-u_xlat16_24.x) * u_xlat8.x + 1.0;
    u_xlat16_11 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_13.xyz;
    u_xlat57 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat57) * u_xlat16_42.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_24.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_14.xyz = u_xlat16_42.xxx * u_xlat11.xyz;
    u_xlat16_42.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_42.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_42.x);
#endif
    u_xlat16_42.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_42.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_42.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat3.x = dot(u_xlat16_7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_23 = max(u_xlat16_23, u_xlat16_60);
    u_xlat16_60 = u_xlat16_24.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_24.x = u_xlat16_60 * u_xlat16_24.x;
    u_xlat16_24.x = max(u_xlat16_42.x, u_xlat16_24.x);
    u_xlat16_23 = u_xlat16_23 * u_xlat16_24.x;
    u_xlat16_24.xyz = vec3(u_xlat16_23) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_23 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_23) * u_xlat16_12.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_12.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat3.xxx * u_xlat16_24.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(u_xlat56) + u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_24.xyz;
    u_xlat16_14.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat16_23 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_14.xyz = vec3(u_xlat16_23) * u_xlat16_14.xyz;
    u_xlat16_23 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_23 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_23) + u_xlat16_61;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_23 = u_xlat16_5.w * u_xlat16_61 + u_xlat16_23;
    u_xlat16_23 = u_xlat16_5.w * u_xlat16_23;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_61;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_23);
    u_xlat16_67 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_66) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_66) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlati56 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati3.x = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati3.x].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_24.xyz;
    u_xlat16_12.x = dot((-u_xlat16_7.xyz), u_xlat2.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat3.xyw = (-u_xlat2.xyz) * u_xlat16_12.xxx + (-u_xlat16_7.xyz);
    u_xlat2.x = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat3.xyw);
    u_xlat16_7.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_41.x = floor(u_xlat16_14.w);
    u_xlat16_59 = u_xlat16_41.x + 1.0;
    u_xlat16_59 = min(u_xlat16_59, 15.0);
    u_xlat16_14.x = u_xlat16_59 * 16.0 + u_xlat16_14.z;
    u_xlat16_7.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_14.x = u_xlat16_41.x * 16.0 + u_xlat16_14.z;
    u_xlat16_7.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_41.x = u_xlat16_7.z * 15.0 + (-u_xlat16_41.x);
    u_xlat16_59 = (-u_xlat16_38) + u_xlat16_20;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59 + u_xlat16_38;
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_41.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_23 * 0.5;
    u_xlat16_59 = (-u_xlat16_23) * 0.5 + 1.0;
    u_xlat16_41.x = u_xlat2.x * u_xlat16_59 + u_xlat16_41.x;
    u_xlat16_59 = u_xlat16_41.x + u_xlat16_41.x;
    u_xlat16_7.x = (-u_xlat16_41.x) * 2.0 + 1.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_7.x + u_xlat16_59;
    u_xlat16_23 = u_xlat16_41.x * u_xlat16_23;
    u_xlat16_23 = min(u_xlat16_3.z, u_xlat16_23);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat3.xyw);
    u_xlat0.xyz = u_xlat16_6.xxx * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_41.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat9.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_41.x);
    u_xlat16_5.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_5.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_5.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xzw;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_12.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * vec3(u_xlat16_23) + u_xlat16_24.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xzw;
    u_xlat16_5.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_11.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_11.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat18 = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = u_xlat18 * abs(u_xlat0.x);
    u_xlat16_2 = texture(_emissiveMap, u_xlat16_1.xy);
    u_xlat16_41.xy = u_xlat16_1.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_18.xy = texture(_LaserMask, u_xlat16_41.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb54 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_12.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat0.x = u_xlatb54 ? u_xlat0.x : float(0.0);
    u_xlat0.x = u_xlat0.x + _emissiveBreathe.z;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat10.y = u_xlat16_18.y;
    u_xlat16_41.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat0.xy = u_xlat10.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_0.xyz = texture(_LaserRamp, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_41.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_12.xyz * _LaserColor.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1 = u_xlat16_2.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat1 = u_xlat16_1 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat1 = u_xlat1 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat16_54 = texture(_Flow01NoiseMap, u_xlat1.xy).x;
    u_xlat16_2.x = texture(_Flow01NoiseMap, u_xlat1.zw).y;
    u_xlat16_41.x = u_xlat16_54 * 0.305306017 + 0.682171106;
    u_xlat16_41.x = u_xlat16_54 * u_xlat16_41.x + 0.0125228781;
    u_xlat16_41.x = u_xlat16_54 * u_xlat16_41.x;
    u_xlat16_59 = u_xlat16_2.x * 0.305306017 + 0.682171106;
    u_xlat16_59 = u_xlat16_2.x * u_xlat16_59 + 0.0125228781;
    u_xlat16_59 = u_xlat16_2.x * u_xlat16_59;
    u_xlat16_41.x = max(u_xlat16_59, u_xlat16_41.x);
    u_xlat16_6.xyz = u_xlat16_41.xxx * _FlowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _FlowColor.www;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz + u_xlat0.xyz;
    u_xlat16_12.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_23;
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
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _maskTex;
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
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat20;
mediump vec2 u_xlat16_20;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_29;
mediump float u_xlat16_32;
bool u_xlatb39;
mediump float u_xlat16_41;
mediump float u_xlat16_44;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat58;
mediump float u_xlat16_58;
bool u_xlatb58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
bool u_xlatb62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
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
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat4.xyz = vec3(u_xlat61) * u_xlat4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat61 = _FlowLineDist.z * _Time.x;
    u_xlat61 = fract(u_xlat61);
    u_xlat9.xy = vec2(u_xlat61) + vs_TEXCOORD3.xy;
    u_xlat9.xy = u_xlat9.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_9.xy = texture(_DistortionMap, u_xlat9.xy).xy;
    u_xlat16_47.xy = texture(_maskTex, vs_TEXCOORD3.zw).xy;
    u_xlat16_6.x = u_xlat16_47.y * _FlowLineDist.w;
    u_xlat16_6.x = u_xlat16_6.x * 0.00999999978;
    u_xlat16_6.xy = u_xlat16_9.xy * u_xlat16_6.xx + vs_TEXCOORD3.xy;
    u_xlat16_9.xy = texture(_normalMap, u_xlat16_6.xy).xw;
    u_xlat16_10.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_44 = dot(u_xlat16_10.xy, u_xlat16_10.xy);
    u_xlat16_44 = min(u_xlat16_44, 1.0);
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_44 = sqrt(u_xlat16_44);
    u_xlat16_10.z = max(u_xlat16_44, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_10.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb62 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb62)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_44 = (-_ShadowBias.w) + 1.0;
    u_xlat20 = (-u_xlat16_44) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat20 + u_xlat16_44;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) * _shadowStrength + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_10.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_11.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat1.xxx * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_6.xy);
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, u_xlat16_6.xy);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_44 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_44) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_44 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_44 = max(u_xlat16_44, u_xlat16_67);
    u_xlat16_67 = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = max(u_xlat16_15.x, u_xlat16_63);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_63;
    u_xlat16_15.xyz = vec3(u_xlat16_44) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_44 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_44);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_44) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat16_16.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_15.xyz;
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_44 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_44 = max(u_xlat16_44, 0.0078125);
    u_xlat16_67 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_67 + u_xlat3.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x + u_xlat16_67;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat20 = (-u_xlat58) * u_xlat16_67 + u_xlat58;
    u_xlat20 = u_xlat58 * u_xlat20 + u_xlat16_67;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat1.y = u_xlat20 + u_xlat58;
    u_xlat1.xy = u_xlat1.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_68) + 1.0;
    u_xlat4.x = max(u_xlat20, 0.0);
    u_xlat20 = min(u_xlat4.x, 1.0);
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat21 = u_xlat16_67 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat21 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_67 / u_xlat20;
    u_xlat1.y = u_xlat20 * 0.318309873;
    u_xlat1.xy = min(u_xlat1.xy, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_68 = u_xlat2.x * u_xlat2.x;
    u_xlat16_68 = u_xlat2.x * u_xlat16_68;
    u_xlat16_68 = u_xlat2.x * u_xlat16_68;
    u_xlat16_69 = u_xlat2.x * u_xlat16_68;
    u_xlat20 = (-u_xlat16_68) * u_xlat2.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_8.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat20 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat1.xyw = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_68) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_68;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_70 = min(u_xlat16_1.z, u_xlat16_68);
    u_xlat16_71 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_70) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat16_70) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati21 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat59 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_7.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_7.x = u_xlat16_32 * 16.0 + u_xlat16_7.z;
    u_xlat16_14.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_7.x = u_xlat16_13.x * 16.0 + u_xlat16_7.z;
    u_xlat16_14.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = (-u_xlat16_60) + u_xlat16_41;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_60;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat59 = u_xlat59 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_68 * 0.5;
    u_xlat16_13.x = (-u_xlat16_68) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat59 * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = min(u_xlat16_1.z, u_xlat16_68);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat16_67) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_67 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_67);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb39 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb39)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(u_xlat16_68) + u_xlat16_12.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_0.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat20 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat20 * abs(u_xlat1.x);
    u_xlat16_0 = texture(_emissiveMap, u_xlat16_6.xy);
    u_xlat16_48.xy = u_xlat16_6.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_20.xy = texture(_LaserMask, u_xlat16_48.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb58 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat1.x = u_xlatb58 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _emissiveBreathe.z;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat4.y = u_xlat16_20.y;
    u_xlat16_48.x = u_xlat16_20.x * _LaserRampIntensity;
    u_xlat1.xy = u_xlat4.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_1.xyz = texture(_LaserRamp, u_xlat1.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_48.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_12.xyz * _LaserColor.xyz + u_xlat16_11.xyz;
    u_xlat16_2.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_0 = u_xlat16_2.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat0 = u_xlat16_0 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat0 = u_xlat0 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat16_58 = texture(_Flow01NoiseMap, u_xlat0.xy).x;
    u_xlat16_2.x = texture(_Flow01NoiseMap, u_xlat0.zw).y;
    u_xlat16_48.x = u_xlat16_58 * 0.305306017 + 0.682171106;
    u_xlat16_48.x = u_xlat16_58 * u_xlat16_48.x + 0.0125228781;
    u_xlat16_48.x = u_xlat16_58 * u_xlat16_48.x;
    u_xlat16_67 = u_xlat16_2.x * 0.305306017 + 0.682171106;
    u_xlat16_67 = u_xlat16_2.x * u_xlat16_67 + 0.0125228781;
    u_xlat16_67 = u_xlat16_2.x * u_xlat16_67;
    u_xlat16_48.x = max(u_xlat16_67, u_xlat16_48.x);
    u_xlat16_11.xyz = u_xlat16_48.xxx * _FlowColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowColor.www;
    u_xlat16_11.xyz = u_xlat16_47.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz + u_xlat1.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_11.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
    SV_Target0.w = (u_xlatb1) ? u_xlat16_10.x : u_xlat16_29;
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
uniform 	vec4 _DistortionMap_ST;
uniform 	vec4 _Flow01NoiseMap_ST;
uniform 	mediump vec4 _FlowColor;
uniform 	mediump vec4 _TxFlow01Offset;
uniform 	mediump vec4 _TxFlowSpeed;
uniform 	mediump vec4 _FlowLineDist;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Flow01NoiseMap;
UNITY_LOCATION(2) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(4) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(6) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _maskTex;
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
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat20;
mediump vec2 u_xlat16_20;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_29;
mediump float u_xlat16_32;
bool u_xlatb39;
mediump float u_xlat16_41;
mediump float u_xlat16_44;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat58;
mediump float u_xlat16_58;
bool u_xlatb58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
bool u_xlatb62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
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
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat4.xyz = vec3(u_xlat61) * u_xlat4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat61 = _FlowLineDist.z * _Time.x;
    u_xlat61 = fract(u_xlat61);
    u_xlat9.xy = vec2(u_xlat61) + vs_TEXCOORD3.xy;
    u_xlat9.xy = u_xlat9.xy * _DistortionMap_ST.xy + _DistortionMap_ST.zw;
    u_xlat16_9.xy = texture(_DistortionMap, u_xlat9.xy).xy;
    u_xlat16_47.xy = texture(_maskTex, vs_TEXCOORD3.zw).xy;
    u_xlat16_6.x = u_xlat16_47.y * _FlowLineDist.w;
    u_xlat16_6.x = u_xlat16_6.x * 0.00999999978;
    u_xlat16_6.xy = u_xlat16_9.xy * u_xlat16_6.xx + vs_TEXCOORD3.xy;
    u_xlat16_9.xy = texture(_normalMap, u_xlat16_6.xy).xw;
    u_xlat16_10.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_44 = dot(u_xlat16_10.xy, u_xlat16_10.xy);
    u_xlat16_44 = min(u_xlat16_44, 1.0);
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_44 = sqrt(u_xlat16_44);
    u_xlat16_10.z = max(u_xlat16_44, 1.00000002e-16);
    u_xlat5.x = dot(u_xlat16_10.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb62 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb62)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_44 = (-_ShadowBias.w) + 1.0;
    u_xlat20 = (-u_xlat16_44) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat20 + u_xlat16_44;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) * _shadowStrength + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_10.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_11.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat1.xxx * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_6.xy);
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, u_xlat16_6.xy);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_44 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_44) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_44 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_44 = max(u_xlat16_44, u_xlat16_67);
    u_xlat16_67 = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = max(u_xlat16_15.x, u_xlat16_63);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_63;
    u_xlat16_15.xyz = vec3(u_xlat16_44) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_44 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_44);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_44) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat16_16.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_15.xyz;
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_44 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_44 = max(u_xlat16_44, 0.0078125);
    u_xlat16_67 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_67 + u_xlat3.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x + u_xlat16_67;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat20 = (-u_xlat58) * u_xlat16_67 + u_xlat58;
    u_xlat20 = u_xlat58 * u_xlat20 + u_xlat16_67;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat1.y = u_xlat20 + u_xlat58;
    u_xlat1.xy = u_xlat1.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_68) + 1.0;
    u_xlat4.x = max(u_xlat20, 0.0);
    u_xlat20 = min(u_xlat4.x, 1.0);
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat21 = u_xlat16_67 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat21 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_67 / u_xlat20;
    u_xlat1.y = u_xlat20 * 0.318309873;
    u_xlat1.xy = min(u_xlat1.xy, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_68 = u_xlat2.x * u_xlat2.x;
    u_xlat16_68 = u_xlat2.x * u_xlat16_68;
    u_xlat16_68 = u_xlat2.x * u_xlat16_68;
    u_xlat16_69 = u_xlat2.x * u_xlat16_68;
    u_xlat20 = (-u_xlat16_68) * u_xlat2.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_8.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat20 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat1.xyw = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_68) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_68;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_70 = min(u_xlat16_1.z, u_xlat16_68);
    u_xlat16_71 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_70) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat16_70) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati21 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat59 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_7.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_7.x = u_xlat16_32 * 16.0 + u_xlat16_7.z;
    u_xlat16_14.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_7.x = u_xlat16_13.x * 16.0 + u_xlat16_7.z;
    u_xlat16_14.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = (-u_xlat16_60) + u_xlat16_41;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_60;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat59 = u_xlat59 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_68 * 0.5;
    u_xlat16_13.x = (-u_xlat16_68) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat59 * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = min(u_xlat16_1.z, u_xlat16_68);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat16_67) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_67 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_67);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb39 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb39)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(u_xlat16_68) + u_xlat16_12.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_0.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat20 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat20 * abs(u_xlat1.x);
    u_xlat16_0 = texture(_emissiveMap, u_xlat16_6.xy);
    u_xlat16_48.xy = u_xlat16_6.xy * _LaserMask_ST.xy + _LaserMask_ST.zw;
    u_xlat16_20.xy = texture(_LaserMask, u_xlat16_48.xy).xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb58 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat1.x = u_xlatb58 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _emissiveBreathe.z;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat4.y = u_xlat16_20.y;
    u_xlat16_48.x = u_xlat16_20.x * _LaserRampIntensity;
    u_xlat1.xy = u_xlat4.xy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_1.xyz = texture(_LaserRamp, u_xlat1.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_48.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_12.xyz * _LaserColor.xyz + u_xlat16_11.xyz;
    u_xlat16_2.xy = texture(_DistortionMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_0 = u_xlat16_2.xyxy * _FlowLineDist.xyxy + vs_TEXCOORD3.zwzw;
    u_xlat0 = u_xlat16_0 * _Flow01NoiseMap_ST.xyxy + _Flow01NoiseMap_ST.zwzw;
    u_xlat0 = u_xlat0 + _TxFlow01Offset;
    u_xlat2 = _TxFlowSpeed * _Time.yyyy;
    u_xlat2 = fract(u_xlat2);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat16_58 = texture(_Flow01NoiseMap, u_xlat0.xy).x;
    u_xlat16_2.x = texture(_Flow01NoiseMap, u_xlat0.zw).y;
    u_xlat16_48.x = u_xlat16_58 * 0.305306017 + 0.682171106;
    u_xlat16_48.x = u_xlat16_58 * u_xlat16_48.x + 0.0125228781;
    u_xlat16_48.x = u_xlat16_58 * u_xlat16_48.x;
    u_xlat16_67 = u_xlat16_2.x * 0.305306017 + 0.682171106;
    u_xlat16_67 = u_xlat16_2.x * u_xlat16_67 + 0.0125228781;
    u_xlat16_67 = u_xlat16_2.x * u_xlat16_67;
    u_xlat16_48.x = max(u_xlat16_67, u_xlat16_48.x);
    u_xlat16_11.xyz = u_xlat16_48.xxx * _FlowColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowColor.www;
    u_xlat16_11.xyz = u_xlat16_47.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz + u_xlat1.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_11.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
    SV_Target0.w = (u_xlatb1) ? u_xlat16_10.x : u_xlat16_29;
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
  GpuProgramID 81838
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
CustomEditor "FTheseusShaderGUI.SkirtPbrShaderGUI"
}