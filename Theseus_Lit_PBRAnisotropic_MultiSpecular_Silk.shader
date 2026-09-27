//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic MultiSpecular)_Silk" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_detailNormalMap ("细节法线贴图", 2D) = "bump" { }

_detailNormalIntensity ("细节法线强度", Range(0, 10)) = 1.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_sunShift ("主要各向异性扭曲", Float) = 1.0

_sunShiftOffset ("主要各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("主要各项异性强度", Range(0, 1)) = 1.0

_sunShift2nd ("次要各向异性扭曲", Float) = 1.0

_sunShiftOffset2nd ("次要各向异性偏移", Float) = 1.0

_anisotropicMultiplier2nd ("次要各项异性强度", Range(0, 1)) = 1.0

[Tex] _DirectSpecularMap ("混合高光颜色贴图", 2D) = "white" { }

_directSpecularColor ("主要各向异性高光颜色", Color) = (1,1,1,1)

_directSpecularColor2nd ("次要各向异性高光颜色", Color) = (1,1,1,1)

_FresnelColor ("菲涅尔颜色", Color) = (0,0,0,0)

_FresnelPower ("菲涅尔范围", Range(0, 100)) = 1.0

_FresnelScale ("菲涅尔强度", Float) = 1.0

[Tex] _LaserRamp ("镭射贴图(RGB:颜色; A:遮罩)", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (0,0,0,0)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 19018
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(9) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
ivec3 u_xlati7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_35;
float u_xlat36;
vec3 u_xlat42;
mediump vec3 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat53;
float u_xlat58;
int u_xlati58;
mediump vec2 u_xlat16_61;
mediump float u_xlat16_78;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
int u_xlati82;
bool u_xlatb82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
mediump float u_xlat16_89;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_0.x = u_xlat16_0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormalMap, u_xlat16_26.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_26.xy * vec2(_detailNormalIntensity);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.z = -1.0;
    u_xlat16_2.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat3.z = u_xlat16_26.z * u_xlat16_2.z;
    u_xlat3.xy = u_xlat16_2.xy + vec2(-1.0, -1.0);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(u_xlat81);
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat27.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat27.xyz, u_xlat5.xyz);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat5.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat53 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat53) + u_xlat4.xyz;
    u_xlat53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat4.xyz = vec3(u_xlat53) * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat6.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xxx * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat6.xyz = vec3(u_xlat81) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat8.xyz);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_52.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.x = u_xlat16_52.x * u_xlat16_52.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat82 = u_xlat16_26.x * u_xlat16_9.x;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat83 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat83 * u_xlat16_9.x;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat10.y = u_xlat81 * u_xlat82;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat84 = u_xlat83 * u_xlat82;
    u_xlat10.z = u_xlat81 * u_xlat84;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat8.xyz);
    u_xlat10.x = u_xlat16_26.x * u_xlat83;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = max(u_xlat85, 6.10351563e-05);
    u_xlat85 = u_xlat84 / u_xlat85;
    u_xlat84 = u_xlat84 * 0.318309873;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat84 = u_xlat84 * u_xlat85;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat83 * u_xlat85;
    u_xlat10.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat82 * u_xlat16_35.x;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat83 * u_xlat6.x;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat16_11.xyz);
    u_xlat6.x = u_xlat83;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat83 = (-u_xlat83) + 1.0;
    u_xlat83 = max(abs(u_xlat83), 0.00048828125);
    u_xlat83 = log2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat83 = exp2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat86 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat6.y = u_xlat82 * u_xlat86;
    u_xlat82 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat6.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = u_xlat84 * u_xlat82;
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_61.x = inversesqrt(u_xlat16_61.x);
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz;
    u_xlat16_61.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61.x = min(max(u_xlat16_61.x, 0.0), 1.0);
#else
    u_xlat16_61.x = clamp(u_xlat16_61.x, 0.0, 1.0);
#endif
    u_xlat16_61.xy = u_xlat16_61.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_13.xyz = texture(_LaserRamp, u_xlat16_61.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_13.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _LaserColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat16_12.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_84 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_84;
    u_xlat16_61.x = u_xlat16_61.x * _LaserColor.w;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_14.xyz) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_52.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_78 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat84;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat85 = (-u_xlat16_78) * u_xlat84 + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat13.xyz = u_xlat16_14.xyz * vec3(u_xlat85);
    u_xlat84 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat84) * vec3(u_xlat16_78) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.zxy;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_78 = _sunShiftOffset + _sunShift;
    u_xlat16_78 = u_xlat16_78 + vs_TEXCOORD5;
    u_xlat17.xyz = vec3(u_xlat16_78) * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat82 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat17.xyz = vec3(u_xlat82) * u_xlat17.xyz;
    u_xlat82 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_61.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_87 = u_xlat16_61.x + -1.0;
    u_xlat85 = u_xlat16_61.x * u_xlat16_9.x;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat88 = (-u_xlat16_87) + 1.0;
    u_xlat88 = u_xlat16_9.x * u_xlat88;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat82 * u_xlat88;
    u_xlat10.y = u_xlat16_35.x * u_xlat85;
    u_xlat82 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat10.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat17.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat36 * u_xlat88;
    u_xlat6.y = u_xlat86 * u_xlat85;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat82 = u_xlat58 * u_xlat82 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat8.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat8.y = u_xlat85 * u_xlat8.x;
    u_xlat8.x = u_xlat16_26.x * u_xlat88;
    u_xlat86 = u_xlat85 * u_xlat88;
    u_xlat8.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat8.x = u_xlat86 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat8.x;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat81 = u_xlat82 * u_xlat81;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_18.zxy * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_15.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_61.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_19.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_26.x = u_xlat16_35.x * u_xlat16_61.x;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_35.x);
    u_xlat16_20.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_35.yyy + u_xlat16_20.xyz;
    u_xlat16_35.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_35.x = u_xlat16_35.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_61.x, u_xlat16_35.x);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_35.x;
    u_xlat16_20.xyz = u_xlat16_26.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_19.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat21.y = u_xlat81 * u_xlat85;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16.xyz);
    u_xlat21.x = u_xlat16_26.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_19.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat21.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = dot(u_xlat5.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16_19.xyz);
    u_xlat34.x = dot(u_xlat17.xyz, u_xlat16_19.xyz);
    u_xlat16.z = u_xlat34.x * u_xlat88;
    u_xlat16.y = u_xlat16_26.x * u_xlat85;
    u_xlat34.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat16.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat58 * u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = float(1.0) / u_xlat34.x;
    u_xlat81 = u_xlat81 * u_xlat34.x;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_35.x = u_xlat82 * u_xlat16_26.x;
    u_xlat82 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat42.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat42.xyz = vec3(u_xlat84) * u_xlat16_35.xxx + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat81) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat16_15.xyz * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16.xxx * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16_20.xyz * u_xlat42.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat42.xyz * u_xlat34.xxx + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_22.xyz = u_xlat16_35.xxx * u_xlat13.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_35.yyy + u_xlat16_23.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_22.xyz;
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat7.xyz);
    u_xlat82 = dot(u_xlat17.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat82 * u_xlat88;
    u_xlat17.y = u_xlat81 * u_xlat85;
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat7.xyz);
    u_xlat17.x = u_xlat16_0.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_0.x) + 1.0;
    u_xlat17.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_0.x * u_xlat85;
    u_xlat13.x = dot(u_xlat5.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = u_xlat16_0.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + u_xlat13.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat7.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat16_61.x = u_xlat82 * u_xlat82;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_89 = u_xlat82 * u_xlat16_61.x;
    u_xlat82 = (-u_xlat16_61.x) * u_xlat82 + 1.0;
    u_xlat7.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat7.xyz = vec3(u_xlat84) * vec3(u_xlat16_89) + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_15.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xyz;
    u_xlat16_61.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_61.x = (-u_xlat16_61.x) * u_xlat16_61.x + 1.0;
    u_xlat16_61.x = max(u_xlat16_61.x, 0.0);
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_61.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_61.x;
    u_xlat16_26.x = max(u_xlat16_35.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_0.x = max(u_xlat16_0.x, u_xlat16_35.x);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_26.x;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * u_xlat34.yyy + u_xlat16_19.xyz;
    u_xlat16_0.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat34.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat34.yyy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat3.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat5.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_22.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_0.x * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_0.x) + u_xlat16_26.x;
    u_xlat16_35.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_0.x;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat81 = min(u_xlat16_0.x, 1.0);
    u_xlat82 = min(u_xlat16_2.z, u_xlat81);
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat82) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_24.xyz * vec3(u_xlat82) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_26.xxx * u_xlat16_25.xyz;
    u_xlati82 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati82].xyz;
    u_xlati82 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati58 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati82].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_0.x = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_25.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_15.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat16_15.xyz + u_xlat1.xzw;
    u_xlat82 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat1.xzw = u_xlat1.xzw * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb82 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xzw = (bool(u_xlatb82)) ? u_xlat1.xzw : u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat1.xzw;
    u_xlat4.xyz = u_xlat1.wxz * u_xlat16_11.yzx + (-u_xlat4.xyz);
    u_xlat7.xyz = u_xlat1.xzw * u_xlat4.xyz;
    u_xlat1.xzw = u_xlat4.zxy * u_xlat1.zwx + (-u_xlat7.xyz);
    u_xlat1.xzw = (-u_xlat3.xyz) * u_xlat27.xxx + u_xlat1.xzw;
    u_xlat16_78 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat16_78 = u_xlat16_78 * abs(u_xlat16_87);
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat30.x = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat1.xzw = u_xlat1.xzw * u_xlat30.xxx;
    u_xlat16_78 = dot((-u_xlat16_11.xyz), u_xlat1.xzw);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat1.xzw = (-u_xlat1.xzw) * vec3(u_xlat16_78) + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat27.xxx + (-u_xlat1.xzw);
    u_xlat3.xyz = u_xlat16_9.xxx * u_xlat3.xyz + u_xlat1.xzw;
    u_xlat30.xyz = u_xlat1.xzw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_87)) * u_xlat30.xyz + u_xlat3.xyz;
    u_xlat16_78 = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_52.x * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat1.x = dot(u_xlat16_22.xyz, u_xlat1.xzw);
    u_xlat16_49.y = u_xlat1.x * 0.5;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_9.x;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_78);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_9.xyz;
    u_xlat6.y = u_xlat16_52.x;
    u_xlat16_49.x = u_xlat16_52.x * 1.09769487;
    u_xlat16_0.xzw = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xzw = min(max(u_xlat16_0.xzw, 0.0), 1.0);
