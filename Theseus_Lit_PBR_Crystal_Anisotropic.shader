//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_Crystal_Anisotropic" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 0.03999999910593033

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 0.20000000298023224

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

_NormalIntensity ("法线强度", Range(0, 2)) = 1.0

[Tex] _AlbedoTex ("基础色贴图", 2D) = "white" { }

_AlbedoColor ("基础色", Color) = (0,0.00546175,0.207547,1)

_InternalUseTwoUV ("内部细节是否启用二套UV", Float) = 0.0

_InternalDetailTex ("内部细节贴图: RG: 法线; BA: 细节;", 2D) = "bump" { }

_InternalDetailColor01 ("第一层内部细节颜色", Color) = (0,0.596079,2,1)

_InternalDetailColor02 ("第二层内部细节颜色", Color) = (0,0.00784314,0.05,1)

_InternalDetailIntensity01 ("第一层内部细节强度", Range(0, 10)) = 5.0

_InternalDetailIntensity02 ("第二层内部细节强度", Range(0, 2)) = 1.100000023841858

_NormalDetailIntensity ("内部法线强度", Range(0, 2)) = 1.5

_InternalDetailOffset ("内部细节偏移", Range(0, 1)) = 1.0

_InternalDetailRotate ("内部细节旋转", Range(0, 360)) = 0.0

_InternalDetailAtten ("内部细节衰减", Range(0.3, 1)) = 0.5

_DirectSpecularColor ("高光颜色", Color) = (0.891509,0.97348,1,1)

_InternalSpecularColor ("内部高光颜色", Color) = (0.140782,0.181006,0.4,1)

_InternalSpecularPower ("内部高光范围", Float) = 1.0

_InternalSpecularIntensity ("内部高光强度", Range(0, 1)) = 0.4000000059604645

_UseBitangent ("使用副切线", Float) = 0.0

_AnisotropyNoise ("各项异性噪波图", 2D) = "black" { }

_AnisotropyMask ("各项异性遮罩图", 2D) = "white" { }

_AnisotropyColor ("主要各项异性高光颜色", Color) = (0,0,0,0)

_AnisotropyIntensity ("主要各项异性高光强度", Float) = 1.0

_AnisotropyRange ("主要各项异性高光范围", Float) = 1.0

_AnisotropyDistort ("主要各项异性高光扭曲", Range(-1, 1)) = 0.5

_AnisotropyOffset ("主要各项异性高光偏移", Range(-1, 1)) = 0.0

_MinorAnisotropyColor ("次要各项异性高光颜色", Color) = (0,0,0,0)

_MinorAnisotropyIntensity ("次要各项异性高光强度", Float) = 1.0

_MinorAnisotropyRange ("次要各项异性高光范围", Float) = 1.0

_MinorAnisotropyDistort ("次要各项异性高光扭曲", Range(-1, 1)) = 0.5

_MinorAnisotropyOffset ("次要各项异性高光偏移", Range(-1, 1)) = 0.0

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_FresnelColor ("菲涅尔颜色", Color) = (0.348,0.677361,1,1)

_FresnelPower ("菲涅尔范围", Range(0, 10)) = 1.5

_FresnelScale ("菲涅尔强度", Float) = 0.5

_RimLightColor ("边缘光颜色", Color) = (0,4.74732,8.47419,1)

_RimLightPower ("边缘光范围", Range(0, 32)) = 16.0

_MatCap ("MatCap贴图", 2D) = "black" { }

