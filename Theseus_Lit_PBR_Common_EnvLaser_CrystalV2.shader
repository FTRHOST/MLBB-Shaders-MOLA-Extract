//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_Common_EnvLaser_CrystalV2" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _AlbedoTex ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MatMaskTex ("R高光遮罩,G边缘光遮罩", 2D) = "white" { }

_MatCap ("MatCap贴图:RGB叠边缘光，A叠高光", 2D) = "black" { }

_crystalSpeCol ("高光颜色", Color) = (0,0,0,1)

_rimCol ("边缘光颜色", Color) = (0,0,0,1)

_crystalSpeParams ("RG:高光范围和羽化 BA:边缘光范围和羽化", Vector) = (0.5,0.5,0.5,0.5)

_LGTex ("流光贴图", 2D) = "black" { }

_LGMask ("流光遮罩", 2D) = "white" { }

_LGColor ("流光颜色", Color) = (1,1,1,1)

_LGIntensity ("流光强度", Float) = 1.0

_USpeed_LG ("U向流动速度", Float) = 0.0

_VSpeed_LG ("V向流动速度", Float) = 0.0

[Tex] _laserMap ("RGB:镭射渐变图, A:镭射Mask", 2D) = "black" { }

_laserColor ("镭射颜色", Color) = (1,1,1,1)