#else
    u_xlat16_0.xzw = clamp(u_xlat16_0.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_1.yzw = u_xlat16_0.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_0.x = floor(u_xlat16_1.w);
    u_xlat16_52.x = u_xlat16_0.x + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_1.x = u_xlat16_52.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_0.w * 15.0 + (-u_xlat16_0.x);
    u_xlat16_52.x = (-u_xlat16_29.x) + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_29.x;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat3.x = u_xlat4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat81 * 0.5;
    u_xlat16_26.x = (-u_xlat81) * 0.5 + 1.0;
    u_xlat16_0.x = u_xlat3.x * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_26.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_52.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_26.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat81;
    u_xlat16_0.x = min(u_xlat16_0.x, u_xlat16_2.z);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xyz = u_xlat16_0.yzx * u_xlat16_9.yzx + u_xlat16_19.yzx;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_52.x = max(_FresnelScale, 0.0);
    u_xlat3.x = u_xlat16_52.x * u_xlat83;
    u_xlat16_11.xyz = u_xlat3.xxx * _FresnelColor.zxy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_18.zxy + u_xlat16_9.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat81);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_29.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_29.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_29.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(9) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
ivec3 u_xlati7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_35;
float u_xlat36;
vec3 u_xlat42;
mediump vec3 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat53;
float u_xlat58;
int u_xlati58;
mediump vec2 u_xlat16_61;
mediump float u_xlat16_78;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
int u_xlati82;
bool u_xlatb82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
mediump float u_xlat16_89;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_0.x = u_xlat16_0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormalMap, u_xlat16_26.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_26.xy * vec2(_detailNormalIntensity);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.z = -1.0;
    u_xlat16_2.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat3.z = u_xlat16_26.z * u_xlat16_2.z;
    u_xlat3.xy = u_xlat16_2.xy + vec2(-1.0, -1.0);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(u_xlat81);
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat27.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat27.xyz, u_xlat5.xyz);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat5.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat53 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat53) + u_xlat4.xyz;
    u_xlat53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat4.xyz = vec3(u_xlat53) * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat6.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xxx * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat6.xyz = vec3(u_xlat81) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat8.xyz);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_52.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.x = u_xlat16_52.x * u_xlat16_52.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat82 = u_xlat16_26.x * u_xlat16_9.x;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat83 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat83 * u_xlat16_9.x;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat10.y = u_xlat81 * u_xlat82;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat84 = u_xlat83 * u_xlat82;
    u_xlat10.z = u_xlat81 * u_xlat84;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat8.xyz);
    u_xlat10.x = u_xlat16_26.x * u_xlat83;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = max(u_xlat85, 6.10351563e-05);
    u_xlat85 = u_xlat84 / u_xlat85;
    u_xlat84 = u_xlat84 * 0.318309873;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat84 = u_xlat84 * u_xlat85;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat83 * u_xlat85;
    u_xlat10.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat82 * u_xlat16_35.x;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat83 * u_xlat6.x;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat16_11.xyz);
    u_xlat6.x = u_xlat83;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat83 = (-u_xlat83) + 1.0;
    u_xlat83 = max(abs(u_xlat83), 0.00048828125);
    u_xlat83 = log2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat83 = exp2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat86 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat6.y = u_xlat82 * u_xlat86;
    u_xlat82 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat6.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = u_xlat84 * u_xlat82;
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_61.x = inversesqrt(u_xlat16_61.x);
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz;
    u_xlat16_61.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61.x = min(max(u_xlat16_61.x, 0.0), 1.0);
#else
    u_xlat16_61.x = clamp(u_xlat16_61.x, 0.0, 1.0);
#endif
    u_xlat16_61.xy = u_xlat16_61.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_13.xyz = texture(_LaserRamp, u_xlat16_61.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_13.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _LaserColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat16_12.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_84 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_84;
    u_xlat16_61.x = u_xlat16_61.x * _LaserColor.w;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_14.xyz) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_52.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_78 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat84;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat85 = (-u_xlat16_78) * u_xlat84 + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat13.xyz = u_xlat16_14.xyz * vec3(u_xlat85);
    u_xlat84 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat84) * vec3(u_xlat16_78) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.zxy;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_78 = _sunShiftOffset + _sunShift;
    u_xlat16_78 = u_xlat16_78 + vs_TEXCOORD5;
    u_xlat17.xyz = vec3(u_xlat16_78) * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat82 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat17.xyz = vec3(u_xlat82) * u_xlat17.xyz;
    u_xlat82 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_61.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_87 = u_xlat16_61.x + -1.0;
    u_xlat85 = u_xlat16_61.x * u_xlat16_9.x;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat88 = (-u_xlat16_87) + 1.0;
    u_xlat88 = u_xlat16_9.x * u_xlat88;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat82 * u_xlat88;
    u_xlat10.y = u_xlat16_35.x * u_xlat85;
    u_xlat82 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat10.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat17.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat36 * u_xlat88;
    u_xlat6.y = u_xlat86 * u_xlat85;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat82 = u_xlat58 * u_xlat82 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat8.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat8.y = u_xlat85 * u_xlat8.x;
    u_xlat8.x = u_xlat16_26.x * u_xlat88;
    u_xlat86 = u_xlat85 * u_xlat88;
    u_xlat8.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat8.x = u_xlat86 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat8.x;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat81 = u_xlat82 * u_xlat81;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_18.zxy * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_15.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_61.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_19.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_26.x = u_xlat16_35.x * u_xlat16_61.x;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_35.x);
    u_xlat16_20.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_35.yyy + u_xlat16_20.xyz;
    u_xlat16_35.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_35.x = u_xlat16_35.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_61.x, u_xlat16_35.x);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_35.x;
    u_xlat16_20.xyz = u_xlat16_26.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_19.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat21.y = u_xlat81 * u_xlat85;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16.xyz);
    u_xlat21.x = u_xlat16_26.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_19.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat21.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = dot(u_xlat5.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16_19.xyz);
    u_xlat34.x = dot(u_xlat17.xyz, u_xlat16_19.xyz);
    u_xlat16.z = u_xlat34.x * u_xlat88;
    u_xlat16.y = u_xlat16_26.x * u_xlat85;
    u_xlat34.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat16.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat58 * u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = float(1.0) / u_xlat34.x;
    u_xlat81 = u_xlat81 * u_xlat34.x;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_35.x = u_xlat82 * u_xlat16_26.x;
    u_xlat82 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat42.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat42.xyz = vec3(u_xlat84) * u_xlat16_35.xxx + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat81) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat16_15.xyz * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16.xxx * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16_20.xyz * u_xlat42.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat42.xyz * u_xlat34.xxx + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_22.xyz = u_xlat16_35.xxx * u_xlat13.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_35.yyy + u_xlat16_23.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_22.xyz;
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat7.xyz);
    u_xlat82 = dot(u_xlat17.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat82 * u_xlat88;
    u_xlat17.y = u_xlat81 * u_xlat85;
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat7.xyz);
    u_xlat17.x = u_xlat16_0.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_0.x) + 1.0;
    u_xlat17.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_0.x * u_xlat85;
    u_xlat13.x = dot(u_xlat5.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = u_xlat16_0.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + u_xlat13.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat7.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat16_61.x = u_xlat82 * u_xlat82;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_89 = u_xlat82 * u_xlat16_61.x;
    u_xlat82 = (-u_xlat16_61.x) * u_xlat82 + 1.0;
    u_xlat7.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat7.xyz = vec3(u_xlat84) * vec3(u_xlat16_89) + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_15.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xyz;
    u_xlat16_61.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_61.x = (-u_xlat16_61.x) * u_xlat16_61.x + 1.0;
    u_xlat16_61.x = max(u_xlat16_61.x, 0.0);
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_61.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_61.x;
    u_xlat16_26.x = max(u_xlat16_35.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_0.x = max(u_xlat16_0.x, u_xlat16_35.x);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_26.x;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * u_xlat34.yyy + u_xlat16_19.xyz;
    u_xlat16_0.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat34.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat34.yyy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat3.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat5.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_22.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_0.x * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_0.x) + u_xlat16_26.x;
    u_xlat16_35.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_0.x;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat81 = min(u_xlat16_0.x, 1.0);
    u_xlat82 = min(u_xlat16_2.z, u_xlat81);
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat82) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_24.xyz * vec3(u_xlat82) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_26.xxx * u_xlat16_25.xyz;
    u_xlati82 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati82].xyz;
    u_xlati82 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati58 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati82].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_0.x = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_25.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_15.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat16_15.xyz + u_xlat1.xzw;
    u_xlat82 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat1.xzw = u_xlat1.xzw * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb82 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xzw = (bool(u_xlatb82)) ? u_xlat1.xzw : u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat1.xzw;
    u_xlat4.xyz = u_xlat1.wxz * u_xlat16_11.yzx + (-u_xlat4.xyz);
    u_xlat7.xyz = u_xlat1.xzw * u_xlat4.xyz;
    u_xlat1.xzw = u_xlat4.zxy * u_xlat1.zwx + (-u_xlat7.xyz);
    u_xlat1.xzw = (-u_xlat3.xyz) * u_xlat27.xxx + u_xlat1.xzw;
    u_xlat16_78 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat16_78 = u_xlat16_78 * abs(u_xlat16_87);
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat30.x = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat1.xzw = u_xlat1.xzw * u_xlat30.xxx;
    u_xlat16_78 = dot((-u_xlat16_11.xyz), u_xlat1.xzw);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat1.xzw = (-u_xlat1.xzw) * vec3(u_xlat16_78) + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat27.xxx + (-u_xlat1.xzw);
    u_xlat3.xyz = u_xlat16_9.xxx * u_xlat3.xyz + u_xlat1.xzw;
    u_xlat30.xyz = u_xlat1.xzw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_87)) * u_xlat30.xyz + u_xlat3.xyz;
    u_xlat16_78 = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_52.x * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat1.x = dot(u_xlat16_22.xyz, u_xlat1.xzw);
    u_xlat16_49.y = u_xlat1.x * 0.5;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_9.x;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_78);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_9.xyz;
    u_xlat6.y = u_xlat16_52.x;
    u_xlat16_49.x = u_xlat16_52.x * 1.09769487;
    u_xlat16_0.xzw = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xzw = min(max(u_xlat16_0.xzw, 0.0), 1.0);