_MatCapColor ("MatCap颜色", Color) = (4,4,4,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR_Crystal_Anisotropic"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 4494
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec2 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
int u_xlati38;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
bool u_xlatb61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat67;
float u_xlat69;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb61 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat5.x = u_xlatb61 ? 1.0 : float(0.0);
    u_xlat16_22.xy = (bool(u_xlatb61)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_22.xy = vs_TEXCOORD4.zw * u_xlat5.xx + u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.xy = u_xlat16_6.yy * vs_TEXCOORD7.xy;
    u_xlat5.xy = vs_TEXCOORD6.xy * u_xlat16_6.xx + u_xlat5.xy;
    u_xlat5.xy = vs_TEXCOORD8.xy * u_xlat16_6.zz + u_xlat5.xy;
    u_xlat16_7 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat8 = u_xlat16_7.xxyy * u_xlat5.xyxy + u_xlat16_22.xyxy;
    u_xlat5.xy = u_xlat16_7.zz * u_xlat5.xy + u_xlat16_22.xy;
    u_xlat16_9.x = cos(u_xlat16_7.w);
    u_xlat16_7.x = sin(u_xlat16_7.w);
    u_xlat16_5.xy = texture(_InternalDetailTex, u_xlat5.xy).zw;
    u_xlat16_8 = u_xlat8 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.yx;
    u_xlat16_7.x = u_xlat16_8.x * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.y * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_61 = texture(_InternalDetailTex, u_xlat16_22.xy).z;
    u_xlat16_59 = _InternalDetailRotate * 0.00870000012;
    u_xlat16_7.x = sin(u_xlat16_59);
    u_xlat16_9.x = cos(u_xlat16_59);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.wz;
    u_xlat16_7.x = u_xlat16_8.z * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.w * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_10.xyz = texture(_InternalDetailTex, u_xlat16_22.xy).xyz;
    u_xlat16_59 = u_xlat16_10.z * _InternalDetailAtten;
    u_xlat16_22.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_5.x * _InternalDetailAtten;
    u_xlat16_63 = u_xlat16_5.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _InternalDetailAtten;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat16_59 = u_xlat16_59 * _InternalDetailIntensity01;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_9.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_5.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_59 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat16_11.xyz;
    u_xlat10.x = dot(u_xlat16_11.xyz, vs_TEXCOORD6.xyz);
    u_xlat10.y = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat10.z = dot(u_xlat16_11.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat16_11.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_11.xxx + u_xlat12.xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_11.zzz + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xy = vec2(u_xlat61) * u_xlat12.xy;
    u_xlat16_13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.xyz = texture(_MatCap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_12.zxy * _MatCapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_9.xyz;
    u_xlat57 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat5.x = (-u_xlat61) * u_xlat16_20.x + u_xlat61;
    u_xlat5.x = u_xlat61 * u_xlat5.x + u_xlat16_20.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat61 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat62 = dot(u_xlat16_11.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat14.x = min(u_xlat62, 1.0);
    u_xlat67 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat67;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat5.x * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat5.x;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat69 = (-u_xlat16_39) * u_xlat5.x + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat16.xyz;
    u_xlat5.x = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat69 = min(u_xlat5.x, 1.0);
    u_xlat52 = (-u_xlat69) * u_xlat16_20.x + u_xlat69;
    u_xlat52 = u_xlat69 * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat69 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat67 * u_xlat52;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat71 = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat23 + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat16_20.x / u_xlat72;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat12.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_3.xw = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.www + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat12.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat12.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat16_11.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat12.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat12.x = u_xlat23 * u_xlat12.x + u_xlat16_20.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat23 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat12.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat67;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_3.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_3.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_7.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat10.xyz) * vec3(u_xlat16_59) + vs_TEXCOORD5.xyz;
    u_xlat16_13.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_3.x) + u_xlat16_60;
    u_xlat16_63 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_60 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_3.x;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_6.xyz), u_xlat16_11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat16_11.xyz) * u_xlat16_2.xxx + (-u_xlat16_6.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_6.x = u_xlat16_21.x * 16.0 + u_xlat16_6.z;
    u_xlat16_7.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_6.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40.x + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat16_59) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_21.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat4.xy = u_xlat16_22.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat4.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat4.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_2.xyz = vec3(u_xlat16_58) * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat15.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_58 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_2.xyz = u_xlat0.xxx * _InternalSpecularColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_58 = min(u_xlat62, 1.0);
    u_xlat16_2.x = (-u_xlat62) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_21.x = u_xlat16_58 * _MinorAnisotropyIntensity;
    u_xlat16_58 = u_xlat16_58 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat19.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat19.xxx + u_xlat16_3.xyz;
    u_xlat16_40.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_57 = texture(_AnisotropyNoise, u_xlat16_40.xy).y;
    u_xlat57 = u_xlat16_57 + -0.5;
    u_xlat16_40.x = u_xlat57 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_59 = u_xlat57 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_40.x = inversesqrt(u_xlat16_40.x);
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat15.xyz);
    u_xlat16_40.x = (-u_xlat16_40.x) * u_xlat16_40.x + 1.0;
    u_xlat16_40.x = sqrt(u_xlat16_40.x);
    u_xlat0.x = log2(u_xlat16_40.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_21.x;
    u_xlat16_21.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat15.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat16_21.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_21.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_58 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_58 = exp2(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _FresnelPower;
    u_xlat16_21.x = max(_FresnelScale, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x;
    u_xlat16_1.xyz = vec3(u_xlat16_58) * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec2 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
int u_xlati38;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
bool u_xlatb61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat67;
float u_xlat69;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb61 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat5.x = u_xlatb61 ? 1.0 : float(0.0);
    u_xlat16_22.xy = (bool(u_xlatb61)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_22.xy = vs_TEXCOORD4.zw * u_xlat5.xx + u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.xy = u_xlat16_6.yy * vs_TEXCOORD7.xy;
    u_xlat5.xy = vs_TEXCOORD6.xy * u_xlat16_6.xx + u_xlat5.xy;
    u_xlat5.xy = vs_TEXCOORD8.xy * u_xlat16_6.zz + u_xlat5.xy;
    u_xlat16_7 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat8 = u_xlat16_7.xxyy * u_xlat5.xyxy + u_xlat16_22.xyxy;
    u_xlat5.xy = u_xlat16_7.zz * u_xlat5.xy + u_xlat16_22.xy;
    u_xlat16_9.x = cos(u_xlat16_7.w);
    u_xlat16_7.x = sin(u_xlat16_7.w);
    u_xlat16_5.xy = texture(_InternalDetailTex, u_xlat5.xy).zw;
    u_xlat16_8 = u_xlat8 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.yx;
    u_xlat16_7.x = u_xlat16_8.x * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.y * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_61 = texture(_InternalDetailTex, u_xlat16_22.xy).z;
    u_xlat16_59 = _InternalDetailRotate * 0.00870000012;
    u_xlat16_7.x = sin(u_xlat16_59);
    u_xlat16_9.x = cos(u_xlat16_59);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.wz;
    u_xlat16_7.x = u_xlat16_8.z * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.w * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_10.xyz = texture(_InternalDetailTex, u_xlat16_22.xy).xyz;
    u_xlat16_59 = u_xlat16_10.z * _InternalDetailAtten;
    u_xlat16_22.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_5.x * _InternalDetailAtten;
    u_xlat16_63 = u_xlat16_5.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _InternalDetailAtten;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat16_59 = u_xlat16_59 * _InternalDetailIntensity01;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_9.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_5.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_59 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat16_11.xyz;
    u_xlat10.x = dot(u_xlat16_11.xyz, vs_TEXCOORD6.xyz);
    u_xlat10.y = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat10.z = dot(u_xlat16_11.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat16_11.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_11.xxx + u_xlat12.xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_11.zzz + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xy = vec2(u_xlat61) * u_xlat12.xy;
    u_xlat16_13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.xyz = texture(_MatCap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_12.zxy * _MatCapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_9.xyz;
    u_xlat57 = u_xlat16_9.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat5.x = (-u_xlat61) * u_xlat16_20.x + u_xlat61;
    u_xlat5.x = u_xlat61 * u_xlat5.x + u_xlat16_20.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat61 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat62 = dot(u_xlat16_11.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat14.x = min(u_xlat62, 1.0);
    u_xlat67 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat67;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat5.x * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat5.x;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat69 = (-u_xlat16_39) * u_xlat5.x + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat16.xyz;
    u_xlat5.x = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat69 = min(u_xlat5.x, 1.0);
    u_xlat52 = (-u_xlat69) * u_xlat16_20.x + u_xlat69;
    u_xlat52 = u_xlat69 * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat69 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat67 * u_xlat52;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat71 = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat23 + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat16_20.x / u_xlat72;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat12.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_3.xw = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.www + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat12.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat12.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat16_11.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat12.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat12.x = u_xlat23 * u_xlat12.x + u_xlat16_20.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat23 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat12.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat67;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_3.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_3.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_7.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat10.xyz) * vec3(u_xlat16_59) + vs_TEXCOORD5.xyz;
    u_xlat16_13.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_3.x) + u_xlat16_60;
    u_xlat16_63 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_60 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_3.x;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_6.xyz), u_xlat16_11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat16_11.xyz) * u_xlat16_2.xxx + (-u_xlat16_6.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_6.x = u_xlat16_21.x * 16.0 + u_xlat16_6.z;
    u_xlat16_7.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_6.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40.x + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat16_59) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_21.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat4.xy = u_xlat16_22.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat4.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat4.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_2.xyz = vec3(u_xlat16_58) * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat15.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_58 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_2.xyz = u_xlat0.xxx * _InternalSpecularColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_58 = min(u_xlat62, 1.0);
    u_xlat16_2.x = (-u_xlat62) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_21.x = u_xlat16_58 * _MinorAnisotropyIntensity;
    u_xlat16_58 = u_xlat16_58 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat19.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat19.xxx + u_xlat16_3.xyz;
    u_xlat16_40.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_57 = texture(_AnisotropyNoise, u_xlat16_40.xy).y;
    u_xlat57 = u_xlat16_57 + -0.5;
    u_xlat16_40.x = u_xlat57 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_59 = u_xlat57 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_40.x = inversesqrt(u_xlat16_40.x);
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat15.xyz);
    u_xlat16_40.x = (-u_xlat16_40.x) * u_xlat16_40.x + 1.0;
    u_xlat16_40.x = sqrt(u_xlat16_40.x);
    u_xlat0.x = log2(u_xlat16_40.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_21.x;
    u_xlat16_21.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat15.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat16_21.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_21.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_58 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_58 = exp2(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _FresnelPower;
    u_xlat16_21.x = max(_FresnelScale, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x;
    u_xlat16_1.xyz = vec3(u_xlat16_58) * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_30;
int u_xlati42;
float u_xlat43;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat47;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
mediump vec2 u_xlat16_51;
vec2 u_xlat57;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat78;
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
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat5.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat6.x = dot(u_xlat16_7.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_7.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_7.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat16_7.xxx;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat16_28.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb63)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat63 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat63);
    u_xlat2.x = (-u_xlat63) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat63;
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
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_8.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_8.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_8.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_8.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_30;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_10.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_10.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_9.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat16_28.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_28.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_72) + 1.0;
    u_xlat16_9.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_30 = u_xlat23.x * u_xlat16_9.x;
    u_xlat23.x = (-u_xlat16_9.x) * u_xlat23.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb44 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat65 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat16_9.xz = (bool(u_xlatb44)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_9.xz = vs_TEXCOORD4.zw * vec2(u_xlat65) + u_xlat16_9.xz;
    u_xlat16_9.xz = u_xlat16_9.xz * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat44.xy = u_xlat16_11.yy * vs_TEXCOORD7.xy;
    u_xlat44.xy = vs_TEXCOORD6.xy * u_xlat16_11.xx + u_xlat44.xy;
    u_xlat44.xy = vs_TEXCOORD8.xy * u_xlat16_11.zz + u_xlat44.xy;
    u_xlat16_3 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat4 = u_xlat16_3.xxyy * u_xlat44.xyxy + u_xlat16_9.xzxz;
    u_xlat44.xy = u_xlat16_3.zz * u_xlat44.xy + u_xlat16_9.xz;
    u_xlat16_9.x = sin(u_xlat16_3.w);
    u_xlat16_12.x = cos(u_xlat16_3.w);
    u_xlat16_44.xy = texture(_InternalDetailTex, u_xlat44.xy).zw;
    u_xlat16_3 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_9.xz = u_xlat16_9.xx * u_xlat16_3.yx;
    u_xlat16_13.x = u_xlat16_3.x * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.y * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = texture(_InternalDetailTex, u_xlat16_9.xz).z;
    u_xlat16_9.x = _InternalDetailRotate * 0.00870000012;
    u_xlat16_12.x = cos(u_xlat16_9.x);
    u_xlat16_9.x = sin(u_xlat16_9.x);
    u_xlat16_9.xz = u_xlat16_3.wz * u_xlat16_9.xx;
    u_xlat16_13.x = u_xlat16_3.z * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.w * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_25.xyz = texture(_InternalDetailTex, u_xlat16_9.xz).xyz;
    u_xlat16_9.x = u_xlat16_25.z * _InternalDetailAtten;
    u_xlat16_51.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_9.x;
    u_xlat16_73 = u_xlat16_44.x * _InternalDetailAtten;
    u_xlat16_74 = u_xlat16_44.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _InternalDetailAtten;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_73;
    u_xlat16_9.x = u_xlat16_9.x * _InternalDetailIntensity01;
    u_xlat16_4.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + _InternalDetailColor01.zxy;
    u_xlat16_13.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_28.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_28.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_28.zzz + u_xlat4.xyz;
    u_xlat44.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat44.x = inversesqrt(u_xlat44.x);
    u_xlat44.xy = u_xlat44.xx * u_xlat4.xy;
    u_xlat16_14.xy = u_xlat44.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_4.xyz = texture(_MatCap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.zxy * _MatCapColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_13.xyz;
    u_xlat5.x = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat23.xyz;
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_9.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_9.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat47 = dot(u_xlat16_28.xyz, u_xlat16_11.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat15.x = min(u_xlat47, 1.0);
    u_xlat68 = (-u_xlat15.x) * u_xlat16_9.x + u_xlat15.x;
    u_xlat68 = u_xlat15.x * u_xlat68 + u_xlat16_9.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat26.z = u_xlat68 + u_xlat15.x;
    u_xlat26.xz = u_xlat26.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.z;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat69 = u_xlat16_9.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat69 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_9.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat26.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16.xyz;
    u_xlat16_30 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_30) + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat65;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat26.x = (-u_xlat16_30) * u_xlat65 + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat26.xxx;
    u_xlat17.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat17.xyz;
    u_xlat65 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat26.x = min(u_xlat65, 1.0);
    u_xlat57.x = (-u_xlat26.x) * u_xlat16_9.x + u_xlat26.x;
    u_xlat57.x = u_xlat26.x * u_xlat57.x + u_xlat16_9.x;
    u_xlat57.x = sqrt(u_xlat57.x);
    u_xlat57.x = u_xlat26.x + u_xlat57.x;
    u_xlat57.x = u_xlat57.x + 6.10351563e-05;
    u_xlat57.x = u_xlat26.z * u_xlat57.x;
    u_xlat57.x = float(1.0) / u_xlat57.x;
    u_xlat78 = dot(u_xlat16_28.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat69 + 1.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat16_9.x / u_xlat78;
    u_xlat57.y = u_xlat78 * 0.318309873;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.x * u_xlat57.y;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.zxy;
    u_xlat17.xyz = u_xlat26.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_30 = max(u_xlat16_30, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_30);
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_18.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat16_28.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat69 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_9.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat22 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat22 * u_xlat22;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_73 = u_xlat22 * u_xlat16_71;
    u_xlat22 = (-u_xlat16_71) * u_xlat22 + 1.0;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(u_xlat22);
    u_xlat2.xyz = u_xlat5.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat16_28.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat43 = (-u_xlat22) * u_xlat16_9.x + u_xlat22;
    u_xlat43 = u_xlat22 * u_xlat43 + u_xlat16_9.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat22;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat26.z;
    u_xlat1.z = float(1.0) / u_xlat43;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_30 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30 = float(1.0) / float(u_xlat16_30);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_73;
    u_xlat16_30 = max(u_xlat16_19.x, u_xlat16_30);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat21.yyy + u_xlat16_14.xyz;
    u_xlat16_71 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_71) * u_xlat16_12.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat26.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.yyy * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(u_xlat22) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat6.xyz) * u_xlat16_7.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_28.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = vec3(u_xlat16_71) * u_xlat16_10.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_30 = (-u_xlat16_71) + u_xlat16_30;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_30 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_71;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_19.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_73 = dot((-u_xlat16_11.xyz), u_xlat16_28.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat0.xzw = (-u_xlat16_28.xyz) * vec3(u_xlat16_73) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_28.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28.x = floor(u_xlat16_10.w);
    u_xlat16_49 = u_xlat16_28.x + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_10.x = u_xlat16_49 * 16.0 + u_xlat16_10.z;
    u_xlat16_11.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_28.x * 16.0 + u_xlat16_10.z;
    u_xlat16_10.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_28.x = u_xlat16_28.z * 15.0 + (-u_xlat16_28.x);
    u_xlat16_49 = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_49 + u_xlat16_43;
    u_xlat16_28.x = u_xlat16_30 * u_xlat16_28.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat0.y * 0.5;
    u_xlat16_49 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28.x = u_xlat1.x * u_xlat16_49 + u_xlat16_28.x;
    u_xlat16_49 = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat16_70 = (-u_xlat16_28.x) * 2.0 + 1.0;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_70 + u_xlat16_49;
    u_xlat16_28.x = u_xlat0.y * u_xlat16_28.x;
    u_xlat16_28.x = min(u_xlat16_3.z, u_xlat16_28.x);
    u_xlat1.xyz = u_xlat6.xyz * u_xlat16_7.xxx + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat15.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_71) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xxx * u_xlat16_7.xzw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + u_xlat16_8.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_0.zxy * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_0.zxy * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _EmissiveColor.zxy + u_xlat16_7.xyz;
    u_xlat0.x = dot(u_xlat16_51.xy, u_xlat16_51.xy);
    u_xlat1.xy = u_xlat16_51.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_8.xyz = u_xlat1.xyz * vec3(u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_70 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat21.x;
    u_xlat16_8.xyz = u_xlat0.xxx * _InternalSpecularColor.zxy;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_7.xyz;
    u_xlat16_70 = min(u_xlat47, 1.0);
    u_xlat16_8.x = (-u_xlat47) + 1.0;
    u_xlat16_8.x = log2(abs(u_xlat16_8.x));
    u_xlat16_29.x = u_xlat16_70 * _MinorAnisotropyIntensity;
    u_xlat16_70 = u_xlat16_70 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat21.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat21.xxx + u_xlat16_9.xyz;
    u_xlat16_50.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_63 = texture(_AnisotropyNoise, u_xlat16_50.xy).y;
    u_xlat63 = u_xlat16_63 + -0.5;
    u_xlat16_50.x = u_xlat63 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_71 = u_xlat63 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_9.xyz = vec3(u_xlat16_71) * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_50.x = inversesqrt(u_xlat16_50.x);
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16_10.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
    u_xlat16_50.x = (-u_xlat16_50.x) * u_xlat16_50.x + 1.0;
    u_xlat16_50.x = sqrt(u_xlat16_50.x);
    u_xlat0.x = log2(u_xlat16_50.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_9.xyz = vec3(u_xlat16_72) * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat0.x = log2(u_xlat16_9.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat16_29.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_29.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_29.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(u_xlat65) + u_xlat16_7.xyz;
    u_xlat16_70 = u_xlat16_8.x * _FresnelPower;
    u_xlat16_8.x = u_xlat16_8.x * _RimLightPower;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_70 * _FresnelPower;
    u_xlat16_29.x = max(_FresnelScale, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_29.x;
    u_xlat16_7.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xxx * _RimLightColor.zxy + u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_7.xyz;
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
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_30;
int u_xlati42;
float u_xlat43;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat47;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
mediump vec2 u_xlat16_51;
vec2 u_xlat57;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat78;
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
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat5.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat6.x = dot(u_xlat16_7.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_7.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_7.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat16_7.xxx;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat16_28.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb63)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat63 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat63);
    u_xlat2.x = (-u_xlat63) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat63;
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
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_8.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_8.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_8.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_8.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_30;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_10.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_10.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_9.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat16_28.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_28.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_72) + 1.0;
    u_xlat16_9.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_30 = u_xlat23.x * u_xlat16_9.x;
    u_xlat23.x = (-u_xlat16_9.x) * u_xlat23.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb44 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat65 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat16_9.xz = (bool(u_xlatb44)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_9.xz = vs_TEXCOORD4.zw * vec2(u_xlat65) + u_xlat16_9.xz;
    u_xlat16_9.xz = u_xlat16_9.xz * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat44.xy = u_xlat16_11.yy * vs_TEXCOORD7.xy;
    u_xlat44.xy = vs_TEXCOORD6.xy * u_xlat16_11.xx + u_xlat44.xy;
    u_xlat44.xy = vs_TEXCOORD8.xy * u_xlat16_11.zz + u_xlat44.xy;
    u_xlat16_3 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat4 = u_xlat16_3.xxyy * u_xlat44.xyxy + u_xlat16_9.xzxz;
    u_xlat44.xy = u_xlat16_3.zz * u_xlat44.xy + u_xlat16_9.xz;
    u_xlat16_9.x = sin(u_xlat16_3.w);
    u_xlat16_12.x = cos(u_xlat16_3.w);
    u_xlat16_44.xy = texture(_InternalDetailTex, u_xlat44.xy).zw;
    u_xlat16_3 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_9.xz = u_xlat16_9.xx * u_xlat16_3.yx;
    u_xlat16_13.x = u_xlat16_3.x * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.y * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = texture(_InternalDetailTex, u_xlat16_9.xz).z;
    u_xlat16_9.x = _InternalDetailRotate * 0.00870000012;
    u_xlat16_12.x = cos(u_xlat16_9.x);
    u_xlat16_9.x = sin(u_xlat16_9.x);
    u_xlat16_9.xz = u_xlat16_3.wz * u_xlat16_9.xx;
    u_xlat16_13.x = u_xlat16_3.z * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.w * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_25.xyz = texture(_InternalDetailTex, u_xlat16_9.xz).xyz;
    u_xlat16_9.x = u_xlat16_25.z * _InternalDetailAtten;
    u_xlat16_51.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_9.x;
    u_xlat16_73 = u_xlat16_44.x * _InternalDetailAtten;
    u_xlat16_74 = u_xlat16_44.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _InternalDetailAtten;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_73;
    u_xlat16_9.x = u_xlat16_9.x * _InternalDetailIntensity01;
    u_xlat16_4.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + _InternalDetailColor01.zxy;
    u_xlat16_13.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_28.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_28.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_28.zzz + u_xlat4.xyz;
    u_xlat44.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat44.x = inversesqrt(u_xlat44.x);
    u_xlat44.xy = u_xlat44.xx * u_xlat4.xy;
    u_xlat16_14.xy = u_xlat44.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_4.xyz = texture(_MatCap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.zxy * _MatCapColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_13.xyz;
    u_xlat5.x = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat23.xyz;
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_9.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_9.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat47 = dot(u_xlat16_28.xyz, u_xlat16_11.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat15.x = min(u_xlat47, 1.0);
    u_xlat68 = (-u_xlat15.x) * u_xlat16_9.x + u_xlat15.x;
    u_xlat68 = u_xlat15.x * u_xlat68 + u_xlat16_9.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat26.z = u_xlat68 + u_xlat15.x;
    u_xlat26.xz = u_xlat26.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.z;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat69 = u_xlat16_9.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat69 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_9.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat26.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16.xyz;
    u_xlat16_30 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_30) + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat65;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat26.x = (-u_xlat16_30) * u_xlat65 + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat26.xxx;
    u_xlat17.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat17.xyz;
    u_xlat65 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat26.x = min(u_xlat65, 1.0);
    u_xlat57.x = (-u_xlat26.x) * u_xlat16_9.x + u_xlat26.x;
    u_xlat57.x = u_xlat26.x * u_xlat57.x + u_xlat16_9.x;
    u_xlat57.x = sqrt(u_xlat57.x);
    u_xlat57.x = u_xlat26.x + u_xlat57.x;
    u_xlat57.x = u_xlat57.x + 6.10351563e-05;
    u_xlat57.x = u_xlat26.z * u_xlat57.x;
    u_xlat57.x = float(1.0) / u_xlat57.x;
    u_xlat78 = dot(u_xlat16_28.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat69 + 1.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat16_9.x / u_xlat78;
    u_xlat57.y = u_xlat78 * 0.318309873;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.x * u_xlat57.y;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.zxy;
    u_xlat17.xyz = u_xlat26.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_30 = max(u_xlat16_30, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_30);
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_18.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat16_28.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat69 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_9.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat22 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat22 * u_xlat22;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_73 = u_xlat22 * u_xlat16_71;
    u_xlat22 = (-u_xlat16_71) * u_xlat22 + 1.0;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(u_xlat22);
    u_xlat2.xyz = u_xlat5.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat16_28.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat43 = (-u_xlat22) * u_xlat16_9.x + u_xlat22;
    u_xlat43 = u_xlat22 * u_xlat43 + u_xlat16_9.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat22;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat26.z;
    u_xlat1.z = float(1.0) / u_xlat43;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_30 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30 = float(1.0) / float(u_xlat16_30);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_73;
    u_xlat16_30 = max(u_xlat16_19.x, u_xlat16_30);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat21.yyy + u_xlat16_14.xyz;
    u_xlat16_71 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_71) * u_xlat16_12.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat26.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.yyy * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(u_xlat22) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat6.xyz) * u_xlat16_7.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_28.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = vec3(u_xlat16_71) * u_xlat16_10.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_30 = (-u_xlat16_71) + u_xlat16_30;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_30 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_71;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_19.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_73 = dot((-u_xlat16_11.xyz), u_xlat16_28.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat0.xzw = (-u_xlat16_28.xyz) * vec3(u_xlat16_73) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_28.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28.x = floor(u_xlat16_10.w);
    u_xlat16_49 = u_xlat16_28.x + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_10.x = u_xlat16_49 * 16.0 + u_xlat16_10.z;
    u_xlat16_11.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_28.x * 16.0 + u_xlat16_10.z;
    u_xlat16_10.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_28.x = u_xlat16_28.z * 15.0 + (-u_xlat16_28.x);
    u_xlat16_49 = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_49 + u_xlat16_43;
    u_xlat16_28.x = u_xlat16_30 * u_xlat16_28.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat0.y * 0.5;
    u_xlat16_49 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28.x = u_xlat1.x * u_xlat16_49 + u_xlat16_28.x;
    u_xlat16_49 = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat16_70 = (-u_xlat16_28.x) * 2.0 + 1.0;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_70 + u_xlat16_49;
    u_xlat16_28.x = u_xlat0.y * u_xlat16_28.x;
    u_xlat16_28.x = min(u_xlat16_3.z, u_xlat16_28.x);
    u_xlat1.xyz = u_xlat6.xyz * u_xlat16_7.xxx + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat15.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_71) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xxx * u_xlat16_7.xzw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + u_xlat16_8.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_0.zxy * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_0.zxy * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _EmissiveColor.zxy + u_xlat16_7.xyz;
    u_xlat0.x = dot(u_xlat16_51.xy, u_xlat16_51.xy);
    u_xlat1.xy = u_xlat16_51.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_8.xyz = u_xlat1.xyz * vec3(u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_70 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat21.x;
    u_xlat16_8.xyz = u_xlat0.xxx * _InternalSpecularColor.zxy;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_7.xyz;
    u_xlat16_70 = min(u_xlat47, 1.0);
    u_xlat16_8.x = (-u_xlat47) + 1.0;
    u_xlat16_8.x = log2(abs(u_xlat16_8.x));
    u_xlat16_29.x = u_xlat16_70 * _MinorAnisotropyIntensity;
    u_xlat16_70 = u_xlat16_70 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat21.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat21.xxx + u_xlat16_9.xyz;
    u_xlat16_50.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_63 = texture(_AnisotropyNoise, u_xlat16_50.xy).y;
    u_xlat63 = u_xlat16_63 + -0.5;
    u_xlat16_50.x = u_xlat63 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_71 = u_xlat63 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_9.xyz = vec3(u_xlat16_71) * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_50.x = inversesqrt(u_xlat16_50.x);
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16_10.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
    u_xlat16_50.x = (-u_xlat16_50.x) * u_xlat16_50.x + 1.0;
    u_xlat16_50.x = sqrt(u_xlat16_50.x);
    u_xlat0.x = log2(u_xlat16_50.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_9.xyz = vec3(u_xlat16_72) * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat0.x = log2(u_xlat16_9.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat16_29.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_29.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_29.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(u_xlat65) + u_xlat16_7.xyz;
    u_xlat16_70 = u_xlat16_8.x * _FresnelPower;
    u_xlat16_8.x = u_xlat16_8.x * _RimLightPower;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_70 * _FresnelPower;
    u_xlat16_29.x = max(_FresnelScale, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_29.x;
    u_xlat16_7.xyz = vec3(u_xlat16_70) * _FresnelColor.zxy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xxx * _RimLightColor.zxy + u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_7.xyz;
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
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec2 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
int u_xlati38;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
mediump float u_xlat16_42;
vec2 u_xlat52;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
bool u_xlatb61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat67;
float u_xlat69;
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
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb61 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat5.x = u_xlatb61 ? 1.0 : float(0.0);
    u_xlat16_22.xy = (bool(u_xlatb61)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_22.xy = vs_TEXCOORD4.zw * u_xlat5.xx + u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.xy = u_xlat16_6.yy * vs_TEXCOORD7.xy;
    u_xlat5.xy = vs_TEXCOORD6.xy * u_xlat16_6.xx + u_xlat5.xy;
    u_xlat5.xy = vs_TEXCOORD8.xy * u_xlat16_6.zz + u_xlat5.xy;
    u_xlat16_7 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat8 = u_xlat16_7.xxyy * u_xlat5.xyxy + u_xlat16_22.xyxy;
    u_xlat5.xy = u_xlat16_7.zz * u_xlat5.xy + u_xlat16_22.xy;
    u_xlat16_9.x = cos(u_xlat16_7.w);
    u_xlat16_7.x = sin(u_xlat16_7.w);
    u_xlat16_5.xy = texture(_InternalDetailTex, u_xlat5.xy).zw;
    u_xlat16_8 = u_xlat8 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.yx;
    u_xlat16_7.x = u_xlat16_8.x * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.y * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_61 = texture(_InternalDetailTex, u_xlat16_22.xy).z;
    u_xlat16_59 = _InternalDetailRotate * 0.00870000012;
    u_xlat16_7.x = sin(u_xlat16_59);
    u_xlat16_9.x = cos(u_xlat16_59);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.wz;
    u_xlat16_7.x = u_xlat16_8.z * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.w * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_10.xyz = texture(_InternalDetailTex, u_xlat16_22.xy).xyz;
    u_xlat16_59 = u_xlat16_10.z * _InternalDetailAtten;
    u_xlat16_22.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_5.x * _InternalDetailAtten;
    u_xlat16_63 = u_xlat16_5.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _InternalDetailAtten;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat16_59 = u_xlat16_59 * _InternalDetailIntensity01;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_9.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_5.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_59 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat16_11.xyz;
    u_xlat10.x = dot(u_xlat16_11.xyz, vs_TEXCOORD6.xyz);
    u_xlat10.y = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat10.z = dot(u_xlat16_11.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat16_11.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_11.xxx + u_xlat12.xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_11.zzz + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xy = vec2(u_xlat61) * u_xlat12.xy;
    u_xlat16_13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.xyz = texture(_MatCap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MatCapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_9.xyz;
    u_xlat57 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat5.x = (-u_xlat61) * u_xlat16_20.x + u_xlat61;
    u_xlat5.x = u_xlat61 * u_xlat5.x + u_xlat16_20.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat61 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat62 = dot(u_xlat16_11.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat14.x = min(u_xlat62, 1.0);
    u_xlat67 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat67;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat5.x * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat5.x;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat69 = (-u_xlat16_39) * u_xlat5.x + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat16.xyz;
    u_xlat5.x = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat69 = min(u_xlat5.x, 1.0);
    u_xlat52.x = (-u_xlat69) * u_xlat16_20.x + u_xlat69;
    u_xlat52.x = u_xlat69 * u_xlat52.x + u_xlat16_20.x;
    u_xlat52.x = sqrt(u_xlat52.x);
    u_xlat52.x = u_xlat69 + u_xlat52.x;
    u_xlat52.x = u_xlat52.x + 6.10351563e-05;
    u_xlat52.x = u_xlat67 * u_xlat52.x;
    u_xlat52.x = float(1.0) / u_xlat52.x;
    u_xlat71 = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat23 + 1.0;
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat71 = u_xlat16_20.x / u_xlat71;
    u_xlat52.y = u_xlat71 * 0.318309873;
    u_xlat52.xy = min(u_xlat52.xy, vec2(16.0, 16.0));
    u_xlat52.x = u_xlat52.x * u_xlat52.y;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat52.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat12.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_3.xw = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.www + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat12.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat12.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat16_11.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat12.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat12.x = u_xlat23 * u_xlat12.x + u_xlat16_20.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat23 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat12.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat67;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_3.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_3.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_7.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat10.xyz) * vec3(u_xlat16_59) + vs_TEXCOORD5.xyz;
    u_xlat16_13.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_3.x) + u_xlat16_60;
    u_xlat16_63 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_60 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_3.x;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_6.xyz), u_xlat16_11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat16_11.xyz) * u_xlat16_2.xxx + (-u_xlat16_6.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_6.x = u_xlat16_21.x * 16.0 + u_xlat16_6.z;
    u_xlat16_7.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_6.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40.x + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat16_59) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_21.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat4.xy = u_xlat16_22.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat4.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat4.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_2.xyz = vec3(u_xlat16_58) * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat15.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_58 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_2.xyz = u_xlat0.xxx * _InternalSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_58 = min(u_xlat62, 1.0);
    u_xlat16_2.x = (-u_xlat62) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_21.x = u_xlat16_58 * _MinorAnisotropyIntensity;
    u_xlat16_58 = u_xlat16_58 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat19.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat19.xxx + u_xlat16_3.xyz;
    u_xlat16_40.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_57 = texture(_AnisotropyNoise, u_xlat16_40.xy).y;
    u_xlat57 = u_xlat16_57 + -0.5;
    u_xlat16_40.x = u_xlat57 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_59 = u_xlat57 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_40.x = inversesqrt(u_xlat16_40.x);
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat15.xyz);
    u_xlat16_40.x = (-u_xlat16_40.x) * u_xlat16_40.x + 1.0;
    u_xlat16_40.x = sqrt(u_xlat16_40.x);
    u_xlat0.x = log2(u_xlat16_40.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_21.x;
    u_xlat16_21.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat15.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat16_21.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_21.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_58 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_58 = exp2(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _FresnelPower;
    u_xlat16_21.x = max(_FresnelScale, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x;
    u_xlat16_1.xyz = vec3(u_xlat16_58) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec2 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
int u_xlati38;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
mediump float u_xlat16_42;
vec2 u_xlat52;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
bool u_xlatb61;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat67;
float u_xlat69;
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
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb61 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat5.x = u_xlatb61 ? 1.0 : float(0.0);
    u_xlat16_22.xy = (bool(u_xlatb61)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_22.xy = vs_TEXCOORD4.zw * u_xlat5.xx + u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.xy = u_xlat16_6.yy * vs_TEXCOORD7.xy;
    u_xlat5.xy = vs_TEXCOORD6.xy * u_xlat16_6.xx + u_xlat5.xy;
    u_xlat5.xy = vs_TEXCOORD8.xy * u_xlat16_6.zz + u_xlat5.xy;
    u_xlat16_7 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat8 = u_xlat16_7.xxyy * u_xlat5.xyxy + u_xlat16_22.xyxy;
    u_xlat5.xy = u_xlat16_7.zz * u_xlat5.xy + u_xlat16_22.xy;
    u_xlat16_9.x = cos(u_xlat16_7.w);
    u_xlat16_7.x = sin(u_xlat16_7.w);
    u_xlat16_5.xy = texture(_InternalDetailTex, u_xlat5.xy).zw;
    u_xlat16_8 = u_xlat8 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.yx;
    u_xlat16_7.x = u_xlat16_8.x * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.y * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_61 = texture(_InternalDetailTex, u_xlat16_22.xy).z;
    u_xlat16_59 = _InternalDetailRotate * 0.00870000012;
    u_xlat16_7.x = sin(u_xlat16_59);
    u_xlat16_9.x = cos(u_xlat16_59);
    u_xlat16_22.xy = u_xlat16_7.xx * u_xlat16_8.wz;
    u_xlat16_7.x = u_xlat16_8.z * u_xlat16_9.x + (-u_xlat16_22.x);
    u_xlat16_7.y = u_xlat16_8.w * u_xlat16_9.x + u_xlat16_22.y;
    u_xlat16_22.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_10.xyz = texture(_InternalDetailTex, u_xlat16_22.xy).xyz;
    u_xlat16_59 = u_xlat16_10.z * _InternalDetailAtten;
    u_xlat16_22.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_5.x * _InternalDetailAtten;
    u_xlat16_63 = u_xlat16_5.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _InternalDetailAtten;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat16_59 = u_xlat16_59 * _InternalDetailIntensity01;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_9.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_5.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_59 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat16_11.xyz;
    u_xlat10.x = dot(u_xlat16_11.xyz, vs_TEXCOORD6.xyz);
    u_xlat10.y = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat10.z = dot(u_xlat16_11.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_11.xyz = vec3(u_xlat16_59) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat16_11.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_11.xxx + u_xlat12.xyz;
    u_xlat12.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_11.zzz + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xy = vec2(u_xlat61) * u_xlat12.xy;
    u_xlat16_13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.xyz = texture(_MatCap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MatCapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_9.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_9.xyz;
    u_xlat57 = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat5.x = (-u_xlat61) * u_xlat16_20.x + u_xlat61;
    u_xlat5.x = u_xlat61 * u_xlat5.x + u_xlat16_20.x;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat61 + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat62 = dot(u_xlat16_11.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat14.x = min(u_xlat62, 1.0);
    u_xlat67 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat67;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat5.x * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat5.x;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat69 = (-u_xlat16_39) * u_xlat5.x + 1.0;
    u_xlat16_39 = u_xlat5.x * u_xlat16_39;
    u_xlat16.xyz = u_xlat16_9.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat16.xyz;
    u_xlat5.x = dot(u_xlat16_11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat69 = min(u_xlat5.x, 1.0);
    u_xlat52.x = (-u_xlat69) * u_xlat16_20.x + u_xlat69;
    u_xlat52.x = u_xlat69 * u_xlat52.x + u_xlat16_20.x;
    u_xlat52.x = sqrt(u_xlat52.x);
    u_xlat52.x = u_xlat69 + u_xlat52.x;
    u_xlat52.x = u_xlat52.x + 6.10351563e-05;
    u_xlat52.x = u_xlat67 * u_xlat52.x;
    u_xlat52.x = float(1.0) / u_xlat52.x;
    u_xlat71 = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat23 + 1.0;
    u_xlat71 = u_xlat71 * u_xlat71;
    u_xlat71 = u_xlat16_20.x / u_xlat71;
    u_xlat52.y = u_xlat71 * 0.318309873;
    u_xlat52.xy = min(u_xlat52.xy, vec2(16.0, 16.0));
    u_xlat52.x = u_xlat52.x * u_xlat52.y;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat52.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat12.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_3.xw = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.www + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat12.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat12.xxx;
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat16_11.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat12.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat12.x = u_xlat23 * u_xlat12.x + u_xlat16_20.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat23 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat12.x;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat67;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_3.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_3.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat61) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_7.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat10.xyz) * vec3(u_xlat16_59) + vs_TEXCOORD5.xyz;
    u_xlat16_13.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_3.x) + u_xlat16_60;
    u_xlat16_63 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_60 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_8.w * u_xlat16_3.x;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_6.xyz), u_xlat16_11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat16_11.xyz) * u_xlat16_2.xxx + (-u_xlat16_6.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_6.x = u_xlat16_21.x * 16.0 + u_xlat16_6.z;
    u_xlat16_7.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_6.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40.x + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat16_59) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_21.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat4.xy = u_xlat16_22.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat4.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat4.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_2.xyz = vec3(u_xlat16_58) * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat15.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_58 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat19.x;
    u_xlat16_2.xyz = u_xlat0.xxx * _InternalSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_58 = min(u_xlat62, 1.0);
    u_xlat16_2.x = (-u_xlat62) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_21.x = u_xlat16_58 * _MinorAnisotropyIntensity;
    u_xlat16_58 = u_xlat16_58 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat19.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat19.xxx + u_xlat16_3.xyz;
    u_xlat16_40.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_57 = texture(_AnisotropyNoise, u_xlat16_40.xy).y;
    u_xlat57 = u_xlat16_57 + -0.5;
    u_xlat16_40.x = u_xlat57 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_59 = u_xlat57 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat15.xyz + u_xlat0.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_40.x = inversesqrt(u_xlat16_40.x);
    u_xlat16_6.xyz = u_xlat16_40.xxx * u_xlat16_6.xyz;
    u_xlat16_40.x = dot(u_xlat16_6.xyz, u_xlat15.xyz);
    u_xlat16_40.x = (-u_xlat16_40.x) * u_xlat16_40.x + 1.0;
    u_xlat16_40.x = sqrt(u_xlat16_40.x);
    u_xlat0.x = log2(u_xlat16_40.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_21.x;
    u_xlat16_21.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat15.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_58;
    u_xlat16_21.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_21.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat5.xxx + u_xlat16_1.xyz;
    u_xlat16_58 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_58 = exp2(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _FresnelPower;
    u_xlat16_21.x = max(_FresnelScale, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_21.x;
    u_xlat16_1.xyz = vec3(u_xlat16_58) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_30;
int u_xlati42;
float u_xlat43;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat47;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
mediump vec2 u_xlat16_51;
vec2 u_xlat57;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat78;
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
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat5.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat6.x = dot(u_xlat16_7.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_7.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_7.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat16_7.xxx;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat16_28.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb63)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat63 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat63);
    u_xlat2.x = (-u_xlat63) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat63;
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
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_8.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_8.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_8.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_8.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_30;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_10.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_10.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_9.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat16_28.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_28.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_72) + 1.0;
    u_xlat16_9.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_30 = u_xlat23.x * u_xlat16_9.x;
    u_xlat23.x = (-u_xlat16_9.x) * u_xlat23.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb44 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat65 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat16_9.xz = (bool(u_xlatb44)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_9.xz = vs_TEXCOORD4.zw * vec2(u_xlat65) + u_xlat16_9.xz;
    u_xlat16_9.xz = u_xlat16_9.xz * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat44.xy = u_xlat16_11.yy * vs_TEXCOORD7.xy;
    u_xlat44.xy = vs_TEXCOORD6.xy * u_xlat16_11.xx + u_xlat44.xy;
    u_xlat44.xy = vs_TEXCOORD8.xy * u_xlat16_11.zz + u_xlat44.xy;
    u_xlat16_3 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat4 = u_xlat16_3.xxyy * u_xlat44.xyxy + u_xlat16_9.xzxz;
    u_xlat44.xy = u_xlat16_3.zz * u_xlat44.xy + u_xlat16_9.xz;
    u_xlat16_9.x = sin(u_xlat16_3.w);
    u_xlat16_12.x = cos(u_xlat16_3.w);
    u_xlat16_44.xy = texture(_InternalDetailTex, u_xlat44.xy).zw;
    u_xlat16_3 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_9.xz = u_xlat16_9.xx * u_xlat16_3.yx;
    u_xlat16_13.x = u_xlat16_3.x * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.y * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = texture(_InternalDetailTex, u_xlat16_9.xz).z;
    u_xlat16_9.x = _InternalDetailRotate * 0.00870000012;
    u_xlat16_12.x = cos(u_xlat16_9.x);
    u_xlat16_9.x = sin(u_xlat16_9.x);
    u_xlat16_9.xz = u_xlat16_3.wz * u_xlat16_9.xx;
    u_xlat16_13.x = u_xlat16_3.z * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.w * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_25.xyz = texture(_InternalDetailTex, u_xlat16_9.xz).xyz;
    u_xlat16_9.x = u_xlat16_25.z * _InternalDetailAtten;
    u_xlat16_51.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_9.x;
    u_xlat16_73 = u_xlat16_44.x * _InternalDetailAtten;
    u_xlat16_74 = u_xlat16_44.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _InternalDetailAtten;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_73;
    u_xlat16_9.x = u_xlat16_9.x * _InternalDetailIntensity01;
    u_xlat16_4.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + _InternalDetailColor01.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_28.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_28.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_28.zzz + u_xlat4.xyz;
    u_xlat44.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat44.x = inversesqrt(u_xlat44.x);
    u_xlat44.xy = u_xlat44.xx * u_xlat4.xy;
    u_xlat16_14.xy = u_xlat44.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_4.xyz = texture(_MatCap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MatCapColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_13.xyz;
    u_xlat5.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat23.xyz;
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_9.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_9.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat47 = dot(u_xlat16_28.xyz, u_xlat16_11.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat15.x = min(u_xlat47, 1.0);
    u_xlat68 = (-u_xlat15.x) * u_xlat16_9.x + u_xlat15.x;
    u_xlat68 = u_xlat15.x * u_xlat68 + u_xlat16_9.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat26.z = u_xlat68 + u_xlat15.x;
    u_xlat26.xz = u_xlat26.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.z;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat69 = u_xlat16_9.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat69 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_9.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat26.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16.xyz;
    u_xlat16_30 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_30) + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat65;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat26.x = (-u_xlat16_30) * u_xlat65 + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat26.xxx;
    u_xlat17.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat17.xyz;
    u_xlat65 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat26.x = min(u_xlat65, 1.0);
    u_xlat57.x = (-u_xlat26.x) * u_xlat16_9.x + u_xlat26.x;
    u_xlat57.x = u_xlat26.x * u_xlat57.x + u_xlat16_9.x;
    u_xlat57.x = sqrt(u_xlat57.x);
    u_xlat57.x = u_xlat26.x + u_xlat57.x;
    u_xlat57.x = u_xlat57.x + 6.10351563e-05;
    u_xlat57.x = u_xlat26.z * u_xlat57.x;
    u_xlat57.x = float(1.0) / u_xlat57.x;
    u_xlat78 = dot(u_xlat16_28.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat69 + 1.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat16_9.x / u_xlat78;
    u_xlat57.y = u_xlat78 * 0.318309873;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.x * u_xlat57.y;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = u_xlat26.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_30 = max(u_xlat16_30, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_30);
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_18.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat16_28.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat69 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_9.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat22 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat22 * u_xlat22;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_73 = u_xlat22 * u_xlat16_71;
    u_xlat22 = (-u_xlat16_71) * u_xlat22 + 1.0;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(u_xlat22);
    u_xlat2.xyz = u_xlat5.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat16_28.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat43 = (-u_xlat22) * u_xlat16_9.x + u_xlat22;
    u_xlat43 = u_xlat22 * u_xlat43 + u_xlat16_9.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat22;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat26.z;
    u_xlat1.z = float(1.0) / u_xlat43;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_30 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30 = float(1.0) / float(u_xlat16_30);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_73;
    u_xlat16_30 = max(u_xlat16_19.x, u_xlat16_30);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat21.yyy + u_xlat16_14.xyz;
    u_xlat16_71 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_71) * u_xlat16_12.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat26.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.yyy * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(u_xlat22) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat6.xyz) * u_xlat16_7.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_28.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = vec3(u_xlat16_71) * u_xlat16_10.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_30 = (-u_xlat16_71) + u_xlat16_30;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_30 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_71;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_19.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_73 = dot((-u_xlat16_11.xyz), u_xlat16_28.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat0.xzw = (-u_xlat16_28.xyz) * vec3(u_xlat16_73) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_28.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28.x = floor(u_xlat16_10.w);
    u_xlat16_49 = u_xlat16_28.x + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_10.x = u_xlat16_49 * 16.0 + u_xlat16_10.z;
    u_xlat16_11.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_28.x * 16.0 + u_xlat16_10.z;
    u_xlat16_10.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_28.x = u_xlat16_28.z * 15.0 + (-u_xlat16_28.x);
    u_xlat16_49 = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_49 + u_xlat16_43;
    u_xlat16_28.x = u_xlat16_30 * u_xlat16_28.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat0.y * 0.5;
    u_xlat16_49 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28.x = u_xlat1.x * u_xlat16_49 + u_xlat16_28.x;
    u_xlat16_49 = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat16_70 = (-u_xlat16_28.x) * 2.0 + 1.0;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_70 + u_xlat16_49;
    u_xlat16_28.x = u_xlat0.y * u_xlat16_28.x;
    u_xlat16_28.x = min(u_xlat16_3.z, u_xlat16_28.x);
    u_xlat1.xyz = u_xlat6.xyz * u_xlat16_7.xxx + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat15.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_71) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xxx * u_xlat16_7.xzw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + u_xlat16_8.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _EmissiveColor.xyz + u_xlat16_7.xyz;
    u_xlat0.x = dot(u_xlat16_51.xy, u_xlat16_51.xy);
    u_xlat1.xy = u_xlat16_51.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_8.xyz = u_xlat1.xyz * vec3(u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_70 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat21.x;
    u_xlat16_8.xyz = u_xlat0.xxx * _InternalSpecularColor.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_7.xyz;
    u_xlat16_70 = min(u_xlat47, 1.0);
    u_xlat16_8.x = (-u_xlat47) + 1.0;
    u_xlat16_8.x = log2(abs(u_xlat16_8.x));
    u_xlat16_29.x = u_xlat16_70 * _MinorAnisotropyIntensity;
    u_xlat16_70 = u_xlat16_70 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat21.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat21.xxx + u_xlat16_9.xyz;
    u_xlat16_50.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_63 = texture(_AnisotropyNoise, u_xlat16_50.xy).y;
    u_xlat63 = u_xlat16_63 + -0.5;
    u_xlat16_50.x = u_xlat63 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_71 = u_xlat63 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_9.xyz = vec3(u_xlat16_71) * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_50.x = inversesqrt(u_xlat16_50.x);
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16_10.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
    u_xlat16_50.x = (-u_xlat16_50.x) * u_xlat16_50.x + 1.0;
    u_xlat16_50.x = sqrt(u_xlat16_50.x);
    u_xlat0.x = log2(u_xlat16_50.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_9.xyz = vec3(u_xlat16_72) * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat0.x = log2(u_xlat16_9.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat16_29.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_29.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_29.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(u_xlat65) + u_xlat16_7.xyz;
    u_xlat16_70 = u_xlat16_8.x * _FresnelPower;
    u_xlat16_8.x = u_xlat16_8.x * _RimLightPower;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_70 * _FresnelPower;
    u_xlat16_29.x = max(_FresnelScale, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_29.x;
    u_xlat16_7.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xxx * _RimLightColor.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	float _InternalUseTwoUV;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity01;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump float _InternalDetailOffset;
uniform 	mediump float _InternalDetailRotate;
uniform 	mediump float _InternalDetailAtten;
uniform 	mediump vec4 _InternalSpecularColor;
uniform 	mediump float _InternalSpecularPower;
uniform 	mediump float _InternalSpecularIntensity;
uniform 	mediump float _NormalDetailIntensity;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_30;
int u_xlati42;
float u_xlat43;
mediump float u_xlat16_43;
vec2 u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat47;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
mediump vec2 u_xlat16_51;
vec2 u_xlat57;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat78;
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
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat5.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat6.x = dot(u_xlat16_7.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_7.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_7.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_7.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat16_7.xxx;
    u_xlat5.x = dot(u_xlat16_28.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat16_28.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb63)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat63 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat63) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat63);
    u_xlat2.x = (-u_xlat63) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat63;
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
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_8.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_8.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_8.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_8.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_8.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_30;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_10.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_10.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_9.xyz;
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat16_28.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_28.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_72) + 1.0;
    u_xlat16_9.x = u_xlat23.x * u_xlat23.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat23.x * u_xlat16_9.x;
    u_xlat16_30 = u_xlat23.x * u_xlat16_9.x;
    u_xlat23.x = (-u_xlat16_9.x) * u_xlat23.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(_InternalUseTwoUV>=0.5);
#else
    u_xlatb44 = _InternalUseTwoUV>=0.5;
#endif
    u_xlat65 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat16_9.xz = (bool(u_xlatb44)) ? vec2(0.0, 0.0) : vs_TEXCOORD4.xy;
    u_xlat16_9.xz = vs_TEXCOORD4.zw * vec2(u_xlat65) + u_xlat16_9.xz;
    u_xlat16_9.xz = u_xlat16_9.xz * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat44.xy = u_xlat16_11.yy * vs_TEXCOORD7.xy;
    u_xlat44.xy = vs_TEXCOORD6.xy * u_xlat16_11.xx + u_xlat44.xy;
    u_xlat44.xy = vs_TEXCOORD8.xy * u_xlat16_11.zz + u_xlat44.xy;
    u_xlat16_3 = vec4(_InternalDetailOffset, _InternalDetailOffset, _InternalDetailOffset, _InternalDetailRotate) * vec4(-0.100000001, -0.200000003, -0.300000012, 0.0174000002);
    u_xlat4 = u_xlat16_3.xxyy * u_xlat44.xyxy + u_xlat16_9.xzxz;
    u_xlat44.xy = u_xlat16_3.zz * u_xlat44.xy + u_xlat16_9.xz;
    u_xlat16_9.x = sin(u_xlat16_3.w);
    u_xlat16_12.x = cos(u_xlat16_3.w);
    u_xlat16_44.xy = texture(_InternalDetailTex, u_xlat44.xy).zw;
    u_xlat16_3 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_9.xz = u_xlat16_9.xx * u_xlat16_3.yx;
    u_xlat16_13.x = u_xlat16_3.x * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.y * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = texture(_InternalDetailTex, u_xlat16_9.xz).z;
    u_xlat16_9.x = _InternalDetailRotate * 0.00870000012;
    u_xlat16_12.x = cos(u_xlat16_9.x);
    u_xlat16_9.x = sin(u_xlat16_9.x);
    u_xlat16_9.xz = u_xlat16_3.wz * u_xlat16_9.xx;
    u_xlat16_13.x = u_xlat16_3.z * u_xlat16_12.x + (-u_xlat16_9.x);
    u_xlat16_13.y = u_xlat16_3.w * u_xlat16_12.x + u_xlat16_9.z;
    u_xlat16_9.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_25.xyz = texture(_InternalDetailTex, u_xlat16_9.xz).xyz;
    u_xlat16_9.x = u_xlat16_25.z * _InternalDetailAtten;
    u_xlat16_51.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_9.x;
    u_xlat16_73 = u_xlat16_44.x * _InternalDetailAtten;
    u_xlat16_74 = u_xlat16_44.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _InternalDetailAtten;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_73;
    u_xlat16_9.x = u_xlat16_9.x * _InternalDetailIntensity01;
    u_xlat16_4.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + _InternalDetailColor01.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_28.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_28.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_28.zzz + u_xlat4.xyz;
    u_xlat44.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat44.x = inversesqrt(u_xlat44.x);
    u_xlat44.xy = u_xlat44.xx * u_xlat4.xy;
    u_xlat16_14.xy = u_xlat44.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_4.xyz = texture(_MatCap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MatCapColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat23.xyz = u_xlat23.xxx * u_xlat16_13.xyz;
    u_xlat5.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat23.xyz;
    u_xlat16_9.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_9.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_9.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat47 = dot(u_xlat16_28.xyz, u_xlat16_11.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat15.x = min(u_xlat47, 1.0);
    u_xlat68 = (-u_xlat15.x) * u_xlat16_9.x + u_xlat15.x;
    u_xlat68 = u_xlat15.x * u_xlat68 + u_xlat16_9.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat26.z = u_xlat68 + u_xlat15.x;
    u_xlat26.xz = u_xlat26.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.z;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat69 = u_xlat16_9.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat69 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_9.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat26.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat64) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat65) * u_xlat16.xyz;
    u_xlat16_30 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_30) + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat65;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat26.x = (-u_xlat16_30) * u_xlat65 + 1.0;
    u_xlat16_30 = u_xlat65 * u_xlat16_30;
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat26.xxx;
    u_xlat17.xyz = u_xlat5.xxx * vec3(u_xlat16_30) + u_xlat17.xyz;
    u_xlat65 = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat26.x = min(u_xlat65, 1.0);
    u_xlat57.x = (-u_xlat26.x) * u_xlat16_9.x + u_xlat26.x;
    u_xlat57.x = u_xlat26.x * u_xlat57.x + u_xlat16_9.x;
    u_xlat57.x = sqrt(u_xlat57.x);
    u_xlat57.x = u_xlat26.x + u_xlat57.x;
    u_xlat57.x = u_xlat57.x + 6.10351563e-05;
    u_xlat57.x = u_xlat26.z * u_xlat57.x;
    u_xlat57.x = float(1.0) / u_xlat57.x;
    u_xlat78 = dot(u_xlat16_28.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat69 + 1.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat16_9.x / u_xlat78;
    u_xlat57.y = u_xlat78 * 0.318309873;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.x * u_xlat57.y;
    u_xlat17.xyz = u_xlat17.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = u_xlat26.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat16_8.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_30 = max(u_xlat16_30, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_30);
    u_xlat16_18.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_71) + u_xlat16_18.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat16_28.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat69 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_9.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat22 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat22 * u_xlat22;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_71 = u_xlat22 * u_xlat16_71;
    u_xlat16_73 = u_xlat22 * u_xlat16_71;
    u_xlat22 = (-u_xlat16_71) * u_xlat22 + 1.0;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(u_xlat22);
    u_xlat2.xyz = u_xlat5.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat16_28.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat43 = (-u_xlat22) * u_xlat16_9.x + u_xlat22;
    u_xlat43 = u_xlat22 * u_xlat43 + u_xlat16_9.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat22;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat26.z;
    u_xlat1.z = float(1.0) / u_xlat43;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_30 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_30 = float(1.0) / float(u_xlat16_30);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_73;
    u_xlat16_30 = max(u_xlat16_19.x, u_xlat16_30);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat21.yyy + u_xlat16_14.xyz;
    u_xlat16_71 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_71) * u_xlat16_12.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat64) * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat26.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_10.xyz = u_xlat21.yyy * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(u_xlat22) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat6.xyz) * u_xlat16_7.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_28.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_10.xyz = vec3(u_xlat16_71) * u_xlat16_10.xyz;
    u_xlat16_71 = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_30 = (-u_xlat16_71) + u_xlat16_30;
    u_xlat16_73 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_30 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_4.w * u_xlat16_71;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_30;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_30) * u_xlat16_19.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_73 = dot((-u_xlat16_11.xyz), u_xlat16_28.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat0.xzw = (-u_xlat16_28.xyz) * vec3(u_xlat16_73) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_28.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28.x = floor(u_xlat16_10.w);
    u_xlat16_49 = u_xlat16_28.x + 1.0;
    u_xlat16_49 = min(u_xlat16_49, 15.0);
    u_xlat16_10.x = u_xlat16_49 * 16.0 + u_xlat16_10.z;
    u_xlat16_11.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_28.x * 16.0 + u_xlat16_10.z;
    u_xlat16_10.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_28.x = u_xlat16_28.z * 15.0 + (-u_xlat16_28.x);
    u_xlat16_49 = (-u_xlat16_43) + u_xlat16_22;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_49 + u_xlat16_43;
    u_xlat16_28.x = u_xlat16_30 * u_xlat16_28.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat0.y * 0.5;
    u_xlat16_49 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28.x = u_xlat1.x * u_xlat16_49 + u_xlat16_28.x;
    u_xlat16_49 = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat16_70 = (-u_xlat16_28.x) * 2.0 + 1.0;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_70 + u_xlat16_49;
    u_xlat16_28.x = u_xlat0.y * u_xlat16_28.x;
    u_xlat16_28.x = min(u_xlat16_3.z, u_xlat16_28.x);
    u_xlat1.xyz = u_xlat6.xyz * u_xlat16_7.xxx + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat15.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_71) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb0)) ? u_xlat16_11.xyz : u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xxx * u_xlat16_7.xzw;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + u_xlat16_8.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _EmissiveColor.xyz + u_xlat16_7.xyz;
    u_xlat0.x = dot(u_xlat16_51.xy, u_xlat16_51.xy);
    u_xlat1.xy = u_xlat16_51.xy * vec2(vec2(_NormalDetailIntensity, _NormalDetailIntensity));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.z = max(u_xlat0.x, 1.00000002e-16);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_8.xyz = u_xlat1.xyz * vec3(u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_70 = _InternalSpecularPower * 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _InternalSpecularIntensity + -0.300000012;
    u_xlat0.x = u_xlat0.x * 2.50000024;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat21.x;
    u_xlat16_8.xyz = u_xlat0.xxx * _InternalSpecularColor.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_7.xyz;
    u_xlat16_70 = min(u_xlat47, 1.0);
    u_xlat16_8.x = (-u_xlat47) + 1.0;
    u_xlat16_8.x = log2(abs(u_xlat16_8.x));
    u_xlat16_29.x = u_xlat16_70 * _MinorAnisotropyIntensity;
    u_xlat16_70 = u_xlat16_70 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat21.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat21.xxx + u_xlat16_9.xyz;
    u_xlat16_50.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_63 = texture(_AnisotropyNoise, u_xlat16_50.xy).y;
    u_xlat63 = u_xlat16_63 + -0.5;
    u_xlat16_50.x = u_xlat63 * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_71 = u_xlat63 * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_9.xyz = vec3(u_xlat16_71) * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16.xyz + u_xlat0.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_50.x = inversesqrt(u_xlat16_50.x);
    u_xlat16_10.xyz = u_xlat16_50.xxx * u_xlat16_10.xyz;
    u_xlat16_50.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
    u_xlat16_50.x = (-u_xlat16_50.x) * u_xlat16_50.x + 1.0;
    u_xlat16_50.x = sqrt(u_xlat16_50.x);
    u_xlat0.x = log2(u_xlat16_50.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat16_29.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_9.xyz = vec3(u_xlat16_72) * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat0.x = log2(u_xlat16_9.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat16_29.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_29.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_29.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(u_xlat65) + u_xlat16_7.xyz;
    u_xlat16_70 = u_xlat16_8.x * _FresnelPower;
    u_xlat16_8.x = u_xlat16_8.x * _RimLightPower;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_70 = exp2(u_xlat16_70);
    u_xlat16_70 = u_xlat16_70 * _FresnelPower;
    u_xlat16_29.x = max(_FresnelScale, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_29.x;
    u_xlat16_7.xyz = vec3(u_xlat16_70) * _FresnelColor.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xxx * _RimLightColor.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat16_32;
float u_xlat45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_0.xy = texture(_InternalDetailTex, u_xlat16_3.xy).zw;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_46;
    u_xlat16_47 = u_xlat16_0.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_4.xyz + _InternalDetailColor01.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_46 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat16_5.xyz;
    u_xlat6.x = dot(u_xlat16_5.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_5.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_5.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_5.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_5.zzz + u_xlat7.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat7.xy = vec2(u_xlat45) * u_xlat7.xy;
    u_xlat16_8.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.zxy * _MatCapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_47 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat45 = dot(u_xlat16_5.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat45 = dot(u_xlat16_5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat51 = min(u_xlat45, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat51) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17.x = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_32.xxx * u_xlat7.xzw;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat16_32.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_32.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_32.yyy + u_xlat16_9.xyz;
    u_xlat16_47 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_8.xyz);
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_47);
    u_xlat16_47 = u_xlat16_17.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_47 = (-u_xlat16_47) * u_xlat16_47 + 1.0;
    u_xlat16_47 = max(u_xlat16_47, 0.0);
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_17.x = u_xlat16_47 * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_32.x, u_xlat16_17.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_17.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat7.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_17.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat16_17.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat7.xyz;
    u_xlat15 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = vec3(u_xlat15) * u_xlat10.xyz;
    u_xlat16_17.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat16_17.x) + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat15;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat52 = (-u_xlat16_17.x) * u_xlat15 + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat52);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat16_17.xxx + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat11.x = min(u_xlat0.x, 1.0);
    u_xlat16_17.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat15 = (-u_xlat11.x) * u_xlat16_17.x + u_xlat11.x;
    u_xlat15 = u_xlat11.x * u_xlat15 + u_xlat16_17.x;
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = u_xlat15 + 6.10351563e-05;
    u_xlat52 = (-u_xlat51) * u_xlat16_17.x + u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat52 + u_xlat16_17.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat51 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = min(u_xlat15, 16.0);
    u_xlat52 = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat55 = u_xlat16_17.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat55 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_17.x / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat15);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_46) + vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_12.xyz + u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_12.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_48) + u_xlat16_49;
    u_xlat16_50 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_50 + 1.0;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_49 + u_xlat16_48;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat15 = min(u_xlat16_48, 1.0);
    u_xlat51 = min(u_xlat15, u_xlat16_0.z);
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati52 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_48 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat16_5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat10.xyz = (-u_xlat16_5.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat51 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_5.w);
    u_xlat16_47 = u_xlat16_32.x + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_5.x = u_xlat16_47 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_32.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32.x = u_xlat16_4.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_47 = u_xlat16_52 + (-u_xlat16_55);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_47 + u_xlat16_55;
    u_xlat16_32.x = u_xlat16_49 * u_xlat16_32.x;
    u_xlat51 = u_xlat51 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat15 * 0.5;
    u_xlat16_47 = (-u_xlat15) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat51 * u_xlat16_47 + u_xlat16_32.x;
    u_xlat16_47 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_4.x = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_4.x + u_xlat16_47;
    u_xlat16_32.x = u_xlat15 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_0.z, u_xlat16_32.x);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_46) + (-u_xlat10.xyz);
    u_xlat6.xyz = u_xlat16_17.xxx * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_15.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyw = u_xlat16_3.xyz * u_xlat16_15.xxx + u_xlat16_15.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_46);
    u_xlat16_3.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb15 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_6.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_46 = min(u_xlat0.x, 1.0);
    u_xlat16_2.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_17.x = u_xlat16_46 * _MinorAnisotropyIntensity;
    u_xlat16_46 = u_xlat16_46 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat15 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(u_xlat15) + u_xlat16_3.xyz;
    u_xlat16_32.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_6.x = texture(_AnisotropyNoise, u_xlat16_32.xy).y;
    u_xlat6.x = u_xlat16_6.x + -0.5;
    u_xlat16_32.x = u_xlat6.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_47 = u_xlat6.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32.x = inversesqrt(u_xlat16_32.x);
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat16_5.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = sqrt(u_xlat16_32.x);
    u_xlat0.x = log2(u_xlat16_32.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17.x;
    u_xlat16_17.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_3.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_46;
    u_xlat16_17.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_17.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_17.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * vec3(u_xlat45) + u_xlat16_1.xyz;
    u_xlat16_46 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_46 = exp2(u_xlat16_46);
    u_xlat16_46 = u_xlat16_46 * _FresnelPower;
    u_xlat16_17.x = max(_FresnelScale, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x;
    u_xlat16_1.xyz = vec3(u_xlat16_46) * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_15.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat16_32;
float u_xlat45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_0.xy = texture(_InternalDetailTex, u_xlat16_3.xy).zw;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_46;
    u_xlat16_47 = u_xlat16_0.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_4.xyz + _InternalDetailColor01.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_46 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat16_5.xyz;
    u_xlat6.x = dot(u_xlat16_5.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_5.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_5.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_5.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_5.zzz + u_xlat7.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat7.xy = vec2(u_xlat45) * u_xlat7.xy;
    u_xlat16_8.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.zxy * _MatCapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_47 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat45 = dot(u_xlat16_5.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat45 = dot(u_xlat16_5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat51 = min(u_xlat45, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat51) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17.x = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_32.xxx * u_xlat7.xzw;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat16_32.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_32.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_32.yyy + u_xlat16_9.xyz;
    u_xlat16_47 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_8.xyz);
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_47);
    u_xlat16_47 = u_xlat16_17.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_47 = (-u_xlat16_47) * u_xlat16_47 + 1.0;
    u_xlat16_47 = max(u_xlat16_47, 0.0);
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_17.x = u_xlat16_47 * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_32.x, u_xlat16_17.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_17.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat7.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_17.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat16_17.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat7.xyz;
    u_xlat15 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = vec3(u_xlat15) * u_xlat10.xyz;
    u_xlat16_17.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat16_17.x) + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat15;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat52 = (-u_xlat16_17.x) * u_xlat15 + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat52);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat16_17.xxx + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat11.x = min(u_xlat0.x, 1.0);
    u_xlat16_17.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat15 = (-u_xlat11.x) * u_xlat16_17.x + u_xlat11.x;
    u_xlat15 = u_xlat11.x * u_xlat15 + u_xlat16_17.x;
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = u_xlat15 + 6.10351563e-05;
    u_xlat52 = (-u_xlat51) * u_xlat16_17.x + u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat52 + u_xlat16_17.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat51 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = min(u_xlat15, 16.0);
    u_xlat52 = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat55 = u_xlat16_17.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat55 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_17.x / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat15);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_46) + vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_12.xyz + u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_12.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_48) + u_xlat16_49;
    u_xlat16_50 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_50 + 1.0;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_49 + u_xlat16_48;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat15 = min(u_xlat16_48, 1.0);
    u_xlat51 = min(u_xlat15, u_xlat16_0.z);
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati52 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_48 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat16_5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat10.xyz = (-u_xlat16_5.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat51 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_5.w);
    u_xlat16_47 = u_xlat16_32.x + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_5.x = u_xlat16_47 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_32.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32.x = u_xlat16_4.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_47 = u_xlat16_52 + (-u_xlat16_55);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_47 + u_xlat16_55;
    u_xlat16_32.x = u_xlat16_49 * u_xlat16_32.x;
    u_xlat51 = u_xlat51 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat15 * 0.5;
    u_xlat16_47 = (-u_xlat15) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat51 * u_xlat16_47 + u_xlat16_32.x;
    u_xlat16_47 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_4.x = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_4.x + u_xlat16_47;
    u_xlat16_32.x = u_xlat15 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_0.z, u_xlat16_32.x);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_46) + (-u_xlat10.xyz);
    u_xlat6.xyz = u_xlat16_17.xxx * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_15.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyw = u_xlat16_3.xyz * u_xlat16_15.xxx + u_xlat16_15.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_46);
    u_xlat16_3.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb15 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_6.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_46 = min(u_xlat0.x, 1.0);
    u_xlat16_2.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_17.x = u_xlat16_46 * _MinorAnisotropyIntensity;
    u_xlat16_46 = u_xlat16_46 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat15 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(u_xlat15) + u_xlat16_3.xyz;
    u_xlat16_32.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_6.x = texture(_AnisotropyNoise, u_xlat16_32.xy).y;
    u_xlat6.x = u_xlat16_6.x + -0.5;
    u_xlat16_32.x = u_xlat6.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_47 = u_xlat6.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32.x = inversesqrt(u_xlat16_32.x);
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat16_5.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = sqrt(u_xlat16_32.x);
    u_xlat0.x = log2(u_xlat16_32.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17.x;
    u_xlat16_17.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_3.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_46;
    u_xlat16_17.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_17.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_17.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * vec3(u_xlat45) + u_xlat16_1.xyz;
    u_xlat16_46 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_46 = exp2(u_xlat16_46);
    u_xlat16_46 = u_xlat16_46 * _FresnelPower;
    u_xlat16_17.x = max(_FresnelScale, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x;
    u_xlat16_1.xyz = vec3(u_xlat16_46) * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_15.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
vec3 u_xlat19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
float u_xlat45;
float u_xlat46;
int u_xlati46;
bool u_xlatb46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
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
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat5.x = dot(u_xlat16_6.xyz, vs_TEXCOORD6.xyz);
    u_xlat5.y = dot(u_xlat16_6.xyz, vs_TEXCOORD7.xyz);
    u_xlat5.z = dot(u_xlat16_6.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_6.xxx;
    u_xlat19.x = dot(u_xlat16_21.xyz, u_xlat19.xyz);
    u_xlat19.x = (-u_xlat19.x) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat16_21.xyz) * u_xlat19.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat16 = (-u_xlat1.x) + u_xlat16;
    u_xlat0.z = _ShadowBias.y * u_xlat16 + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat15.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_15.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_7.x = u_xlat16_15.z * _shadowStrength;
    u_xlat15.xy = u_xlat16_15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_8.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_1.xy = texture(_InternalDetailTex, u_xlat16_8.xy).zw;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_52;
    u_xlat16_8.x = u_xlat16_1.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_1.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_1.zxy * u_xlat16_23.xyz;
    u_xlat16_9.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_23.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_9.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_21.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_21.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_21.zzz + u_xlat2.xyz;
    u_xlat46 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xy = vec2(u_xlat46) * u_xlat2.xy;
    u_xlat16_10.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_MatCap, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.zxy * _MatCapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat46 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
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
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz;
    u_xlat15.x = dot(u_xlat16_21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat46 = min(u_xlat15.x, 1.0);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyz);
    u_xlat2.x = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.yyy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat30 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_52);
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat1.x;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16 = (-u_xlat16_52) * u_xlat1.x + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat4.xyz = u_xlat16_8.xyz * vec3(u_xlat16);
    u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat16_52) + u_xlat4.xyz;
    u_xlat30 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat1.x = min(u_xlat30, 1.0);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat48 = (-u_xlat1.x) * u_xlat16_52 + u_xlat1.x;
    u_xlat48 = u_xlat1.x * u_xlat48 + u_xlat16_52;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat1.x + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat49 = (-u_xlat46) * u_xlat16_52 + u_xlat46;
    u_xlat49 = u_xlat46 * u_xlat49 + u_xlat16_52;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat46 + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat49 = dot(u_xlat16_21.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat50 = u_xlat16_52 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat50 + 1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat16_52 / u_xlat49;
    u_xlat49 = u_xlat49 * 0.318309873;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * u_xlat16_6.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_53));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_21.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat4.xyz = (-u_xlat16_21.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat16_21.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_6.xxx + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_6.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat1.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat1.xyw = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat1.xyw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_2.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_21.x = u_xlat16_6.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_2.x = u_xlat16_21.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_16 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_6.x = u_xlat16_21.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_21.x = (-u_xlat16_16) + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21.x + u_xlat16_16;
    u_xlat16_6.x = u_xlat16_54 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.w * 0.5;
    u_xlat16_21.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_21.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_36 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_36 + u_xlat16_21.x;
    u_xlat16_6.x = u_xlat0.w * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_1.z, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_51 = min(u_xlat30, 1.0);
    u_xlat16_7.x = (-u_xlat30) + 1.0;
    u_xlat16_7.x = log2(abs(u_xlat16_7.x));
    u_xlat16_22.x = u_xlat16_51 * _MinorAnisotropyIntensity;
    u_xlat16_51 = u_xlat16_51 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat30 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xzw = vs_TEXCOORD3.xyz * vec3(u_xlat30) + u_xlat16_8.xyz;
    u_xlat16_37.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_1.x = texture(_AnisotropyNoise, u_xlat16_37.xy).y;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat16_37.x = u_xlat1.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_52 = u_xlat1.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat16_10.xyz;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = sqrt(u_xlat16_37.x);
    u_xlat0.x = log2(u_xlat16_37.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22.x;
    u_xlat16_22.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_53 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat0.x = log2(u_xlat16_8.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_51;
    u_xlat16_22.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_22.xyz;
    u_xlat16_0 = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_0) * u_xlat16_22.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat15.xxx + u_xlat16_6.xyz;
    u_xlat16_51 = u_xlat16_7.x * _FresnelPower;
    u_xlat16_7.x = u_xlat16_7.x * _RimLightPower;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _FresnelPower;
    u_xlat16_22.x = max(_FresnelScale, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_22.x;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _FresnelColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * _RimLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_6.xyz;
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
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_15.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
vec3 u_xlat19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
float u_xlat45;
float u_xlat46;
int u_xlati46;
bool u_xlatb46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
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
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat5.x = dot(u_xlat16_6.xyz, vs_TEXCOORD6.xyz);
    u_xlat5.y = dot(u_xlat16_6.xyz, vs_TEXCOORD7.xyz);
    u_xlat5.z = dot(u_xlat16_6.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_6.xxx;
    u_xlat19.x = dot(u_xlat16_21.xyz, u_xlat19.xyz);
    u_xlat19.x = (-u_xlat19.x) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat16_21.xyz) * u_xlat19.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat16 = (-u_xlat1.x) + u_xlat16;
    u_xlat0.z = _ShadowBias.y * u_xlat16 + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat15.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_15.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_7.x = u_xlat16_15.z * _shadowStrength;
    u_xlat15.xy = u_xlat16_15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_8.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_1.xy = texture(_InternalDetailTex, u_xlat16_8.xy).zw;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_52;
    u_xlat16_8.x = u_xlat16_1.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_1.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_1.zxy * u_xlat16_23.xyz;
    u_xlat16_9.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_23.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.zxy;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.zxy;
    u_xlat16_9.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_21.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_21.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_21.zzz + u_xlat2.xyz;
    u_xlat46 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xy = vec2(u_xlat46) * u_xlat2.xy;
    u_xlat16_10.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_MatCap, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.zxy * _MatCapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat46 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
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
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz;
    u_xlat15.x = dot(u_xlat16_21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat46 = min(u_xlat15.x, 1.0);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyz);
    u_xlat2.x = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.yyy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat30 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_52);
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat1.x;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16 = (-u_xlat16_52) * u_xlat1.x + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat4.xyz = u_xlat16_8.xyz * vec3(u_xlat16);
    u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat16_52) + u_xlat4.xyz;
    u_xlat30 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat1.x = min(u_xlat30, 1.0);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat48 = (-u_xlat1.x) * u_xlat16_52 + u_xlat1.x;
    u_xlat48 = u_xlat1.x * u_xlat48 + u_xlat16_52;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat1.x + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat49 = (-u_xlat46) * u_xlat16_52 + u_xlat46;
    u_xlat49 = u_xlat46 * u_xlat49 + u_xlat16_52;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat46 + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat49 = dot(u_xlat16_21.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat50 = u_xlat16_52 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat50 + 1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat16_52 / u_xlat49;
    u_xlat49 = u_xlat49 * 0.318309873;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * u_xlat16_6.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_53));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_21.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat4.xyz = (-u_xlat16_21.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat16_21.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_6.xxx + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_6.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat1.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat1.xyw = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat1.xyw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_2.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_21.x = u_xlat16_6.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_2.x = u_xlat16_21.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_16 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_6.x = u_xlat16_21.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_21.x = (-u_xlat16_16) + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21.x + u_xlat16_16;
    u_xlat16_6.x = u_xlat16_54 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.w * 0.5;
    u_xlat16_21.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_21.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_36 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_36 + u_xlat16_21.x;
    u_xlat16_6.x = u_xlat0.w * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_1.z, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_51 = min(u_xlat30, 1.0);
    u_xlat16_7.x = (-u_xlat30) + 1.0;
    u_xlat16_7.x = log2(abs(u_xlat16_7.x));
    u_xlat16_22.x = u_xlat16_51 * _MinorAnisotropyIntensity;
    u_xlat16_51 = u_xlat16_51 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat30 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xzw = vs_TEXCOORD3.xyz * vec3(u_xlat30) + u_xlat16_8.xyz;
    u_xlat16_37.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_1.x = texture(_AnisotropyNoise, u_xlat16_37.xy).y;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat16_37.x = u_xlat1.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_52 = u_xlat1.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat16_10.xyz;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = sqrt(u_xlat16_37.x);
    u_xlat0.x = log2(u_xlat16_37.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22.x;
    u_xlat16_22.xyz = u_xlat0.xxx * _MinorAnisotropyColor.zxy;
    u_xlat16_53 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat0.x = log2(u_xlat16_8.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_51;
    u_xlat16_22.xyz = u_xlat0.xxx * _AnisotropyColor.zxy + u_xlat16_22.xyz;
    u_xlat16_0 = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_0) * u_xlat16_22.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat15.xxx + u_xlat16_6.xyz;
    u_xlat16_51 = u_xlat16_7.x * _FresnelPower;
    u_xlat16_7.x = u_xlat16_7.x * _RimLightPower;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _FresnelPower;
    u_xlat16_22.x = max(_FresnelScale, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_22.x;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _FresnelColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * _RimLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_6.xyz;
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
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_15.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec2 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat16_32;
float u_xlat45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_0.xy = texture(_InternalDetailTex, u_xlat16_3.xy).zw;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_46;
    u_xlat16_47 = u_xlat16_0.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_4.xyz + _InternalDetailColor01.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_46 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat16_5.xyz;
    u_xlat6.x = dot(u_xlat16_5.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_5.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_5.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_5.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_5.zzz + u_xlat7.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat7.xy = vec2(u_xlat45) * u_xlat7.xy;
    u_xlat16_8.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * _MatCapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_47 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat45 = dot(u_xlat16_5.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat45 = dot(u_xlat16_5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat51 = min(u_xlat45, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat51) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17.x = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_32.xxx * u_xlat7.xzw;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat16_32.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_32.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_32.yyy + u_xlat16_9.xyz;
    u_xlat16_47 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_8.xyz);
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_47);
    u_xlat16_47 = u_xlat16_17.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_47 = (-u_xlat16_47) * u_xlat16_47 + 1.0;
    u_xlat16_47 = max(u_xlat16_47, 0.0);
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_17.x = u_xlat16_47 * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_32.x, u_xlat16_17.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_17.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat7.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_17.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat16_17.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat7.xyz;
    u_xlat15 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = vec3(u_xlat15) * u_xlat10.xyz;
    u_xlat16_17.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat16_17.x) + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat15;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat52 = (-u_xlat16_17.x) * u_xlat15 + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat52);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat16_17.xxx + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat11.x = min(u_xlat0.x, 1.0);
    u_xlat16_17.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat15 = (-u_xlat11.x) * u_xlat16_17.x + u_xlat11.x;
    u_xlat15 = u_xlat11.x * u_xlat15 + u_xlat16_17.x;
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = u_xlat15 + 6.10351563e-05;
    u_xlat52 = (-u_xlat51) * u_xlat16_17.x + u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat52 + u_xlat16_17.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat51 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = min(u_xlat15, 16.0);
    u_xlat52 = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat55 = u_xlat16_17.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat55 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_17.x / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat15);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_46) + vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_12.xyz + u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_12.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_48) + u_xlat16_49;
    u_xlat16_50 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_50 + 1.0;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_49 + u_xlat16_48;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat15 = min(u_xlat16_48, 1.0);
    u_xlat51 = min(u_xlat15, u_xlat16_0.z);
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati52 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_48 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat16_5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat10.xyz = (-u_xlat16_5.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat51 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_5.w);
    u_xlat16_47 = u_xlat16_32.x + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_5.x = u_xlat16_47 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_32.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32.x = u_xlat16_4.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_47 = u_xlat16_52 + (-u_xlat16_55);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_47 + u_xlat16_55;
    u_xlat16_32.x = u_xlat16_49 * u_xlat16_32.x;
    u_xlat51 = u_xlat51 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat15 * 0.5;
    u_xlat16_47 = (-u_xlat15) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat51 * u_xlat16_47 + u_xlat16_32.x;
    u_xlat16_47 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_4.x = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_4.x + u_xlat16_47;
    u_xlat16_32.x = u_xlat15 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_0.z, u_xlat16_32.x);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_46) + (-u_xlat10.xyz);
    u_xlat6.xyz = u_xlat16_17.xxx * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_15.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyw = u_xlat16_3.xyz * u_xlat16_15.xxx + u_xlat16_15.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_46);
    u_xlat16_3.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb15 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_46 = min(u_xlat0.x, 1.0);
    u_xlat16_2.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_17.x = u_xlat16_46 * _MinorAnisotropyIntensity;
    u_xlat16_46 = u_xlat16_46 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat15 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(u_xlat15) + u_xlat16_3.xyz;
    u_xlat16_32.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_6.x = texture(_AnisotropyNoise, u_xlat16_32.xy).y;
    u_xlat6.x = u_xlat16_6.x + -0.5;
    u_xlat16_32.x = u_xlat6.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_47 = u_xlat6.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32.x = inversesqrt(u_xlat16_32.x);
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat16_5.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = sqrt(u_xlat16_32.x);
    u_xlat0.x = log2(u_xlat16_32.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17.x;
    u_xlat16_17.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_3.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_46;
    u_xlat16_17.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_17.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_17.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * vec3(u_xlat45) + u_xlat16_1.xyz;
    u_xlat16_46 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_46 = exp2(u_xlat16_46);
    u_xlat16_46 = u_xlat16_46 * _FresnelPower;
    u_xlat16_17.x = max(_FresnelScale, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x;
    u_xlat16_1.xyz = vec3(u_xlat16_46) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec2 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat16_32;
float u_xlat45;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
float u_xlat55;
mediump float u_xlat16_55;
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
    u_xlat16_16 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_16 = max(u_xlat16_16, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_31.xxx;
    u_xlat16_31.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_31.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_31.x);
#endif
    u_xlat16_31.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_31.yyy + u_xlat16_3.xyz;
    u_xlat16_46 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_46 = u_xlat16_46 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_46);
    u_xlat16_46 = u_xlat16_16 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_16 = float(1.0) / float(u_xlat16_16);
    u_xlat16_46 = (-u_xlat16_46) * u_xlat16_46 + 1.0;
    u_xlat16_46 = max(u_xlat16_46, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_16 = u_xlat16_46 * u_xlat16_16;
    u_xlat16_16 = max(u_xlat16_31.x, u_xlat16_16);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_16;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_0.xy = texture(_InternalDetailTex, u_xlat16_3.xy).zw;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = u_xlat16_0.x * u_xlat16_46;
    u_xlat16_47 = u_xlat16_0.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_4.xyz + _InternalDetailColor01.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_46 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat16_5.xyz;
    u_xlat6.x = dot(u_xlat16_5.xyz, vs_TEXCOORD6.xyz);
    u_xlat6.y = dot(u_xlat16_5.xyz, vs_TEXCOORD7.xyz);
    u_xlat6.z = dot(u_xlat16_5.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_46 = inversesqrt(u_xlat16_46);
    u_xlat16_5.xyz = vec3(u_xlat16_46) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16_5.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_5.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_5.zzz + u_xlat7.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat7.xy = vec2(u_xlat45) * u_xlat7.xy;
    u_xlat16_8.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * _MatCapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_47 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xy = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yz;
    u_xlat7.xy = u_xlat16_7.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xy = min(max(u_xlat7.xy, 0.0), 1.0);
#else
    u_xlat7.xy = clamp(u_xlat7.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat45 = dot(u_xlat16_5.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat45) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat45 = dot(u_xlat16_5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat51 = min(u_xlat45, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat51) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat7.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17.x = dot(u_xlat7.xzw, u_xlat7.xzw);
    u_xlat16_17.x = max(u_xlat16_17.x, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_32.xxx * u_xlat7.xzw;
    u_xlat16_32.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_32.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_32.x);
#endif
    u_xlat16_32.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_32.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_32.yyy + u_xlat16_9.xyz;
    u_xlat16_47 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_8.xyz);
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_47);
    u_xlat16_47 = u_xlat16_17.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17.x = float(1.0) / float(u_xlat16_17.x);
    u_xlat16_47 = (-u_xlat16_47) * u_xlat16_47 + 1.0;
    u_xlat16_47 = max(u_xlat16_47, 0.0);
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_17.x = u_xlat16_47 * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_32.x, u_xlat16_17.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_17.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat7.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_17.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat16_17.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat7.xyz;
    u_xlat15 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = vec3(u_xlat15) * u_xlat10.xyz;
    u_xlat16_17.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat16_17.x) + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat15;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat52 = (-u_xlat16_17.x) * u_xlat15 + 1.0;
    u_xlat16_17.x = u_xlat15 * u_xlat16_17.x;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat52);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat16_17.xxx + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat11.x = min(u_xlat0.x, 1.0);
    u_xlat16_17.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0078125);
    u_xlat15 = (-u_xlat11.x) * u_xlat16_17.x + u_xlat11.x;
    u_xlat15 = u_xlat11.x * u_xlat15 + u_xlat16_17.x;
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + u_xlat11.x;
    u_xlat15 = u_xlat15 + 6.10351563e-05;
    u_xlat52 = (-u_xlat51) * u_xlat16_17.x + u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat52 + u_xlat16_17.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat51 + u_xlat52;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = min(u_xlat15, 16.0);
    u_xlat52 = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat55 = u_xlat16_17.x + -1.0;
    u_xlat52 = u_xlat52 * u_xlat55 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_17.x / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat15 = u_xlat15 * u_xlat52;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat15);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat16_46) + vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_12.xyz + u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_12.xyz;
    u_xlat16_48 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_48) + u_xlat16_49;
    u_xlat16_50 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_50 + 1.0;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_49 + u_xlat16_48;
    u_xlat16_48 = u_xlat16_2.w * u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 + -1.0;
    u_xlat16_49 = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat15 = min(u_xlat16_48, 1.0);
    u_xlat51 = min(u_xlat15, u_xlat16_0.z);
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_13.y = u_xlat16_12.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_49) * u_xlat16_14.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati52 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_48 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat16_5.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat10.xyz = (-u_xlat16_5.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat51 = dot(u_xlat16_12.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_5.w);
    u_xlat16_47 = u_xlat16_32.x + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_5.x = u_xlat16_47 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_32.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32.x = u_xlat16_4.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_47 = u_xlat16_52 + (-u_xlat16_55);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_47 + u_xlat16_55;
    u_xlat16_32.x = u_xlat16_49 * u_xlat16_32.x;
    u_xlat51 = u_xlat51 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat15 * 0.5;
    u_xlat16_47 = (-u_xlat15) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat51 * u_xlat16_47 + u_xlat16_32.x;
    u_xlat16_47 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_4.x = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_4.x + u_xlat16_47;
    u_xlat16_32.x = u_xlat15 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_0.z, u_xlat16_32.x);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_46) + (-u_xlat10.xyz);
    u_xlat6.xyz = u_xlat16_17.xxx * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_15.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyw = u_xlat16_3.xyz * u_xlat16_15.xxx + u_xlat16_15.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_46);
    u_xlat16_3.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb15 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_46 = min(u_xlat0.x, 1.0);
    u_xlat16_2.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.x = log2(abs(u_xlat16_2.x));
    u_xlat16_17.x = u_xlat16_46 * _MinorAnisotropyIntensity;
    u_xlat16_46 = u_xlat16_46 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat15 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * vec3(u_xlat15) + u_xlat16_3.xyz;
    u_xlat16_32.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_6.x = texture(_AnisotropyNoise, u_xlat16_32.xy).y;
    u_xlat6.x = u_xlat16_6.x + -0.5;
    u_xlat16_32.x = u_xlat6.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_47 = u_xlat6.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32.x = inversesqrt(u_xlat16_32.x);
    u_xlat16_5.xyz = u_xlat16_32.xxx * u_xlat16_5.xyz;
    u_xlat16_32.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat16_32.x = (-u_xlat16_32.x) * u_xlat16_32.x + 1.0;
    u_xlat16_32.x = sqrt(u_xlat16_32.x);
    u_xlat0.x = log2(u_xlat16_32.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17.x;
    u_xlat16_17.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_3.xyz = vec3(u_xlat16_48) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat0.x = log2(u_xlat16_3.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_46;
    u_xlat16_17.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_17.xyz;
    u_xlat16_0.x = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_17.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * vec3(u_xlat45) + u_xlat16_1.xyz;
    u_xlat16_46 = u_xlat16_2.x * _FresnelPower;
    u_xlat16_2.x = u_xlat16_2.x * _RimLightPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_46 = exp2(u_xlat16_46);
    u_xlat16_46 = u_xlat16_46 * _FresnelPower;
    u_xlat16_17.x = max(_FresnelScale, 0.0);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_17.x;
    u_xlat16_1.xyz = vec3(u_xlat16_46) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xxx * _RimLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
vec3 u_xlat19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
float u_xlat46;
int u_xlati46;
bool u_xlatb46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
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
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat5.x = dot(u_xlat16_6.xyz, vs_TEXCOORD6.xyz);
    u_xlat5.y = dot(u_xlat16_6.xyz, vs_TEXCOORD7.xyz);
    u_xlat5.z = dot(u_xlat16_6.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_6.xxx;
    u_xlat19.x = dot(u_xlat16_21.xyz, u_xlat19.xyz);
    u_xlat19.x = (-u_xlat19.x) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat16_21.xyz) * u_xlat19.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat16 = (-u_xlat1.x) + u_xlat16;
    u_xlat0.z = _ShadowBias.y * u_xlat16 + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat15.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_15.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_7.x = u_xlat16_15.z * _shadowStrength;
    u_xlat15.xy = u_xlat16_15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_8.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_1.xy = texture(_InternalDetailTex, u_xlat16_8.xy).zw;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_52;
    u_xlat16_8.x = u_xlat16_1.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_1.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_1.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_23.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_21.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_21.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_21.zzz + u_xlat2.xyz;
    u_xlat46 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xy = vec2(u_xlat46) * u_xlat2.xy;
    u_xlat16_10.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_MatCap, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * _MatCapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat46 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
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
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz;
    u_xlat15.x = dot(u_xlat16_21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat46 = min(u_xlat15.x, 1.0);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyz);
    u_xlat2.x = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.yyy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat30 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_52);
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat1.x;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16 = (-u_xlat16_52) * u_xlat1.x + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat4.xyz = u_xlat16_8.xyz * vec3(u_xlat16);
    u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat16_52) + u_xlat4.xyz;
    u_xlat30 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat1.x = min(u_xlat30, 1.0);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat48 = (-u_xlat1.x) * u_xlat16_52 + u_xlat1.x;
    u_xlat48 = u_xlat1.x * u_xlat48 + u_xlat16_52;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat1.x + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat49 = (-u_xlat46) * u_xlat16_52 + u_xlat46;
    u_xlat49 = u_xlat46 * u_xlat49 + u_xlat16_52;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat46 + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat49 = dot(u_xlat16_21.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat50 = u_xlat16_52 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat50 + 1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat16_52 / u_xlat49;
    u_xlat49 = u_xlat49 * 0.318309873;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * u_xlat16_6.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_53));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_21.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat4.xyz = (-u_xlat16_21.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat16_21.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_6.xxx + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_6.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat1.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat1.xyw = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat1.xyw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_2.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_21.x = u_xlat16_6.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_2.x = u_xlat16_21.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_16 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_6.x = u_xlat16_21.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_21.x = (-u_xlat16_16) + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21.x + u_xlat16_16;
    u_xlat16_6.x = u_xlat16_54 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.w * 0.5;
    u_xlat16_21.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_21.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_36 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_36 + u_xlat16_21.x;
    u_xlat16_6.x = u_xlat0.w * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_1.z, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * _EmissiveColor.xyz + u_xlat16_6.xyz;
    u_xlat16_51 = min(u_xlat30, 1.0);
    u_xlat16_7.x = (-u_xlat30) + 1.0;
    u_xlat16_7.x = log2(abs(u_xlat16_7.x));
    u_xlat16_22.x = u_xlat16_51 * _MinorAnisotropyIntensity;
    u_xlat16_51 = u_xlat16_51 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat30 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xzw = vs_TEXCOORD3.xyz * vec3(u_xlat30) + u_xlat16_8.xyz;
    u_xlat16_37.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_1.x = texture(_AnisotropyNoise, u_xlat16_37.xy).y;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat16_37.x = u_xlat1.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_52 = u_xlat1.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat16_10.xyz;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = sqrt(u_xlat16_37.x);
    u_xlat0.x = log2(u_xlat16_37.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22.x;
    u_xlat16_22.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_53 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat0.x = log2(u_xlat16_8.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_51;
    u_xlat16_22.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_22.xyz;
    u_xlat16_0 = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_0) * u_xlat16_22.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat15.xxx + u_xlat16_6.xyz;
    u_xlat16_51 = u_xlat16_7.x * _FresnelPower;
    u_xlat16_7.x = u_xlat16_7.x * _RimLightPower;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _FresnelPower;
    u_xlat16_22.x = max(_FresnelScale, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_22.x;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _FresnelColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * _RimLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz;
    vs_TEXCOORD5.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD5.w = min(max(vs_TEXCOORD5.w, 0.0), 1.0);
#else
    vs_TEXCOORD5.w = clamp(vs_TEXCOORD5.w, 0.0, 1.0);
#endif
    vs_TEXCOORD6.x = u_xlat1.x;
    vs_TEXCOORD6.z = u_xlat0.x;
    vs_TEXCOORD6.y = u_xlat16_2.x;
    vs_TEXCOORD7.x = u_xlat1.y;
    vs_TEXCOORD8.x = u_xlat1.z;
    vs_TEXCOORD7.z = u_xlat0.y;
    vs_TEXCOORD8.z = u_xlat0.z;
    vs_TEXCOORD7.y = u_xlat16_2.y;
    vs_TEXCOORD8.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _NormalIntensity;
uniform 	mediump vec4 _InternalDetailTex_ST;
uniform 	mediump vec4 _InternalDetailColor01;
uniform 	mediump vec4 _InternalDetailColor02;
uniform 	mediump float _InternalDetailIntensity02;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _RimLightColor;
uniform 	mediump float _RimLightPower;
uniform 	float _UseBitangent;
uniform 	mediump vec4 _AnisotropyNoise_ST;
uniform 	mediump vec4 _AnisotropyColor;
uniform 	mediump float _AnisotropyIntensity;
uniform 	mediump float _AnisotropyRange;
uniform 	mediump float _AnisotropyDistort;
uniform 	mediump float _AnisotropyOffset;
uniform 	mediump vec4 _MinorAnisotropyColor;
uniform 	mediump float _MinorAnisotropyIntensity;
uniform 	mediump float _MinorAnisotropyRange;
uniform 	mediump float _MinorAnisotropyDistort;
uniform 	mediump float _MinorAnisotropyOffset;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _InternalDetailTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropyNoise;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropyMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
vec3 u_xlat19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
float u_xlat46;
int u_xlati46;
bool u_xlatb46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
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
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat5.x = dot(u_xlat16_6.xyz, vs_TEXCOORD6.xyz);
    u_xlat5.y = dot(u_xlat16_6.xyz, vs_TEXCOORD7.xyz);
    u_xlat5.z = dot(u_xlat16_6.xyz, vs_TEXCOORD8.xyz);
    u_xlat16_6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_6.xxx;
    u_xlat19.x = dot(u_xlat16_21.xyz, u_xlat19.xyz);
    u_xlat19.x = (-u_xlat19.x) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat16_21.xyz) * u_xlat19.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat16 = (-u_xlat1.x) + u_xlat16;
    u_xlat0.z = _ShadowBias.y * u_xlat16 + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat15.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat15.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_15.xyz = texture(_shadowStrengthMap, vs_TEXCOORD4.xy).yzx;
    u_xlat16_7.x = u_xlat16_15.z * _shadowStrength;
    u_xlat15.xy = u_xlat16_15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_8.xy = vs_TEXCOORD4.xy * _InternalDetailTex_ST.xy + _InternalDetailTex_ST.zw;
    u_xlat16_1.xy = texture(_InternalDetailTex, u_xlat16_8.xy).zw;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_52;
    u_xlat16_8.x = u_xlat16_1.y * _InternalDetailIntensity02;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_1.xyz * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_1.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD4.xy);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_23.xyz) * u_xlat16_9.xyz + _InternalDetailColor01.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _InternalDetailColor02.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_21.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_21.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_21.zzz + u_xlat2.xyz;
    u_xlat46 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xy = vec2(u_xlat46) * u_xlat2.xy;
    u_xlat16_10.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_MatCap, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * _MatCapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat46 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
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
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz;
    u_xlat15.x = dot(u_xlat16_21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat46 = min(u_xlat15.x, 1.0);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat46) + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyz);
    u_xlat2.x = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_12.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat15.yyy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat30 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_52);
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat16_52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_52) + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat1.x;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat16 = (-u_xlat16_52) * u_xlat1.x + 1.0;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
    u_xlat4.xyz = u_xlat16_8.xyz * vec3(u_xlat16);
    u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat16_52) + u_xlat4.xyz;
    u_xlat30 = dot(u_xlat16_21.xyz, u_xlat16_11.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat1.x = min(u_xlat30, 1.0);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat48 = (-u_xlat1.x) * u_xlat16_52 + u_xlat1.x;
    u_xlat48 = u_xlat1.x * u_xlat48 + u_xlat16_52;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat1.x + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat49 = (-u_xlat46) * u_xlat16_52 + u_xlat46;
    u_xlat49 = u_xlat46 * u_xlat49 + u_xlat16_52;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat46 + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat49 = dot(u_xlat16_21.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat50 = u_xlat16_52 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat50 + 1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat16_52 / u_xlat49;
    u_xlat49 = u_xlat49 * 0.318309873;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat46) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * u_xlat16_6.xxx + vs_TEXCOORD5.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
    u_xlat16_53 = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD5.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_53));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_21.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat4.xyz = (-u_xlat16_21.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat16_21.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_6.xxx + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat16_52) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_6.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat1.y = u_xlat16_2.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat1.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat1.xyw = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat1.xyw * u_xlat1.xyw;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_53) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb1)) ? u_xlat16_11.xyz : u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_2.yzw = u_xlat16_21.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_2.w);
    u_xlat16_21.x = u_xlat16_6.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_2.x = u_xlat16_21.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_2.x = u_xlat16_6.x * 16.0 + u_xlat16_2.z;
    u_xlat16_21.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(0.00390625, 0.0625);
    u_xlat16_16 = texture(_SpecularOcclusionLut3D, u_xlat16_21.xy).x;
    u_xlat16_6.x = u_xlat16_21.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_21.x = (-u_xlat16_16) + u_xlat16_1.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_21.x + u_xlat16_16;
    u_xlat16_6.x = u_xlat16_54 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.w * 0.5;
    u_xlat16_21.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_21.x + u_xlat16_6.x;
    u_xlat16_21.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_36 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_36 + u_xlat16_21.x;
    u_xlat16_6.x = u_xlat0.w * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_1.z, u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * _EmissiveColor.xyz + u_xlat16_6.xyz;
    u_xlat16_51 = min(u_xlat30, 1.0);
    u_xlat16_7.x = (-u_xlat30) + 1.0;
    u_xlat16_7.x = log2(abs(u_xlat16_7.x));
    u_xlat16_22.x = u_xlat16_51 * _MinorAnisotropyIntensity;
    u_xlat16_51 = u_xlat16_51 * _AnisotropyIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseBitangent>=0.5);
