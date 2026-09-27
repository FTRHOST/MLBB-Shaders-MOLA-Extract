//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Pan/Theseus_Pan_Base_Skin" {
Properties {

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

_useShadow ("阴影开关", Float) = 1.0

_FGD ("FGD Map", 2D) = "white" { }

_ACESLutTex ("Aces Lut", 2D) = "white" { }

_cull ("__cull", Float) = 2.0

_srcblend ("__src", Float) = 1.0

_dstblend ("__dst", Float) = 0.0

_srcblendalpha ("__srcA", Float) = 1.0

_dstblendalpha ("__dstA", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_AlbedoMap ("Albedo贴图", 2D) = "white" { }

_BaseColor ("Albedo颜色", Color) = (1,1,1,1)

_dirLight_lightColor ("直接光颜色", Color) = (1,1,1,1)

_RD ("渐变贴图", 2D) = "white" { }

_RampLertStr ("渐变强度", Range(0, 1)) = 1.0

_RemaphalfLambert_center ("渐变交界线位置", Float) = 0.4000000059604645

_RemaphalfLambert_sharp ("渐变锐度", Float) = 0.10000000149011612

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMax ("最大金属度", Range(0, 1)) = 1.0

_RoughnessMax ("基础最大粗糙度", Range(0.001, 0.98)) = 0.0010000000474974513

_Normal ("法线贴图", 2D) = "bump" { }

_NormalStrength ("法线强度", Range(0.001, 2)) = 1.0

_SpecularColor ("高光颜色", Color) = (1,1,1,1)

_specularAlphaMode ("高光透明模式", Float) = 1.0

_SkinMask ("R 皮肤遮罩,G 曲率贴图", 2D) = "white" { }

_SssLut ("SSS_LUT", 2D) = "black" { }

_sssLutLerp ("SSS强度", Range(0, 1)) = 0.5

_SssLutXScale ("SSS UVx Scale", Float) = 1.0

_SssLutYScale ("SSS UVy Scale", Float) = 1.0

_SkinSpeRoughness ("皮肤第二高光粗糙度", Range(0.001, 0.98)) = 0.20000000298023224

_skinSpeLerp ("皮肤第二高光混合权重", Range(0, 1)) = 0.5

_Emission ("自发光贴图", 2D) = "black" { }

_EmissionColor ("自发光颜色", Color) = (0,0,0,1)

_EmissiveBreathe ("自发光呼吸参数", Vector) = (0,0,0,0)

_aoPow ("遮蔽对比度", Range(0.001, 8)) = 1.0

_AmbientLightColorTint ("环境光漫反射", Color) = (1,1,1,1)

_EnvmapIntensity ("环境光高光", Color) = (1,1,1,1)

[Toggle] _customAndToonAdjust ("Use ShadowToon Adjust", Float) = 0.0

_GlobalShadowBrightnessAdjustment ("阴影亮度", Float) = 0.0

_FaceOutlineMask ("外描边遮罩", 2D) = "Black" { }

_Outline_Width ("外描边宽度", Float) = 0.019999999552965164

_Outline_Color ("外描边颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X 一般不用动", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y一般不用动", Float) = 0.0

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 12526
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(9) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump vec3 u_xlat16_17;
mediump float u_xlat16_18;
mediump vec2 u_xlat16_23;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat32;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_41;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_61;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat4.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat5.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_18 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_50 = u_xlat6.y * u_xlat6.y;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_7.x = u_xlat16_50 * u_xlat16_50;
    u_xlat16_23.x = (-u_xlat16_18) * u_xlat16_7.x + u_xlat16_18;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_18 + u_xlat16_7.x;
    u_xlat16_39 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_23.y = u_xlat16_39 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_23.xy = sqrt(u_xlat16_23.xy);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_23.y;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_23.x + u_xlat16_18;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_23.x = sqrt(u_xlat32);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat0.x + u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_34 * u_xlat16_7.x + (-u_xlat16_34);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_34 + 1.0;
    u_xlat0.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_34;
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_18 = u_xlat16_7.x / u_xlat16_18;
    u_xlat16_34 = (-u_xlat16_23.x) + 1.0;
    u_xlat32 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_7.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_23.x = u_xlat16_34 * u_xlat16_7.x;
    u_xlat16_34 = (-u_xlat16_7.x) * u_xlat16_34 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.zxy;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.zxy;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_34) + u_xlat16_23.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_18) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_18 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_34 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = _SkinSpeRoughness * u_xlat16_34 + u_xlat16_18;
    u_xlat49 = u_xlat16_18 * u_xlat16_18;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_18 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_18) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.zxy;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.zxy;
    u_xlat49 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat49 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_23.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_25.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_57;
    u_xlat16_10.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_23.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_57);
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_23.xxx + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz;
    u_xlat16_23.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_14.xyz;
    u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_25.x = (-_RoughnessMax) + 1.0;
    u_xlat16_25.x = u_xlat16_25.x * 64.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_41.x = u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_23.xxx * u_xlat16_7.xzw;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_23.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_10.xyz * u_xlat16_23.xxx;
    u_xlat16_9.xzw = max(u_xlat16_9.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_6.x = sqrt(u_xlat49);
    u_xlat6.x = u_xlat16_6.x;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat49 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.x = u_xlat49 + 0.209999993;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat16_9.xzw;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_9.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_9.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_57 = float(1.0) / float(u_xlat16_9.x);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_10.xyz = u_xlat6.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_57;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_41.x, u_xlat16_9.x);
    u_xlat16_15.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_41.yyy + u_xlat16_15.xyz;
    u_xlat16_41.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_41.x = max(u_xlat16_57, u_xlat16_41.x);
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(u_xlat16_58) + u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
    u_xlat16_26.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_15.xyz;
    u_xlat16_26.x = dot(u_xlat1.xyz, u_xlat16_26.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = log2(u_xlat16_26.x);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_25.x = exp2(u_xlat16_25.x);
    u_xlat16_26.x = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_10.xzw = u_xlat16_7.xzw * u_xlat16_10.xxx;
    u_xlat16_10.xzw = u_xlat16_9.xzw * u_xlat16_10.xzw;
    u_xlat16_10.xzw = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_25.xxx;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    u_xlat6.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_9.x = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_25.x = u_xlat32 * u_xlat32;
    u_xlat16_27 = u_xlat16_25.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_27;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_11.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.zxy * u_xlat16_25.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_9.xxx * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_9 = texture(_RD, u_xlat0.xy);
    u_xlat16_15.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_9.zxy * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_9.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_26.x = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_61 = log2(abs(u_xlat16_5.z));
    u_xlat16_61 = u_xlat16_61 * _aoPow;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_26.xxx;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat11.xyz + u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xzw + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_10.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat6.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_10.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _IrradianceACCoeffs[u_xlati51].zxy;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].zxy + u_xlat16_10.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].zxy + u_xlat16_10.xyz;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_6.www * u_xlat16_6.zxy;
    u_xlat6.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat51 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_61 * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat6.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_7.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_7.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.zxy;
    u_xlat16_10.x = dot(u_xlat16_7.zwx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_7.xzw * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_7.xzw;
    u_xlat16_10.x = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_10.xyz = u_xlat8.xyz * u_xlat16_10.xxx + u_xlat16_4.xxx;
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat1.yzx + u_xlat16_2.yzx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_8.w * _BaseColor.w;
    u_xlat1.xyz = u_xlat3.xyz + u_xlat5.xyz;
    u_xlat3.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat49 = u_xlat49 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat49 * -2.0 + 3.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat49 * u_xlat3.x;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat49 = max(u_xlat49, 0.00100000005);
    u_xlat16_10.xyz = vec3(u_xlat49) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb49 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_10.xyz = (bool(u_xlatb49)) ? u_xlat16_10.xyz : u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat49 = _EmissiveBreathe.y * _Time.y;
    u_xlat49 = cos(u_xlat49);
    u_xlat49 = max(abs(u_xlat49), _EmissiveBreathe.z);
    u_xlat16_3.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_3.zxy * _EmissionColor.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat49) + u_xlat1.xyz;
    u_xlat16_13.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat49 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat49);
    u_xlat0.x = u_xlat49 * 0.0625 + u_xlat0.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_17.xyz) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_7.x : u_xlat16_23.x;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(9) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump vec3 u_xlat16_17;
mediump float u_xlat16_18;
mediump vec2 u_xlat16_23;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat32;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_41;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_61;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat4.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat5.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_18 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_50 = u_xlat6.y * u_xlat6.y;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_7.x = u_xlat16_50 * u_xlat16_50;
    u_xlat16_23.x = (-u_xlat16_18) * u_xlat16_7.x + u_xlat16_18;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_18 + u_xlat16_7.x;
    u_xlat16_39 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_23.y = u_xlat16_39 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_23.xy = sqrt(u_xlat16_23.xy);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_23.y;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_23.x + u_xlat16_18;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_23.x = sqrt(u_xlat32);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat0.x + u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_34 * u_xlat16_7.x + (-u_xlat16_34);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_34 + 1.0;
    u_xlat0.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_34;
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_18 = u_xlat16_7.x / u_xlat16_18;
    u_xlat16_34 = (-u_xlat16_23.x) + 1.0;
    u_xlat32 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_7.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_23.x = u_xlat16_34 * u_xlat16_7.x;
    u_xlat16_34 = (-u_xlat16_7.x) * u_xlat16_34 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.zxy;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.zxy;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_34) + u_xlat16_23.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_18) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_18 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_34 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = _SkinSpeRoughness * u_xlat16_34 + u_xlat16_18;
    u_xlat49 = u_xlat16_18 * u_xlat16_18;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_18 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_18) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.zxy;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.zxy;
    u_xlat49 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat49 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_23.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_25.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_57;
    u_xlat16_10.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_23.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_57);
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_23.xxx + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz;
    u_xlat16_23.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_14.xyz;
    u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_25.x = (-_RoughnessMax) + 1.0;
    u_xlat16_25.x = u_xlat16_25.x * 64.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_41.x = u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_23.xxx * u_xlat16_7.xzw;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_23.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_10.xyz * u_xlat16_23.xxx;
    u_xlat16_9.xzw = max(u_xlat16_9.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_6.x = sqrt(u_xlat49);
    u_xlat6.x = u_xlat16_6.x;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat49 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.x = u_xlat49 + 0.209999993;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat16_9.xzw;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_9.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_9.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_57 = float(1.0) / float(u_xlat16_9.x);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_10.xyz = u_xlat6.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_57;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_41.x, u_xlat16_9.x);
    u_xlat16_15.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_41.yyy + u_xlat16_15.xyz;
    u_xlat16_41.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_41.x = max(u_xlat16_57, u_xlat16_41.x);
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(u_xlat16_58) + u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
    u_xlat16_26.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_15.xyz;
    u_xlat16_26.x = dot(u_xlat1.xyz, u_xlat16_26.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = log2(u_xlat16_26.x);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_25.x = exp2(u_xlat16_25.x);
    u_xlat16_26.x = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_10.xzw = u_xlat16_7.xzw * u_xlat16_10.xxx;
    u_xlat16_10.xzw = u_xlat16_9.xzw * u_xlat16_10.xzw;
    u_xlat16_10.xzw = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_25.xxx;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    u_xlat6.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_9.x = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_25.x = u_xlat32 * u_xlat32;
    u_xlat16_27 = u_xlat16_25.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_27;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_11.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.zxy * u_xlat16_25.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_9.xxx * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_9 = texture(_RD, u_xlat0.xy);
    u_xlat16_15.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_9.zxy * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_9.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_26.x = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_61 = log2(abs(u_xlat16_5.z));
    u_xlat16_61 = u_xlat16_61 * _aoPow;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_26.xxx;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat11.xyz + u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xzw + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_10.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat6.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_10.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _IrradianceACCoeffs[u_xlati51].zxy;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].zxy + u_xlat16_10.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].zxy + u_xlat16_10.xyz;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_6.www * u_xlat16_6.zxy;
    u_xlat6.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat51 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_61 * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat6.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_7.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_7.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.zxy;
    u_xlat16_10.x = dot(u_xlat16_7.zwx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_7.xzw * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_7.xzw;
    u_xlat16_10.x = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_10.xyz = u_xlat8.xyz * u_xlat16_10.xxx + u_xlat16_4.xxx;
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat1.yzx + u_xlat16_2.yzx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_8.w * _BaseColor.w;
    u_xlat1.xyz = u_xlat3.xyz + u_xlat5.xyz;
    u_xlat3.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat49 = u_xlat49 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat49 * -2.0 + 3.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat49 = u_xlat49 * u_xlat3.x;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat49 = max(u_xlat49, 0.00100000005);
    u_xlat16_10.xyz = vec3(u_xlat49) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb49 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_10.xyz = (bool(u_xlatb49)) ? u_xlat16_10.xyz : u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat49 = _EmissiveBreathe.y * _Time.y;
    u_xlat49 = cos(u_xlat49);
    u_xlat49 = max(abs(u_xlat49), _EmissiveBreathe.z);
    u_xlat16_3.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_3.zxy * _EmissionColor.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat49) + u_xlat1.xyz;
    u_xlat16_13.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_10.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat49 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat49);
    u_xlat0.x = u_xlat49 * 0.0625 + u_xlat0.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_17.xyz) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_7.x : u_xlat16_23.x;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_23;