#else
    u_xlat16_0.xzw = clamp(u_xlat16_0.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_1.yzw = u_xlat16_0.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_0.x = floor(u_xlat16_1.w);
    u_xlat16_52.x = u_xlat16_0.x + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_1.x = u_xlat16_52.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_0.w * 15.0 + (-u_xlat16_0.x);
    u_xlat16_52.x = (-u_xlat16_29.x) + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_29.x;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat3.x = u_xlat4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat81 * 0.5;
    u_xlat16_26.x = (-u_xlat81) * 0.5 + 1.0;
    u_xlat16_0.x = u_xlat3.x * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_26.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_52.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_26.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat81;
    u_xlat16_0.x = min(u_xlat16_0.x, u_xlat16_2.z);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xyz = u_xlat16_0.yzx * u_xlat16_9.yzx + u_xlat16_19.yzx;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_52.x = max(_FresnelScale, 0.0);
    u_xlat3.x = u_xlat16_52.x * u_xlat83;
    u_xlat16_11.xyz = u_xlat3.xxx * _FresnelColor.zxy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_18.zxy + u_xlat16_9.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat81);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_29.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_29.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_29.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat30;
vec3 u_xlat31;
float u_xlat35;
float u_xlat36;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_39;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_64;
float u_xlat78;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat16_6.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_5.xyz = texture(_detailNormalMap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_detailNormalIntensity);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_6.xyw = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat5.z = u_xlat16_6.z * u_xlat16_6.w;
    u_xlat5.xy = u_xlat16_6.xy + vec2(-1.0, -1.0);
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat31.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat30.x = dot(u_xlat31.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat31.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_84 = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_84 = u_xlat16_84 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat9.zxy, u_xlat31.xyz);
    u_xlat27.xyz = (-u_xlat31.yzx) * u_xlat27.xxx + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat31.xyz;
    u_xlat2.xyz = u_xlat31.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat16_84) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat9.xyz);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_7.zz);
    u_xlat16_38.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_90 = u_xlat16_38.x * u_xlat16_38.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat16_12.x * u_xlat16_90;
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat81 = (-u_xlat16_12.x) + 1.0;
    u_xlat81 = u_xlat81 * u_xlat16_90;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat80;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat9.xyz);
    u_xlat10.x = u_xlat81 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat81 * u_xlat80;
    u_xlat10.z = u_xlat1.x * u_xlat82;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = max(u_xlat86, 6.10351563e-05);
    u_xlat86 = u_xlat82 / u_xlat86;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat82 = u_xlat82 * u_xlat86;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat81 * u_xlat86;
    u_xlat10.x = dot(u_xlat31.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat80 * u_xlat16_13.x;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat10.x;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat16_39.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat81;
    u_xlat81 = dot(u_xlat31.xyz, u_xlat16_39.xyz);
    u_xlat3.x = u_xlat81;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat81 = max(abs(u_xlat81), 0.00048828125);
    u_xlat81 = log2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat81 = exp2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat87 = dot(u_xlat27.zxy, u_xlat16_39.xyz);
    u_xlat3.y = u_xlat80 * u_xlat87;
    u_xlat80 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat3.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat80 * u_xlat86 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat80 = u_xlat82 * u_xlat80;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_92 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz;
    u_xlat16_14.x = dot(u_xlat31.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.xy = u_xlat16_14.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_11.xyz = texture(_LaserRamp, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LaserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_82 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_92 = u_xlat16_92 * u_xlat16_82;
    u_xlat16_92 = u_xlat16_92 * _LaserColor.w;
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_11.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_11.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_38.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat82;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat86 = (-u_xlat16_64) * u_xlat82 + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat11.xyz = u_xlat16_15.xyz * vec3(u_xlat86);
    u_xlat82 = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat82) * vec3(u_xlat16_64) + u_xlat11.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat11.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor2nd.zxy;
    u_xlat17.xyz = u_xlat10.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat17.xyz = u_xlat16_6.xyz * u_xlat17.xyz;
    u_xlat16_64 = _sunShiftOffset + _sunShift;
    u_xlat16_64 = u_xlat16_64 + vs_TEXCOORD5;
    u_xlat18.xyz = vec3(u_xlat16_64) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat18.xyz = vec3(u_xlat80) * u_xlat18.xyz;
    u_xlat80 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_93 = u_xlat16_92 + -1.0;
    u_xlat86 = u_xlat16_90 * u_xlat16_92;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat88 = (-u_xlat16_93) + 1.0;
    u_xlat88 = u_xlat88 * u_xlat16_90;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat80 * u_xlat88;
    u_xlat10.y = u_xlat16_13.x * u_xlat86;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat36 * u_xlat88;
    u_xlat3.y = u_xlat87 * u_xlat86;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat3.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat80 = u_xlat55 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat9.x = dot(u_xlat18.xyz, u_xlat9.xyz);
    u_xlat9.y = u_xlat86 * u_xlat9.x;
    u_xlat9.x = u_xlat16_12.x * u_xlat88;
    u_xlat87 = u_xlat86 * u_xlat88;
    u_xlat9.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat9.x = u_xlat87 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat80 * u_xlat1.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.zxy * _directSpecularColor.zxy;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_16.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_92 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_20.xyz = u_xlat16_12.xxx * u_xlat17.xyz;
    u_xlat16_12.x = u_xlat16_13.x * u_xlat16_92;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_13.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_13.x = u_xlat16_13.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_13.x = max(u_xlat16_13.x, u_xlat16_92);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_21.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat17.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_20.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat17.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat86;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat17.xyz);
    u_xlat22.x = u_xlat88 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_20.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_12.x) + 1.0;
    u_xlat22.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat17.x = dot(u_xlat31.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat17.z = u_xlat35 * u_xlat88;
    u_xlat17.y = u_xlat86 * u_xlat16_12.x;
    u_xlat35 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat17.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat55 * u_xlat35 + 6.10351563e-05;
    u_xlat35 = float(1.0) / u_xlat35;
    u_xlat1.x = u_xlat1.x * u_xlat35;
    u_xlat16_12.x = u_xlat80 * u_xlat80;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_12.x;
    u_xlat80 = (-u_xlat16_12.x) * u_xlat80 + 1.0;
    u_xlat43.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat43.xyz = vec3(u_xlat82) * u_xlat16_13.xxx + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat1.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat16_16.xyz * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat17.xxx * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat16_21.xyz * u_xlat43.xyz;
    u_xlat16_20.xyz = u_xlat43.xyz * u_xlat26.xxx + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_13.xxx;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat80 = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat11.z = u_xlat80 * u_xlat88;
    u_xlat18.y = u_xlat1.x * u_xlat86;
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat4.xyz);
    u_xlat18.x = u_xlat16_84 * u_xlat88;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_84) + 1.0;
    u_xlat18.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat16_23.xyz);
    u_xlat11.y = u_xlat16_84 * u_xlat86;
    u_xlat11.x = dot(u_xlat31.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat4.x + 6.10351563e-05;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat1.x = u_xlat1.x * u_xlat55;
    u_xlat16_13.x = u_xlat80 * u_xlat80;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_92 = u_xlat80 * u_xlat16_13.x;
    u_xlat80 = (-u_xlat16_13.x) * u_xlat80 + 1.0;
    u_xlat4.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat4.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_12.x = max(u_xlat16_24.x, u_xlat16_12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_13.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat16_16.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat4.xyz * u_xlat26.yyy + u_xlat16_20.xyz;
    u_xlat16_84 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat26.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10.xxx + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_20.xyz + u_xlat16_6.xyz;
    u_xlat16_16.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_84) + u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_84;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_23.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_12.xxx * u_xlat16_25.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati52 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb1 = u_xlat16_93>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_39.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_39.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat16_64 = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * abs(u_xlat16_93);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat0.xzw + u_xlat31.xyz;
    u_xlat1.x = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat27.xxx;
    u_xlat16_64 = dot((-u_xlat16_39.xyz), u_xlat0.xzw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_64) + (-u_xlat16_39.xyz);
    u_xlat27.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xzw);
    u_xlat27.xyz = vec3(u_xlat16_90) * u_xlat27.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(vec3(u_xlat16_93)) * u_xlat2.xyz + u_xlat27.xyz;
    u_xlat16_64 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_38.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat0.xzw);
    u_xlat16_47.y = u_xlat0.x * 0.5;
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat3.y = u_xlat16_38.x;
    u_xlat16_47.x = u_xlat16_38.x * 1.09769487;
    u_xlat16_38.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.xyz = min(max(u_xlat16_38.xyz, 0.0), 1.0);