_laserIntensity ("镭射强度", Float) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR_Freya_Wing"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 61449
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(13) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat42;
bool u_xlatb42;
float u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
mediump float u_xlat16_66;
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
    u_xlat61 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat6.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat6.zzz + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xy = vec2(u_xlat62) * u_xlat7.xy;
    u_xlat16_3.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_MatCap, u_xlat16_3.xy);
    u_xlat16_9.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_47 = u_xlat16_3.w + (-u_xlat16_9.x);
    u_xlat16_10.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_9.x = (-u_xlat16_9.x) + u_xlat16_10.x;
    u_xlat16_28 = u_xlat16_9.y + (-u_xlat16_10.y);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _crystalSpeCol.zxy;
    u_xlat16_10.xzw = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = (-u_xlat16_10.y) + u_xlat7.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * _rimCol.zxy;
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz;
    u_xlat16_45.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_45.yyy * u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_45.xxx + u_xlat16_11.xyz;
    u_xlat16_3 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_66) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_13.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_13.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_9.xyz) + u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_62;
    u_xlat16_66 = u_xlat16_66 * _laserColor.w;
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_12.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat61 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat61) * vec3(u_xlat16_59) + u_xlat13.xyz;
    u_xlat62 = dot(u_xlat6.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat63 = u_xlat62 * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat62 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat45 = (-u_xlat7.x) * u_xlat16_20.x + u_xlat7.x;
    u_xlat45 = u_xlat7.x * u_xlat45 + u_xlat16_20.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat7.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat45;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23.x = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat62) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat6.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_58 = u_xlat63 * u_xlat16_39;
    u_xlat63 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat14.xyz = u_xlat16_11.xyz * vec3(u_xlat63);
    u_xlat14.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat45;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat42 = u_xlat42 * u_xlat64;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat13.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat19.xxx;
    u_xlat23.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat45;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.zxy;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat23.xyz = u_xlat16_1.xzw * u_xlat23.xyz;
    u_xlat16_15.xyz = u_xlat23.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_9.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat6.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_59) + u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_12.w = _OcclusionScale * u_xlat16_29 + 1.0;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_66 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_59;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_66;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati38 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_10.xzw), u_xlat6.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat6.xyz) * u_xlat16_2.xxx + (-u_xlat16_10.xzw);
    u_xlat19.x = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_12.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_12.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_38 + (-u_xlat16_61);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_61;
    u_xlat16_2.x = u_xlat16_66 * u_xlat16_2.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat19.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat57) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat7.y = u_xlat16_12.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_10.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_9.yzx + u_xlat16_15.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_3.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_LGIntensity);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _LGColor.zxy + u_xlat16_1.xyz;
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
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(13) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat42;
bool u_xlatb42;
float u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
mediump float u_xlat16_66;
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
    u_xlat61 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat6.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat6.zzz + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xy = vec2(u_xlat62) * u_xlat7.xy;
    u_xlat16_3.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_MatCap, u_xlat16_3.xy);
    u_xlat16_9.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_47 = u_xlat16_3.w + (-u_xlat16_9.x);
    u_xlat16_10.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_9.x = (-u_xlat16_9.x) + u_xlat16_10.x;
    u_xlat16_28 = u_xlat16_9.y + (-u_xlat16_10.y);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _crystalSpeCol.zxy;
    u_xlat16_10.xzw = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = (-u_xlat16_10.y) + u_xlat7.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * _rimCol.zxy;
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz;
    u_xlat16_45.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_45.yyy * u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_45.xxx + u_xlat16_11.xyz;
    u_xlat16_3 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_3.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_66) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_13.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_13.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_9.xyz) + u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_62;
    u_xlat16_66 = u_xlat16_66 * _laserColor.w;
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_12.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat61 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat61) * vec3(u_xlat16_59) + u_xlat13.xyz;
    u_xlat62 = dot(u_xlat6.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat63 = u_xlat62 * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat62 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat45 = (-u_xlat7.x) * u_xlat16_20.x + u_xlat7.x;
    u_xlat45 = u_xlat7.x * u_xlat45 + u_xlat16_20.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat7.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat45;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23.x = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat62) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat6.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_58 = u_xlat63 * u_xlat16_39;
    u_xlat63 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat14.xyz = u_xlat16_11.xyz * vec3(u_xlat63);
    u_xlat14.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat45;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat42 = u_xlat42 * u_xlat64;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat13.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat19.xxx;
    u_xlat23.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat45;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.zxy;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat23.xyz = u_xlat16_1.xzw * u_xlat23.xyz;
    u_xlat16_15.xyz = u_xlat23.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_9.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat6.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_59) + u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_12.w = _OcclusionScale * u_xlat16_29 + 1.0;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_66 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_59;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_66;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati38 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_10.xzw), u_xlat6.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat6.xyz) * u_xlat16_2.xxx + (-u_xlat16_10.xzw);
    u_xlat19.x = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_12.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_12.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_38 + (-u_xlat16_61);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_61;
    u_xlat16_2.x = u_xlat16_66 * u_xlat16_2.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat19.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat57) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat7.y = u_xlat16_12.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_10.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_9.yzx + u_xlat16_15.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_3.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_LGIntensity);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _LGColor.zxy + u_xlat16_1.xyz;
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
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(15) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_20;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
float u_xlat59;
float u_xlat60;
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
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_19.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat7.zzz + u_xlat1.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xy = vec2(u_xlat57) * u_xlat1.xy;
    u_xlat16_12.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatCap, u_xlat16_12.xy);
    u_xlat16_12.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_63 = u_xlat16_1.w + (-u_xlat16_12.x);
    u_xlat16_50.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_67 = (-u_xlat16_12.x) + u_xlat16_50.x;
    u_xlat16_68 = (-u_xlat16_50.y) + u_xlat16_12.y;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_67 = float(1.0) / u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * _crystalSpeCol.zxy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_50.y) + u_xlat3.x;
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_67) * _rimCol.zxy;
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_1.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_1.yyy * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_4.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_1.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_57 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_57;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat20;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat39 = (-u_xlat16_10.x) * u_xlat20 + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat20 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_10.xxx + u_xlat9.xyz;
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat39 = (-u_xlat57) * u_xlat16_10.x + u_xlat57;
    u_xlat39 = u_xlat57 * u_xlat39 + u_xlat16_10.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat57 + u_xlat39;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat59 = (-u_xlat3.x) * u_xlat16_10.x + u_xlat3.x;
    u_xlat59 = u_xlat3.x * u_xlat59 + u_xlat16_10.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat3.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat59;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat41 = u_xlat16_10.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat16.xyz = u_xlat1.xxx * u_xlat16.xyz;
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat39 = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat39 * u_xlat39;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_48 = u_xlat39 * u_xlat16_29.x;
    u_xlat39 = (-u_xlat16_29.x) * u_xlat39 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat20) * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat39 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat39) * u_xlat16_10.x + u_xlat39;
    u_xlat60 = u_xlat39 * u_xlat60 + u_xlat16_10.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat39 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat59 * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat60;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = u_xlat9.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat2.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat2.x;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_69 = u_xlat2.x * u_xlat16_63;
    u_xlat2.x = (-u_xlat16_63) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat41 = (-u_xlat20) * u_xlat16_10.x + u_xlat20;
    u_xlat41 = u_xlat20 * u_xlat41 + u_xlat16_10.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat20 + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat59;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_29.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat39) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat20) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_8.w = _OcclusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_2.x = u_xlat16_30.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_39;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_29.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_LGIntensity);
    u_xlat16_29.xyz = u_xlat16_1.www * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _LGColor.zxy + u_xlat16_6.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(12) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(15) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_20;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