mediump vec2 u_xlat16_25;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
int u_xlati53;
bool u_xlatb53;
mediump float u_xlat16_54;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat52 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat18.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat53 = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat16_3.x = u_xlat53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_37 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_20) * _dirLight_lightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16_20 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat0.x + u_xlat53;
    u_xlat0.x = u_xlat53 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat34 + u_xlat16_5.x;
    u_xlat16_57 = u_xlat7.y * u_xlat7.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_25.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_42 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_25.y = u_xlat16_42 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_25.xy = sqrt(u_xlat16_25.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_25.y;
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_25.x + u_xlat16_20;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_25.x = sqrt(u_xlat34);
    u_xlat16_25.x = max(u_xlat16_25.x, 6.10351563e-05);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_25.x);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat17.x + u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_54 * u_xlat16_8.x + (-u_xlat16_54);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_54 + 1.0;
    u_xlat17.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_54;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_54 = (-u_xlat16_25.x) + 1.0;
    u_xlat34 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_25.x = u_xlat16_54 * u_xlat16_8.x;
    u_xlat16_54 = (-u_xlat16_8.x) * u_xlat16_54 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.zxy * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.zxy;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_54) + u_xlat16_25.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_54 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_54 + u_xlat16_20;
    u_xlat17.z = u_xlat16_20 * u_xlat16_20;
    u_xlat53 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat53 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz;
    u_xlat53 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat53 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_41.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_41.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat17.xyz * _SpecularColor.zxy;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_6.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_11.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_23.yyy + u_xlat16_11.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_40 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_25.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_11.xyz = u_xlat4.xyz * vec3(u_xlat16_61);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_25.xxx + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_25.xxx * u_xlat16_10.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_27 = (-_RoughnessMax) + 1.0;
    u_xlat16_27 = u_xlat16_27 * 64.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_44 = u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_25.xxx * u_xlat16_8.xzw;
    u_xlat16_14.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_44 * u_xlat16_10.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_25.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat17.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat53 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = u_xlat53 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat53) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.x = u_xlat53 + 0.209999993;
    u_xlat16_3.xyw = u_xlat16_3.xyw * u_xlat4.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xzw = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb53 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb53)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_15.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_23.yyy + u_xlat16_15.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xzw);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb53 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_40 = (u_xlatb53) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_62 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(u_xlat16_62) + u_xlat16_11.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_62);
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xzw);
    u_xlat16_44 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_15.xyz = vec3(u_xlat16_44) * u_xlat16_15.xyz;
    u_xlat16_44 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = log2(u_xlat16_44);
    u_xlat16_27 = u_xlat16_44 * u_xlat16_27;
    u_xlat16_27 = exp2(u_xlat16_27);
    u_xlat16_44 = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_15.xyz = u_xlat16_8.xzw * u_xlat16_10.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = max(u_xlat16_15.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.x = u_xlat16_44 * u_xlat16_27;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyw = u_xlat16_3.xyw + u_xlat16_6.xyz;
    u_xlat4.xyz = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16_37 = u_xlat16_5.w * u_xlat16_37 + 1.0;
    u_xlat53 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat53;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_6.x = min(u_xlat16_37, u_xlat0.x);
    u_xlat16_6.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_10.zxy * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat12.xyz = vec3(_RampLertStr) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_37 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_6.x = log2(abs(u_xlat16_5.z));
    u_xlat16_6.x = u_xlat16_6.x * _aoPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat12.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat53 = (-u_xlat16_41.y) + 1.0;
    u_xlat16_37 = u_xlat16_41.x * _sssLutLerp;
    u_xlat16_23.x = u_xlat53 * u_xlat53;
    u_xlat16_30 = u_xlat16_23.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_30;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.zxy * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_37) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat18.y<0.0; u_xlati53 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati53 = int((u_xlat18.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati53 = int(int_bitfieldInsert(2,u_xlati53,0,1) );
    u_xlat16_37 = u_xlat18.y * u_xlat18.y;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = u_xlatb53 ? 1 : int(0);
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy + u_xlat16_14.xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = (u_xlatb53) ? 5 : 4;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy + u_xlat16_14.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_6.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat5.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat16_37 = dot((-u_xlat16_11.xyz), u_xlat18.xyz);
    u_xlat16_37 = u_xlat16_37 + u_xlat16_37;
    u_xlat18.xyz = (-u_xlat18.xyz) * vec3(u_xlat16_37) + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat18.xyz);
    u_xlat1.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat18.xyz;
    u_xlat16_37 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_37;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.zxy;
    u_xlat16_37 = dot(u_xlat16_6.yzx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_37 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_37) + u_xlat16_17.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_25.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat17.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat17.yzx + u_xlat16_3.ywx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_9.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_23;
mediump vec2 u_xlat16_25;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
int u_xlati53;
bool u_xlatb53;
mediump float u_xlat16_54;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat52 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat18.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat53 = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat16_3.x = u_xlat53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_37 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_20) * _dirLight_lightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16_20 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat0.x + u_xlat53;
    u_xlat0.x = u_xlat53 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat34 + u_xlat16_5.x;
    u_xlat16_57 = u_xlat7.y * u_xlat7.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_25.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_42 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_25.y = u_xlat16_42 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_25.xy = sqrt(u_xlat16_25.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_25.y;
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_25.x + u_xlat16_20;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_25.x = sqrt(u_xlat34);
    u_xlat16_25.x = max(u_xlat16_25.x, 6.10351563e-05);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_25.x);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat17.x + u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_54 * u_xlat16_8.x + (-u_xlat16_54);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_54 + 1.0;
    u_xlat17.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_54;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_54 = (-u_xlat16_25.x) + 1.0;
    u_xlat34 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_25.x = u_xlat16_54 * u_xlat16_8.x;
    u_xlat16_54 = (-u_xlat16_8.x) * u_xlat16_54 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.zxy * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.zxy;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_54) + u_xlat16_25.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_54 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_54 + u_xlat16_20;
    u_xlat17.z = u_xlat16_20 * u_xlat16_20;
    u_xlat53 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat53 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz;
    u_xlat53 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat53 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_41.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_41.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat17.xyz * _SpecularColor.zxy;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_6.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_11.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_23.yyy + u_xlat16_11.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_40 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_25.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_11.xyz = u_xlat4.xyz * vec3(u_xlat16_61);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_25.xxx + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_25.xxx * u_xlat16_10.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_27 = (-_RoughnessMax) + 1.0;
    u_xlat16_27 = u_xlat16_27 * 64.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_44 = u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_25.xxx * u_xlat16_8.xzw;
    u_xlat16_14.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_44 * u_xlat16_10.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_25.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat17.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat53 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = u_xlat53 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat53) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.x = u_xlat53 + 0.209999993;
    u_xlat16_3.xyw = u_xlat16_3.xyw * u_xlat4.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xzw = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb53 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb53)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_15.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_23.yyy + u_xlat16_15.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xzw);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb53 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_40 = (u_xlatb53) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_62 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(u_xlat16_62) + u_xlat16_11.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_62);
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xzw);
    u_xlat16_44 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_15.xyz = vec3(u_xlat16_44) * u_xlat16_15.xyz;
    u_xlat16_44 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = log2(u_xlat16_44);
    u_xlat16_27 = u_xlat16_44 * u_xlat16_27;
    u_xlat16_27 = exp2(u_xlat16_27);
    u_xlat16_44 = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_15.xyz = u_xlat16_8.xzw * u_xlat16_10.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = max(u_xlat16_15.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.x = u_xlat16_44 * u_xlat16_27;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyw = u_xlat16_3.xyw + u_xlat16_6.xyz;
    u_xlat4.xyz = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16_37 = u_xlat16_5.w * u_xlat16_37 + 1.0;
    u_xlat53 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat53;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_6.x = min(u_xlat16_37, u_xlat0.x);
    u_xlat16_6.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_10.zxy * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat12.xyz = vec3(_RampLertStr) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_37 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_6.x = log2(abs(u_xlat16_5.z));
    u_xlat16_6.x = u_xlat16_6.x * _aoPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat12.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat53 = (-u_xlat16_41.y) + 1.0;
    u_xlat16_37 = u_xlat16_41.x * _sssLutLerp;
    u_xlat16_23.x = u_xlat53 * u_xlat53;
    u_xlat16_30 = u_xlat16_23.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_30;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.zxy * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_37) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat18.y<0.0; u_xlati53 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati53 = int((u_xlat18.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati53 = int(int_bitfieldInsert(2,u_xlati53,0,1) );
    u_xlat16_37 = u_xlat18.y * u_xlat18.y;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = u_xlatb53 ? 1 : int(0);
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy + u_xlat16_14.xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = (u_xlatb53) ? 5 : 4;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].zxy + u_xlat16_14.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_6.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat5.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat16_37 = dot((-u_xlat16_11.xyz), u_xlat18.xyz);
    u_xlat16_37 = u_xlat16_37 + u_xlat16_37;
    u_xlat18.xyz = (-u_xlat18.xyz) * vec3(u_xlat16_37) + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat18.xyz);
    u_xlat1.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat18.xyz;
    u_xlat16_37 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_37;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.zxy;
    u_xlat16_37 = dot(u_xlat16_6.yzx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_37 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_37) + u_xlat16_17.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_25.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat17.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat17.yzx + u_xlat16_3.ywx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_9.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(8) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_18;
mediump vec2 u_xlat16_23;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat32;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_41;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_61;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat4.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat5.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_18 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_50 = u_xlat6.y * u_xlat6.y;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_7.x = u_xlat16_50 * u_xlat16_50;
    u_xlat16_23.x = (-u_xlat16_18) * u_xlat16_7.x + u_xlat16_18;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_18 + u_xlat16_7.x;
    u_xlat16_39 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_23.y = u_xlat16_39 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_23.xy = sqrt(u_xlat16_23.xy);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_23.y;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_23.x + u_xlat16_18;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_23.x = sqrt(u_xlat32);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat0.x + u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_34 * u_xlat16_7.x + (-u_xlat16_34);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_34 + 1.0;
    u_xlat0.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_34;
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_18 = u_xlat16_7.x / u_xlat16_18;
    u_xlat16_34 = (-u_xlat16_23.x) + 1.0;
    u_xlat32 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_7.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_23.x = u_xlat16_34 * u_xlat16_7.x;
    u_xlat16_34 = (-u_xlat16_7.x) * u_xlat16_34 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.xyz;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.xyz;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_34) + u_xlat16_23.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_18) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_18 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_34 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = _SkinSpeRoughness * u_xlat16_34 + u_xlat16_18;
    u_xlat49 = u_xlat16_18 * u_xlat16_18;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_18 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_18) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.xyz;
    u_xlat49 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat49 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_23.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_25.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_57;
    u_xlat16_10.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_23.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_57);
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_23.xxx + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz;
    u_xlat16_23.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_14.xyz;
    u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_25.x = (-_RoughnessMax) + 1.0;
    u_xlat16_25.x = u_xlat16_25.x * 64.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_41.x = u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_23.xxx * u_xlat16_7.xzw;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_23.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_10.xyz * u_xlat16_23.xxx;
    u_xlat16_9.xzw = max(u_xlat16_9.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_6 = sqrt(u_xlat49);
    u_xlat6.x = u_xlat16_6;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat49 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.x = u_xlat49 + 0.209999993;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat16_9.xzw;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_9.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_9.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_57 = float(1.0) / float(u_xlat16_9.x);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_10.xyz = u_xlat6.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_57;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_41.x, u_xlat16_9.x);
    u_xlat16_15.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_41.yyy + u_xlat16_15.xyz;
    u_xlat16_41.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_41.x = max(u_xlat16_57, u_xlat16_41.x);
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(u_xlat16_58) + u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
    u_xlat16_26.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_15.xyz;
    u_xlat16_26.x = dot(u_xlat1.xyz, u_xlat16_26.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = log2(u_xlat16_26.x);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_25.x = exp2(u_xlat16_25.x);
    u_xlat16_26.x = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_10.xzw = u_xlat16_7.xzw * u_xlat16_10.xxx;
    u_xlat16_10.xzw = u_xlat16_9.xzw * u_xlat16_10.xzw;
    u_xlat16_10.xzw = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_25.xxx;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    u_xlat6.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_9.x = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_25.x = u_xlat32 * u_xlat32;
    u_xlat16_27 = u_xlat16_25.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_27;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_11.xyz * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat16_25.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_9.xxx * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_9 = texture(_RD, u_xlat0.xy);
    u_xlat16_15.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_9.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_26.x = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_61 = log2(abs(u_xlat16_5.z));
    u_xlat16_61 = u_xlat16_61 * _aoPow;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_26.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat11.xyz + u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xzw + u_xlat16_14.xyz;
    u_xlat0.xyz = max(u_xlat16_10.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_10.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_10.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_10.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat51 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_61 * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat5.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_7.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_50;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.xyz;
    u_xlat16_50 = dot(u_xlat16_7.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb48)) ? u_xlat16_10.xyz : u_xlat16_7.xzw;
    u_xlat16_50 = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_10.xyz = u_xlat8.xyz * vec3(u_xlat16_50) + u_xlat16_4.xxx;
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_8.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat48 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat48 * -2.0 + 3.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat48 = min(u_xlat48, 1.0);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat16_7.xyz = vec3(u_xlat48) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb48 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_7.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_7.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_18;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(8) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_18;
mediump vec2 u_xlat16_23;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat32;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_41;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_61;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat4.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat5.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_18 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_50 = u_xlat6.y * u_xlat6.y;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_7.x = u_xlat16_50 * u_xlat16_50;
    u_xlat16_23.x = (-u_xlat16_18) * u_xlat16_7.x + u_xlat16_18;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_18 + u_xlat16_7.x;
    u_xlat16_39 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_23.y = u_xlat16_39 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_23.xy = sqrt(u_xlat16_23.xy);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_23.y;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_23.x + u_xlat16_18;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_23.x = sqrt(u_xlat32);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat0.x + u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_34 * u_xlat16_7.x + (-u_xlat16_34);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_34 + 1.0;
    u_xlat0.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_34;
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_18 = u_xlat16_7.x / u_xlat16_18;
    u_xlat16_34 = (-u_xlat16_23.x) + 1.0;
    u_xlat32 = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_7.x = u_xlat16_34 * u_xlat16_34;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_23.x = u_xlat16_34 * u_xlat16_7.x;
    u_xlat16_34 = (-u_xlat16_7.x) * u_xlat16_34 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.xyz;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.xyz;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_34) + u_xlat16_23.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_18) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_18 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_34 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = _SkinSpeRoughness * u_xlat16_34 + u_xlat16_18;
    u_xlat49 = u_xlat16_18 * u_xlat16_18;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_18 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_18) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.xyz;
    u_xlat49 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat49 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_23.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_9.x = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_9.x = (-u_xlat16_9.x) * u_xlat16_9.x + 1.0;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_25.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_9.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_9.x);