#else
    u_xlat16_38.xyz = clamp(u_xlat16_38.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_38.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_38.x = u_xlat16_84 + 1.0;
    u_xlat16_38.x = min(u_xlat16_38.x, 15.0);
    u_xlat16_2.x = u_xlat16_38.x * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_84 = u_xlat16_38.z * 15.0 + (-u_xlat16_84);
    u_xlat16_38.x = (-u_xlat16_52) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_12.x * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_12.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_38.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_12.x;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_84, u_xlat16_7.z);
    u_xlat16_12.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_20.yzx;
    u_xlat16_84 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_11.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_38.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_38.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat81 * u_xlat16_38.x;
    u_xlat16_38.xyz = u_xlat0.xxx * _FresnelColor.zxy;
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_19.zxy + u_xlat16_6.xyz;
    u_xlat16_38.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_38.xyz + u_xlat16_6.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_26.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_12.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat30;
vec3 u_xlat31;
float u_xlat35;
float u_xlat36;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_39;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_64;
float u_xlat78;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat16_6.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_5.xyz = texture(_detailNormalMap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_detailNormalIntensity);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_6.xyw = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat5.z = u_xlat16_6.z * u_xlat16_6.w;
    u_xlat5.xy = u_xlat16_6.xy + vec2(-1.0, -1.0);
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat31.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat30.x = dot(u_xlat31.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat31.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_84 = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_84 = u_xlat16_84 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat9.zxy, u_xlat31.xyz);
    u_xlat27.xyz = (-u_xlat31.yzx) * u_xlat27.xxx + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat31.xyz;
    u_xlat2.xyz = u_xlat31.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat16_84) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat9.xyz);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_7.zz);
    u_xlat16_38.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_90 = u_xlat16_38.x * u_xlat16_38.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat16_12.x * u_xlat16_90;
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat81 = (-u_xlat16_12.x) + 1.0;
    u_xlat81 = u_xlat81 * u_xlat16_90;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat80;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat9.xyz);
    u_xlat10.x = u_xlat81 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat81 * u_xlat80;
    u_xlat10.z = u_xlat1.x * u_xlat82;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = max(u_xlat86, 6.10351563e-05);
    u_xlat86 = u_xlat82 / u_xlat86;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat82 = u_xlat82 * u_xlat86;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat81 * u_xlat86;
    u_xlat10.x = dot(u_xlat31.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat80 * u_xlat16_13.x;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat10.x;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat16_39.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat81;
    u_xlat81 = dot(u_xlat31.xyz, u_xlat16_39.xyz);
    u_xlat3.x = u_xlat81;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat81 = max(abs(u_xlat81), 0.00048828125);
    u_xlat81 = log2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat81 = exp2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat87 = dot(u_xlat27.zxy, u_xlat16_39.xyz);
    u_xlat3.y = u_xlat80 * u_xlat87;
    u_xlat80 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat3.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat80 * u_xlat86 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat80 = u_xlat82 * u_xlat80;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_92 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz;
    u_xlat16_14.x = dot(u_xlat31.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.xy = u_xlat16_14.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_11.xyz = texture(_LaserRamp, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LaserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_82 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_92 = u_xlat16_92 * u_xlat16_82;
    u_xlat16_92 = u_xlat16_92 * _LaserColor.w;
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_11.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_11.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_38.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat82;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat86 = (-u_xlat16_64) * u_xlat82 + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat11.xyz = u_xlat16_15.xyz * vec3(u_xlat86);
    u_xlat82 = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat82) * vec3(u_xlat16_64) + u_xlat11.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat11.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor2nd.zxy;
    u_xlat17.xyz = u_xlat10.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat17.xyz = u_xlat16_6.xyz * u_xlat17.xyz;
    u_xlat16_64 = _sunShiftOffset + _sunShift;
    u_xlat16_64 = u_xlat16_64 + vs_TEXCOORD5;
    u_xlat18.xyz = vec3(u_xlat16_64) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat18.xyz = vec3(u_xlat80) * u_xlat18.xyz;
    u_xlat80 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_93 = u_xlat16_92 + -1.0;
    u_xlat86 = u_xlat16_90 * u_xlat16_92;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat88 = (-u_xlat16_93) + 1.0;
    u_xlat88 = u_xlat88 * u_xlat16_90;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat80 * u_xlat88;
    u_xlat10.y = u_xlat16_13.x * u_xlat86;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat36 * u_xlat88;
    u_xlat3.y = u_xlat87 * u_xlat86;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat3.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat80 = u_xlat55 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat9.x = dot(u_xlat18.xyz, u_xlat9.xyz);
    u_xlat9.y = u_xlat86 * u_xlat9.x;
    u_xlat9.x = u_xlat16_12.x * u_xlat88;
    u_xlat87 = u_xlat86 * u_xlat88;
    u_xlat9.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat9.x = u_xlat87 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat80 * u_xlat1.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.zxy * _directSpecularColor.zxy;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_16.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_92 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_20.xyz = u_xlat16_12.xxx * u_xlat17.xyz;
    u_xlat16_12.x = u_xlat16_13.x * u_xlat16_92;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_13.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_13.x = u_xlat16_13.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_13.x = max(u_xlat16_13.x, u_xlat16_92);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_21.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat17.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_20.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat17.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat86;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat17.xyz);
    u_xlat22.x = u_xlat88 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_20.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_12.x) + 1.0;
    u_xlat22.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat17.x = dot(u_xlat31.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat17.z = u_xlat35 * u_xlat88;
    u_xlat17.y = u_xlat86 * u_xlat16_12.x;
    u_xlat35 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat17.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat55 * u_xlat35 + 6.10351563e-05;
    u_xlat35 = float(1.0) / u_xlat35;
    u_xlat1.x = u_xlat1.x * u_xlat35;
    u_xlat16_12.x = u_xlat80 * u_xlat80;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_12.x;
    u_xlat80 = (-u_xlat16_12.x) * u_xlat80 + 1.0;
    u_xlat43.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat43.xyz = vec3(u_xlat82) * u_xlat16_13.xxx + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat1.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat16_16.xyz * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat17.xxx * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat16_21.xyz * u_xlat43.xyz;
    u_xlat16_20.xyz = u_xlat43.xyz * u_xlat26.xxx + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_13.xxx;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat80 = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat11.z = u_xlat80 * u_xlat88;
    u_xlat18.y = u_xlat1.x * u_xlat86;
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat4.xyz);
    u_xlat18.x = u_xlat16_84 * u_xlat88;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_84) + 1.0;
    u_xlat18.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat16_23.xyz);
    u_xlat11.y = u_xlat16_84 * u_xlat86;
    u_xlat11.x = dot(u_xlat31.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat4.x + 6.10351563e-05;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat1.x = u_xlat1.x * u_xlat55;
    u_xlat16_13.x = u_xlat80 * u_xlat80;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_92 = u_xlat80 * u_xlat16_13.x;
    u_xlat80 = (-u_xlat16_13.x) * u_xlat80 + 1.0;
    u_xlat4.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat4.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_12.x = max(u_xlat16_24.x, u_xlat16_12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_13.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat16_16.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat4.xyz * u_xlat26.yyy + u_xlat16_20.xyz;
    u_xlat16_84 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat26.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10.xxx + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_20.xyz + u_xlat16_6.xyz;
    u_xlat16_16.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_84) + u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_84;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_23.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_12.xxx * u_xlat16_25.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati52 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb1 = u_xlat16_93>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_39.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_39.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat16_64 = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * abs(u_xlat16_93);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat0.xzw + u_xlat31.xyz;
    u_xlat1.x = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat27.xxx;
    u_xlat16_64 = dot((-u_xlat16_39.xyz), u_xlat0.xzw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_64) + (-u_xlat16_39.xyz);
    u_xlat27.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xzw);
    u_xlat27.xyz = vec3(u_xlat16_90) * u_xlat27.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(vec3(u_xlat16_93)) * u_xlat2.xyz + u_xlat27.xyz;
    u_xlat16_64 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_38.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat0.xzw);
    u_xlat16_47.y = u_xlat0.x * 0.5;
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat3.y = u_xlat16_38.x;
    u_xlat16_47.x = u_xlat16_38.x * 1.09769487;
    u_xlat16_38.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.xyz = min(max(u_xlat16_38.xyz, 0.0), 1.0);
#else
    u_xlat16_38.xyz = clamp(u_xlat16_38.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_38.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_38.x = u_xlat16_84 + 1.0;
    u_xlat16_38.x = min(u_xlat16_38.x, 15.0);
    u_xlat16_2.x = u_xlat16_38.x * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_84 = u_xlat16_38.z * 15.0 + (-u_xlat16_84);
    u_xlat16_38.x = (-u_xlat16_52) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_12.x * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_12.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_38.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_12.x;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_84, u_xlat16_7.z);
    u_xlat16_12.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_20.yzx;
    u_xlat16_84 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_11.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_38.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_38.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat81 * u_xlat16_38.x;
    u_xlat16_38.xyz = u_xlat0.xxx * _FresnelColor.zxy;
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_19.zxy + u_xlat16_6.xyz;
    u_xlat16_38.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_38.xyz + u_xlat16_6.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_26.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_12.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(9) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