float u_xlat59;
float u_xlat60;
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
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_19.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat7.zzz + u_xlat1.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xy = vec2(u_xlat57) * u_xlat1.xy;
    u_xlat16_12.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatCap, u_xlat16_12.xy);
    u_xlat16_12.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_63 = u_xlat16_1.w + (-u_xlat16_12.x);
    u_xlat16_50.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_67 = (-u_xlat16_12.x) + u_xlat16_50.x;
    u_xlat16_68 = (-u_xlat16_50.y) + u_xlat16_12.y;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_67 = float(1.0) / u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * _crystalSpeCol.zxy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_50.y) + u_xlat3.x;
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_67) * _rimCol.zxy;
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_1.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_1.yyy * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_4.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_1.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_57 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_57;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat20;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat39 = (-u_xlat16_10.x) * u_xlat20 + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat20 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_10.xxx + u_xlat9.xyz;
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat39 = (-u_xlat57) * u_xlat16_10.x + u_xlat57;
    u_xlat39 = u_xlat57 * u_xlat39 + u_xlat16_10.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat57 + u_xlat39;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat59 = (-u_xlat3.x) * u_xlat16_10.x + u_xlat3.x;
    u_xlat59 = u_xlat3.x * u_xlat59 + u_xlat16_10.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat3.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat59;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat41 = u_xlat16_10.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat16.xyz = u_xlat1.xxx * u_xlat16.xyz;
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat39 = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat39 * u_xlat39;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_48 = u_xlat39 * u_xlat16_29.x;
    u_xlat39 = (-u_xlat16_29.x) * u_xlat39 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat20) * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat39 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat39) * u_xlat16_10.x + u_xlat39;
    u_xlat60 = u_xlat39 * u_xlat60 + u_xlat16_10.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat39 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat59 * u_xlat60;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat60;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = u_xlat9.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat41 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat2.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat2.x;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_69 = u_xlat2.x * u_xlat16_63;
    u_xlat2.x = (-u_xlat16_63) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat41 = (-u_xlat20) * u_xlat16_10.x + u_xlat20;
    u_xlat41 = u_xlat20 * u_xlat41 + u_xlat16_10.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat20 + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat59;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_29.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat39) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat20) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_8.w = _OcclusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_2.x = u_xlat16_30.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_39;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_10.x);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_29.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_29.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_LGIntensity);
    u_xlat16_29.xyz = u_xlat16_1.www * u_xlat16_29.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _LGColor.zxy + u_xlat16_6.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
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
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
float u_xlat42;
float u_xlat43;
int u_xlati43;
float u_xlat48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat58;
int u_xlati58;
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
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5 = (-u_xlat55) * u_xlat16_49 + u_xlat55;
    u_xlat5 = u_xlat55 * u_xlat5 + u_xlat16_49;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat55;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat11.x;
    u_xlat58 = u_xlat21 + 6.10351563e-05;
    u_xlat58 = u_xlat5 * u_xlat58;
    u_xlat26.z = float(1.0) / u_xlat58;
    u_xlat43 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat43);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_51) + 1.0;
    u_xlat26.x = u_xlat43 * u_xlat43;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat42 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_49 / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat16_52 = u_xlat10.x * u_xlat10.x;
    u_xlat16_52 = u_xlat10.x * u_xlat16_52;
    u_xlat16_52 = u_xlat10.x * u_xlat16_52;
    u_xlat16_54 = u_xlat10.x * u_xlat16_52;
    u_xlat10.x = (-u_xlat16_52) * u_xlat10.x + 1.0;
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat43 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat10.xzw = vec3(u_xlat43) * vec3(u_xlat16_54) + u_xlat10.xzw;
    u_xlat10.xyz = u_xlat10.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat55) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_OcclusionScale) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_18.x) + u_xlat16_52;
    u_xlat16_54 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_52 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _OcclusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_52;
    u_xlat55 = min(u_xlat16_18.x, 1.0);
    u_xlat58 = min(u_xlat16_5.z, u_xlat55);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat58) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati43 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat15.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_3.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_3.x = u_xlat16_50 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_34 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_39) + u_xlat16_23;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_39;
    u_xlat16_34 = u_xlat16_52 * u_xlat16_34;
    u_xlat7.x = u_xlat7.x * u_xlat16_34;
    u_xlat16_34 = u_xlat55 * 0.5;
    u_xlat16_50 = (-u_xlat55) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat7.x * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_4.x = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_4.x + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat55;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_6.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_6.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
    u_xlat48 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat3.x = u_xlat48 * 0.0625 + u_xlat3.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_16.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_49 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
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
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
float u_xlat42;
float u_xlat43;
int u_xlati43;
float u_xlat48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat58;
int u_xlati58;
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
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5 = (-u_xlat55) * u_xlat16_49 + u_xlat55;
    u_xlat5 = u_xlat55 * u_xlat5 + u_xlat16_49;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat55;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat11.x;
    u_xlat58 = u_xlat21 + 6.10351563e-05;
    u_xlat58 = u_xlat5 * u_xlat58;
    u_xlat26.z = float(1.0) / u_xlat58;
    u_xlat43 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat43);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_51) + 1.0;
    u_xlat26.x = u_xlat43 * u_xlat43;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat42 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_49 / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat16_52 = u_xlat10.x * u_xlat10.x;
    u_xlat16_52 = u_xlat10.x * u_xlat16_52;
    u_xlat16_52 = u_xlat10.x * u_xlat16_52;
    u_xlat16_54 = u_xlat10.x * u_xlat16_52;
    u_xlat10.x = (-u_xlat16_52) * u_xlat10.x + 1.0;
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat43 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat10.xzw = vec3(u_xlat43) * vec3(u_xlat16_54) + u_xlat10.xzw;
    u_xlat10.xyz = u_xlat10.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat55) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_OcclusionScale) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_18.x) + u_xlat16_52;
    u_xlat16_54 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_54 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_52 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _OcclusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_52;
    u_xlat55 = min(u_xlat16_18.x, 1.0);
    u_xlat58 = min(u_xlat16_5.z, u_xlat55);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat58) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati43 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat15.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_3.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_3.x = u_xlat16_50 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_34 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_39) + u_xlat16_23;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_39;
    u_xlat16_34 = u_xlat16_52 * u_xlat16_34;
    u_xlat7.x = u_xlat7.x * u_xlat16_34;
    u_xlat16_34 = u_xlat55 * 0.5;
    u_xlat16_50 = (-u_xlat55) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat7.x * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_4.x = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_4.x + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat55;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_6.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_6.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_4.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz * _EmissiveColor.zxy + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
    u_xlat48 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat3.x = u_xlat48 * 0.0625 + u_xlat3.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_16.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_49 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_64) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_60 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_60 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat16_64 = u_xlat1.x * u_xlat1.x;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_65 = u_xlat1.x * u_xlat16_64;
    u_xlat1.x = (-u_xlat16_64) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_60) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_64 = u_xlat16_60 + 1.0;
    u_xlat16_64 = min(u_xlat16_64, 15.0);
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_64 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64 + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat56 * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_64 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_64 + u_xlat16_60;
    u_xlat16_64 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_65 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65 + u_xlat16_64;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
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
    u_xlat16_6.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _EmissiveColor.zxy + u_xlat16_11.xyz;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_64) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_60 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_60 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat16_64 = u_xlat1.x * u_xlat1.x;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_65 = u_xlat1.x * u_xlat16_64;
    u_xlat1.x = (-u_xlat16_64) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_60) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_64 = u_xlat16_60 + 1.0;
    u_xlat16_64 = min(u_xlat16_64, 15.0);
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_64 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64 + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat56 * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_64 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_64 + u_xlat16_60;
    u_xlat16_64 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_65 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65 + u_xlat16_64;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
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
    u_xlat16_6.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _EmissiveColor.zxy + u_xlat16_11.xyz;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(9) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(12) uniform mediump sampler2D _MatMaskTex;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat42;