#endif
    u_xlat16_9.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.x = max(u_xlat16_23.x, u_xlat16_9.x);
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.yyy + u_xlat16_9.xzw;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_10.x = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_57;
    u_xlat16_10.xyz = u_xlat16_23.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_23.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_57);
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_23.xxx + u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz;
    u_xlat16_23.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_14.xyz;
    u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_25.x = (-_RoughnessMax) + 1.0;
    u_xlat16_25.x = u_xlat16_25.x * 64.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_25.x;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_41.x = u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_23.xxx * u_xlat16_7.xzw;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_23.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_10.xyz * u_xlat16_23.xxx;
    u_xlat16_9.xzw = max(u_xlat16_9.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_6 = sqrt(u_xlat49);
    u_xlat6.x = u_xlat16_6;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat49 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.x = u_xlat49 + 0.209999993;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat16_9.xzw;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_9.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 6.10351563e-05);
    u_xlat16_41.x = u_xlat16_9.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_41.x = (-u_xlat16_41.x) * u_xlat16_41.x + 1.0;
    u_xlat16_41.x = max(u_xlat16_41.x, 0.0);
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_57 = float(1.0) / float(u_xlat16_9.x);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_10.xyz = u_xlat6.xyz * u_xlat16_9.xxx;
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_57;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb49 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb49)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_41.x, u_xlat16_9.x);
    u_xlat16_15.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_41.yyy + u_xlat16_15.xyz;
    u_xlat16_41.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat16_41.x = u_xlat16_41.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb49 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_57 = (u_xlatb49) ? 1.0 : 0.0;
    u_xlat16_41.x = max(u_xlat16_57, u_xlat16_41.x);
    u_xlat16_9.x = u_xlat16_41.x * u_xlat16_9.x;
    u_xlat16_9.xzw = u_xlat16_9.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(u_xlat16_58) + u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
    u_xlat16_26.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_15.xyz;
    u_xlat16_26.x = dot(u_xlat1.xyz, u_xlat16_26.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = log2(u_xlat16_26.x);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_25.x = exp2(u_xlat16_25.x);
    u_xlat16_26.x = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_10.xzw = u_xlat16_7.xzw * u_xlat16_10.xxx;
    u_xlat16_10.xzw = u_xlat16_9.xzw * u_xlat16_10.xzw;
    u_xlat16_10.xzw = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_26.x;
    u_xlat16_9.xyz = u_xlat16_9.xzw * u_xlat16_25.xxx;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_9.xyz;
    u_xlat6.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_9.x = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_25.x = u_xlat32 * u_xlat32;
    u_xlat16_27 = u_xlat16_25.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_27;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_11.xyz * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat16_25.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_9.xxx * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_9 = texture(_RD, u_xlat0.xy);
    u_xlat16_15.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_9.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_26.x = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_61 = log2(abs(u_xlat16_5.z));
    u_xlat16_61 = u_xlat16_61 * _aoPow;
    u_xlat16_61 = exp2(u_xlat16_61);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_26.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat11.xyz + u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xzw + u_xlat16_14.xyz;
    u_xlat0.xyz = max(u_xlat16_10.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_10.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_10.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_10.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_10.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat51 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_61 * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat51) * u_xlat16_7.xzw;
    u_xlat5.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_7.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_50;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.xyz;
    u_xlat16_50 = dot(u_xlat16_7.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb48)) ? u_xlat16_10.xyz : u_xlat16_7.xzw;
    u_xlat16_50 = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_10.xyz = u_xlat8.xyz * vec3(u_xlat16_50) + u_xlat16_4.xxx;
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_10.xyz;
    u_xlat16_7.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_8.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat48 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat48 * -2.0 + 3.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat48 = min(u_xlat48, 1.0);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat16_7.xyz = vec3(u_xlat48) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb48 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_7.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_7.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_18;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(10) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_23;
mediump vec2 u_xlat16_25;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
int u_xlati53;
bool u_xlatb53;
mediump float u_xlat16_54;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat52 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat18.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat53 = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat16_3.x = u_xlat53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_37 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_20) * _dirLight_lightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16_20 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat0.x + u_xlat53;
    u_xlat0.x = u_xlat53 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat34 + u_xlat16_5.x;
    u_xlat16_57 = u_xlat7.y * u_xlat7.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_25.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_42 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_25.y = u_xlat16_42 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_25.xy = sqrt(u_xlat16_25.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_25.y;
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_25.x + u_xlat16_20;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_25.x = sqrt(u_xlat34);
    u_xlat16_25.x = max(u_xlat16_25.x, 6.10351563e-05);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_25.x);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat17.x + u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_54 * u_xlat16_8.x + (-u_xlat16_54);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_54 + 1.0;
    u_xlat17.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_54;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_54 = (-u_xlat16_25.x) + 1.0;
    u_xlat34 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_25.x = u_xlat16_54 * u_xlat16_8.x;
    u_xlat16_54 = (-u_xlat16_8.x) * u_xlat16_54 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.xyz;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.xyz;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_54) + u_xlat16_25.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_54 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_54 + u_xlat16_20;
    u_xlat17.z = u_xlat16_20 * u_xlat16_20;
    u_xlat53 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat53 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz;
    u_xlat53 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat53 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_41.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_41.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat17.xyz * _SpecularColor.xyz;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_6.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_11.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_23.yyy + u_xlat16_11.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_40 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_25.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_11.xyz = u_xlat4.xyz * vec3(u_xlat16_61);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_25.xxx + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_25.xxx * u_xlat16_10.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_27 = (-_RoughnessMax) + 1.0;
    u_xlat16_27 = u_xlat16_27 * 64.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_44 = u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_25.xxx * u_xlat16_8.xzw;
    u_xlat16_14.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_44 * u_xlat16_10.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_25.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat17.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat53 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = u_xlat53 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat53) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.x = u_xlat53 + 0.209999993;
    u_xlat16_3.xyw = u_xlat16_3.xyw * u_xlat4.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xzw = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb53 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb53)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_15.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_23.yyy + u_xlat16_15.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xzw);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb53 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_40 = (u_xlatb53) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_62 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(u_xlat16_62) + u_xlat16_11.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_62);
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xzw);
    u_xlat16_44 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_15.xyz = vec3(u_xlat16_44) * u_xlat16_15.xyz;
    u_xlat16_44 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = log2(u_xlat16_44);
    u_xlat16_27 = u_xlat16_44 * u_xlat16_27;
    u_xlat16_27 = exp2(u_xlat16_27);
    u_xlat16_44 = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_15.xyz = u_xlat16_8.xzw * u_xlat16_10.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = max(u_xlat16_15.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.x = u_xlat16_44 * u_xlat16_27;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyw = u_xlat16_3.xyw + u_xlat16_6.xyz;
    u_xlat4.xyz = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16_37 = u_xlat16_5.w * u_xlat16_37 + 1.0;
    u_xlat53 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat53;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_6.x = min(u_xlat16_37, u_xlat0.x);
    u_xlat16_6.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat12.xyz = vec3(_RampLertStr) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_37 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_6.x = log2(abs(u_xlat16_5.z));
    u_xlat16_6.x = u_xlat16_6.x * _aoPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat12.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat53 = (-u_xlat16_41.y) + 1.0;
    u_xlat16_37 = u_xlat16_41.x * _sssLutLerp;
    u_xlat16_23.x = u_xlat53 * u_xlat53;
    u_xlat16_30 = u_xlat16_23.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_30;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_37) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat18.y<0.0; u_xlati53 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati53 = int((u_xlat18.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati53 = int(int_bitfieldInsert(2,u_xlati53,0,1) );
    u_xlat16_37 = u_xlat18.y * u_xlat18.y;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = u_xlatb53 ? 1 : int(0);
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz + u_xlat16_14.xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = (u_xlatb53) ? 5 : 4;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz + u_xlat16_14.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_6.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat5.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat16_37 = dot((-u_xlat16_11.xyz), u_xlat18.xyz);
    u_xlat16_37 = u_xlat16_37 + u_xlat16_37;
    u_xlat18.xyz = (-u_xlat18.xyz) * vec3(u_xlat16_37) + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat18.xyz);
    u_xlat1.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat18.xyz;
    u_xlat16_37 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_37;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.xyz;
    u_xlat16_37 = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_37 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_37) + u_xlat16_17.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_25.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat17.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat17.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_9.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(10) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_23;