ivec3 u_xlati7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_35;
float u_xlat36;
vec3 u_xlat42;
mediump vec3 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat53;
float u_xlat58;
int u_xlati58;
mediump vec2 u_xlat16_61;
mediump float u_xlat16_78;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
int u_xlati82;
bool u_xlatb82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
mediump float u_xlat16_89;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_0.x = u_xlat16_0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormalMap, u_xlat16_26.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_26.xy * vec2(_detailNormalIntensity);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.z = -1.0;
    u_xlat16_2.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat3.z = u_xlat16_26.z * u_xlat16_2.z;
    u_xlat3.xy = u_xlat16_2.xy + vec2(-1.0, -1.0);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(u_xlat81);
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat27.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat27.xyz, u_xlat5.xyz);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat5.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat53 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat53) + u_xlat4.xyz;
    u_xlat53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat4.xyz = vec3(u_xlat53) * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat6.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xxx * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat6.xyz = vec3(u_xlat81) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat8.xyz);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_52.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.x = u_xlat16_52.x * u_xlat16_52.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat82 = u_xlat16_26.x * u_xlat16_9.x;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat83 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat83 * u_xlat16_9.x;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat10.y = u_xlat81 * u_xlat82;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat84 = u_xlat83 * u_xlat82;
    u_xlat10.z = u_xlat81 * u_xlat84;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat8.xyz);
    u_xlat10.x = u_xlat16_26.x * u_xlat83;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = max(u_xlat85, 6.10351563e-05);
    u_xlat85 = u_xlat84 / u_xlat85;
    u_xlat84 = u_xlat84 * 0.318309873;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat84 = u_xlat84 * u_xlat85;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat83 * u_xlat85;
    u_xlat10.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat82 * u_xlat16_35.x;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat83 * u_xlat6.x;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat16_11.xyz);
    u_xlat6.x = u_xlat83;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat83 = (-u_xlat83) + 1.0;
    u_xlat83 = max(abs(u_xlat83), 0.00048828125);
    u_xlat83 = log2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat83 = exp2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat86 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat6.y = u_xlat82 * u_xlat86;
    u_xlat82 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat6.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = u_xlat84 * u_xlat82;
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_61.x = inversesqrt(u_xlat16_61.x);
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz;
    u_xlat16_61.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61.x = min(max(u_xlat16_61.x, 0.0), 1.0);
#else
    u_xlat16_61.x = clamp(u_xlat16_61.x, 0.0, 1.0);
#endif
    u_xlat16_61.xy = u_xlat16_61.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_13.xyz = texture(_LaserRamp, u_xlat16_61.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _LaserColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_84 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_84;
    u_xlat16_61.x = u_xlat16_61.x * _LaserColor.w;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_14.xyz) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_52.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_78 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat84;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat85 = (-u_xlat16_78) * u_xlat84 + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat13.xyz = u_xlat16_14.xyz * vec3(u_xlat85);
    u_xlat84 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat84) * vec3(u_xlat16_78) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_78 = _sunShiftOffset + _sunShift;
    u_xlat16_78 = u_xlat16_78 + vs_TEXCOORD5;
    u_xlat17.xyz = vec3(u_xlat16_78) * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat82 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat17.xyz = vec3(u_xlat82) * u_xlat17.xyz;
    u_xlat82 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_61.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_87 = u_xlat16_61.x + -1.0;
    u_xlat85 = u_xlat16_61.x * u_xlat16_9.x;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat88 = (-u_xlat16_87) + 1.0;
    u_xlat88 = u_xlat16_9.x * u_xlat88;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat82 * u_xlat88;
    u_xlat10.y = u_xlat16_35.x * u_xlat85;
    u_xlat82 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat10.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat17.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat36 * u_xlat88;
    u_xlat6.y = u_xlat86 * u_xlat85;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat82 = u_xlat58 * u_xlat82 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat8.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat8.y = u_xlat85 * u_xlat8.x;
    u_xlat8.x = u_xlat16_26.x * u_xlat88;
    u_xlat86 = u_xlat85 * u_xlat88;
    u_xlat8.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat8.x = u_xlat86 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat8.x;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat81 = u_xlat82 * u_xlat81;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_15.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_61.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_19.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_26.x = u_xlat16_35.x * u_xlat16_61.x;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_35.x);
    u_xlat16_20.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_35.yyy + u_xlat16_20.xyz;
    u_xlat16_35.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_35.x = u_xlat16_35.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_61.x, u_xlat16_35.x);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_35.x;
    u_xlat16_20.xyz = u_xlat16_26.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_19.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat21.y = u_xlat81 * u_xlat85;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16.xyz);
    u_xlat21.x = u_xlat16_26.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_19.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat21.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = dot(u_xlat5.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16_19.xyz);
    u_xlat34.x = dot(u_xlat17.xyz, u_xlat16_19.xyz);
    u_xlat16.z = u_xlat34.x * u_xlat88;
    u_xlat16.y = u_xlat16_26.x * u_xlat85;
    u_xlat34.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat16.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat58 * u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = float(1.0) / u_xlat34.x;
    u_xlat81 = u_xlat81 * u_xlat34.x;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_35.x = u_xlat82 * u_xlat16_26.x;
    u_xlat82 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat42.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat42.xyz = vec3(u_xlat84) * u_xlat16_35.xxx + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat81) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat16_15.xyz * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16.xxx * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16_20.xyz * u_xlat42.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat42.xyz * u_xlat34.xxx + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_22.xyz = u_xlat16_35.xxx * u_xlat13.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_35.yyy + u_xlat16_23.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_22.xyz;
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat7.xyz);
    u_xlat82 = dot(u_xlat17.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat82 * u_xlat88;
    u_xlat17.y = u_xlat81 * u_xlat85;
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat7.xyz);
    u_xlat17.x = u_xlat16_0.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_0.x) + 1.0;
    u_xlat17.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_0.x * u_xlat85;
    u_xlat13.x = dot(u_xlat5.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = u_xlat16_0.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + u_xlat13.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat7.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat16_61.x = u_xlat82 * u_xlat82;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_89 = u_xlat82 * u_xlat16_61.x;
    u_xlat82 = (-u_xlat16_61.x) * u_xlat82 + 1.0;
    u_xlat7.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat7.xyz = vec3(u_xlat84) * vec3(u_xlat16_89) + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_15.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xyz;
    u_xlat16_61.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_61.x = (-u_xlat16_61.x) * u_xlat16_61.x + 1.0;
    u_xlat16_61.x = max(u_xlat16_61.x, 0.0);
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_61.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_61.x;
    u_xlat16_26.x = max(u_xlat16_35.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_0.x = max(u_xlat16_0.x, u_xlat16_35.x);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_26.x;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * u_xlat34.yyy + u_xlat16_19.xyz;
    u_xlat16_0.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat34.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat34.yyy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat3.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat5.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_22.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_0.x * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_0.x) + u_xlat16_26.x;
    u_xlat16_35.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_0.x;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat81 = min(u_xlat16_0.x, 1.0);
    u_xlat82 = min(u_xlat16_2.z, u_xlat81);
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat82) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_24.xyz * vec3(u_xlat82) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_26.xxx * u_xlat16_25.xyz;
    u_xlati82 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati82].xyz;
    u_xlati82 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati58 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati82].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_0.x = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_25.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_15.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat16_15.xyz + u_xlat1.xzw;
    u_xlat82 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat1.xzw = u_xlat1.xzw * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb82 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xzw = (bool(u_xlatb82)) ? u_xlat1.xzw : u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat1.xzw;
    u_xlat4.xyz = u_xlat1.wxz * u_xlat16_11.yzx + (-u_xlat4.xyz);
    u_xlat7.xyz = u_xlat1.xzw * u_xlat4.xyz;
    u_xlat1.xzw = u_xlat4.zxy * u_xlat1.zwx + (-u_xlat7.xyz);
    u_xlat1.xzw = (-u_xlat3.xyz) * u_xlat27.xxx + u_xlat1.xzw;
    u_xlat16_78 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat16_78 = u_xlat16_78 * abs(u_xlat16_87);
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat30.x = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat1.xzw = u_xlat1.xzw * u_xlat30.xxx;
    u_xlat16_78 = dot((-u_xlat16_11.xyz), u_xlat1.xzw);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat1.xzw = (-u_xlat1.xzw) * vec3(u_xlat16_78) + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat27.xxx + (-u_xlat1.xzw);
    u_xlat3.xyz = u_xlat16_9.xxx * u_xlat3.xyz + u_xlat1.xzw;
    u_xlat30.xyz = u_xlat1.xzw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_87)) * u_xlat30.xyz + u_xlat3.xyz;
    u_xlat16_78 = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_52.x * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat1.x = dot(u_xlat16_22.xyz, u_xlat1.xzw);
    u_xlat16_49.y = u_xlat1.x * 0.5;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_9.x;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_78);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_9.xyz;
    u_xlat6.y = u_xlat16_52.x;
    u_xlat16_49.x = u_xlat16_52.x * 1.09769487;
    u_xlat16_0.xzw = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xzw = min(max(u_xlat16_0.xzw, 0.0), 1.0);