bool u_xlatb42;
float u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
mediump float u_xlat16_66;
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
    u_xlat61 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat6.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat6.zzz + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xy = vec2(u_xlat62) * u_xlat7.xy;
    u_xlat16_3.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_MatCap, u_xlat16_3.xy);
    u_xlat16_9.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_47 = u_xlat16_3.w + (-u_xlat16_9.x);
    u_xlat16_10.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_9.x = (-u_xlat16_9.x) + u_xlat16_10.x;
    u_xlat16_28 = u_xlat16_9.y + (-u_xlat16_10.y);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _crystalSpeCol.xyz;
    u_xlat16_10.xzw = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = (-u_xlat16_10.y) + u_xlat7.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * _rimCol.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz;
    u_xlat16_45.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_45.yyy * u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_45.xxx + u_xlat16_11.xyz;
    u_xlat16_3 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_66) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_13.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_9.xyz) + u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_62;
    u_xlat16_66 = u_xlat16_66 * _laserColor.w;
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_12.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat61 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat61) * vec3(u_xlat16_59) + u_xlat13.xyz;
    u_xlat62 = dot(u_xlat6.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat63 = u_xlat62 * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat62 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat45 = (-u_xlat7.x) * u_xlat16_20.x + u_xlat7.x;
    u_xlat45 = u_xlat7.x * u_xlat45 + u_xlat16_20.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat7.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat45;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23.x = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat62) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat6.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_58 = u_xlat63 * u_xlat16_39;
    u_xlat63 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat14.xyz = u_xlat16_11.xyz * vec3(u_xlat63);
    u_xlat14.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat45;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat42 = u_xlat42 * u_xlat64;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat13.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat19.xxx;
    u_xlat23.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat45;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.xyz;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat23.xyz = u_xlat16_1.xzw * u_xlat23.xyz;
    u_xlat16_15.xyz = u_xlat23.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_9.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat6.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_59) + u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_12.w = _OcclusionScale * u_xlat16_29 + 1.0;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_66 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_59;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_66;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati38 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_10.xzw), u_xlat6.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat6.xyz) * u_xlat16_2.xxx + (-u_xlat16_10.xzw);
    u_xlat19.x = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_12.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_12.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_38 + (-u_xlat16_61);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_61;
    u_xlat16_2.x = u_xlat16_66 * u_xlat16_2.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat19.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat57) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat7.y = u_xlat16_12.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_10.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_LGIntensity);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _LGColor.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(9) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(12) uniform mediump sampler2D _MatMaskTex;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