mediump vec2 u_xlat16_25;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
int u_xlati53;
bool u_xlatb53;
mediump float u_xlat16_54;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat52 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat18.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat53 = dot(u_xlat18.xyz, u_xlat17.xyz);
    u_xlat16_3.x = u_xlat53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_37 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_20) * _dirLight_lightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16_20 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat0.x + u_xlat53;
    u_xlat0.x = u_xlat53 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat34 + u_xlat16_5.x;
    u_xlat16_57 = u_xlat7.y * u_xlat7.y;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_25.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_42 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_25.y = u_xlat16_42 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_25.xy = sqrt(u_xlat16_25.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_25.y;
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_25.x + u_xlat16_20;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_25.x = sqrt(u_xlat34);
    u_xlat16_25.x = max(u_xlat16_25.x, 6.10351563e-05);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_25.x);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat17.x + u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_54 * u_xlat16_8.x + (-u_xlat16_54);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_42 = u_xlat16_42 * u_xlat16_54 + 1.0;
    u_xlat17.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = u_xlat16_42 * u_xlat16_42;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_54;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_54 = (-u_xlat16_25.x) + 1.0;
    u_xlat34 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_25.x = u_xlat16_54 * u_xlat16_8.x;
    u_xlat16_54 = (-u_xlat16_8.x) * u_xlat16_54 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.xyz;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.xyz;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_54) + u_xlat16_25.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_54 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_54 + u_xlat16_20;
    u_xlat17.z = u_xlat16_20 * u_xlat16_20;
    u_xlat53 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat53 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz;
    u_xlat53 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat53 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_41.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_41.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_3.xxx * u_xlat17.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat17.xyz * _SpecularColor.xyz;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_6.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_11.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_23.yyy + u_xlat16_11.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_40 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_25.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_11.xyz = u_xlat4.xyz * vec3(u_xlat16_61);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_25.xxx + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_25.xxx * u_xlat16_10.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_14.xyz;
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_27 = (-_RoughnessMax) + 1.0;
    u_xlat16_27 = u_xlat16_27 * 64.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_44 = u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * 0.5 + 0.5;
    u_xlat16_14.xyz = u_xlat16_25.xxx * u_xlat16_8.xzw;
    u_xlat16_14.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.x = u_xlat16_44 * u_xlat16_10.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_25.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat17.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat53 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = u_xlat53 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat53) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.x = u_xlat53 + 0.209999993;
    u_xlat16_3.xyw = u_xlat16_3.xyw * u_xlat4.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_6.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_40 = float(1.0) / float(u_xlat16_6.x);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_10.xzw = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_40;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb53 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb53)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_23.x, u_xlat16_6.x);
    u_xlat16_15.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_23.yyy + u_xlat16_15.xyz;
    u_xlat16_23.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xzw);
    u_xlat16_23.x = u_xlat16_23.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb53 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_40 = (u_xlatb53) ? 1.0 : 0.0;
    u_xlat16_23.x = max(u_xlat16_40, u_xlat16_23.x);
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_62 = dot(u_xlat16_10.xzw, u_xlat16_10.xzw);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(u_xlat16_62) + u_xlat16_11.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_62);
    u_xlat16_10.x = dot(u_xlat18.xyz, u_xlat16_10.xzw);
    u_xlat16_44 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_15.xyz = vec3(u_xlat16_44) * u_xlat16_15.xyz;
    u_xlat16_44 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = log2(u_xlat16_44);
    u_xlat16_27 = u_xlat16_44 * u_xlat16_27;
    u_xlat16_27 = exp2(u_xlat16_27);
    u_xlat16_44 = u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + 0.5;
    u_xlat16_15.xyz = u_xlat16_8.xzw * u_xlat16_10.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = max(u_xlat16_15.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.x = u_xlat16_44 * u_xlat16_27;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xxx;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyw = u_xlat16_3.xyw + u_xlat16_6.xyz;
    u_xlat4.xyz = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat16_37 = u_xlat16_5.w * u_xlat16_37 + 1.0;
    u_xlat53 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat53;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_6.x = min(u_xlat16_37, u_xlat0.x);
    u_xlat16_6.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_6.xy);
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat12.xyz = vec3(_RampLertStr) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_37 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_6.x = log2(abs(u_xlat16_5.z));
    u_xlat16_6.x = u_xlat16_6.x * _aoPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat12.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat53 = (-u_xlat16_41.y) + 1.0;
    u_xlat16_37 = u_xlat16_41.x * _sssLutLerp;
    u_xlat16_23.x = u_xlat53 * u_xlat53;
    u_xlat16_30 = u_xlat16_23.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_30;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_37) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat7.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat18.y<0.0; u_xlati53 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati53 = int((u_xlat18.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati53 = int(int_bitfieldInsert(2,u_xlati53,0,1) );
    u_xlat16_37 = u_xlat18.y * u_xlat18.y;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = u_xlatb53 ? 1 : int(0);
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz + u_xlat16_14.xyz;
    u_xlat16_37 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(u_xlat16_37<0.0);
#else
    u_xlatb53 = u_xlat16_37<0.0;
#endif
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlati53 = (u_xlatb53) ? 5 : 4;
    u_xlat16_14.xyz = vec3(u_xlat16_37) * _IrradianceACCoeffs[u_xlati53].xyz + u_xlat16_14.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_14.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_6.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat5.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat16_37 = dot((-u_xlat16_11.xyz), u_xlat18.xyz);
    u_xlat16_37 = u_xlat16_37 + u_xlat16_37;
    u_xlat18.xyz = (-u_xlat18.xyz) * vec3(u_xlat16_37) + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat18.xyz);
    u_xlat1.xyz = vec3(u_xlat16_57) * u_xlat2.xyz + u_xlat18.xyz;
    u_xlat16_37 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_37;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.xyz;
    u_xlat16_37 = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_37) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_37 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_37) + u_xlat16_17.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_25.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat17.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat17.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_9.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(9) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_17;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
mediump float u_xlat16_32;
mediump float u_xlat16_37;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
mediump float u_xlat16_47;
float u_xlat48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_54;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat45 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat45 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat45 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat3.xyz;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat48 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_17 = u_xlat48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat46 + u_xlat48;
    u_xlat15 = u_xlat46 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat30 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat30 + u_xlat16_5.x;
    u_xlat16_47 = u_xlat6.y * u_xlat6.y;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_7.x = u_xlat16_47 * u_xlat16_47;
    u_xlat16_22.x = (-u_xlat16_17) * u_xlat16_7.x + u_xlat16_17;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_17 + u_xlat16_7.x;
    u_xlat16_37 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_22.y = u_xlat16_37 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_22.xy = sqrt(u_xlat16_22.xy);
    u_xlat16_17 = u_xlat16_17 * u_xlat16_22.y;
    u_xlat16_17 = u_xlat16_2.x * u_xlat16_22.x + u_xlat16_17;
    u_xlat30 = u_xlat0.x * 2.0 + 2.0;
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat16_22.x = sqrt(u_xlat30);
    u_xlat16_22.x = max(u_xlat16_22.x, 6.10351563e-05);
    u_xlat16_22.x = float(1.0) / float(u_xlat16_22.x);
    u_xlat16_32 = u_xlat16_32 * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
    u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_22.x * u_xlat0.x + u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_37 = u_xlat16_32 * u_xlat16_7.x + (-u_xlat16_32);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_32 + 1.0;
    u_xlat0.x = u_xlat16_32 * u_xlat16_32;
    u_xlat16_32 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_32;
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_17 = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_32 = (-u_xlat16_22.x) + 1.0;
    u_xlat30 = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat30 = max(u_xlat30, 6.10351563e-05);
    u_xlat30 = float(1.0) / float(u_xlat30);
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_32;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_22.x = u_xlat16_32 * u_xlat16_7.x;
    u_xlat16_32 = (-u_xlat16_7.x) * u_xlat16_32 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.zxy;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.zxy;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_32) + u_xlat16_22.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_17) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_17 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_32 = (-u_xlat16_17) + 1.0;
    u_xlat16_17 = _SkinSpeRoughness * u_xlat16_32 + u_xlat16_17;
    u_xlat46 = u_xlat16_17 * u_xlat16_17;
    u_xlat48 = u_xlat46 * u_xlat46 + -1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat0.x = u_xlat0.x * u_xlat48 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat46 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat30 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_17 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_17) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.zxy;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.zxy;
    u_xlat46 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat46 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_9.xyz = u_xlat4.xyz * u_xlat16_22.xxx;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_6 = sqrt(u_xlat46);
    u_xlat6.x = u_xlat16_6;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat46 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat46 = u_xlat46 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat46) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.x = u_xlat46 + 0.209999993;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat12.xyz = max(u_xlat12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat30 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_54 = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_10.x = u_xlat30 * u_xlat30;
    u_xlat16_26 = u_xlat16_10.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_26;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_11.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.zxy * u_xlat16_10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = vec3(u_xlat16_54) * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat15);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat0.xy);
    u_xlat16_13.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat46 = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_54 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_13.x = log2(abs(u_xlat16_5.z));
    u_xlat16_13.x = u_xlat16_13.x * _aoPow;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(u_xlat16_54);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat12.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati48 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati48 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati48,0,1) );
    u_xlat16_54 = u_xlat1.y * u_xlat1.y;
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy;
    u_xlat16_54 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_54<0.0);
#else
    u_xlatb48 = u_xlat16_54<0.0;
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlati48 = u_xlatb48 ? 1 : int(0);
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy + u_xlat16_28.xyz;
    u_xlat16_54 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_54<0.0);
#else
    u_xlatb48 = u_xlat16_54<0.0;
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlati48 = (u_xlatb48) ? 5 : 4;
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy + u_xlat16_28.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_28.xyz;
    u_xlat48 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat48) * u_xlat16_7.xzw;
    u_xlat48 = (-_directOcclusionColor.x) + 1.0;
    u_xlat48 = u_xlat16_13.x * u_xlat48 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat48) * u_xlat16_7.xzw;
    u_xlat5.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_7.x = dot((-u_xlat16_9.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_9.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat45) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_47;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.zxy;
    u_xlat16_47 = dot(u_xlat16_7.zwx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = vec3(u_xlat16_47) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb45 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb45)) ? u_xlat16_9.xyz : u_xlat16_7.xzw;
    u_xlat16_47 = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_47) + u_xlat16_4.xxx;
    u_xlat16_9.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_9.xyz;
    u_xlat16_7.xyz = vec3(u_xlat48) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat6.yzx + u_xlat1.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_8.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat45 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat45 * -2.0 + 3.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat1.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat16_7.xyz = vec3(u_xlat45) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_7.xyz = (bool(u_xlatb45)) ? u_xlat16_7.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_7.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat45 = _EmissiveBreathe.y * _Time.y;
    u_xlat45 = cos(u_xlat45);
    u_xlat45 = max(abs(u_xlat45), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat45) + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_7.xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_17;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(9) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_17;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
mediump float u_xlat16_32;
mediump float u_xlat16_37;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
mediump float u_xlat16_47;
float u_xlat48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_54;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat45 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat45 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat16_2.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat45 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat45 = max(u_xlat45, 1.17549435e-38);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat3.xyz;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.x = u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat48 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_17 = u_xlat48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat46 + u_xlat48;
    u_xlat15 = u_xlat46 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 + (-_RemaphalfLambert_center);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat30 = (-u_xlat16_5.x) + 1.0;
    u_xlat6.y = _RoughnessMax * u_xlat30 + u_xlat16_5.x;
    u_xlat16_47 = u_xlat6.y * u_xlat6.y;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_7.x = u_xlat16_47 * u_xlat16_47;
    u_xlat16_22.x = (-u_xlat16_17) * u_xlat16_7.x + u_xlat16_17;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_17 + u_xlat16_7.x;
    u_xlat16_37 = (-u_xlat16_2.x) * u_xlat16_7.x + u_xlat16_2.x;
    u_xlat16_22.y = u_xlat16_37 * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_22.xy = sqrt(u_xlat16_22.xy);
    u_xlat16_17 = u_xlat16_17 * u_xlat16_22.y;
    u_xlat16_17 = u_xlat16_2.x * u_xlat16_22.x + u_xlat16_17;
    u_xlat30 = u_xlat0.x * 2.0 + 2.0;
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat16_22.x = sqrt(u_xlat30);
    u_xlat16_22.x = max(u_xlat16_22.x, 6.10351563e-05);
    u_xlat16_22.x = float(1.0) / float(u_xlat16_22.x);
    u_xlat16_32 = u_xlat16_32 * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
    u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_22.x * u_xlat0.x + u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_37 = u_xlat16_32 * u_xlat16_7.x + (-u_xlat16_32);
    u_xlat16_7.x = u_xlat16_7.x * 0.159154937;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_32 + 1.0;
    u_xlat0.x = u_xlat16_32 * u_xlat16_32;
    u_xlat16_32 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_32;
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_17 = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_32 = (-u_xlat16_22.x) + 1.0;
    u_xlat30 = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat30 = max(u_xlat30, 6.10351563e-05);
    u_xlat30 = float(1.0) / float(u_xlat30);
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_32;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_22.x = u_xlat16_32 * u_xlat16_7.x;
    u_xlat16_32 = (-u_xlat16_7.x) * u_xlat16_32 + 1.0;
    u_xlat16_8 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xzw = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_8.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_8.zxy;
    u_xlat8.xyz = u_xlat16_7.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xzw = u_xlat16_7.xzw * _BaseColor.zxy;
    u_xlat16_9.x = u_xlat16_5.y * _MetallicMax;
    u_xlat8.xyz = u_xlat16_9.xxx * u_xlat8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_32) + u_xlat16_22.xxx;
    u_xlat16_10.xyz = vec3(u_xlat16_17) * u_xlat16_9.xyz;
    u_xlat11.xyz = max(u_xlat16_10.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_17 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_32 = (-u_xlat16_17) + 1.0;
    u_xlat16_17 = _SkinSpeRoughness * u_xlat16_32 + u_xlat16_17;
    u_xlat46 = u_xlat16_17 * u_xlat16_17;
    u_xlat48 = u_xlat46 * u_xlat46 + -1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat0.x = u_xlat0.x * u_xlat48 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat46 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat30 * u_xlat0.x;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat0.xxx;
    u_xlat12.xyz = u_xlat16_2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat11.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_17 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat11.xyz = vec3(u_xlat16_17) * u_xlat12.xyz + u_xlat11.xyz;
    u_xlat16_9.xyz = u_xlat11.xyz * _SpecularColor.zxy;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _dirLight_lightColor.zxy;
    u_xlat46 = u_xlat16_2.x * 0.5 + 0.5;
    u_xlat11.x = u_xlat46 * _SssLutXScale;
    u_xlat16_2.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_9.xyz = u_xlat4.xyz * u_xlat16_22.xxx;
    u_xlat46 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_6 = sqrt(u_xlat46);
    u_xlat6.x = u_xlat16_6;
    u_xlat16_4.xyz = texture(_FGD, u_xlat6.xy).xyz;
    u_xlat46 = max(u_xlat16_4.y, 0.0399999991);
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat46 = u_xlat46 + -1.0;
    u_xlat6.xyz = u_xlat8.xyz * vec3(u_xlat46) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.x = u_xlat46 + 0.209999993;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat12.xyz = max(u_xlat12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat30 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_54 = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_10.x = u_xlat30 * u_xlat30;
    u_xlat16_26 = u_xlat16_10.x * _SssLutYScale;
    u_xlat11.y = u_xlat16_26;
    u_xlat16_11.xyz = texture(_SssLut, u_xlat11.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_11.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.zxy * u_xlat16_10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = vec3(u_xlat16_54) * u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat15);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat0.xy);
    u_xlat16_13.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat46 = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_54 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_13.x = log2(abs(u_xlat16_5.z));
    u_xlat16_13.x = u_xlat16_13.x * _aoPow;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(u_xlat16_54);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xzw;
    u_xlat16_7.xzw = u_xlat16_7.xzw * _AmbientLightColorTint.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.xyz = u_xlat11.xyz * u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat12.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati48 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati48 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati48,0,1) );
    u_xlat16_54 = u_xlat1.y * u_xlat1.y;
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy;
    u_xlat16_54 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_54<0.0);