#else
    u_xlat16_0.xzw = clamp(u_xlat16_0.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_1.yzw = u_xlat16_0.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_0.x = floor(u_xlat16_1.w);
    u_xlat16_52.x = u_xlat16_0.x + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_1.x = u_xlat16_52.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_0.w * 15.0 + (-u_xlat16_0.x);
    u_xlat16_52.x = (-u_xlat16_29) + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_29;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat3.x = u_xlat4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat81 * 0.5;
    u_xlat16_26.x = (-u_xlat81) * 0.5 + 1.0;
    u_xlat16_0.x = u_xlat3.x * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_26.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_52.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_26.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat81;
    u_xlat16_0.x = min(u_xlat16_0.x, u_xlat16_2.z);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_19.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_52.x = max(_FresnelScale, 0.0);
    u_xlat3.x = u_xlat16_52.x * u_xlat83;
    u_xlat16_11.xyz = u_xlat3.xxx * _FresnelColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(9) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
ivec3 u_xlati7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_35;
float u_xlat36;
vec3 u_xlat42;
mediump vec3 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat53;
float u_xlat58;
int u_xlati58;
mediump vec2 u_xlat16_61;
mediump float u_xlat16_78;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
int u_xlati82;
bool u_xlatb82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
mediump float u_xlat16_89;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_0.x = u_xlat16_0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormalMap, u_xlat16_26.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_26.xy * vec2(_detailNormalIntensity);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.z = -1.0;
    u_xlat16_2.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat3.z = u_xlat16_26.z * u_xlat16_2.z;
    u_xlat3.xy = u_xlat16_2.xy + vec2(-1.0, -1.0);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat4.xyz = u_xlat16_26.xyz * vec3(u_xlat81);
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat27.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat27.xyz, u_xlat5.xyz);
    u_xlat27.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat5.xyz = u_xlat27.xxx * u_xlat3.xyz;
    u_xlat53 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat53) + u_xlat4.xyz;
    u_xlat53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat4.xyz = vec3(u_xlat53) * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat6.xyz);
    u_xlat1.xzw = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xxx * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat6.xyz = vec3(u_xlat81) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat8.xyz);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_26.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_52.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.x = u_xlat16_52.x * u_xlat16_52.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat82 = u_xlat16_26.x * u_xlat16_9.x;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat83 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat83 * u_xlat16_9.x;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat10.y = u_xlat81 * u_xlat82;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat84 = u_xlat83 * u_xlat82;
    u_xlat10.z = u_xlat81 * u_xlat84;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat8.xyz);
    u_xlat10.x = u_xlat16_26.x * u_xlat83;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = max(u_xlat85, 6.10351563e-05);
    u_xlat85 = u_xlat84 / u_xlat85;
    u_xlat84 = u_xlat84 * 0.318309873;
    u_xlat85 = u_xlat85 * u_xlat85;
    u_xlat84 = u_xlat84 * u_xlat85;
    u_xlat84 = min(u_xlat84, 16.0);
    u_xlat85 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat83 * u_xlat85;
    u_xlat10.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat82 * u_xlat16_35.x;
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat83 * u_xlat6.x;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat16_11.xyz);
    u_xlat6.x = u_xlat83;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat83 = (-u_xlat83) + 1.0;
    u_xlat83 = max(abs(u_xlat83), 0.00048828125);
    u_xlat83 = log2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat83 = exp2(u_xlat83);
    u_xlat83 = u_xlat83 * _FresnelPower;
    u_xlat86 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat6.y = u_xlat82 * u_xlat86;
    u_xlat82 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat6.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = u_xlat84 * u_xlat82;
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat16_0.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_61.x = inversesqrt(u_xlat16_61.x);
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz;
    u_xlat16_61.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61.x = min(max(u_xlat16_61.x, 0.0), 1.0);
#else
    u_xlat16_61.x = clamp(u_xlat16_61.x, 0.0, 1.0);
#endif
    u_xlat16_61.xy = u_xlat16_61.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_13.xyz = texture(_LaserRamp, u_xlat16_61.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _LaserColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_84 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_84;
    u_xlat16_61.x = u_xlat16_61.x * _LaserColor.w;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_14.xyz) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_61.xxx * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_52.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_78 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat84;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat85 = (-u_xlat16_78) * u_xlat84 + 1.0;
    u_xlat16_78 = u_xlat84 * u_xlat16_78;
    u_xlat13.xyz = u_xlat16_14.xyz * vec3(u_xlat85);
    u_xlat84 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat84) * vec3(u_xlat16_78) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_78 = _sunShiftOffset + _sunShift;
    u_xlat16_78 = u_xlat16_78 + vs_TEXCOORD5;
    u_xlat17.xyz = vec3(u_xlat16_78) * u_xlat5.xyz + u_xlat1.wxz;
    u_xlat82 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat17.xyz = vec3(u_xlat82) * u_xlat17.xyz;
    u_xlat82 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_61.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_87 = u_xlat16_61.x + -1.0;
    u_xlat85 = u_xlat16_61.x * u_xlat16_9.x;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat88 = (-u_xlat16_87) + 1.0;
    u_xlat88 = u_xlat16_9.x * u_xlat88;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat82 * u_xlat88;
    u_xlat10.y = u_xlat16_35.x * u_xlat85;
    u_xlat82 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat10.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat17.xyz, u_xlat16_11.xyz);
    u_xlat6.z = u_xlat36 * u_xlat88;
    u_xlat6.y = u_xlat86 * u_xlat85;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat82 = u_xlat58 * u_xlat82 + 6.10351563e-05;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat8.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat8.y = u_xlat85 * u_xlat8.x;
    u_xlat8.x = u_xlat16_26.x * u_xlat88;
    u_xlat86 = u_xlat85 * u_xlat88;
    u_xlat8.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat8.x = u_xlat86 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat8.x;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat81 = u_xlat82 * u_xlat81;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_15.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_61.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_19.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_26.x = u_xlat16_35.x * u_xlat16_61.x;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_35.x);
    u_xlat16_20.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_35.yyy + u_xlat16_20.xyz;
    u_xlat16_35.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_35.x = u_xlat16_35.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_61.x, u_xlat16_35.x);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_35.x;
    u_xlat16_20.xyz = u_xlat16_26.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_19.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat21.y = u_xlat81 * u_xlat85;
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16.xyz);
    u_xlat21.x = u_xlat16_26.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_19.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat21.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16.x = dot(u_xlat5.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat4.zxy, u_xlat16_19.xyz);
    u_xlat34.x = dot(u_xlat17.xyz, u_xlat16_19.xyz);
    u_xlat16.z = u_xlat34.x * u_xlat88;
    u_xlat16.y = u_xlat16_26.x * u_xlat85;
    u_xlat34.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat16.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat58 * u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = float(1.0) / u_xlat34.x;
    u_xlat81 = u_xlat81 * u_xlat34.x;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_35.x = u_xlat82 * u_xlat16_26.x;
    u_xlat82 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat42.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat42.xyz = vec3(u_xlat84) * u_xlat16_35.xxx + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat81) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat16_15.xyz * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16.xxx * u_xlat42.xyz;
    u_xlat42.xyz = u_xlat16_20.xyz * u_xlat42.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat42.xyz * u_xlat34.xxx + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_22.xyz = u_xlat16_35.xxx * u_xlat13.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_35.yyy + u_xlat16_23.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_0.xxx + u_xlat16_22.xyz;
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat7.xyz);
    u_xlat82 = dot(u_xlat17.xyz, u_xlat16_22.xyz);
    u_xlat13.z = u_xlat82 * u_xlat88;
    u_xlat17.y = u_xlat81 * u_xlat85;
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat7.xyz);
    u_xlat17.x = u_xlat16_0.x * u_xlat88;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_0.x) + 1.0;
    u_xlat17.z = u_xlat81 * u_xlat86;
    u_xlat81 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat86 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat8.x * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat16_0.x = dot(u_xlat4.zxy, u_xlat16_22.xyz);
    u_xlat13.y = u_xlat16_0.x * u_xlat85;
    u_xlat13.x = dot(u_xlat5.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = u_xlat16_0.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + u_xlat13.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat7.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat81 = u_xlat81 * u_xlat58;
    u_xlat16_61.x = u_xlat82 * u_xlat82;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_61.x = u_xlat82 * u_xlat16_61.x;
    u_xlat16_89 = u_xlat82 * u_xlat16_61.x;
    u_xlat82 = (-u_xlat16_61.x) * u_xlat82 + 1.0;
    u_xlat7.xyz = u_xlat16_14.xyz * vec3(u_xlat82);
    u_xlat7.xyz = vec3(u_xlat84) * vec3(u_xlat16_89) + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat81) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_15.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xyz;
    u_xlat16_61.x = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_61.x = (-u_xlat16_61.x) * u_xlat16_61.x + 1.0;
    u_xlat16_61.x = max(u_xlat16_61.x, 0.0);
    u_xlat16_61.x = u_xlat16_61.x * u_xlat16_61.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_61.x;
    u_xlat16_26.x = max(u_xlat16_35.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_0.x = max(u_xlat16_0.x, u_xlat16_35.x);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_26.x;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * u_xlat34.yyy + u_xlat16_19.xyz;
    u_xlat16_0.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_12.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat34.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16.xxx * u_xlat16_20.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_22.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat34.yyy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = (-u_xlat3.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_22.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_22.xyz + u_xlat5.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_22.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_0.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_0.x * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_0.x) + u_xlat16_26.x;
    u_xlat16_35.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_49.z * u_xlat16_0.x;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat81 = min(u_xlat16_0.x, 1.0);
    u_xlat82 = min(u_xlat16_2.z, u_xlat81);
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat82) * u_xlat16_20.xyz;
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat82) * u_xlat16_24.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat82) + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_24.xyz * vec3(u_xlat82) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_22.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_22.xz);
    u_xlat16_24.y = u_xlat16_22.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_26.xxx * u_xlat16_25.xyz;
    u_xlati82 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati82].xyz;
    u_xlati82 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati58 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati82].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_0.x = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_25.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz + u_xlat16_15.xyz;
    u_xlat16_35.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_35.x = inversesqrt(u_xlat16_35.x);
    u_xlat16_15.xyz = u_xlat16_35.xxx * vs_TEXCOORD1.yzx;
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat16_15.xyz + u_xlat1.xzw;
    u_xlat82 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat1.xzw = u_xlat1.xzw * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlatb82 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb82 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xzw = (bool(u_xlatb82)) ? u_xlat1.xzw : u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat1.xzw;
    u_xlat4.xyz = u_xlat1.wxz * u_xlat16_11.yzx + (-u_xlat4.xyz);
    u_xlat7.xyz = u_xlat1.xzw * u_xlat4.xyz;
    u_xlat1.xzw = u_xlat4.zxy * u_xlat1.zwx + (-u_xlat7.xyz);
    u_xlat1.xzw = (-u_xlat3.xyz) * u_xlat27.xxx + u_xlat1.xzw;
    u_xlat16_78 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_78 = min(u_xlat16_78, 1.0);
    u_xlat16_78 = u_xlat16_78 * abs(u_xlat16_87);
    u_xlat1.xzw = vec3(u_xlat16_78) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat4.x = dot(u_xlat16_22.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat30.x = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat1.xzw = u_xlat1.xzw * u_xlat30.xxx;
    u_xlat16_78 = dot((-u_xlat16_11.xyz), u_xlat1.xzw);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat1.xzw = (-u_xlat1.xzw) * vec3(u_xlat16_78) + (-u_xlat16_11.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat27.xxx + (-u_xlat1.xzw);
    u_xlat3.xyz = u_xlat16_9.xxx * u_xlat3.xyz + u_xlat1.xzw;
    u_xlat30.xyz = u_xlat1.xzw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_87)) * u_xlat30.xyz + u_xlat3.xyz;
    u_xlat16_78 = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_52.x * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat1.x = dot(u_xlat16_22.xyz, u_xlat1.xzw);
    u_xlat16_49.y = u_xlat1.x * 0.5;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_9.x;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_78);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_9.xyz;
    u_xlat6.y = u_xlat16_52.x;
    u_xlat16_49.x = u_xlat16_52.x * 1.09769487;
    u_xlat16_0.xzw = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xzw = min(max(u_xlat16_0.xzw, 0.0), 1.0);