int u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat38;
mediump float u_xlat16_38;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat42;
bool u_xlatb42;
float u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
mediump float u_xlat16_66;
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
    u_xlat61 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat6.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat6.zzz + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xy = vec2(u_xlat62) * u_xlat7.xy;
    u_xlat16_3.xy = u_xlat7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_MatCap, u_xlat16_3.xy);
    u_xlat16_9.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_47 = u_xlat16_3.w + (-u_xlat16_9.x);
    u_xlat16_10.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_9.x = (-u_xlat16_9.x) + u_xlat16_10.x;
    u_xlat16_28 = u_xlat16_9.y + (-u_xlat16_10.y);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _crystalSpeCol.xyz;
    u_xlat16_10.xzw = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat7.x = dot(u_xlat6.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = (-u_xlat16_10.y) + u_xlat7.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * _rimCol.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz;
    u_xlat16_45.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.xyz = u_xlat16_45.yyy * u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_45.xxx + u_xlat16_11.xyz;
    u_xlat16_3 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_66) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_13.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_9.xyz) + u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_62;
    u_xlat16_66 = u_xlat16_66 * _laserColor.w;
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_12.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat61 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat61) * vec3(u_xlat16_59) + u_xlat13.xyz;
    u_xlat62 = dot(u_xlat6.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat63 = u_xlat62 * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat62 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat45 = (-u_xlat7.x) * u_xlat16_20.x + u_xlat7.x;
    u_xlat45 = u_xlat7.x * u_xlat45 + u_xlat16_20.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat7.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat45;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23.x = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat62) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat6.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_58 = u_xlat63 * u_xlat16_39;
    u_xlat63 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat14.xyz = u_xlat16_11.xyz * vec3(u_xlat63);
    u_xlat14.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat45;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat42 = u_xlat42 * u_xlat64;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat13.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat19.xxx;
    u_xlat23.xyz = vec3(u_xlat61) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat45;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.xyz;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat23.xyz = u_xlat16_1.xzw * u_xlat23.xyz;
    u_xlat16_15.xyz = u_xlat23.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_9.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat6.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_59) + u_xlat16_66;
    u_xlat16_29 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_12.w = _OcclusionScale * u_xlat16_29 + 1.0;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_66 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_12.w * u_xlat16_59;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_66;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati19 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati19].xyz;
    u_xlati19 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati38 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_10.xzw), u_xlat6.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat6.xyz) * u_xlat16_2.xxx + (-u_xlat16_10.xzw);
    u_xlat19.x = dot(u_xlat16_16.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_12.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_12.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
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
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_9.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = u_xlat16_38 + (-u_xlat16_61);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_61;
    u_xlat16_2.x = u_xlat16_66 * u_xlat16_2.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat19.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_8.z);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat57) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat7.y = u_xlat16_12.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_10.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_21.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_LGIntensity);
    u_xlat16_21.xyz = u_xlat16_3.www * u_xlat16_21.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _LGColor.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(11) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(14) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_20;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat42;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
float u_xlat59;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
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
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_19 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat7.zzz + u_xlat1.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xy = vec2(u_xlat57) * u_xlat1.xy;
    u_xlat16_12.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatCap, u_xlat16_12.xy);
    u_xlat16_12.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_63 = u_xlat16_1.w + (-u_xlat16_12.x);
    u_xlat16_50.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_67 = (-u_xlat16_12.x) + u_xlat16_50.x;
    u_xlat16_68 = (-u_xlat16_50.y) + u_xlat16_12.y;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_67 = float(1.0) / u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * _crystalSpeCol.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_50.y) + u_xlat4.x;
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_67) * _rimCol.xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_1.yyy * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_1.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_57 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_57;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat20;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat39 = (-u_xlat16_10.x) * u_xlat20 + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat20 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_10.xxx + u_xlat9.xyz;
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat39 = (-u_xlat57) * u_xlat16_10.x + u_xlat57;
    u_xlat39 = u_xlat57 * u_xlat39 + u_xlat16_10.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat57 + u_xlat39;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat59 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat59 = u_xlat4.x * u_xlat59 + u_xlat16_10.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat4.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat59;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat42 = u_xlat16_10.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat16.xyz = u_xlat1.xxx * u_xlat16.xyz;
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat39 = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat39 * u_xlat39;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_48 = u_xlat39 * u_xlat16_29.x;
    u_xlat39 = (-u_xlat16_29.x) * u_xlat39 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat20) * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat39 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat39) * u_xlat16_10.x + u_xlat39;
    u_xlat61 = u_xlat39 * u_xlat61 + u_xlat16_10.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat39 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat59 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat61;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = u_xlat9.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat2.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat2.x;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_69 = u_xlat2.x * u_xlat16_63;
    u_xlat2.x = (-u_xlat16_63) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat42 = (-u_xlat20) * u_xlat16_10.x + u_xlat20;
    u_xlat42 = u_xlat20 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat20 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat42;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat59;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_29.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat39) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat20) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_8.w = _OcclusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_69 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_70 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_70) + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_2.x = u_xlat16_30.x * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_39;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_3.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_29.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _EmissiveColor.xyz + u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LGIntensity);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * _LGColor.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_29.x;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	float _USpeed_LG;