#else
    u_xlatb48 = u_xlat16_54<0.0;
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlati48 = u_xlatb48 ? 1 : int(0);
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy + u_xlat16_28.xyz;
    u_xlat16_54 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_54<0.0);
#else
    u_xlatb48 = u_xlat16_54<0.0;
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlati48 = (u_xlatb48) ? 5 : 4;
    u_xlat16_28.xyz = vec3(u_xlat16_54) * _IrradianceACCoeffs[u_xlati48].zxy + u_xlat16_28.xyz;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_14.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_28.xyz;
    u_xlat48 = u_xlat16_4.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_7.xzw = vec3(u_xlat48) * u_xlat16_7.xzw;
    u_xlat48 = (-_directOcclusionColor.x) + 1.0;
    u_xlat48 = u_xlat16_13.x * u_xlat48 + _directOcclusionColor.x;
    u_xlat16_7.xzw = vec3(u_xlat48) * u_xlat16_7.xzw;
    u_xlat5.xyz = max(u_xlat16_7.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_7.x = dot((-u_xlat16_9.xyz), u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_7.xxx + (-u_xlat16_9.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat45) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_47;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_7.xzw = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat1.xyz = u_xlat16_7.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_7.xzw = u_xlat16_7.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xzw = u_xlat16_7.xzw * _EnvmapIntensity.zxy;
    u_xlat16_47 = dot(u_xlat16_7.zwx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = vec3(u_xlat16_47) * u_xlat16_7.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb45 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xzw = (bool(u_xlatb45)) ? u_xlat16_9.xyz : u_xlat16_7.xzw;
    u_xlat16_47 = (-u_xlat16_4.x) + u_xlat16_4.y;
    u_xlat16_9.xyz = u_xlat8.xyz * vec3(u_xlat16_47) + u_xlat16_4.xxx;
    u_xlat16_9.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_9.xyz;
    u_xlat16_7.xyz = vec3(u_xlat48) * u_xlat16_7.xyz;
    u_xlat1.xyz = min(u_xlat16_7.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat6.yzx + u_xlat1.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _BaseColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_8.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat45 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat45 * -2.0 + 3.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat1.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat16_7.xyz = vec3(u_xlat45) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_7.xyz = (bool(u_xlatb45)) ? u_xlat16_7.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_7.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat45 = _EmissiveBreathe.y * _Time.y;
    u_xlat45 = cos(u_xlat45);
    u_xlat45 = max(abs(u_xlat45), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat45) + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_7.xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_17;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
mediump float u_xlat16_19;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_29;
float u_xlat32;
mediump float u_xlat16_35;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
float u_xlat50;
int u_xlati50;
bool u_xlatb50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb49 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb49)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat17.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat17.x = (-u_xlat1.x) + u_xlat17.x;
    u_xlat0.z = _ShadowBias.y * u_xlat17.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : 1.0;
    u_xlat16.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.x = max(u_xlat16.x, 1.17549435e-38);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat16.xyz = u_xlat16.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat49 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat4.xyz = vec3(u_xlat49) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat50 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat16_3.x = u_xlat50;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_35 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_19) * _dirLight_lightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat16_19 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat50;
    u_xlat0.x = u_xlat50 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_54 = u_xlat7.y * u_xlat7.y;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_24.x = (-u_xlat16_19) * u_xlat16_8.x + u_xlat16_19;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_19 + u_xlat16_8.x;
    u_xlat16_40 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_24.y = u_xlat16_40 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_24.xy = sqrt(u_xlat16_24.xy);
    u_xlat16_19 = u_xlat16_19 * u_xlat16_24.y;
    u_xlat16_19 = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_19;
    u_xlat32 = u_xlat16.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_24.x = sqrt(u_xlat32);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16.x + u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_51 * u_xlat16_8.x + (-u_xlat16_51);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_51 + 1.0;
    u_xlat16.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_51;
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_19 = u_xlat16_8.x / u_xlat16_19;
    u_xlat16_51 = (-u_xlat16_24.x) + 1.0;
    u_xlat32 = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_8.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_24.x = u_xlat16_51 * u_xlat16_8.x;
    u_xlat16_51 = (-u_xlat16_8.x) * u_xlat16_51 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.zxy * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.zxy;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_51) + u_xlat16_24.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_19) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_19 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_51 = (-u_xlat16_19) + 1.0;
    u_xlat16_19 = _SkinSpeRoughness * u_xlat16_51 + u_xlat16_19;
    u_xlat16.z = u_xlat16_19 * u_xlat16_19;
    u_xlat50 = u_xlat16.z * u_xlat16.z + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat50 + 1.0;
    u_xlat16.x = max(u_xlat16.x, 6.10351563e-05);
    u_xlat16.xz = u_xlat16.xz * u_xlat16.xz;
    u_xlat16.x = u_xlat16.z / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.318309873;
    u_xlat16.x = min(u_xlat16.x, 16.0);
    u_xlat16.x = u_xlat32 * u_xlat16.x;
    u_xlat16.xyz = u_xlat16_10.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat16_3.xxx * u_xlat16.xyz;
    u_xlat50 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat50 * _SssLutXScale;
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_39.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_39.x * _skinSpeLerp;
    u_xlat16.xyz = u_xlat16_3.xxx * u_xlat16.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat16.xyz * _SpecularColor.zxy;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16.x = dot(u_xlat17.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_16.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat50 = max(u_xlat16_16.y, 0.0399999991);
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat50 = u_xlat50 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat50) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.x = u_xlat50 + 0.209999993;
    u_xlat12.xyz = u_xlat16_3.xyw * u_xlat4.xyz;
    u_xlat12.xyz = max(u_xlat12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_35 = u_xlat16_5.w * u_xlat16_35 + 1.0;
    u_xlat50 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat50;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_10.x = min(u_xlat16_35, u_xlat0.x);
    u_xlat16_10.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_10.xy);
    u_xlat16_11.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat14.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat14.xyz = vec3(_RampLertStr) * u_xlat14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat14.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_35 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_11.x = log2(abs(u_xlat16_5.z));
    u_xlat16_11.x = u_xlat16_11.x * _aoPow;
    u_xlat16_11.x = exp2(u_xlat16_11.x);
    u_xlat16_8.xzw = vec3(u_xlat16_35) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat50 = (-u_xlat16_39.y) + 1.0;
    u_xlat16_35 = u_xlat16_39.x * _sssLutLerp;
    u_xlat16_27.x = u_xlat50 * u_xlat50;
    u_xlat16_29 = u_xlat16_27.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_29;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_7.zxy * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.zxy * u_xlat16_27.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_35) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat12.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat17.y<0.0; u_xlati50 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati50 = int((u_xlat17.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati50,0,1) );
    u_xlat16_35 = u_xlat17.y * u_xlat17.y;
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy;
    u_xlat16_35 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat17.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat16_35<0.0);
#else
    u_xlatb50 = u_xlat16_35<0.0;
#endif
    u_xlat16_35 = u_xlat16_35 * u_xlat16_35;
    u_xlati50 = u_xlatb50 ? 1 : int(0);
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy + u_xlat16_27.xyz;
    u_xlat16_35 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat17.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat16_35<0.0);
#else
    u_xlatb50 = u_xlat16_35<0.0;
#endif
    u_xlat16_35 = u_xlat16_35 * u_xlat16_35;
    u_xlati50 = (u_xlatb50) ? 5 : 4;
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy + u_xlat16_27.xyz;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_7.www * u_xlat16_7.zxy;
    u_xlat7.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_27.xyz;
    u_xlat48 = u_xlat16_16.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat48) * u_xlat16_8.xzw;
    u_xlat48 = (-_directOcclusionColor.x) + 1.0;
    u_xlat48 = u_xlat16_11.x * u_xlat48 + _directOcclusionColor.x;
    u_xlat16_8.xzw = vec3(u_xlat48) * u_xlat16_8.xzw;
    u_xlat7.xyz = max(u_xlat16_8.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat16_35 = dot((-u_xlat16_6.xyz), u_xlat17.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat17.xyz = (-u_xlat17.xyz) * vec3(u_xlat16_35) + (-u_xlat16_6.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat17.xyz);
    u_xlat1.xyz = vec3(u_xlat16_54) * u_xlat2.xyz + u_xlat17.xyz;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_35;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.zxy;
    u_xlat16_35 = dot(u_xlat16_6.yzx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_35) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_35 = (-u_xlat16_16.x) + u_xlat16_16.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_35) + u_xlat16_16.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_24.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat48) * u_xlat16_6.xyz;
    u_xlat16.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat16.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.ywx * u_xlat4.yzx + u_xlat16.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_9.w * _BaseColor.w;
    u_xlat16.xyz = u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
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
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_16.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_19;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
mediump float u_xlat16_19;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_29;
float u_xlat32;
mediump float u_xlat16_35;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
float u_xlat50;
int u_xlati50;
bool u_xlatb50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb49 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb49)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat17.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat17.x = (-u_xlat1.x) + u_xlat17.x;
    u_xlat0.z = _ShadowBias.y * u_xlat17.x + u_xlat1.x;
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
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : 1.0;
    u_xlat16.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.x = max(u_xlat16.x, 1.17549435e-38);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat16.xyz = u_xlat16.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz;
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat49 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat4.xyz = vec3(u_xlat49) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat5.x;
    u_xlat2.x = u_xlat4.z;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat17.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat50 = dot(u_xlat17.xyz, u_xlat16.xyz);
    u_xlat16_3.x = u_xlat50;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_35 = u_xlat0.x + -1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_19) * _dirLight_lightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat5.xyz);
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat16_19 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat0.x + u_xlat50;
    u_xlat0.x = u_xlat50 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat32 = (-u_xlat16_5.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat32 + u_xlat16_5.x;
    u_xlat16_54 = u_xlat7.y * u_xlat7.y;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat16_8.x = u_xlat16_54 * u_xlat16_54;
    u_xlat16_24.x = (-u_xlat16_19) * u_xlat16_8.x + u_xlat16_19;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_19 + u_xlat16_8.x;
    u_xlat16_40 = (-u_xlat16_3.x) * u_xlat16_8.x + u_xlat16_3.x;
    u_xlat16_24.y = u_xlat16_40 * u_xlat16_3.x + u_xlat16_8.x;
    u_xlat16_24.xy = sqrt(u_xlat16_24.xy);
    u_xlat16_19 = u_xlat16_19 * u_xlat16_24.y;
    u_xlat16_19 = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_19;
    u_xlat32 = u_xlat16.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_24.x = sqrt(u_xlat32);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16.x + u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_51 * u_xlat16_8.x + (-u_xlat16_51);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_51 + 1.0;
    u_xlat16.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_51;
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_19 = u_xlat16_8.x / u_xlat16_19;
    u_xlat16_51 = (-u_xlat16_24.x) + 1.0;
    u_xlat32 = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_8.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_24.x = u_xlat16_51 * u_xlat16_8.x;
    u_xlat16_51 = (-u_xlat16_8.x) * u_xlat16_51 + 1.0;
    u_xlat16_9 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_9.zxy * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.zxy + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.zxy;
    u_xlat16_10.x = u_xlat16_5.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_51) + u_xlat16_24.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_19) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_19 = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_51 = (-u_xlat16_19) + 1.0;
    u_xlat16_19 = _SkinSpeRoughness * u_xlat16_51 + u_xlat16_19;
    u_xlat16.z = u_xlat16_19 * u_xlat16_19;
    u_xlat50 = u_xlat16.z * u_xlat16.z + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat50 + 1.0;
    u_xlat16.x = max(u_xlat16.x, 6.10351563e-05);
    u_xlat16.xz = u_xlat16.xz * u_xlat16.xz;
    u_xlat16.x = u_xlat16.z / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.318309873;
    u_xlat16.x = min(u_xlat16.x, 16.0);
    u_xlat16.x = u_xlat32 * u_xlat16.x;
    u_xlat16.xyz = u_xlat16_10.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat16_3.xxx * u_xlat16.xyz;
    u_xlat50 = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat13.x = u_xlat50 * _SssLutXScale;
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_39.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.x = u_xlat16_39.x * _skinSpeLerp;
    u_xlat16.xyz = u_xlat16_3.xxx * u_xlat16.xyz + u_xlat12.xyz;
    u_xlat16_3.xyw = u_xlat16.xyz * _SpecularColor.zxy;
    u_xlat16_3.xyw = u_xlat16_6.xyz * u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16.x = dot(u_xlat17.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16.x);
    u_xlat7.x = u_xlat16_7.x;
    u_xlat16_16.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat50 = max(u_xlat16_16.y, 0.0399999991);
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat50 = u_xlat50 + -1.0;
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat50) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.x = u_xlat50 + 0.209999993;
    u_xlat12.xyz = u_xlat16_3.xyw * u_xlat4.xyz;
    u_xlat12.xyz = max(u_xlat12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_35 = u_xlat16_5.w * u_xlat16_35 + 1.0;
    u_xlat50 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat50;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_10.x = min(u_xlat16_35, u_xlat0.x);
    u_xlat16_10.y = 0.5;
    u_xlat16_10 = texture(_RD, u_xlat16_10.xy);
    u_xlat16_11.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat14.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_10.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat14.xyz = vec3(_RampLertStr) * u_xlat14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat14.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_35 = (-u_xlat16_5.y) * _MetallicMax + 1.0;
    u_xlat16_11.x = log2(abs(u_xlat16_5.z));
    u_xlat16_11.x = u_xlat16_11.x * _aoPow;
    u_xlat16_11.x = exp2(u_xlat16_11.x);
    u_xlat16_8.xzw = vec3(u_xlat16_35) * u_xlat16_8.xzw;
    u_xlat5.xyz = u_xlat16_8.xzw * u_xlat14.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _dirLight_lightColor.zxy;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat50 = (-u_xlat16_39.y) + 1.0;
    u_xlat16_35 = u_xlat16_39.x * _sssLutLerp;
    u_xlat16_27.x = u_xlat50 * u_xlat50;
    u_xlat16_29 = u_xlat16_27.x * _SssLutYScale;
    u_xlat13.y = u_xlat16_29;
    u_xlat16_7.xyz = texture(_SssLut, u_xlat13.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_7.zxy * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.zxy * u_xlat16_27.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = vec3(u_xlat16_35) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat12.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat17.y<0.0; u_xlati50 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati50 = int((u_xlat17.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati50,0,1) );
    u_xlat16_35 = u_xlat17.y * u_xlat17.y;
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy;
    u_xlat16_35 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat17.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat16_35<0.0);
#else
    u_xlatb50 = u_xlat16_35<0.0;
#endif
    u_xlat16_35 = u_xlat16_35 * u_xlat16_35;
    u_xlati50 = u_xlatb50 ? 1 : int(0);
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy + u_xlat16_27.xyz;
    u_xlat16_35 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat17.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat16_35<0.0);