#else
    u_xlatb0 = _UseBitangent>=0.5;
#endif
    u_xlat30 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : vs_TEXCOORD2.xyz;
    u_xlat0.xzw = vs_TEXCOORD3.xyz * vec3(u_xlat30) + u_xlat16_8.xyz;
    u_xlat16_37.xy = vs_TEXCOORD4.xy * _AnisotropyNoise_ST.xy + _AnisotropyNoise_ST.zw;
    u_xlat16_1.x = texture(_AnisotropyNoise, u_xlat16_37.xy).y;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat16_37.x = u_xlat1.x * _MinorAnisotropyDistort + _MinorAnisotropyOffset;
    u_xlat16_52 = u_xlat1.x * _AnisotropyDistort + _AnisotropyOffset;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_10.xyz = u_xlat16_37.xxx * u_xlat16_10.xyz;
    u_xlat16_37.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = sqrt(u_xlat16_37.x);
    u_xlat0.x = log2(u_xlat16_37.x);
    u_xlat0.x = u_xlat0.x * _MinorAnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22.x;
    u_xlat16_22.xyz = u_xlat0.xxx * _MinorAnisotropyColor.xyz;
    u_xlat16_53 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat0.x = log2(u_xlat16_8.x);
    u_xlat0.x = u_xlat0.x * _AnisotropyRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_51;
    u_xlat16_22.xyz = u_xlat0.xxx * _AnisotropyColor.xyz + u_xlat16_22.xyz;
    u_xlat16_0 = texture(_AnisotropyMask, vs_TEXCOORD4.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_0) * u_xlat16_22.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat15.xxx + u_xlat16_6.xyz;
    u_xlat16_51 = u_xlat16_7.x * _FresnelPower;
    u_xlat16_7.x = u_xlat16_7.x * _RimLightPower;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _FresnelPower;
    u_xlat16_22.x = max(_FresnelScale, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_22.x;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _FresnelColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xxx * _RimLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
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
  GpuProgramID 87180
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Crystal_AnisotropicGUI"
}