uniform 	float _VSpeed_LG;
uniform 	mediump vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _rimCol;
uniform 	mediump vec4 _crystalSpeCol;
uniform 	mediump vec4 _crystalSpeParams;
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
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(11) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(14) uniform mediump sampler2D _MatMaskTex;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_20;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat42;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
float u_xlat59;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
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
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat16_19 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat7.zzz + u_xlat1.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xy = vec2(u_xlat57) * u_xlat1.xy;
    u_xlat16_12.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatCap, u_xlat16_12.xy);
    u_xlat16_12.xy = (-_crystalSpeParams.yw) + _crystalSpeParams.xz;
    u_xlat16_63 = u_xlat16_1.w + (-u_xlat16_12.x);
    u_xlat16_50.xy = _crystalSpeParams.yw + _crystalSpeParams.xz;
    u_xlat16_67 = (-u_xlat16_12.x) + u_xlat16_50.x;
    u_xlat16_68 = (-u_xlat16_50.y) + u_xlat16_12.y;
    u_xlat16_68 = float(1.0) / u_xlat16_68;
    u_xlat16_67 = float(1.0) / u_xlat16_67;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * _crystalSpeCol.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_50.y) + u_xlat4.x;
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_67) * _rimCol.xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xy = texture(_MatMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_14.xyz = u_xlat16_1.yyy * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_14.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_1.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_57 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_57;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat1.xyz = vec3(u_xlat57) * u_xlat1.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat20;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat39 = (-u_xlat16_10.x) * u_xlat20 + 1.0;
    u_xlat16_10.x = u_xlat20 * u_xlat16_10.x;
    u_xlat9.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat20 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_10.xxx + u_xlat9.xyz;
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat39 = (-u_xlat57) * u_xlat16_10.x + u_xlat57;
    u_xlat39 = u_xlat57 * u_xlat39 + u_xlat16_10.x;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat57 + u_xlat39;
    u_xlat39 = u_xlat39 + 6.10351563e-05;
    u_xlat59 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat59 = u_xlat4.x * u_xlat59 + u_xlat16_10.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat4.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat39 = u_xlat39 * u_xlat59;
    u_xlat1.z = float(1.0) / u_xlat39;
    u_xlat42 = u_xlat16_10.x + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat16.xyz = u_xlat1.xxx * u_xlat16.xyz;
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat39 = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat39 * u_xlat39;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat39 * u_xlat16_29.x;
    u_xlat16_48 = u_xlat39 * u_xlat16_29.x;
    u_xlat39 = (-u_xlat16_29.x) * u_xlat39 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat20) * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat39 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat39) * u_xlat16_10.x + u_xlat39;
    u_xlat61 = u_xlat39 * u_xlat61 + u_xlat16_10.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat39 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat59 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat61;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = u_xlat9.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat42 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat2.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat2.x;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat2.x * u_xlat16_63;
    u_xlat16_69 = u_xlat2.x * u_xlat16_63;
    u_xlat2.x = (-u_xlat16_63) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat20) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat42 = (-u_xlat20) * u_xlat16_10.x + u_xlat20;
    u_xlat42 = u_xlat20 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat20 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat42;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat59;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_29.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat39) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat20) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_29.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_8.w = _OcclusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_69 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_70 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_70) + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_2.x = u_xlat16_30.x * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_39;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_3.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_30.xyz = u_xlat16_14.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_29.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _EmissiveColor.xyz + u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat19.xy = u_xlat19.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat19.xy);
    u_xlat16_12.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_LGIntensity);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * _LGColor.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_29.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
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
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
ivec3 u_xlati14;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
int u_xlati20;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec2 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat52;
int u_xlati52;
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
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_46 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat52 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat52) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_46 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat5.x = (-u_xlat52) * u_xlat16_46 + u_xlat52;
    u_xlat5.x = u_xlat52 * u_xlat5.x + u_xlat16_46;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat52;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = vec3(u_xlat16_48) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat11.x) * u_xlat16_46 + u_xlat11.x;
    u_xlat20 = u_xlat11.x * u_xlat20 + u_xlat16_46;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat5.y = u_xlat20 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat20 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat10.xyz = vec3(u_xlat20) * u_xlat10.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_48 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_48) + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat25 = u_xlat16_46 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat25 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_46 / u_xlat20;
    u_xlat5.y = u_xlat20 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_48 = u_xlat10.x * u_xlat10.x;
    u_xlat16_48 = u_xlat10.x * u_xlat16_48;
    u_xlat16_48 = u_xlat10.x * u_xlat16_48;
    u_xlat16_49 = u_xlat10.x * u_xlat16_48;
    u_xlat20 = (-u_xlat16_48) * u_xlat10.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat20);
    u_xlat20 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat20) * vec3(u_xlat16_49) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat5.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat52) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(_OcclusionScale) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_17.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat16_8.xyz;
    u_xlat16_17.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_17.x * 0.5 + 0.5;
    u_xlat16_48 = (-u_xlat16_17.x) + u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_17.x = u_xlat16_2.w * u_xlat16_48 + u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_2.w * u_xlat16_17.x;
    u_xlat16_48 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 + -1.0;
    u_xlat16_48 = _OcclusionScale * u_xlat16_48 + 1.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_48;
    u_xlat5.x = min(u_xlat16_17.x, 1.0);
    u_xlat20 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat20) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat20) * u_xlat16_9.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = vec3(u_xlat20) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat20) * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat20) + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(u_xlat20) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_12.y = u_xlat16_8.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati14.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_13.xyz;
    u_xlati20 = int(int_bitfieldInsert(2,u_xlati14.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati20].xyz;
    u_xlati20 = int(uint(uint(u_xlati14.x) & 1u));
    u_xlati52 = (u_xlati14.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat14.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat20 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat14.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32 = floor(u_xlat16_6.w);
    u_xlat16_47 = u_xlat16_32 + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_6.x = u_xlat16_47 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_32 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32 = u_xlat16_4.z * 15.0 + (-u_xlat16_32);
    u_xlat16_47 = (-u_xlat16_22) + u_xlat16_7;
    u_xlat16_32 = u_xlat16_32 * u_xlat16_47 + u_xlat16_22;
    u_xlat16_32 = u_xlat16_48 * u_xlat16_32;
    u_xlat20 = u_xlat20 * u_xlat16_32;
    u_xlat16_32 = u_xlat5.x * 0.5;
    u_xlat16_47 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_32 = u_xlat20 * u_xlat16_47 + u_xlat16_32;
    u_xlat16_47 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_48 = (-u_xlat16_32) * 2.0 + 1.0;
    u_xlat16_32 = u_xlat16_32 * u_xlat16_48 + u_xlat16_47;
    u_xlat16_32 = u_xlat16_32 * u_xlat5.x;
    u_xlat16_32 = min(u_xlat16_32, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat50) + (-u_xlat14.xyz);
    u_xlat0.xyz = vec3(u_xlat16_46) * u_xlat0.xyz + u_xlat14.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_46);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_17.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_6.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_32) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_46 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ShadowStrengthMap;
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
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
ivec3 u_xlati14;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
int u_xlati20;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec2 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat52;
int u_xlati52;
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
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_46 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat52 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat52) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_46 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat16_46 = u_xlat16_46 * u_xlat16_46;
    u_xlat16_46 = max(u_xlat16_46, 0.0078125);
    u_xlat5.x = (-u_xlat52) * u_xlat16_46 + u_xlat52;
    u_xlat5.x = u_xlat52 * u_xlat5.x + u_xlat16_46;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat52;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = vec3(u_xlat16_48) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat11.x) * u_xlat16_46 + u_xlat11.x;
    u_xlat20 = u_xlat11.x * u_xlat20 + u_xlat16_46;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat5.y = u_xlat20 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat20 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat10.xyz = vec3(u_xlat20) * u_xlat10.xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_48 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_48) + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat25 = u_xlat16_46 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat25 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_46 / u_xlat20;
    u_xlat5.y = u_xlat20 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_48 = u_xlat10.x * u_xlat10.x;
    u_xlat16_48 = u_xlat10.x * u_xlat16_48;
    u_xlat16_48 = u_xlat10.x * u_xlat16_48;
    u_xlat16_49 = u_xlat10.x * u_xlat16_48;
    u_xlat20 = (-u_xlat16_48) * u_xlat10.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(u_xlat20);
    u_xlat20 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat20) * vec3(u_xlat16_49) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat5.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat52) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(_OcclusionScale) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_17.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_8.xyz = u_xlat16_17.xxx * u_xlat16_8.xyz;
    u_xlat16_17.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_17.x * 0.5 + 0.5;
    u_xlat16_48 = (-u_xlat16_17.x) + u_xlat16_48;
    u_xlat16_49 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_49 + 1.0;
    u_xlat16_17.x = u_xlat16_2.w * u_xlat16_48 + u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_2.w * u_xlat16_17.x;
    u_xlat16_48 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 + -1.0;
    u_xlat16_48 = _OcclusionScale * u_xlat16_48 + 1.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_48;
    u_xlat5.x = min(u_xlat16_17.x, 1.0);
    u_xlat20 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat20) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat20) * u_xlat16_9.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = vec3(u_xlat20) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat20) * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat20) + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(u_xlat20) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_12.y = u_xlat16_8.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati14.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_48) * u_xlat16_13.xyz;
    u_xlati20 = int(int_bitfieldInsert(2,u_xlati14.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati20].xyz;
    u_xlati20 = int(uint(uint(u_xlati14.x) & 1u));
    u_xlati52 = (u_xlati14.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.x = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat14.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat20 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat14.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32 = floor(u_xlat16_6.w);
    u_xlat16_47 = u_xlat16_32 + 1.0;
    u_xlat16_47 = min(u_xlat16_47, 15.0);
    u_xlat16_6.x = u_xlat16_47 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_32 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_32 = u_xlat16_4.z * 15.0 + (-u_xlat16_32);
    u_xlat16_47 = (-u_xlat16_22) + u_xlat16_7;
    u_xlat16_32 = u_xlat16_32 * u_xlat16_47 + u_xlat16_22;
    u_xlat16_32 = u_xlat16_48 * u_xlat16_32;
    u_xlat20 = u_xlat20 * u_xlat16_32;
    u_xlat16_32 = u_xlat5.x * 0.5;
    u_xlat16_47 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_32 = u_xlat20 * u_xlat16_47 + u_xlat16_32;
    u_xlat16_47 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_48 = (-u_xlat16_32) * 2.0 + 1.0;
    u_xlat16_32 = u_xlat16_32 * u_xlat16_48 + u_xlat16_47;
    u_xlat16_32 = u_xlat16_32 * u_xlat5.x;
    u_xlat16_32 = min(u_xlat16_32, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat50) + (-u_xlat14.xyz);
    u_xlat0.xyz = vec3(u_xlat16_46) * u_xlat0.xyz + u_xlat14.xyz;
    u_xlat16_46 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_46;
    u_xlat16_46 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_46);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_17.xxx * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_6.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_32) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_46 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_46 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46 = min(max(u_xlat16_46, 0.0), 1.0);