#else
    u_xlat16_0.xzw = clamp(u_xlat16_0.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_1.yzw = u_xlat16_0.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_0.x = floor(u_xlat16_1.w);
    u_xlat16_52.x = u_xlat16_0.x + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_1.x = u_xlat16_52.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_0.w * 15.0 + (-u_xlat16_0.x);
    u_xlat16_52.x = (-u_xlat16_29) + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_29;
    u_xlat16_0.x = u_xlat16_26.x * u_xlat16_0.x;
    u_xlat3.x = u_xlat4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat81 * 0.5;
    u_xlat16_26.x = (-u_xlat81) * 0.5 + 1.0;
    u_xlat16_0.x = u_xlat3.x * u_xlat16_26.x + u_xlat16_0.x;
    u_xlat16_26.x = u_xlat16_0.x + u_xlat16_0.x;
    u_xlat16_52.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_52.x + u_xlat16_26.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat81;
    u_xlat16_0.x = min(u_xlat16_0.x, u_xlat16_2.z);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_9.xyz + u_xlat16_19.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_52.x = max(_FresnelScale, 0.0);
    u_xlat3.x = u_xlat16_52.x * u_xlat83;
    u_xlat16_11.xyz = u_xlat3.xxx * _FresnelColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat30;
vec3 u_xlat31;
float u_xlat35;
float u_xlat36;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_39;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_64;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat16_6.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_5.xyz = texture(_detailNormalMap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_detailNormalIntensity);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_6.xyw = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat5.z = u_xlat16_6.z * u_xlat16_6.w;
    u_xlat5.xy = u_xlat16_6.xy + vec2(-1.0, -1.0);
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat31.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat30.x = dot(u_xlat31.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat31.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_84 = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_84 = u_xlat16_84 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat9.zxy, u_xlat31.xyz);
    u_xlat27.xyz = (-u_xlat31.yzx) * u_xlat27.xxx + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat31.xyz;
    u_xlat2.xyz = u_xlat31.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat16_84) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat9.xyz);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_7.zz);
    u_xlat16_38.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_90 = u_xlat16_38.x * u_xlat16_38.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat16_12.x * u_xlat16_90;
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat81 = (-u_xlat16_12.x) + 1.0;
    u_xlat81 = u_xlat81 * u_xlat16_90;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat80;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat9.xyz);
    u_xlat10.x = u_xlat81 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat81 * u_xlat80;
    u_xlat10.z = u_xlat1.x * u_xlat82;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = max(u_xlat86, 6.10351563e-05);
    u_xlat86 = u_xlat82 / u_xlat86;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat82 = u_xlat82 * u_xlat86;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat81 * u_xlat86;
    u_xlat10.x = dot(u_xlat31.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat80 * u_xlat16_13.x;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat10.x;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat16_39.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat81;
    u_xlat81 = dot(u_xlat31.xyz, u_xlat16_39.xyz);
    u_xlat3.x = u_xlat81;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat81 = max(abs(u_xlat81), 0.00048828125);
    u_xlat81 = log2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat81 = exp2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat87 = dot(u_xlat27.zxy, u_xlat16_39.xyz);
    u_xlat3.y = u_xlat80 * u_xlat87;
    u_xlat80 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat3.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat80 * u_xlat86 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat80 = u_xlat82 * u_xlat80;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_92 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz;
    u_xlat16_14.x = dot(u_xlat31.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.xy = u_xlat16_14.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_11.xyz = texture(_LaserRamp, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LaserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_82 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_92 = u_xlat16_92 * u_xlat16_82;
    u_xlat16_92 = u_xlat16_92 * _LaserColor.w;
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_38.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat82;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat86 = (-u_xlat16_64) * u_xlat82 + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat11.xyz = u_xlat16_15.xyz * vec3(u_xlat86);
    u_xlat82 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat82) * vec3(u_xlat16_64) + u_xlat11.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat11.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor2nd.xyz;
    u_xlat17.xyz = u_xlat10.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat17.xyz = u_xlat16_6.xyz * u_xlat17.xyz;
    u_xlat16_64 = _sunShiftOffset + _sunShift;
    u_xlat16_64 = u_xlat16_64 + vs_TEXCOORD5;
    u_xlat18.xyz = vec3(u_xlat16_64) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat18.xyz = vec3(u_xlat80) * u_xlat18.xyz;
    u_xlat80 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_93 = u_xlat16_92 + -1.0;
    u_xlat86 = u_xlat16_90 * u_xlat16_92;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat88 = (-u_xlat16_93) + 1.0;
    u_xlat88 = u_xlat88 * u_xlat16_90;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat80 * u_xlat88;
    u_xlat10.y = u_xlat16_13.x * u_xlat86;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat36 * u_xlat88;
    u_xlat3.y = u_xlat87 * u_xlat86;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat3.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat80 = u_xlat55 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat9.x = dot(u_xlat18.xyz, u_xlat9.xyz);
    u_xlat9.y = u_xlat86 * u_xlat9.x;
    u_xlat9.x = u_xlat16_12.x * u_xlat88;
    u_xlat87 = u_xlat86 * u_xlat88;
    u_xlat9.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat9.x = u_xlat87 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat80 * u_xlat1.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_16.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_92 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_20.xyz = u_xlat16_12.xxx * u_xlat17.xyz;
    u_xlat16_12.x = u_xlat16_13.x * u_xlat16_92;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_13.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_13.x = u_xlat16_13.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_13.x = max(u_xlat16_13.x, u_xlat16_92);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_21.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat17.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_20.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat17.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat86;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat17.xyz);
    u_xlat22.x = u_xlat88 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_20.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_12.x) + 1.0;
    u_xlat22.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat17.x = dot(u_xlat31.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat17.z = u_xlat35 * u_xlat88;
    u_xlat17.y = u_xlat86 * u_xlat16_12.x;
    u_xlat35 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat17.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat55 * u_xlat35 + 6.10351563e-05;
    u_xlat35 = float(1.0) / u_xlat35;
    u_xlat1.x = u_xlat1.x * u_xlat35;
    u_xlat16_12.x = u_xlat80 * u_xlat80;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_12.x;
    u_xlat80 = (-u_xlat16_12.x) * u_xlat80 + 1.0;
    u_xlat43.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat43.xyz = vec3(u_xlat82) * u_xlat16_13.xxx + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat1.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat16_16.xyz * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat17.xxx * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat16_21.xyz * u_xlat43.xyz;
    u_xlat16_20.xyz = u_xlat43.xyz * u_xlat26.xxx + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_13.xxx;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat80 = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat11.z = u_xlat80 * u_xlat88;
    u_xlat18.y = u_xlat1.x * u_xlat86;
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat4.xyz);
    u_xlat18.x = u_xlat16_84 * u_xlat88;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_84) + 1.0;
    u_xlat18.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat16_23.xyz);
    u_xlat11.y = u_xlat16_84 * u_xlat86;
    u_xlat11.x = dot(u_xlat31.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat4.x + 6.10351563e-05;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat1.x = u_xlat1.x * u_xlat55;
    u_xlat16_13.x = u_xlat80 * u_xlat80;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_92 = u_xlat80 * u_xlat16_13.x;
    u_xlat80 = (-u_xlat16_13.x) * u_xlat80 + 1.0;
    u_xlat4.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat4.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_12.x = max(u_xlat16_24.x, u_xlat16_12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_13.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat16_16.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat4.xyz * u_xlat26.yyy + u_xlat16_20.xyz;
    u_xlat16_84 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat26.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10.xxx + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_20.xyz + u_xlat16_6.xyz;
    u_xlat16_16.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_84) + u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_84;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_23.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_12.xxx * u_xlat16_25.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati52 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb1 = u_xlat16_93>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_39.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_39.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat16_64 = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * abs(u_xlat16_93);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat0.xzw + u_xlat31.xyz;
    u_xlat1.x = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat27.xxx;
    u_xlat16_64 = dot((-u_xlat16_39.xyz), u_xlat0.xzw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_64) + (-u_xlat16_39.xyz);
    u_xlat27.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xzw);
    u_xlat27.xyz = vec3(u_xlat16_90) * u_xlat27.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(vec3(u_xlat16_93)) * u_xlat2.xyz + u_xlat27.xyz;
    u_xlat16_64 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_38.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat0.xzw);
    u_xlat16_47.y = u_xlat0.x * 0.5;
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat3.y = u_xlat16_38.x;
    u_xlat16_47.x = u_xlat16_38.x * 1.09769487;
    u_xlat16_38.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.xyz = min(max(u_xlat16_38.xyz, 0.0), 1.0);