#else
    u_xlatb50 = u_xlat16_35<0.0;
#endif
    u_xlat16_35 = u_xlat16_35 * u_xlat16_35;
    u_xlati50 = (u_xlatb50) ? 5 : 4;
    u_xlat16_27.xyz = vec3(u_xlat16_35) * _IrradianceACCoeffs[u_xlati50].zxy + u_xlat16_27.xyz;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_7.www * u_xlat16_7.zxy;
    u_xlat7.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_27.xyz;
    u_xlat48 = u_xlat16_16.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat48) * u_xlat16_8.xzw;
    u_xlat48 = (-_directOcclusionColor.x) + 1.0;
    u_xlat48 = u_xlat16_11.x * u_xlat48 + _directOcclusionColor.x;
    u_xlat16_8.xzw = vec3(u_xlat48) * u_xlat16_8.xzw;
    u_xlat7.xyz = max(u_xlat16_8.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat5.xyz + u_xlat7.xyz;
    u_xlat16_35 = dot((-u_xlat16_6.xyz), u_xlat17.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat17.xyz = (-u_xlat17.xyz) * vec3(u_xlat16_35) + (-u_xlat16_6.xyz);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx + (-u_xlat17.xyz);
    u_xlat1.xyz = vec3(u_xlat16_54) * u_xlat2.xyz + u_xlat17.xyz;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_35;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EnvmapIntensity.zxy;
    u_xlat16_35 = dot(u_xlat16_6.yzx, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xzw = vec3(u_xlat16_35) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xzw : u_xlat16_6.xyz;
    u_xlat16_35 = (-u_xlat16_16.x) + u_xlat16_16.y;
    u_xlat16_8.xzw = u_xlat9.xyz * vec3(u_xlat16_35) + u_xlat16_16.xxx;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_24.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat48) * u_xlat16_6.xyz;
    u_xlat16.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat1.xyz = max(u_xlat16.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.ywx * u_xlat4.yzx + u_xlat16.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.w * _BaseColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_9.w * _BaseColor.w;
    u_xlat16.xyz = u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16.xyz;
    u_xlat0.xyz = max(u_xlat16_6.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * _EmissionColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_6.xyz;
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
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_16.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_19;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(8) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
float u_xlat32;
mediump float u_xlat16_36;
mediump float u_xlat16_40;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_4.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat5.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat5.y = u_xlat6.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_4.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat5.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat16_20 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_36 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_6.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat32 + u_xlat16_6.x;
    u_xlat16_52 = u_xlat7.y * u_xlat7.y;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_8.x = u_xlat16_52 * u_xlat16_52;
    u_xlat16_24.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_40 = (-u_xlat16_4.x) * u_xlat16_8.x + u_xlat16_4.x;
    u_xlat16_24.y = u_xlat16_40 * u_xlat16_4.x + u_xlat16_8.x;
    u_xlat16_24.xy = sqrt(u_xlat16_24.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_24.y;
    u_xlat16_20 = u_xlat16_4.x * u_xlat16_24.x + u_xlat16_20;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_24.x = sqrt(u_xlat32);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat0.x + u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_36 * u_xlat16_8.x + (-u_xlat16_36);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_36 + 1.0;
    u_xlat0.x = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_36;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_36 = (-u_xlat16_24.x) + 1.0;
    u_xlat32 = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_8.x = u_xlat16_36 * u_xlat16_36;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_24.x = u_xlat16_36 * u_xlat16_8.x;
    u_xlat16_36 = (-u_xlat16_8.x) * u_xlat16_36 + 1.0;
    u_xlat16_2 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_2.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_2.xyz * u_xlat16_8.xzw;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.xyz;
    u_xlat16_10.x = u_xlat16_6.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_36) + u_xlat16_24.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_6.x, 0.00100000005);
    u_xlat16_36 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_36 + u_xlat16_20;
    u_xlat49 = u_xlat16_20 * u_xlat16_20;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat13.xyz = u_xlat16_10.xyz * u_xlat0.xxx;
    u_xlat13.xyz = u_xlat16_4.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_20 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat12.xyz = vec3(u_xlat16_20) * u_xlat13.xyz + u_xlat12.xyz;
    u_xlat16_10.xyz = u_xlat12.xyz * _SpecularColor.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xxx * _dirLight_lightColor.xyz;
    u_xlat49 = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat12.x = u_xlat49 * _SssLutXScale;
    u_xlat16_4.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xyz = u_xlat5.xyz * u_xlat16_24.xxx;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat49);
    u_xlat7.x = u_xlat16_7;
    u_xlat16_5.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat49 = max(u_xlat16_5.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat7.xyz = u_xlat9.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.x = u_xlat49 + 0.209999993;
    u_xlat13.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_58 = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_11.x = u_xlat32 * u_xlat32;
    u_xlat16_28 = u_xlat16_11.x * _SssLutYScale;
    u_xlat12.y = u_xlat16_28;
    u_xlat16_12.xyz = texture(_SssLut, u_xlat12.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.xyz = vec3(u_xlat16_58) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_11 = texture(_RD, u_xlat0.xy);
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_11.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_58 = (-u_xlat16_6.y) * _MetallicMax + 1.0;
    u_xlat16_14.x = log2(abs(u_xlat16_6.z));
    u_xlat16_14.x = u_xlat16_14.x * _aoPow;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_8.xzw = u_xlat16_8.xzw * vec3(u_xlat16_58);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.xyz = u_xlat12.xyz * u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat13.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_58 = u_xlat1.y * u_xlat1.y;
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_30.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_30.xyz;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_30.xyz;
    u_xlat51 = u_xlat16_5.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_14.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat6.xyz = max(u_xlat16_8.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat6.xyz;
    u_xlat16_8.x = dot((-u_xlat16_10.xyz), u_xlat1.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_8.xxx + (-u_xlat16_10.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_52 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_52;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_8.xzw = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_8.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xzw = u_xlat16_8.xzw * _EnvmapIntensity.xyz;
    u_xlat16_52 = dot(u_xlat16_8.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = vec3(u_xlat16_52) * u_xlat16_8.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xzw = (bool(u_xlatb48)) ? u_xlat16_10.xyz : u_xlat16_8.xzw;
    u_xlat16_52 = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_52) + u_xlat16_5.xxx;
    u_xlat16_10.xyz = u_xlat16_24.xxx * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_8.xyz = vec3(u_xlat51) * u_xlat16_8.xyz;
    u_xlat1.xyz = min(u_xlat16_8.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat16_4.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_2.w * _BaseColor.w + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_2.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat48 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat48 * -2.0 + 3.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat48 = min(u_xlat48, 1.0);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb48 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_8.xyz = (bool(u_xlatb48)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_8.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Normal;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _RD;
UNITY_LOCATION(5) uniform mediump sampler2D _Emission;
UNITY_LOCATION(6) uniform mediump sampler2D _FGD;
UNITY_LOCATION(7) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(8) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_20;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
float u_xlat32;
mediump float u_xlat16_36;
mediump float u_xlat16_40;
float u_xlat48;
bool u_xlatb48;
float u_xlat49;
float u_xlat51;
int u_xlati51;
bool u_xlatb51;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat48 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_4.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat5.z;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat5.y = u_xlat6.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat3.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_4.x = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat5.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat16_20 = u_xlat51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_36 = u_xlat49 + u_xlat51;
    u_xlat16 = u_xlat49 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 + (-_RemaphalfLambert_center);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat32 = (-u_xlat16_6.x) + 1.0;
    u_xlat7.y = _RoughnessMax * u_xlat32 + u_xlat16_6.x;
    u_xlat16_52 = u_xlat7.y * u_xlat7.y;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_8.x = u_xlat16_52 * u_xlat16_52;
    u_xlat16_24.x = (-u_xlat16_20) * u_xlat16_8.x + u_xlat16_20;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_20 + u_xlat16_8.x;
    u_xlat16_40 = (-u_xlat16_4.x) * u_xlat16_8.x + u_xlat16_4.x;
    u_xlat16_24.y = u_xlat16_40 * u_xlat16_4.x + u_xlat16_8.x;
    u_xlat16_24.xy = sqrt(u_xlat16_24.xy);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_24.y;
    u_xlat16_20 = u_xlat16_4.x * u_xlat16_24.x + u_xlat16_20;
    u_xlat32 = u_xlat0.x * 2.0 + 2.0;
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat16_24.x = sqrt(u_xlat32);
    u_xlat16_24.x = max(u_xlat16_24.x, 6.10351563e-05);
    u_xlat16_24.x = float(1.0) / float(u_xlat16_24.x);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat0.x + u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_36 * u_xlat16_8.x + (-u_xlat16_36);
    u_xlat16_8.x = u_xlat16_8.x * 0.159154937;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_36 + 1.0;
    u_xlat0.x = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_36;
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_20 = u_xlat16_8.x / u_xlat16_20;
    u_xlat16_36 = (-u_xlat16_24.x) + 1.0;
    u_xlat32 = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat32 = float(1.0) / float(u_xlat32);
    u_xlat16_8.x = u_xlat16_36 * u_xlat16_36;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_24.x = u_xlat16_36 * u_xlat16_8.x;
    u_xlat16_36 = (-u_xlat16_8.x) * u_xlat16_36 + 1.0;
    u_xlat16_2 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xzw = u_xlat16_2.xyz * u_xlat16_8.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xzw = u_xlat16_2.xyz * u_xlat16_8.xzw;
    u_xlat9.xyz = u_xlat16_8.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xzw = u_xlat16_8.xzw * _BaseColor.xyz;
    u_xlat16_10.x = u_xlat16_6.y * _MetallicMax;
    u_xlat9.xyz = u_xlat16_10.xxx * u_xlat9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_36) + u_xlat16_24.xxx;
    u_xlat16_11.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat12.xyz = max(u_xlat16_11.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_20 = max(u_xlat16_6.x, 0.00100000005);
    u_xlat16_36 = (-u_xlat16_20) + 1.0;
    u_xlat16_20 = _SkinSpeRoughness * u_xlat16_36 + u_xlat16_20;
    u_xlat49 = u_xlat16_20 * u_xlat16_20;
    u_xlat51 = u_xlat49 * u_xlat49 + -1.0;
    u_xlat49 = u_xlat49 * u_xlat49;
    u_xlat0.x = u_xlat0.x * u_xlat51 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat49 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat32 * u_xlat0.x;
    u_xlat13.xyz = u_xlat16_10.xyz * u_xlat0.xxx;
    u_xlat13.xyz = u_xlat16_4.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat12.xyz);
    u_xlat16_0.xz = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_20 = u_xlat16_0.x * _skinSpeLerp;
    u_xlat12.xyz = vec3(u_xlat16_20) * u_xlat13.xyz + u_xlat12.xyz;
    u_xlat16_10.xyz = u_xlat12.xyz * _SpecularColor.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xxx * _dirLight_lightColor.xyz;
    u_xlat49 = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat12.x = u_xlat49 * _SssLutXScale;
    u_xlat16_4.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xyz = u_xlat5.xyz * u_xlat16_24.xxx;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat49);
    u_xlat7.x = u_xlat16_7;
    u_xlat16_5.xyz = texture(_FGD, u_xlat7.xy).xyz;
    u_xlat49 = max(u_xlat16_5.y, 0.0399999991);
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = u_xlat49 + -1.0;
    u_xlat7.xyz = u_xlat9.xyz * vec3(u_xlat49) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.x = u_xlat49 + 0.209999993;
    u_xlat13.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat13.xyz = max(u_xlat13.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat32 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_58 = u_xlat16_0.x * _sssLutLerp;
    u_xlat16_11.x = u_xlat32 * u_xlat32;
    u_xlat16_28 = u_xlat16_11.x * _SssLutYScale;
    u_xlat12.y = u_xlat16_28;
    u_xlat16_12.xyz = texture(_SssLut, u_xlat12.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.xyz = vec3(u_xlat16_58) * u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.x = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = u_xlat0.x * (-u_xlat16);
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat0.y = 0.5;
    u_xlat16_11 = texture(_RD, u_xlat0.xy);
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat49 = u_xlat16_11.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat0.xyz = vec3(_RampLertStr) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_58 = (-u_xlat16_6.y) * _MetallicMax + 1.0;
    u_xlat16_14.x = log2(abs(u_xlat16_6.z));
    u_xlat16_14.x = u_xlat16_14.x * _aoPow;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_8.xzw = u_xlat16_8.xzw * vec3(u_xlat16_58);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_8.xzw;
    u_xlat16_8.xzw = u_xlat16_8.xzw * _AmbientLightColorTint.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _dirLight_lightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.xyz = u_xlat12.xyz * u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat13.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat1.y<0.0; u_xlati51 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati51 = int((u_xlat1.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati51,0,1) );
    u_xlat16_58 = u_xlat1.y * u_xlat1.y;
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = u_xlatb51 ? 1 : int(0);
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_30.xyz;
    u_xlat16_58 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat1.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlat16_58<0.0);
#else
    u_xlatb51 = u_xlat16_58<0.0;
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlati51 = (u_xlatb51) ? 5 : 4;
    u_xlat16_30.xyz = vec3(u_xlat16_58) * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_30.xyz;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_15.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_15.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * u_xlat16_30.xyz;
    u_xlat51 = u_xlat16_5.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_14.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_8.xzw = vec3(u_xlat51) * u_xlat16_8.xzw;
    u_xlat6.xyz = max(u_xlat16_8.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz + u_xlat6.xyz;
    u_xlat16_8.x = dot((-u_xlat16_10.xyz), u_xlat1.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_8.xxx + (-u_xlat16_10.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat48) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat16_52) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_52 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_52;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, 6.0);
    u_xlat16_8.xzw = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_8.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_8.xzw = u_xlat16_8.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xzw = u_xlat16_8.xzw * _EnvmapIntensity.xyz;
    u_xlat16_52 = dot(u_xlat16_8.xzw, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = vec3(u_xlat16_52) * u_xlat16_8.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xzw = (bool(u_xlatb48)) ? u_xlat16_10.xyz : u_xlat16_8.xzw;
    u_xlat16_52 = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_10.xyz = u_xlat9.xyz * vec3(u_xlat16_52) + u_xlat16_5.xxx;
    u_xlat16_10.xyz = u_xlat16_24.xxx * u_xlat16_10.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xzw * u_xlat16_10.xyz;
    u_xlat16_8.xyz = vec3(u_xlat51) * u_xlat16_8.xyz;
    u_xlat1.xyz = min(u_xlat16_8.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat7.xyz + u_xlat1.xyz;
    u_xlat16_4.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_2.w * _BaseColor.w + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_2.w * _BaseColor.w;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat48 = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat48 * -2.0 + 3.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat48 = min(u_xlat48, 1.0);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb48 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_8.xyz = (bool(u_xlatb48)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat48 = _EmissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat48 = max(abs(u_xlat48), _EmissiveBreathe.z);
    u_xlat16_1.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat48) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_8.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4.x : u_xlat16_20;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(10) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat20;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat54;
float u_xlat56;
int u_xlati56;
bool u_xlatb56;
mediump float u_xlat16_57;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat20.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat20.x = (-u_xlat3.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
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
    u_xlat16_4.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_4.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_4.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat3.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat7.xyz = vec3(u_xlat54) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat3.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat16_6.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_40 = u_xlat0.x + -1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_23) * _dirLight_lightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat20.xyz, u_xlat8.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat16_23 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat0.x + u_xlat56;
    u_xlat0.x = u_xlat56 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_1.x) + 1.0;
    u_xlat8.y = _RoughnessMax * u_xlat34 + u_xlat16_1.x;
    u_xlat16_60 = u_xlat8.y * u_xlat8.y;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_10.x = u_xlat16_60 * u_xlat16_60;
    u_xlat16_27.x = (-u_xlat16_23) * u_xlat16_10.x + u_xlat16_23;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_23 + u_xlat16_10.x;
    u_xlat16_44 = (-u_xlat16_6.x) * u_xlat16_10.x + u_xlat16_6.x;
    u_xlat16_27.y = u_xlat16_44 * u_xlat16_6.x + u_xlat16_10.x;
    u_xlat16_27.xy = sqrt(u_xlat16_27.xy);
    u_xlat16_23 = u_xlat16_23 * u_xlat16_27.y;
    u_xlat16_23 = u_xlat16_6.x * u_xlat16_27.x + u_xlat16_23;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_27.x = sqrt(u_xlat34);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_27.x * u_xlat17.x + u_xlat16_27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_57 * u_xlat16_10.x + (-u_xlat16_57);
    u_xlat16_10.x = u_xlat16_10.x * 0.159154937;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_57 + 1.0;
    u_xlat17.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_57;
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_23 = u_xlat16_10.x / u_xlat16_23;
    u_xlat16_57 = (-u_xlat16_27.x) + 1.0;
    u_xlat34 = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27.x = u_xlat16_57 * u_xlat16_10.x;
    u_xlat16_57 = (-u_xlat16_10.x) * u_xlat16_57 + 1.0;
    u_xlat16_2 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw;
    u_xlat11.xyz = u_xlat16_10.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * _BaseColor.xyz;
    u_xlat16_12.x = u_xlat16_1.y * _MetallicMax;
    u_xlat11.xyz = u_xlat16_12.xxx * u_xlat11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_12.xyz = u_xlat11.xyz * vec3(u_xlat16_57) + u_xlat16_27.xxx;
    u_xlat16_13.xyz = vec3(u_xlat16_23) * u_xlat16_12.xyz;
    u_xlat14.xyz = max(u_xlat16_13.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat14.xyz = min(u_xlat14.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_23 = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_57 = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = _SkinSpeRoughness * u_xlat16_57 + u_xlat16_23;
    u_xlat17.z = u_xlat16_23 * u_xlat16_23;
    u_xlat56 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat56 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_12.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_6.xxx * u_xlat17.xyz;
    u_xlat56 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat15.x = u_xlat56 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat14.xyz);
    u_xlat16_42.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_42.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_6.xxx * u_xlat17.xyz + u_xlat14.xyz;
    u_xlat16_6.xyw = u_xlat17.xyz * _SpecularColor.xyz;
    u_xlat16_6.xyw = u_xlat16_9.xyz * u_xlat16_6.xyw;
    u_xlat16_9.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat7.xyz * u_xlat16_9.xxx;
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = sqrt(u_xlat17.x);
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat8.xy).xyz;
    u_xlat56 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat56 = u_xlat56 + -1.0;
    u_xlat7.xyz = u_xlat11.xyz * vec3(u_xlat56) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.x = u_xlat56 + 0.209999993;
    u_xlat14.xyz = u_xlat16_6.xyw * u_xlat7.xyz;
    u_xlat14.xyz = max(u_xlat14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_40 = u_xlat16_1.w * u_xlat16_40 + 1.0;
    u_xlat56 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat56;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_12.x = min(u_xlat16_40, u_xlat0.x);
    u_xlat16_12.y = 0.5;
    u_xlat16_4 = texture(_RD, u_xlat16_12.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_4.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat16.xyz = vec3(_RampLertStr) * u_xlat16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_40 = (-u_xlat16_1.y) * _MetallicMax + 1.0;
    u_xlat16_12.x = log2(abs(u_xlat16_1.z));
    u_xlat16_12.x = u_xlat16_12.x * _aoPow;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_10.xzw = vec3(u_xlat16_40) * u_xlat16_10.xzw;
    u_xlat16.xyz = u_xlat16_10.xzw * u_xlat16.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _AmbientLightColorTint.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _dirLight_lightColor.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat56 = (-u_xlat16_42.y) + 1.0;
    u_xlat16_40 = u_xlat16_42.x * _sssLutLerp;
    u_xlat16_29.x = u_xlat56 * u_xlat56;
    u_xlat16_32 = u_xlat16_29.x * _SssLutYScale;
    u_xlat15.y = u_xlat16_32;
    u_xlat16_8.xyz = texture(_SssLut, u_xlat15.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat16_8.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_40) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = u_xlat14.xyz + u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat20.y<0.0; u_xlati56 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati56 = int((u_xlat20.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati56,0,1) );
    u_xlat16_40 = u_xlat20.y * u_xlat20.y;
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_40 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat20.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_40<0.0);
#else
    u_xlatb56 = u_xlat16_40<0.0;
#endif
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlati56 = u_xlatb56 ? 1 : int(0);
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_29.xyz;
    u_xlat16_40 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat20.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_40<0.0);
#else
    u_xlatb56 = u_xlat16_40<0.0;
#endif
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlati56 = (u_xlatb56) ? 5 : 4;
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_29.xyz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat20.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat14.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_13.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_29.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = vec3(u_xlat51) * u_xlat16_10.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_12.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_10.xzw = vec3(u_xlat51) * u_xlat16_10.xzw;
    u_xlat14.xyz = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = u_xlat8.xyz + u_xlat14.xyz;
    u_xlat16_40 = dot((-u_xlat16_9.xyz), u_xlat20.xyz);
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat20.xyz = (-u_xlat20.xyz) * vec3(u_xlat16_40) + (-u_xlat16_9.xyz);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx + (-u_xlat20.xyz);
    u_xlat3.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat20.xyz;
    u_xlat16_40 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_40;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, 6.0);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = u_xlat16_9.xyz * _EnvmapIntensity.xyz;
    u_xlat16_40 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = vec3(u_xlat16_40) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb3)) ? u_xlat16_10.xzw : u_xlat16_9.xyz;
    u_xlat16_40 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_10.xzw = u_xlat11.xyz * vec3(u_xlat16_40) + u_xlat16_17.xxx;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_27.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat17.xyz = min(u_xlat16_9.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyw * u_xlat7.xyz + u_xlat17.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _BaseColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_2.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat3.xyz + u_xlat8.xyz;
    u_xlat3.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_9.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_3.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_23;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec2 vs_TEXCOORD5;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3 = in_TEXCOORD0.xyxy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xy = vec2(0.0, 0.0);
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _useShadow;
uniform 	mediump vec4 _dirLight_lightColor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _RampLertStr;
uniform 	mediump float _RemaphalfLambert_center;
uniform 	mediump float _RemaphalfLambert_sharp;
uniform 	mediump float _NormalStrength;
uniform 	mediump float _MetallicMax;
uniform 	mediump float _RoughnessMax;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directOcclusionColor;
uniform 	mediump float _aoPow;
uniform 	mediump vec4 _AmbientLightColorTint;
uniform 	mediump vec4 _EnvmapIntensity;
uniform 	mediump float _customAndToonAdjust;
uniform 	mediump float _GlobalShadowBrightnessAdjustment;
uniform 	mediump float _sssLutLerp;
uniform 	mediump float _SssLutXScale;
uniform 	mediump float _SssLutYScale;
uniform 	mediump float _skinSpeLerp;
uniform 	mediump float _SkinSpeRoughness;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _RD;
UNITY_LOCATION(7) uniform mediump sampler2D _Emission;
UNITY_LOCATION(8) uniform mediump sampler2D _FGD;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(10) uniform mediump sampler2D _SssLut;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec2 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat20;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_44;
float u_xlat51;
float u_xlat52;
bool u_xlatb52;
float u_xlat54;
float u_xlat56;
int u_xlati56;
bool u_xlatb56;
mediump float u_xlat16_57;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb52 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb52)) ? u_xlat1.xyz : vs_TEXCOORD0.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat20.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat20.x = (-u_xlat3.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
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
    u_xlat16_4.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_4.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_4.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useShadow);
#endif
    u_xlat0.x = (u_xlatb17) ? u_xlat0.x : 1.0;
    u_xlat17.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(vec2(_NormalStrength, _NormalStrength));
    u_xlat3.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat7.xyz = vec3(u_xlat54) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat3.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat16_6.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_40 = u_xlat0.x + -1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_23) * _dirLight_lightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat20.xyz, u_xlat8.xyz);
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat8.xyz);
    u_xlat16_23 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat0.x + u_xlat56;
    u_xlat0.x = u_xlat56 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + (-_RemaphalfLambert_center);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat34 = (-u_xlat16_1.x) + 1.0;
    u_xlat8.y = _RoughnessMax * u_xlat34 + u_xlat16_1.x;
    u_xlat16_60 = u_xlat8.y * u_xlat8.y;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_10.x = u_xlat16_60 * u_xlat16_60;
    u_xlat16_27.x = (-u_xlat16_23) * u_xlat16_10.x + u_xlat16_23;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_23 + u_xlat16_10.x;
    u_xlat16_44 = (-u_xlat16_6.x) * u_xlat16_10.x + u_xlat16_6.x;
    u_xlat16_27.y = u_xlat16_44 * u_xlat16_6.x + u_xlat16_10.x;
    u_xlat16_27.xy = sqrt(u_xlat16_27.xy);
    u_xlat16_23 = u_xlat16_23 * u_xlat16_27.y;
    u_xlat16_23 = u_xlat16_6.x * u_xlat16_27.x + u_xlat16_23;
    u_xlat34 = u_xlat17.x * 2.0 + 2.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat16_27.x = sqrt(u_xlat34);
    u_xlat16_27.x = max(u_xlat16_27.x, 6.10351563e-05);
    u_xlat16_27.x = float(1.0) / float(u_xlat16_27.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_27.x * u_xlat17.x + u_xlat16_27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_57 * u_xlat16_10.x + (-u_xlat16_57);
    u_xlat16_10.x = u_xlat16_10.x * 0.159154937;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_57 + 1.0;
    u_xlat17.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_57;
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_23 = u_xlat16_10.x / u_xlat16_23;
    u_xlat16_57 = (-u_xlat16_27.x) + 1.0;
    u_xlat34 = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat34 = max(u_xlat34, 6.10351563e-05);
    u_xlat34 = float(1.0) / float(u_xlat34);
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_57;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27.x = u_xlat16_57 * u_xlat16_10.x;
    u_xlat16_57 = (-u_xlat16_10.x) * u_xlat16_57 + 1.0;
    u_xlat16_2 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_2.xyz * u_xlat16_10.xzw;
    u_xlat11.xyz = u_xlat16_10.xzw * _BaseColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * _BaseColor.xyz;
    u_xlat16_12.x = u_xlat16_1.y * _MetallicMax;
    u_xlat11.xyz = u_xlat16_12.xxx * u_xlat11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_12.xyz = u_xlat11.xyz * vec3(u_xlat16_57) + u_xlat16_27.xxx;
    u_xlat16_13.xyz = vec3(u_xlat16_23) * u_xlat16_12.xyz;
    u_xlat14.xyz = max(u_xlat16_13.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat14.xyz = min(u_xlat14.xyz, vec3(2.79999995, 2.79999995, 2.79999995));
    u_xlat16_23 = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_57 = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = _SkinSpeRoughness * u_xlat16_57 + u_xlat16_23;
    u_xlat17.z = u_xlat16_23 * u_xlat16_23;
    u_xlat56 = u_xlat17.z * u_xlat17.z + -1.0;
    u_xlat17.x = u_xlat17.x * u_xlat56 + 1.0;
    u_xlat17.x = max(u_xlat17.x, 6.10351563e-05);
    u_xlat17.xz = u_xlat17.xz * u_xlat17.xz;
    u_xlat17.x = u_xlat17.z / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.318309873;
    u_xlat17.x = min(u_xlat17.x, 16.0);
    u_xlat17.x = u_xlat34 * u_xlat17.x;
    u_xlat17.xyz = u_xlat16_12.xyz * u_xlat17.xxx;
    u_xlat17.xyz = u_xlat16_6.xxx * u_xlat17.xyz;
    u_xlat56 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat15.x = u_xlat56 * _SssLutXScale;
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat14.xyz);
    u_xlat16_42.xy = texture(_SkinMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_42.x * _skinSpeLerp;
    u_xlat17.xyz = u_xlat16_6.xxx * u_xlat17.xyz + u_xlat14.xyz;
    u_xlat16_6.xyw = u_xlat17.xyz * _SpecularColor.xyz;
    u_xlat16_6.xyw = u_xlat16_9.xyz * u_xlat16_6.xyw;
    u_xlat16_9.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat7.xyz * u_xlat16_9.xxx;
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = sqrt(u_xlat17.x);
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_17.xyz = texture(_FGD, u_xlat8.xy).xyz;
    u_xlat56 = max(u_xlat16_17.y, 0.0399999991);
    u_xlat56 = float(1.0) / u_xlat56;
    u_xlat56 = u_xlat56 + -1.0;
    u_xlat7.xyz = u_xlat11.xyz * vec3(u_xlat56) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.x = u_xlat56 + 0.209999993;
    u_xlat14.xyz = u_xlat16_6.xyw * u_xlat7.xyz;
    u_xlat14.xyz = max(u_xlat14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_40 = u_xlat16_1.w * u_xlat16_40 + 1.0;
    u_xlat56 = max(_RemaphalfLambert_sharp, 0.00100000005);
    u_xlat0.x = (-u_xlat0.x) * u_xlat56;
    u_xlat0.x = u_xlat0.x * 49.8288116;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / float(u_xlat0.x);
    u_xlat16_12.x = min(u_xlat16_40, u_xlat0.x);
    u_xlat16_12.y = 0.5;
    u_xlat16_4 = texture(_RD, u_xlat16_12.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = u_xlat16_4.w + (-_GlobalShadowBrightnessAdjustment);
    u_xlat16.xyz = vec3(_RampLertStr) * u_xlat16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.317999989, 0.317999989, 0.317999989);
    u_xlat16_40 = (-u_xlat16_1.y) * _MetallicMax + 1.0;
    u_xlat16_12.x = log2(abs(u_xlat16_1.z));
    u_xlat16_12.x = u_xlat16_12.x * _aoPow;
    u_xlat16_12.x = exp2(u_xlat16_12.x);
    u_xlat16_10.xzw = vec3(u_xlat16_40) * u_xlat16_10.xzw;
    u_xlat16.xyz = u_xlat16_10.xzw * u_xlat16.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _AmbientLightColorTint.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _dirLight_lightColor.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat56 = (-u_xlat16_42.y) + 1.0;
    u_xlat16_40 = u_xlat16_42.x * _sssLutLerp;
    u_xlat16_29.x = u_xlat56 * u_xlat56;
    u_xlat16_32 = u_xlat16_29.x * _SssLutYScale;
    u_xlat15.y = u_xlat16_32;
    u_xlat16_8.xyz = texture(_SssLut, u_xlat15.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat16_8.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_40) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = u_xlat14.xyz + u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat20.y<0.0; u_xlati56 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati56 = int((u_xlat20.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati56,0,1) );
    u_xlat16_40 = u_xlat20.y * u_xlat20.y;
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_40 = dot(_IndirectSpecularMapRotationParams.xy, u_xlat20.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_40<0.0);
#else
    u_xlatb56 = u_xlat16_40<0.0;
#endif
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlati56 = u_xlatb56 ? 1 : int(0);
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_29.xyz;
    u_xlat16_40 = dot(_IndirectSpecularMapRotationParams.zw, u_xlat20.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_40<0.0);
#else
    u_xlatb56 = u_xlat16_40<0.0;
#endif
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlati56 = (u_xlatb56) ? 5 : 4;
    u_xlat16_29.xyz = vec3(u_xlat16_40) * _IrradianceACCoeffs[u_xlati56].xyz + u_xlat16_29.xyz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat20.xyz, _IndirectSpecularMapMipLevelUsed);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat14.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity) + u_xlat16_13.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_29.xyz;
    u_xlat51 = u_xlat16_17.z + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = vec3(u_xlat51) * u_xlat16_10.xzw;
    u_xlat51 = (-_directOcclusionColor.x) + 1.0;
    u_xlat51 = u_xlat16_12.x * u_xlat51 + _directOcclusionColor.x;
    u_xlat16_10.xzw = vec3(u_xlat51) * u_xlat16_10.xzw;
    u_xlat14.xyz = max(u_xlat16_10.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = u_xlat8.xyz + u_xlat14.xyz;
    u_xlat16_40 = dot((-u_xlat16_9.xyz), u_xlat20.xyz);
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat20.xyz = (-u_xlat20.xyz) * vec3(u_xlat16_40) + (-u_xlat16_9.xyz);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx + (-u_xlat20.xyz);
    u_xlat3.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat20.xyz;
    u_xlat16_40 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_40;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, 6.0);
    u_xlat16_9.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = u_xlat16_9.xyz * _EnvmapIntensity.xyz;
    u_xlat16_40 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = vec3(u_xlat16_40) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb3)) ? u_xlat16_10.xzw : u_xlat16_9.xyz;
    u_xlat16_40 = (-u_xlat16_17.x) + u_xlat16_17.y;
    u_xlat16_10.xzw = u_xlat11.xyz * vec3(u_xlat16_40) + u_xlat16_17.xxx;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_27.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = vec3(u_xlat51) * u_xlat16_9.xyz;
    u_xlat17.xyz = min(u_xlat16_9.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat3.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyw * u_xlat7.xyz + u_xlat17.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _BaseColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_2.w * _BaseColor.w;
    u_xlat17.xyz = u_xlat3.xyz + u_xlat8.xyz;
    u_xlat3.x = (-_GlobalShadowBrightnessAdjustment) + 1.0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_customAndToonAdjust);
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat17.xyz;
    u_xlat0.xyz = max(u_xlat16_9.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat51 = _EmissiveBreathe.y * _Time.y;
    u_xlat51 = cos(u_xlat51);
    u_xlat51 = max(abs(u_xlat51), _EmissiveBreathe.z);
    u_xlat16_3.xyz = texture(_Emission, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat51) + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_23;
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
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 86089
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
 Pass {
 Name "Outline"
  LOD 100
  Tags { "RenderType" = "Opaque" }
 Cull Front
  GpuProgramID 189116
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
uniform 	mediump float _Outline_Width;
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
UNITY_LOCATION(1) uniform mediump sampler2D _FaceOutlineMask;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_MatrixV[3].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat16_2.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_2.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.xyz = vec3(u_xlat12) * u_xlat16_2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat3.yyy;
    u_xlat16_2.xyz = in_TANGENT0.xyz * u_xlat3.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = in_NORMAL0.xyz * u_xlat3.zzz + u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
    u_xlat1.y = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Outline_Width, _Outline_Width, _Outline_Width));
    u_xlat12 = textureLod(_FaceOutlineMask, in_TEXCOORD0.xy, 0.0).w;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].z;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[1].z;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[2].z;
    u_xlat1.w = hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat0.w = 1.0;
    gl_Position.z = dot(u_xlat1, u_xlat0);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].x;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].x;
    gl_Position.x = dot(u_xlat1.xyz, u_xlat0.xzw);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].y;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].y;
    gl_Position.y = dot(u_xlat1.xyz, u_xlat0.yzw);
    u_xlat0.x = hlslcc_mtx4x4glstate_matrix_projection[2].w;
    u_xlat0.y = hlslcc_mtx4x4glstate_matrix_projection[3].w;
    gl_Position.w = dot(u_xlat0.xy, u_xlat0.zw);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoMap;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = _Outline_Color.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = _Outline_Color.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Outline_Color.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * _Outline_Color.w;
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
uniform 	mediump float _Outline_Width;
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
UNITY_LOCATION(1) uniform mediump sampler2D _FaceOutlineMask;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_MatrixV[3].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat16_2.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_2.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.xyz = vec3(u_xlat12) * u_xlat16_2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat3.yyy;
    u_xlat16_2.xyz = in_TANGENT0.xyz * u_xlat3.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = in_NORMAL0.xyz * u_xlat3.zzz + u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
    u_xlat1.y = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Outline_Width, _Outline_Width, _Outline_Width));
    u_xlat12 = textureLod(_FaceOutlineMask, in_TEXCOORD0.xy, 0.0).w;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].z;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[1].z;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[2].z;
    u_xlat1.w = hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat0.w = 1.0;
    gl_Position.z = dot(u_xlat1, u_xlat0);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].x;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].x;
    gl_Position.x = dot(u_xlat1.xyz, u_xlat0.xzw);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].y;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].y;
    gl_Position.y = dot(u_xlat1.xyz, u_xlat0.yzw);
    u_xlat0.x = hlslcc_mtx4x4glstate_matrix_projection[2].w;
    u_xlat0.y = hlslcc_mtx4x4glstate_matrix_projection[3].w;
    gl_Position.w = dot(u_xlat0.xy, u_xlat0.zw);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoMap;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = _Outline_Color.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = _Outline_Color.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Outline_Color.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * _Outline_Color.w;
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
CustomEditor "CodeGenShaderGUI.Theseus_Pan_Base_SkinGUI"
}