#else
    u_xlat16_46 = clamp(u_xlat16_46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat16_17.xyz * _EmissiveColor.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat40;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_64);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat4.x) * u_xlat16_60 + u_xlat4.x;
    u_xlat40 = u_xlat4.x * u_xlat40 + u_xlat16_60;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat4.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat40;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat40 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat40);
    u_xlat40 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat20 = u_xlat40 * u_xlat40;
    u_xlat56 = u_xlat16_60 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat56 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_60 / u_xlat20;
    u_xlat20 = u_xlat20 * 0.318309873;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat18 = u_xlat18 * u_xlat20;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_65 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat40 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat40) * vec3(u_xlat16_65) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat18) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _DirectSpecularColor.xyz;
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat40 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat4.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_64 = u_xlat16_60 + 1.0;
    u_xlat16_64 = min(u_xlat16_64, 15.0);
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_64 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64 + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat40 * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_64 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_64 + u_xlat16_60;
    u_xlat16_64 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_65 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65 + u_xlat16_64;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat40;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_64);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat4.x) * u_xlat16_60 + u_xlat4.x;
    u_xlat40 = u_xlat4.x * u_xlat40 + u_xlat16_60;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat4.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat40;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat40 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat40);
    u_xlat40 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat20 = u_xlat40 * u_xlat40;
    u_xlat56 = u_xlat16_60 + -1.0;
    u_xlat20 = u_xlat20 * u_xlat56 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = u_xlat16_60 / u_xlat20;
    u_xlat20 = u_xlat20 * 0.318309873;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat18 = u_xlat18 * u_xlat20;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_65 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat40 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat40) * vec3(u_xlat16_65) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat18) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _DirectSpecularColor.xyz;
    u_xlat2.xyw = vec3(u_xlat54) * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat40 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat4.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_60);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_3.w);
    u_xlat16_64 = u_xlat16_60 + 1.0;
    u_xlat16_64 = min(u_xlat16_64, 15.0);
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_60 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_60 = u_xlat16_12.z * 15.0 + (-u_xlat16_60);
    u_xlat16_64 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64 + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat40 * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_64 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_64 + u_xlat16_60;
    u_xlat16_64 = u_xlat16_60 + u_xlat16_60;
    u_xlat16_65 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65 + u_xlat16_64;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_2.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
  GpuProgramID 81816
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_EnvLaser_CrystalV2GUI"
}