#else
    u_xlat16_38.xyz = clamp(u_xlat16_38.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_38.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_38.x = u_xlat16_84 + 1.0;
    u_xlat16_38.x = min(u_xlat16_38.x, 15.0);
    u_xlat16_2.x = u_xlat16_38.x * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_84 = u_xlat16_38.z * 15.0 + (-u_xlat16_84);
    u_xlat16_38.x = (-u_xlat16_52) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_12.x * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_12.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_38.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_12.x;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_84, u_xlat16_7.z);
    u_xlat16_12.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_20.xyz;
    u_xlat16_84 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_11.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_38.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_38.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat81 * u_xlat16_38.x;
    u_xlat16_38.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat16_38.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_38.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_12.x;
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
uniform 	mediump vec4 _detailNormalMap_ST;
uniform 	mediump float _detailNormalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _detailNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(11) uniform mediump sampler2D _DirectSpecularMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat30;
vec3 u_xlat31;
float u_xlat35;
float u_xlat36;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_39;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_64;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat16_6.xy = vs_TEXCOORD3.xy * _detailNormalMap_ST.xy + _detailNormalMap_ST.zw;
    u_xlat16_5.xyz = texture(_detailNormalMap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_detailNormalIntensity);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_6.xyw = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat5.z = u_xlat16_6.z * u_xlat16_6.w;
    u_xlat5.xy = u_xlat16_6.xy + vec2(-1.0, -1.0);
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat11.x = u_xlat9.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat31.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat30.x = dot(u_xlat31.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat31.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_84 = _sunShift2nd + _sunShiftOffset2nd;
    u_xlat16_84 = u_xlat16_84 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat9.zxy, u_xlat31.xyz);
    u_xlat27.xyz = (-u_xlat31.yzx) * u_xlat27.xxx + u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat31.xyz;
    u_xlat2.xyz = u_xlat31.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat16_84) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat9.xyz);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_7.zz);
    u_xlat16_38.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_90 = u_xlat16_38.x * u_xlat16_38.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat16_12.x * u_xlat16_90;
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat81 = (-u_xlat16_12.x) + 1.0;
    u_xlat81 = u_xlat81 * u_xlat16_90;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat80;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat9.xyz);
    u_xlat10.x = u_xlat81 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat81 * u_xlat80;
    u_xlat10.z = u_xlat1.x * u_xlat82;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = max(u_xlat86, 6.10351563e-05);
    u_xlat86 = u_xlat82 / u_xlat86;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat82 = u_xlat82 * u_xlat86;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat81 * u_xlat86;
    u_xlat10.x = dot(u_xlat31.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat80 * u_xlat16_13.x;
    u_xlat86 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat10.x;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat16_39.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat81;
    u_xlat81 = dot(u_xlat31.xyz, u_xlat16_39.xyz);
    u_xlat3.x = u_xlat81;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat81 = max(abs(u_xlat81), 0.00048828125);
    u_xlat81 = log2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat81 = exp2(u_xlat81);
    u_xlat81 = u_xlat81 * _FresnelPower;
    u_xlat87 = dot(u_xlat27.zxy, u_xlat16_39.xyz);
    u_xlat3.y = u_xlat80 * u_xlat87;
    u_xlat80 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat3.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat80 * u_xlat86 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat80 = u_xlat82 * u_xlat80;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_92 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz;
    u_xlat16_14.x = dot(u_xlat31.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.xy = u_xlat16_14.xx * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_11.xyz = texture(_LaserRamp, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LaserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_82 = texture(_LaserRamp, vs_TEXCOORD3.xy).w;
    u_xlat16_92 = u_xlat16_92 * u_xlat16_82;
    u_xlat16_92 = u_xlat16_92 * _LaserColor.w;
    u_xlat16_11 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_92) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_38.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat82;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat86 = (-u_xlat16_64) * u_xlat82 + 1.0;
    u_xlat16_64 = u_xlat82 * u_xlat16_64;
    u_xlat11.xyz = u_xlat16_15.xyz * vec3(u_xlat86);
    u_xlat82 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat82) * vec3(u_xlat16_64) + u_xlat11.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat11.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor2nd.xyz;
    u_xlat17.xyz = u_xlat10.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat17.xyz = u_xlat16_6.xyz * u_xlat17.xyz;
    u_xlat16_64 = _sunShiftOffset + _sunShift;
    u_xlat16_64 = u_xlat16_64 + vs_TEXCOORD5;
    u_xlat18.xyz = vec3(u_xlat16_64) * u_xlat31.xyz + u_xlat2.zxy;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat18.xyz = vec3(u_xlat80) * u_xlat18.xyz;
    u_xlat80 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_93 = u_xlat16_92 + -1.0;
    u_xlat86 = u_xlat16_90 * u_xlat16_92;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat88 = (-u_xlat16_93) + 1.0;
    u_xlat88 = u_xlat88 * u_xlat16_90;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat10.z = u_xlat80 * u_xlat88;
    u_xlat10.y = u_xlat16_13.x * u_xlat86;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat36 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat3.z = u_xlat36 * u_xlat88;
    u_xlat3.y = u_xlat87 * u_xlat86;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat3.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat80 = u_xlat55 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat9.x = dot(u_xlat18.xyz, u_xlat9.xyz);
    u_xlat9.y = u_xlat86 * u_xlat9.x;
    u_xlat9.x = u_xlat16_12.x * u_xlat88;
    u_xlat87 = u_xlat86 * u_xlat88;
    u_xlat9.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat9.x = u_xlat87 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat80 * u_xlat1.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = texture(_DirectSpecularMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_19.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_16.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_92 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_20.xyz = u_xlat16_12.xxx * u_xlat17.xyz;
    u_xlat16_12.x = u_xlat16_13.x * u_xlat16_92;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_13.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_13.x = u_xlat16_13.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_92 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_13.x = max(u_xlat16_13.x, u_xlat16_92);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_21.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat17.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_20.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat17.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat86;
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat17.xyz);
    u_xlat22.x = u_xlat88 * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_20.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_12.x) + 1.0;
    u_xlat22.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat17.x = dot(u_xlat31.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat17.z = u_xlat35 * u_xlat88;
    u_xlat17.y = u_xlat86 * u_xlat16_12.x;
    u_xlat35 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat17.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat55 * u_xlat35 + 6.10351563e-05;
    u_xlat35 = float(1.0) / u_xlat35;
    u_xlat1.x = u_xlat1.x * u_xlat35;
    u_xlat16_12.x = u_xlat80 * u_xlat80;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat80 * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_12.x;
    u_xlat80 = (-u_xlat16_12.x) * u_xlat80 + 1.0;
    u_xlat43.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat43.xyz = vec3(u_xlat82) * u_xlat16_13.xxx + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat1.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat16_16.xyz * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat17.xxx * u_xlat43.xyz;
    u_xlat43.xyz = u_xlat16_21.xyz * u_xlat43.xyz;
    u_xlat16_20.xyz = u_xlat43.xyz * u_xlat26.xxx + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_13.xxx;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_84) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat80 = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat11.z = u_xlat80 * u_xlat88;
    u_xlat18.y = u_xlat1.x * u_xlat86;
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat4.xyz);
    u_xlat18.x = u_xlat16_84 * u_xlat88;
    u_xlat1.x = dot(u_xlat31.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_84) + 1.0;
    u_xlat18.z = u_xlat1.x * u_xlat87;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat87 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_84 = dot(u_xlat27.zxy, u_xlat16_23.xyz);
    u_xlat11.y = u_xlat16_84 * u_xlat86;
    u_xlat11.x = dot(u_xlat31.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat4.x + 6.10351563e-05;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat1.x = u_xlat1.x * u_xlat55;
    u_xlat16_13.x = u_xlat80 * u_xlat80;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat80 * u_xlat16_13.x;
    u_xlat16_92 = u_xlat80 * u_xlat16_13.x;
    u_xlat80 = (-u_xlat16_13.x) * u_xlat80 + 1.0;
    u_xlat4.xyz = u_xlat16_15.xyz * vec3(u_xlat80);
    u_xlat4.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat16_13.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_12.x = max(u_xlat16_24.x, u_xlat16_12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_13.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat16_16.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat4.xyz * u_xlat26.yyy + u_xlat16_20.xyz;
    u_xlat16_84 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz;
    u_xlat16_23.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat26.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat17.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10.xxx + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat26.yyy * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat11.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_20.xyz + u_xlat16_6.xyz;
    u_xlat16_16.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_12.x = (-u_xlat16_84) + u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_84 = u_xlat16_47.z * u_xlat16_84;
    u_xlat16_12.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x + -1.0;
    u_xlat16_12.x = _occlusionScale * u_xlat16_12.x + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_12.x;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_23.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_12.xxx * u_xlat16_25.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati52 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb1 = u_xlat16_93>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_39.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_39.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat16_64 = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * abs(u_xlat16_93);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat0.xzw + u_xlat31.xyz;
    u_xlat1.x = dot(u_xlat16_16.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat27.xxx;
    u_xlat16_64 = dot((-u_xlat16_39.xyz), u_xlat0.xzw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_64) + (-u_xlat16_39.xyz);
    u_xlat27.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xzw);
    u_xlat27.xyz = vec3(u_xlat16_90) * u_xlat27.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(vec3(u_xlat16_93)) * u_xlat2.xyz + u_xlat27.xyz;
    u_xlat16_64 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_38.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat0.xzw);
    u_xlat16_47.y = u_xlat0.x * 0.5;
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat3.y = u_xlat16_38.x;
    u_xlat16_47.x = u_xlat16_38.x * 1.09769487;
    u_xlat16_38.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.xyz = min(max(u_xlat16_38.xyz, 0.0), 1.0);
#else
    u_xlat16_38.xyz = clamp(u_xlat16_38.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_38.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_38.x = u_xlat16_84 + 1.0;
    u_xlat16_38.x = min(u_xlat16_38.x, 15.0);
    u_xlat16_2.x = u_xlat16_38.x * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_38.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_38.xy = u_xlat16_38.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_38.xy).x;
    u_xlat16_84 = u_xlat16_38.z * 15.0 + (-u_xlat16_84);
    u_xlat16_38.x = (-u_xlat16_52) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_12.x * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_12.x + u_xlat16_84;
    u_xlat16_12.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_38.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_38.x + u_xlat16_12.x;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_84, u_xlat16_7.z);
    u_xlat16_12.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_20.xyz;
    u_xlat16_84 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_11.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_11.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_38.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_38.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat81 * u_xlat16_38.x;
    u_xlat16_38.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat16_6.xyz = u_xlat16_38.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat16_38.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_38.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_12.x;
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
  GpuProgramID 67854
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_MultiSpecular_SilkGUI"
}