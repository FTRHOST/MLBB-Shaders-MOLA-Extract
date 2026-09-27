//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_RasterCard" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

[Tex] _SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

[Tex] _DfgTexture ("DFG贴图", 2D) = "black" { }

[Tex] _ACESLutTex ("ACESLut贴图", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

[Tex] _albedoMap2 ("Albedo贴图2", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_RasterCardTex ("R:光栅范围 G:描边范围", 2D) = "black" { }

_U_RasterCardTex ("光栅纹理U轴移动", Range(-1, 1)) = 1.0

_V_RasterCardTex ("光栅纹理V轴移动", Range(0, 1)) = 1.0

[Tex] _outlineMask ("R:描边花纹;G:菲涅尔遮罩;B:光栅遮罩", 2D) = "white" { }

_outlineColor ("描边颜色", Color) = (1,1,1,1)

_outlineIntensity ("描边强度", Range(0, 10)) = 4.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMap ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_anisotropicMap ("anisotropicMap", 2D) = "white" { }

_sunShift ("sunShift", Float) = 1.0

_sunShiftOffset ("sunShiftOffset", Float) = 1.0

_anisotropicMultiplier ("anisotropicMultiplier", Range(0, 1)) = 1.0

_fresnelRange ("菲涅尔范围", Float) = 0.10000000149011612

_fresnelPow ("菲涅尔强度", Float) = 0.0

_fresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrengthMap ("shadowStrengthMap", 2D) = "white" { }

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_zwrite ("__zw", Float) = 1.0

_RelativeRotation ("Relative Rotation", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 12044
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat29;
vec3 u_xlat33;
mediump vec3 u_xlat16_34;
vec3 u_xlat35;
vec3 u_xlat44;
mediump vec3 u_xlat16_46;
float u_xlat50;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
vec2 u_xlat54;
mediump float u_xlat16_59;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_75;
int u_xlati75;
bool u_xlatb75;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_79;
int u_xlati79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
float u_xlat87;
bool u_xlatb87;
float u_xlat89;
float u_xlat91;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25 = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25 = u_xlat25 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat50 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat50 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * u_xlat4.xyz;
    u_xlat75 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat75) + u_xlat5.xyz;
    u_xlat75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat8.xyz = vec3(u_xlat25) * u_xlat8.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat16_26.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_1.x + -1.0;
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_59 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_59 = max(u_xlat16_59, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_59;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat10.z = u_xlat25 * u_xlat75;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_26.xyz);
    u_xlat25 = u_xlat16_1.x * u_xlat16_59;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat10.y = u_xlat16_84 * u_xlat25;
    u_xlat79 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat10.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat35.xyz;
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat75 * u_xlat80;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat25 * u_xlat80;
    u_xlat80 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat12.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat13.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat13.xyz = vec3(u_xlat81) * u_xlat13.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat25 * u_xlat81;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat75 * u_xlat16_84;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_26.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat75 * u_xlat25;
    u_xlat14.z = u_xlat81 * u_xlat83;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat83 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat62 = u_xlat83 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat82 * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_15 = (-u_xlat16_13) + u_xlat16_14;
    u_xlat16.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat82 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat82 = u_xlat82 + _U_RasterCardTex;
    u_xlat16.x = u_xlat82 + vs_TEXCOORD3.z;
    u_xlat16.xy = u_xlat16.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_16.xy = texture(_RasterCardTex, u_xlat16.xy).xy;
    u_xlat16_26.xz = u_xlat16_16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xz = min(max(u_xlat16_26.xz, 0.0), 1.0);
#else
    u_xlat16_26.xz = clamp(u_xlat16_26.xz, 0.0, 1.0);
#endif
    u_xlat16_82 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_26.xxxx * u_xlat16_15 + u_xlat16_13;
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz;
    u_xlat16_17.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_3.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_9.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16_17.xyz;
    u_xlat81 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_79 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat79 = u_xlat16_79 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat19.xyz = u_xlat35.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyz = vec3(u_xlat87) * u_xlat19.xyz;
    u_xlat87 = dot(u_xlat8.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat25 * u_xlat87;
    u_xlat16_26.x = dot(u_xlat5.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_26.x;
    u_xlat87 = dot(u_xlat6.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_26.x) + 1.0;
    u_xlat20.z = u_xlat83 * u_xlat87;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat83 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat62 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat91 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat75 * u_xlat91;
    u_xlat16_26.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat25 * u_xlat16_26.x;
    u_xlat19.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat91 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat19.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat80 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat87 = u_xlat87 * u_xlat91;
    u_xlat16_26.x = u_xlat89 * u_xlat89;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat89 * u_xlat16_26.x;
    u_xlat89 = (-u_xlat16_26.x) * u_xlat89 + 1.0;
    u_xlat44.xyz = u_xlat16_17.xyz * vec3(u_xlat89);
    u_xlat44.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat44.xyz;
    u_xlat44.xyz = vec3(u_xlat87) * u_xlat44.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat44.xyz * _directSpecularColor.zxy;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat16_18.xyz = u_xlat44.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_26.x);
    u_xlat16_21.xyz = vec3(u_xlat16_51) * u_xlat16.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_34.xz = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_34.zzz + u_xlat16_22.xyz;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat87 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat87);
    u_xlat87 = dot(u_xlat8.xyz, u_xlat35.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
    u_xlat8.z = u_xlat75 * u_xlat8.x;
    u_xlat16.y = u_xlat25 * u_xlat87;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat35.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_1.x;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16.z = u_xlat75 * u_xlat83;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat83 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat62 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat8.y = u_xlat25 * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 + u_xlat8.x;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat80 * u_xlat25 + 6.10351563e-05;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat75;
    u_xlat16_51 = u_xlat35.x * u_xlat35.x;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_84 = u_xlat35.x * u_xlat16_51;
    u_xlat75 = (-u_xlat16_51) * u_xlat35.x + 1.0;
    u_xlat33.xyz = u_xlat16_17.xyz * vec3(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat81) * vec3(u_xlat16_84) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat25) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _directSpecularColor.zxy;
    u_xlat33.xyz = u_xlat8.xxx * u_xlat33.xyz;
    u_xlat16_51 = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_26.x = u_xlat16_51 * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_34.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_51 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_51, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat33.xyz = u_xlat16_1.xyz * u_xlat33.xyz;
    u_xlat16_18.xyz = u_xlat33.xyz * vec3(u_xlat79) + u_xlat16_18.xyz;
    u_xlat16_34.x = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat79) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat79) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat4.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_34.x * 0.5 + 0.5;
    u_xlat16_84 = (-u_xlat16_34.x) + u_xlat16_84;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_84 + u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_34.x;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_34.x = u_xlat16_84 * u_xlat16_34.x;
    u_xlat25 = min(u_xlat16_34.x, 1.0);
    u_xlat75 = min(u_xlat25, u_xlat16_3.z);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat75) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_23.y = u_xlat16_2.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_84) * u_xlat16_24.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati79 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati79].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_34.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz + u_xlat16_1.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat50) + u_xlat5.xyz;
    u_xlat16_86 = u_xlat16_59 * 8.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_59 = max(u_xlat16_59, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_77) * u_xlat16_86;
    u_xlat5.xyz = vec3(u_xlat16_86) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_86 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_86) + (-u_xlat16_11.xyz);
    u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat50) + (-u_xlat5.xyz);
    u_xlat0.xzw = vec3(u_xlat16_59) * u_xlat0.xzw + u_xlat5.xyz;
    u_xlat4.xyz = (-u_xlat0.xzw) + u_xlat5.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_77)) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_9.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat29 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat4.x * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_2.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_77);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_15.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_46.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_9.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_2.x = u_xlat16_9.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_34.x = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_34.x + u_xlat16_50;
    u_xlat16_9.x = u_xlat16_84 * u_xlat16_9.x;
    u_xlat0.x = u_xlat29 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat25 * 0.5;
    u_xlat16_34.x = (-u_xlat25) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_34.x + u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_59 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_59 + u_xlat16_34.x;
    u_xlat16_9.x = u_xlat25 * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_3.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.yzx * u_xlat16_15.yzx + u_xlat16_18.yzx;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_1.xyz;
    u_xlat16_15.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    u_xlat16_1.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_1.xy = u_xlat16_1.xx * vs_TEXCOORD3.xy;
    u_xlat16_1.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_1.xy;
    u_xlat4.xy = u_xlat16_1.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat4.x>=0.5);
#else
    u_xlatb75 = u_xlat4.x>=0.5;
#endif
    u_xlat54.x = u_xlatb75 ? 1.0 : float(0.0);
    u_xlat75 = (u_xlatb75) ? 0.0 : _FlowLightFactory.y;
    u_xlat75 = u_xlat54.x * (-_FlowLightFactory.y) + u_xlat75;
    u_xlat5.x = u_xlat75 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat54.xy = fract(u_xlat5.xy);
    u_xlat4.xy = u_xlat54.xy + u_xlat4.xy;
    u_xlat16_75 = texture(_FlowLightMap, u_xlat4.xy).x;
    u_xlat16_4.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.x = u_xlat16_82 * u_xlat16_4.x;
    u_xlat16_26.x = u_xlat16_75 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat4.xzw = u_xlat16_26.zzz * u_xlat16_15.xyz;
    u_xlat4.xzw = u_xlat4.xzw * vec3(_outlineIntensity);
    u_xlat16_1.x = u_xlat16_26.x * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xzw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xzw = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat75 = dot(u_xlat4.xzw, u_xlat16_11.xyz);
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat75 = log2(u_xlat75);
    u_xlat75 = u_xlat75 * _fresnelPow;
    u_xlat75 = exp2(u_xlat75);
    u_xlat75 = u_xlat75 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat75 * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_34.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat29;
vec3 u_xlat33;
mediump vec3 u_xlat16_34;
vec3 u_xlat35;
vec3 u_xlat44;
mediump vec3 u_xlat16_46;
float u_xlat50;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
vec2 u_xlat54;
mediump float u_xlat16_59;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_75;
int u_xlati75;
bool u_xlatb75;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_79;
int u_xlati79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
float u_xlat87;
bool u_xlatb87;
float u_xlat89;
float u_xlat91;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25 = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25 = u_xlat25 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat50 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat50 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * u_xlat4.xyz;
    u_xlat75 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat75) + u_xlat5.xyz;
    u_xlat75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat8.xyz = vec3(u_xlat25) * u_xlat8.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat16_26.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_1.x + -1.0;
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_59 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_59 = max(u_xlat16_59, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_59;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat10.z = u_xlat25 * u_xlat75;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_26.xyz);
    u_xlat25 = u_xlat16_1.x * u_xlat16_59;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat10.y = u_xlat16_84 * u_xlat25;
    u_xlat79 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat10.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat35.xyz;
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat75 * u_xlat80;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat25 * u_xlat80;
    u_xlat80 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat12.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat13.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat13.xyz = vec3(u_xlat81) * u_xlat13.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat25 * u_xlat81;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat75 * u_xlat16_84;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_26.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat75 * u_xlat25;
    u_xlat14.z = u_xlat81 * u_xlat83;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat83 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat62 = u_xlat83 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat82 * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_15 = (-u_xlat16_13) + u_xlat16_14;
    u_xlat16.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat82 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat82 = u_xlat82 + _U_RasterCardTex;
    u_xlat16.x = u_xlat82 + vs_TEXCOORD3.z;
    u_xlat16.xy = u_xlat16.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_16.xy = texture(_RasterCardTex, u_xlat16.xy).xy;
    u_xlat16_26.xz = u_xlat16_16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xz = min(max(u_xlat16_26.xz, 0.0), 1.0);
#else
    u_xlat16_26.xz = clamp(u_xlat16_26.xz, 0.0, 1.0);
#endif
    u_xlat16_82 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_26.xxxx * u_xlat16_15 + u_xlat16_13;
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz;
    u_xlat16_17.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_3.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_9.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16_17.xyz;
    u_xlat81 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_79 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat79 = u_xlat16_79 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat19.xyz = u_xlat35.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyz = vec3(u_xlat87) * u_xlat19.xyz;
    u_xlat87 = dot(u_xlat8.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat25 * u_xlat87;
    u_xlat16_26.x = dot(u_xlat5.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_26.x;
    u_xlat87 = dot(u_xlat6.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_26.x) + 1.0;
    u_xlat20.z = u_xlat83 * u_xlat87;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat83 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat62 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat91 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat75 * u_xlat91;
    u_xlat16_26.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat25 * u_xlat16_26.x;
    u_xlat19.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat91 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat19.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat80 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat87 = u_xlat87 * u_xlat91;
    u_xlat16_26.x = u_xlat89 * u_xlat89;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat89 * u_xlat16_26.x;
    u_xlat89 = (-u_xlat16_26.x) * u_xlat89 + 1.0;
    u_xlat44.xyz = u_xlat16_17.xyz * vec3(u_xlat89);
    u_xlat44.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat44.xyz;
    u_xlat44.xyz = vec3(u_xlat87) * u_xlat44.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat44.xyz * _directSpecularColor.zxy;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat16_18.xyz = u_xlat44.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_26.x);
    u_xlat16_21.xyz = vec3(u_xlat16_51) * u_xlat16.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_34.xz = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_34.zzz + u_xlat16_22.xyz;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat87 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat87);
    u_xlat87 = dot(u_xlat8.xyz, u_xlat35.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
    u_xlat8.z = u_xlat75 * u_xlat8.x;
    u_xlat16.y = u_xlat25 * u_xlat87;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat35.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_1.x;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16.z = u_xlat75 * u_xlat83;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat83 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat62 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat8.y = u_xlat25 * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 + u_xlat8.x;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat80 * u_xlat25 + 6.10351563e-05;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat75;
    u_xlat16_51 = u_xlat35.x * u_xlat35.x;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_84 = u_xlat35.x * u_xlat16_51;
    u_xlat75 = (-u_xlat16_51) * u_xlat35.x + 1.0;
    u_xlat33.xyz = u_xlat16_17.xyz * vec3(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat81) * vec3(u_xlat16_84) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat25) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _directSpecularColor.zxy;
    u_xlat33.xyz = u_xlat8.xxx * u_xlat33.xyz;
    u_xlat16_51 = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_26.x = u_xlat16_51 * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_34.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_51 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_51, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat33.xyz = u_xlat16_1.xyz * u_xlat33.xyz;
    u_xlat16_18.xyz = u_xlat33.xyz * vec3(u_xlat79) + u_xlat16_18.xyz;
    u_xlat16_34.x = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat79) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat79) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat4.xyz) * vec3(u_xlat50) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_34.x * 0.5 + 0.5;
    u_xlat16_84 = (-u_xlat16_34.x) + u_xlat16_84;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_84 + u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_34.x;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_34.x = u_xlat16_84 * u_xlat16_34.x;
    u_xlat25 = min(u_xlat16_34.x, 1.0);
    u_xlat75 = min(u_xlat25, u_xlat16_3.z);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat75) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_23.y = u_xlat16_2.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_84) * u_xlat16_24.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati79 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati79].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_34.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz + u_xlat16_1.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat50) + u_xlat5.xyz;
    u_xlat16_86 = u_xlat16_59 * 8.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_59 = max(u_xlat16_59, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_77) * u_xlat16_86;
    u_xlat5.xyz = vec3(u_xlat16_86) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_86 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_86) + (-u_xlat16_11.xyz);
    u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat50) + (-u_xlat5.xyz);
    u_xlat0.xzw = vec3(u_xlat16_59) * u_xlat0.xzw + u_xlat5.xyz;
    u_xlat4.xyz = (-u_xlat0.xzw) + u_xlat5.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_77)) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_9.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat29 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat4.x * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_2.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_77);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_15.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_46.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_9.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_2.x = u_xlat16_9.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_34.x = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_34.x + u_xlat16_50;
    u_xlat16_9.x = u_xlat16_84 * u_xlat16_9.x;
    u_xlat0.x = u_xlat29 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat25 * 0.5;
    u_xlat16_34.x = (-u_xlat25) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_34.x + u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_59 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_59 + u_xlat16_34.x;
    u_xlat16_9.x = u_xlat25 * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_3.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.yzx * u_xlat16_15.yzx + u_xlat16_18.yzx;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_1.xyz;
    u_xlat16_15.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    u_xlat16_1.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_1.xy = u_xlat16_1.xx * vs_TEXCOORD3.xy;
    u_xlat16_1.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_1.xy;
    u_xlat4.xy = u_xlat16_1.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat4.x>=0.5);
#else
    u_xlatb75 = u_xlat4.x>=0.5;
#endif
    u_xlat54.x = u_xlatb75 ? 1.0 : float(0.0);
    u_xlat75 = (u_xlatb75) ? 0.0 : _FlowLightFactory.y;
    u_xlat75 = u_xlat54.x * (-_FlowLightFactory.y) + u_xlat75;
    u_xlat5.x = u_xlat75 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat54.xy = fract(u_xlat5.xy);
    u_xlat4.xy = u_xlat54.xy + u_xlat4.xy;
    u_xlat16_75 = texture(_FlowLightMap, u_xlat4.xy).x;
    u_xlat16_4.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.x = u_xlat16_82 * u_xlat16_4.x;
    u_xlat16_26.x = u_xlat16_75 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat4.xzw = u_xlat16_26.zzz * u_xlat16_15.xyz;
    u_xlat4.xzw = u_xlat4.xzw * vec3(_outlineIntensity);
    u_xlat16_1.x = u_xlat16_26.x * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xzw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xzw = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat75 = dot(u_xlat4.xzw, u_xlat16_11.xyz);
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat75 = log2(u_xlat75);
    u_xlat75 = u_xlat75 * _fresnelPow;
    u_xlat75 = exp2(u_xlat75);
    u_xlat75 = u_xlat75 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat75 * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_34.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat29;
float u_xlat31;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat52;
int u_xlati52;
vec2 u_xlat54;
float u_xlat57;
mediump float u_xlat16_57;
vec2 u_xlat62;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_65;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
float u_xlat80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
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
    u_xlatb78 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb78 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat8.xyz = vec3(u_xlat83) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb78)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat78 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat78);
    u_xlat2.x = (-u_xlat78) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat78;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat26 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_26.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat26 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_37.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb78 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb78 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_12.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_89;
    u_xlat16_12.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat78 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat78 = u_xlat78 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat27.xyz = (-u_xlat9.yzx) * u_xlat27.xxx + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat9.xyz;
    u_xlat2.xyz = u_xlat9.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat78) * u_xlat9.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_85 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_89 = u_xlat16_85 + -1.0;
    u_xlat80 = (-u_xlat16_89) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_90 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat80 * u_xlat16_90;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat5.z = u_xlat1.x * u_xlat80;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat16_11.xyz);
    u_xlat1.x = u_xlat16_85 * u_xlat16_90;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat5.y = u_xlat16_65 * u_xlat1.x;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat5.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_14.xyz = vec3(u_xlat16_85) * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat80 * u_xlat4.x;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat27.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat1.x * u_xlat4.x;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat81 = u_xlat4.x * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_11.xyz;
    u_xlat31 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat15.xyz = vec3(u_xlat31) * u_xlat15.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat1.x * u_xlat31;
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat80 * u_xlat16_65;
    u_xlat31 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_11.x) + 1.0;
    u_xlat84 = u_xlat80 * u_xlat1.x;
    u_xlat16.z = u_xlat31 * u_xlat84;
    u_xlat31 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat31 = u_xlat84 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat86 = u_xlat84 * 0.318309873;
    u_xlat31 = u_xlat31 * u_xlat86;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat81 = u_xlat81 * u_xlat31;
    u_xlat16_11.x = u_xlat57 * u_xlat57;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat57 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat57 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_17 = (-u_xlat16_15) + u_xlat16_16;
    u_xlat18.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat57 = dot(u_xlat16_14.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat18.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat62.xy = u_xlat18.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_62.xy = texture(_RasterCardTex, u_xlat62.xy).xy;
    u_xlat16_11.xz = u_xlat16_62.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xz = min(max(u_xlat16_11.xz, 0.0), 1.0);
#else
    u_xlat16_11.xz = clamp(u_xlat16_11.xz, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_11.x = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_11.xxxx * u_xlat16_17 + u_xlat16_15;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_39.xyz = u_xlat16_13.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat16_39.xyz;
    u_xlat82 = u_xlat16_39.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat18.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.zxy;
    u_xlat18.xyz = u_xlat5.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_12.xyz * u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat26) * u_xlat18.xyz;
    u_xlat21.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat81;
    u_xlat16_11.x = dot(u_xlat27.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat80 * u_xlat16_11.x;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_11.x) + 1.0;
    u_xlat22.z = u_xlat81 * u_xlat84;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat84 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat86 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat87 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat80 * u_xlat87;
    u_xlat16_11.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_11.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat21.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat4.x * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat81 = u_xlat81 * u_xlat87;
    u_xlat16_11.x = u_xlat31 * u_xlat31;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat31 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat31 + 1.0;
    u_xlat47.xyz = u_xlat16_39.xyz * vec3(u_xlat31);
    u_xlat47.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat47.xyz;
    u_xlat47.xyz = vec3(u_xlat81) * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat47.xyz * _directSpecularColor.zxy;
    u_xlat47.xyz = u_xlat21.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat47.xyz * u_xlat16_7.xyz + u_xlat18.xyz;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_20.xyz = u_xlat16_37.xxx * u_xlat18.xyz;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_20.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_20.xyz);
    u_xlat3.z = u_xlat80 * u_xlat3.x;
    u_xlat18.y = u_xlat1.x * u_xlat81;
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat8.xyz);
    u_xlat18.x = u_xlat80 * u_xlat16_85;
    u_xlat80 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat80 * u_xlat84;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat84 / u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat86 * u_xlat80;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat3.y = u_xlat1.x * u_xlat16_85;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat4.x * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat80;
    u_xlat16_37.x = u_xlat81 * u_xlat81;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_92 = u_xlat81 * u_xlat16_37.x;
    u_xlat80 = (-u_xlat16_37.x) * u_xlat81 + 1.0;
    u_xlat29.xyz = u_xlat16_39.xyz * vec3(u_xlat80);
    u_xlat29.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat29.xyz;
    u_xlat29.xyz = u_xlat1.xxx * u_xlat29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.zxy;
    u_xlat29.xyz = u_xlat3.xxx * u_xlat29.xyz;
    u_xlat16_37.x = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_11.x = u_xlat16_37.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_23.x, u_xlat16_11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_37.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat16_20.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat29.xyz = u_xlat29.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat29.xyz * vec3(u_xlat26) + u_xlat16_19.xyz;
    u_xlat16_85 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat21.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_85) + u_xlat16_11.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_85;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_85));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_24.y = u_xlat16_12.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_11.xxx * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati52 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_85 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_17.xyz = u_xlat16_37.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat78) * u_xlat16_17.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_89>=0.0);
#else
    u_xlatb1 = u_xlat16_89>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat83) + u_xlat0.xzw;
    u_xlat16_37.x = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_37.x = min(u_xlat16_37.x, 1.0);
    u_xlat16_37.x = u_xlat16_37.x * abs(u_xlat16_89);
    u_xlat0.xzw = u_xlat16_37.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_37.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_37.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyz = u_xlat6.xyz * vec3(u_xlat83) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_90) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_89)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_37.x = -abs(u_xlat16_89) * 0.800000012 + 1.0;
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_37.x);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat52 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_89;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_37.x);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_46.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_39.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_1.w);
    u_xlat16_37.x = u_xlat16_85 + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_1.x = u_xlat16_37.x * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_1.x = u_xlat16_85 * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_85 = u_xlat16_17.z * 15.0 + (-u_xlat16_85);
    u_xlat16_37.x = (-u_xlat16_78) + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_78;
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_85;
    u_xlat0.x = u_xlat52 * u_xlat16_85;
    u_xlat16_85 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_11.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_37.x = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_11.x;
    u_xlat16_85 = u_xlat0.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_4.z, u_xlat16_85);
    u_xlat16_11.xyw = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyw = u_xlat16_11.ywx * u_xlat16_12.yzx + u_xlat16_19.yzx;
    u_xlat16_85 = dot(u_xlat16_11.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_15.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_26.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_26.xyz;
    u_xlat16_7.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_7.xy = u_xlat16_7.xx * vs_TEXCOORD3.xy;
    u_xlat16_7.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_7.xy;
    u_xlat2.xy = u_xlat16_7.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat2.x>=0.5);
#else
    u_xlatb78 = u_xlat2.x>=0.5;
#endif
    u_xlat54.x = u_xlatb78 ? 1.0 : float(0.0);
    u_xlat78 = (u_xlatb78) ? 0.0 : _FlowLightFactory.y;
    u_xlat78 = u_xlat54.x * (-_FlowLightFactory.y) + u_xlat78;
    u_xlat3.x = u_xlat78 * _Time.y;
    u_xlat3.y = _FlowLightFactory.z * _Time.y;
    u_xlat54.xy = fract(u_xlat3.xy);
    u_xlat2.xy = u_xlat54.xy + u_xlat2.xy;
    u_xlat16_78 = texture(_FlowLightMap, u_xlat2.xy).x;
    u_xlat16_2.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_16.xyz;
    u_xlat2.xzw = u_xlat16_11.zzz * u_xlat16_12.xyz;
    u_xlat2.xzw = u_xlat2.xzw * vec3(_outlineIntensity);
    u_xlat16_7.x = u_xlat16_33 * _FlowLightFactory.x;
    u_xlat16_7.xyz = u_xlat16_7.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xzw * _outlineColor.xyz + u_xlat16_7.xyz;
    u_xlat78 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xzw = vec3(u_xlat78) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat2.xzw, u_xlat16_14.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _fresnelPow;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _fresnelPow;
    u_xlat16_7.x = max(_fresnelRange, 0.0);
    u_xlat16_7.x = u_xlat78 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_2.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat29;
float u_xlat31;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat52;
int u_xlati52;
vec2 u_xlat54;
float u_xlat57;
mediump float u_xlat16_57;
vec2 u_xlat62;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_65;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
float u_xlat80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
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
    u_xlatb78 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb78 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat8.xyz = vec3(u_xlat83) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb78)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat78 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat78);
    u_xlat2.x = (-u_xlat78) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat78;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat26 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_26.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat26 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_37.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb78 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb78 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_12.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_89;
    u_xlat16_12.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat78 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat78 = u_xlat78 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat27.xyz = (-u_xlat9.yzx) * u_xlat27.xxx + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat9.xyz;
    u_xlat2.xyz = u_xlat9.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat78) * u_xlat9.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_85 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_89 = u_xlat16_85 + -1.0;
    u_xlat80 = (-u_xlat16_89) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_90 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat80 * u_xlat16_90;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat5.z = u_xlat1.x * u_xlat80;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat16_11.xyz);
    u_xlat1.x = u_xlat16_85 * u_xlat16_90;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat5.y = u_xlat16_65 * u_xlat1.x;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat5.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_14.xyz = vec3(u_xlat16_85) * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat80 * u_xlat4.x;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat27.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat1.x * u_xlat4.x;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat81 = u_xlat4.x * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_11.xyz;
    u_xlat31 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat15.xyz = vec3(u_xlat31) * u_xlat15.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat1.x * u_xlat31;
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat80 * u_xlat16_65;
    u_xlat31 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_11.x) + 1.0;
    u_xlat84 = u_xlat80 * u_xlat1.x;
    u_xlat16.z = u_xlat31 * u_xlat84;
    u_xlat31 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat31 = u_xlat84 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat86 = u_xlat84 * 0.318309873;
    u_xlat31 = u_xlat31 * u_xlat86;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat81 = u_xlat81 * u_xlat31;
    u_xlat16_11.x = u_xlat57 * u_xlat57;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat57 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat57 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_17 = (-u_xlat16_15) + u_xlat16_16;
    u_xlat18.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat57 = dot(u_xlat16_14.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat18.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat62.xy = u_xlat18.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_62.xy = texture(_RasterCardTex, u_xlat62.xy).xy;
    u_xlat16_11.xz = u_xlat16_62.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xz = min(max(u_xlat16_11.xz, 0.0), 1.0);
#else
    u_xlat16_11.xz = clamp(u_xlat16_11.xz, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_11.x = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_11.xxxx * u_xlat16_17 + u_xlat16_15;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_39.xyz = u_xlat16_13.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat16_39.xyz;
    u_xlat82 = u_xlat16_39.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat18.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.zxy;
    u_xlat18.xyz = u_xlat5.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_12.xyz * u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat26) * u_xlat18.xyz;
    u_xlat21.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat81;
    u_xlat16_11.x = dot(u_xlat27.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat80 * u_xlat16_11.x;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_11.x) + 1.0;
    u_xlat22.z = u_xlat81 * u_xlat84;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat84 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat86 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat87 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat80 * u_xlat87;
    u_xlat16_11.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_11.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat21.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat4.x * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat81 = u_xlat81 * u_xlat87;
    u_xlat16_11.x = u_xlat31 * u_xlat31;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat31 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat31 + 1.0;
    u_xlat47.xyz = u_xlat16_39.xyz * vec3(u_xlat31);
    u_xlat47.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat47.xyz;
    u_xlat47.xyz = vec3(u_xlat81) * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat47.xyz * _directSpecularColor.zxy;
    u_xlat47.xyz = u_xlat21.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat47.xyz * u_xlat16_7.xyz + u_xlat18.xyz;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_20.xyz = u_xlat16_37.xxx * u_xlat18.xyz;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_20.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_20.xyz);
    u_xlat3.z = u_xlat80 * u_xlat3.x;
    u_xlat18.y = u_xlat1.x * u_xlat81;
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat8.xyz);
    u_xlat18.x = u_xlat80 * u_xlat16_85;
    u_xlat80 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat80 * u_xlat84;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat84 / u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat86 * u_xlat80;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat3.y = u_xlat1.x * u_xlat16_85;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat4.x * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat80;
    u_xlat16_37.x = u_xlat81 * u_xlat81;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_92 = u_xlat81 * u_xlat16_37.x;
    u_xlat80 = (-u_xlat16_37.x) * u_xlat81 + 1.0;
    u_xlat29.xyz = u_xlat16_39.xyz * vec3(u_xlat80);
    u_xlat29.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat29.xyz;
    u_xlat29.xyz = u_xlat1.xxx * u_xlat29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.zxy;
    u_xlat29.xyz = u_xlat3.xxx * u_xlat29.xyz;
    u_xlat16_37.x = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_11.x = u_xlat16_37.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_23.x, u_xlat16_11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_37.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat16_20.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat29.xyz = u_xlat29.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat29.xyz * vec3(u_xlat26) + u_xlat16_19.xyz;
    u_xlat16_85 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat21.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_85) + u_xlat16_11.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_85;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_85));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_24.y = u_xlat16_12.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_11.xxx * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati52 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_85 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_17.xyz = u_xlat16_37.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat78) * u_xlat16_17.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_89>=0.0);
#else
    u_xlatb1 = u_xlat16_89>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat83) + u_xlat0.xzw;
    u_xlat16_37.x = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_37.x = min(u_xlat16_37.x, 1.0);
    u_xlat16_37.x = u_xlat16_37.x * abs(u_xlat16_89);
    u_xlat0.xzw = u_xlat16_37.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_37.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_37.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyz = u_xlat6.xyz * vec3(u_xlat83) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_90) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_89)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_37.x = -abs(u_xlat16_89) * 0.800000012 + 1.0;
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_37.x);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat52 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_89;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_37.x);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_46.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_39.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_1.w);
    u_xlat16_37.x = u_xlat16_85 + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_1.x = u_xlat16_37.x * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_1.x = u_xlat16_85 * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_85 = u_xlat16_17.z * 15.0 + (-u_xlat16_85);
    u_xlat16_37.x = (-u_xlat16_78) + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_78;
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_85;
    u_xlat0.x = u_xlat52 * u_xlat16_85;
    u_xlat16_85 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_11.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_37.x = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_11.x;
    u_xlat16_85 = u_xlat0.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_4.z, u_xlat16_85);
    u_xlat16_11.xyw = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyw = u_xlat16_11.ywx * u_xlat16_12.yzx + u_xlat16_19.yzx;
    u_xlat16_85 = dot(u_xlat16_11.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_15.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_26.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_26.xyz;
    u_xlat16_7.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_7.xy = u_xlat16_7.xx * vs_TEXCOORD3.xy;
    u_xlat16_7.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_7.xy;
    u_xlat2.xy = u_xlat16_7.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat2.x>=0.5);
#else
    u_xlatb78 = u_xlat2.x>=0.5;
#endif
    u_xlat54.x = u_xlatb78 ? 1.0 : float(0.0);
    u_xlat78 = (u_xlatb78) ? 0.0 : _FlowLightFactory.y;
    u_xlat78 = u_xlat54.x * (-_FlowLightFactory.y) + u_xlat78;
    u_xlat3.x = u_xlat78 * _Time.y;
    u_xlat3.y = _FlowLightFactory.z * _Time.y;
    u_xlat54.xy = fract(u_xlat3.xy);
    u_xlat2.xy = u_xlat54.xy + u_xlat2.xy;
    u_xlat16_78 = texture(_FlowLightMap, u_xlat2.xy).x;
    u_xlat16_2.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_16.xyz;
    u_xlat2.xzw = u_xlat16_11.zzz * u_xlat16_12.xyz;
    u_xlat2.xzw = u_xlat2.xzw * vec3(_outlineIntensity);
    u_xlat16_7.x = u_xlat16_33 * _FlowLightFactory.x;
    u_xlat16_7.xyz = u_xlat16_7.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xzw * _outlineColor.xyz + u_xlat16_7.xyz;
    u_xlat78 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat2.xzw = vec3(u_xlat78) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat2.xzw, u_xlat16_14.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _fresnelPow;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _fresnelPow;
    u_xlat16_7.x = max(_fresnelRange, 0.0);
    u_xlat16_7.x = u_xlat78 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_2.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec2 u_xlat16_25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat29;
vec3 u_xlat33;
mediump vec3 u_xlat16_34;
vec3 u_xlat35;
vec3 u_xlat44;
mediump vec3 u_xlat16_46;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_59;
float u_xlat62;
float u_xlat75;
int u_xlati75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_79;
int u_xlati79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
float u_xlat87;
bool u_xlatb87;
float u_xlat89;
float u_xlat91;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25 = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25 = u_xlat25 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat50.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat50.x = max(u_xlat50.x, 1.17549435e-38);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat5.xyz = u_xlat50.xxx * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat50.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50.x = max(u_xlat50.x, 1.17549435e-38);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat4.xyz;
    u_xlat75 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat75) + u_xlat5.xyz;
    u_xlat75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat8.xyz = vec3(u_xlat25) * u_xlat8.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat16_26.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_1.x + -1.0;
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_59.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_59.x = max(u_xlat16_59.x, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_59.x;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat10.z = u_xlat25 * u_xlat75;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_26.xyz);
    u_xlat25 = u_xlat16_1.x * u_xlat16_59.x;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat10.y = u_xlat16_84 * u_xlat25;
    u_xlat79 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat10.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat35.xyz;
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat75 * u_xlat80;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat25 * u_xlat80;
    u_xlat80 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat12.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat13.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat13.xyz = vec3(u_xlat81) * u_xlat13.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat25 * u_xlat81;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat75 * u_xlat16_84;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_26.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat75 * u_xlat25;
    u_xlat14.z = u_xlat81 * u_xlat83;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat83 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat62 = u_xlat83 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat82 * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_15 = (-u_xlat16_13) + u_xlat16_14;
    u_xlat16.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat82 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat82 = u_xlat82 + _U_RasterCardTex;
    u_xlat16.x = u_xlat82 + vs_TEXCOORD3.z;
    u_xlat16.xy = u_xlat16.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_16.xy = texture(_RasterCardTex, u_xlat16.xy).xy;
    u_xlat16_26.xz = u_xlat16_16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xz = min(max(u_xlat16_26.xz, 0.0), 1.0);
#else
    u_xlat16_26.xz = clamp(u_xlat16_26.xz, 0.0, 1.0);
#endif
    u_xlat16_82 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_26.xxxx * u_xlat16_15 + u_xlat16_13;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_3.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_9.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16_17.xyz;
    u_xlat81 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_79 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat79 = u_xlat16_79 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat19.xyz = u_xlat35.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyz = vec3(u_xlat87) * u_xlat19.xyz;
    u_xlat87 = dot(u_xlat8.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat25 * u_xlat87;
    u_xlat16_26.x = dot(u_xlat5.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_26.x;
    u_xlat87 = dot(u_xlat6.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_26.x) + 1.0;
    u_xlat20.z = u_xlat83 * u_xlat87;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat83 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat62 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat91 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat75 * u_xlat91;
    u_xlat16_26.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat25 * u_xlat16_26.x;
    u_xlat19.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat91 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat19.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat80 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat87 = u_xlat87 * u_xlat91;
    u_xlat16_26.x = u_xlat89 * u_xlat89;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat89 * u_xlat16_26.x;
    u_xlat89 = (-u_xlat16_26.x) * u_xlat89 + 1.0;
    u_xlat44.xyz = u_xlat16_17.xyz * vec3(u_xlat89);
    u_xlat44.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat44.xyz;
    u_xlat44.xyz = vec3(u_xlat87) * u_xlat44.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat44.xyz * _directSpecularColor.xyz;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat16_18.xyz = u_xlat44.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_26.x);
    u_xlat16_21.xyz = vec3(u_xlat16_51) * u_xlat16.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_34.xz = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_34.zzz + u_xlat16_22.xyz;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat87 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat87);
    u_xlat87 = dot(u_xlat8.xyz, u_xlat35.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
    u_xlat8.z = u_xlat75 * u_xlat8.x;
    u_xlat16.y = u_xlat25 * u_xlat87;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat35.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_1.x;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16.z = u_xlat75 * u_xlat83;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat83 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat62 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat8.y = u_xlat25 * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 + u_xlat8.x;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat80 * u_xlat25 + 6.10351563e-05;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat75;
    u_xlat16_51 = u_xlat35.x * u_xlat35.x;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_84 = u_xlat35.x * u_xlat16_51;
    u_xlat75 = (-u_xlat16_51) * u_xlat35.x + 1.0;
    u_xlat33.xyz = u_xlat16_17.xyz * vec3(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat81) * vec3(u_xlat16_84) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat25) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _directSpecularColor.xyz;
    u_xlat33.xyz = u_xlat8.xxx * u_xlat33.xyz;
    u_xlat16_51 = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_26.x = u_xlat16_51 * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_34.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_51 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_51, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat33.xyz = u_xlat16_1.xyz * u_xlat33.xyz;
    u_xlat16_18.xyz = u_xlat33.xyz * vec3(u_xlat79) + u_xlat16_18.xyz;
    u_xlat16_34.x = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat79) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat79) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat4.xyz) * u_xlat50.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_34.x * 0.5 + 0.5;
    u_xlat16_84 = (-u_xlat16_34.x) + u_xlat16_84;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_84 + u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_34.x;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_34.x = u_xlat16_84 * u_xlat16_34.x;
    u_xlat25 = min(u_xlat16_34.x, 1.0);
    u_xlat75 = min(u_xlat25, u_xlat16_3.z);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat75) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_23.y = u_xlat16_2.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_84) * u_xlat16_24.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati79 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati79].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_34.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz + u_xlat16_1.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * u_xlat50.xxx + u_xlat5.xyz;
    u_xlat16_86 = u_xlat16_59.x * 8.0;
    u_xlat16_59.x = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_59.x = max(u_xlat16_59.x, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_77) * u_xlat16_86;
    u_xlat5.xyz = vec3(u_xlat16_86) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_86 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_86) + (-u_xlat16_11.xyz);
    u_xlat0.xzw = u_xlat4.xyz * u_xlat50.xxx + (-u_xlat5.xyz);
    u_xlat0.xzw = u_xlat16_59.xxx * u_xlat0.xzw + u_xlat5.xyz;
    u_xlat4.xyz = (-u_xlat0.xzw) + u_xlat5.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_77)) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_9.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat29 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat4.x * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_2.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_77);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_15.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_46.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_9.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_2.x = u_xlat16_9.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_34.x = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_34.x + u_xlat16_50;
    u_xlat16_9.x = u_xlat16_84 * u_xlat16_9.x;
    u_xlat0.x = u_xlat29 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat25 * 0.5;
    u_xlat16_34.x = (-u_xlat25) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_34.x + u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_59.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_59.x + u_xlat16_34.x;
    u_xlat16_9.x = u_xlat25 * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_3.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_18.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_1.xyz;
    u_xlat16_15.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_59.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_59.xy = u_xlat16_59.xx * vs_TEXCOORD3.xy;
    u_xlat16_59.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_59.xy;
    u_xlat0.xy = u_xlat16_59.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb50 = u_xlat0.x>=0.5;
#endif
    u_xlat75 = u_xlatb50 ? 1.0 : float(0.0);
    u_xlat50.x = (u_xlatb50) ? 0.0 : _FlowLightFactory.y;
    u_xlat50.x = u_xlat75 * (-_FlowLightFactory.y) + u_xlat50.x;
    u_xlat4.x = u_xlat50.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat50.xy = fract(u_xlat4.xy);
    u_xlat0.xy = u_xlat50.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_25.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_59.x = u_xlat16_82 * u_xlat16_25.x;
    u_xlat16_84 = u_xlat16_0.x * u_xlat16_59.x;
    u_xlat16_59.x = u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_59.xxx * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat16_26.zzz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_76 = u_xlat16_84 * _FlowLightFactory.x;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat16_11.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _fresnelPow;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_25.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_34.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec2 u_xlat16_25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
float u_xlat29;
vec3 u_xlat33;
mediump vec3 u_xlat16_34;
vec3 u_xlat35;
vec3 u_xlat44;
mediump vec3 u_xlat16_46;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_59;
float u_xlat62;
float u_xlat75;
int u_xlati75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_79;
int u_xlati79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
float u_xlat87;
bool u_xlatb87;
float u_xlat89;
float u_xlat91;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25 = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25 = u_xlat25 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat50.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat50.x = max(u_xlat50.x, 1.17549435e-38);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat5.xyz = u_xlat50.xxx * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat50.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat50.x = max(u_xlat50.x, 1.17549435e-38);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat4.xyz;
    u_xlat75 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat75) + u_xlat5.xyz;
    u_xlat75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat8.xyz = vec3(u_xlat25) * u_xlat8.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat16_26.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_1.x + -1.0;
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_59.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_59.x = max(u_xlat16_59.x, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_59.x;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat10.z = u_xlat25 * u_xlat75;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_26.xyz);
    u_xlat25 = u_xlat16_1.x * u_xlat16_59.x;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat10.y = u_xlat16_84 * u_xlat25;
    u_xlat79 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat10.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat35.xyz;
    u_xlat80 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat75 * u_xlat80;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat25 * u_xlat80;
    u_xlat80 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat12.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat13.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat13.xyz = vec3(u_xlat81) * u_xlat13.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat25 * u_xlat81;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat75 * u_xlat16_84;
    u_xlat81 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat16_26.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat16_26.x) + 1.0;
    u_xlat83 = u_xlat75 * u_xlat25;
    u_xlat14.z = u_xlat81 * u_xlat83;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat83 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat62 = u_xlat83 * 0.318309873;
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat16_26.x = u_xlat82 * u_xlat82;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat82 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat82 * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat82 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_15 = (-u_xlat16_13) + u_xlat16_14;
    u_xlat16.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat82 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat82 = u_xlat82 + _U_RasterCardTex;
    u_xlat16.x = u_xlat82 + vs_TEXCOORD3.z;
    u_xlat16.xy = u_xlat16.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_16.xy = texture(_RasterCardTex, u_xlat16.xy).xy;
    u_xlat16_26.xz = u_xlat16_16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xz = min(max(u_xlat16_26.xz, 0.0), 1.0);
#else
    u_xlat16_26.xz = clamp(u_xlat16_26.xz, 0.0, 1.0);
#endif
    u_xlat16_82 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_26.xxxx * u_xlat16_15 + u_xlat16_13;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = u_xlat16_3.www * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_9.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16_17.xyz;
    u_xlat81 = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_79 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat79 = u_xlat16_79 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat19.xyz = u_xlat35.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyz = vec3(u_xlat87) * u_xlat19.xyz;
    u_xlat87 = dot(u_xlat8.xyz, u_xlat19.xyz);
    u_xlat20.y = u_xlat25 * u_xlat87;
    u_xlat16_26.x = dot(u_xlat5.zxy, u_xlat19.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_26.x;
    u_xlat87 = dot(u_xlat6.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_26.x) + 1.0;
    u_xlat20.z = u_xlat83 * u_xlat87;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat83 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat62 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat91 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat75 * u_xlat91;
    u_xlat16_26.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat25 * u_xlat16_26.x;
    u_xlat19.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat91 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat91 = sqrt(u_xlat91);
    u_xlat91 = u_xlat91 + u_xlat19.x;
    u_xlat91 = u_xlat91 + 6.10351563e-05;
    u_xlat91 = u_xlat80 * u_xlat91 + 6.10351563e-05;
    u_xlat91 = float(1.0) / u_xlat91;
    u_xlat87 = u_xlat87 * u_xlat91;
    u_xlat16_26.x = u_xlat89 * u_xlat89;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat89 * u_xlat16_26.x;
    u_xlat16_51 = u_xlat89 * u_xlat16_26.x;
    u_xlat89 = (-u_xlat16_26.x) * u_xlat89 + 1.0;
    u_xlat44.xyz = u_xlat16_17.xyz * vec3(u_xlat89);
    u_xlat44.xyz = vec3(u_xlat81) * vec3(u_xlat16_51) + u_xlat44.xyz;
    u_xlat44.xyz = vec3(u_xlat87) * u_xlat44.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat44.xyz * _directSpecularColor.xyz;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat16_18.xyz = u_xlat44.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_26.x);
    u_xlat16_21.xyz = vec3(u_xlat16_51) * u_xlat16.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_34.xz = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_34.zzz + u_xlat16_22.xyz;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat87 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat87);
    u_xlat87 = dot(u_xlat8.xyz, u_xlat35.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
    u_xlat8.z = u_xlat75 * u_xlat8.x;
    u_xlat16.y = u_xlat25 * u_xlat87;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat35.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_1.x;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16.z = u_xlat75 * u_xlat83;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat83 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat62 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat8.y = u_xlat25 * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 + u_xlat8.x;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat80 * u_xlat25 + 6.10351563e-05;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat75;
    u_xlat16_51 = u_xlat35.x * u_xlat35.x;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_51 = u_xlat35.x * u_xlat16_51;
    u_xlat16_84 = u_xlat35.x * u_xlat16_51;
    u_xlat75 = (-u_xlat16_51) * u_xlat35.x + 1.0;
    u_xlat33.xyz = u_xlat16_17.xyz * vec3(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat81) * vec3(u_xlat16_84) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat25) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _directSpecularColor.xyz;
    u_xlat33.xyz = u_xlat8.xxx * u_xlat33.xyz;
    u_xlat16_51 = u_xlat16_26.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_26.x);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_26.x = u_xlat16_51 * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_34.x, u_xlat16_26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_51 = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_51, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat33.xyz = u_xlat16_1.xyz * u_xlat33.xyz;
    u_xlat16_18.xyz = u_xlat33.xyz * vec3(u_xlat79) + u_xlat16_18.xyz;
    u_xlat16_34.x = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = vec3(u_xlat79) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = vec3(u_xlat79) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat4.xyz) * u_xlat50.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_2.xyz + u_xlat6.xyz;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34.x = inversesqrt(u_xlat16_34.x);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_34.x * 0.5 + 0.5;
    u_xlat16_84 = (-u_xlat16_34.x) + u_xlat16_84;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_84 + u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_46.z * u_xlat16_34.x;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_34.x = u_xlat16_84 * u_xlat16_34.x;
    u_xlat25 = min(u_xlat16_34.x, 1.0);
    u_xlat75 = min(u_xlat25, u_xlat16_3.z);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat75) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat75) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_23.y = u_xlat16_2.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_84) * u_xlat16_24.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati79 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati79].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_34.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz + u_xlat16_1.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * u_xlat50.xxx + u_xlat5.xyz;
    u_xlat16_86 = u_xlat16_59.x * 8.0;
    u_xlat16_59.x = u_xlat16_59.x * u_xlat16_59.x;
    u_xlat16_59.x = max(u_xlat16_59.x, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_77) * u_xlat16_86;
    u_xlat5.xyz = vec3(u_xlat16_86) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_86 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_86) + (-u_xlat16_11.xyz);
    u_xlat0.xzw = u_xlat4.xyz * u_xlat50.xxx + (-u_xlat5.xyz);
    u_xlat0.xzw = u_xlat16_59.xxx * u_xlat0.xzw + u_xlat5.xyz;
    u_xlat4.xyz = (-u_xlat0.xzw) + u_xlat5.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_77)) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_9.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat29 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat4.x * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_2.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_77);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = u_xlat16_34.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_15.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_46.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_9.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_2.x = u_xlat16_9.x * 16.0 + u_xlat16_2.z;
    u_xlat16_17.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_34.x = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_34.x + u_xlat16_50;
    u_xlat16_9.x = u_xlat16_84 * u_xlat16_9.x;
    u_xlat0.x = u_xlat29 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat25 * 0.5;
    u_xlat16_34.x = (-u_xlat25) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_34.x + u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_59.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_59.x + u_xlat16_34.x;
    u_xlat16_9.x = u_xlat25 * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_3.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + u_xlat16_18.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_1.xyz;
    u_xlat16_15.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_15.xyz + u_xlat16_1.xyz;
    u_xlat16_59.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_59.xy = u_xlat16_59.xx * vs_TEXCOORD3.xy;
    u_xlat16_59.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_59.xy;
    u_xlat0.xy = u_xlat16_59.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb50 = u_xlat0.x>=0.5;
#endif
    u_xlat75 = u_xlatb50 ? 1.0 : float(0.0);
    u_xlat50.x = (u_xlatb50) ? 0.0 : _FlowLightFactory.y;
    u_xlat50.x = u_xlat75 * (-_FlowLightFactory.y) + u_xlat50.x;
    u_xlat4.x = u_xlat50.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat50.xy = fract(u_xlat4.xy);
    u_xlat0.xy = u_xlat50.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_25.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_59.x = u_xlat16_82 * u_xlat16_25.x;
    u_xlat16_84 = u_xlat16_0.x * u_xlat16_59.x;
    u_xlat16_59.x = u_xlat16_59.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59.x = min(max(u_xlat16_59.x, 0.0), 1.0);
#else
    u_xlat16_59.x = clamp(u_xlat16_59.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_59.xxx * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat16_26.zzz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_76 = u_xlat16_84 * _FlowLightFactory.x;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat16_11.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _fresnelPow;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_25.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_34.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
ivec3 u_xlati3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat29;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
vec2 u_xlat52;
int u_xlati52;
bool u_xlatb52;
float u_xlat57;
mediump float u_xlat16_57;
vec2 u_xlat62;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_65;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
float u_xlat80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
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
    u_xlatb78 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb78 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat8.xyz = vec3(u_xlat83) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb78)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat78 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat78);
    u_xlat2.x = (-u_xlat78) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat78;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat26 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_26.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat26 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_37.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb78 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb78 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_12.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_89;
    u_xlat16_12.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat78 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat78 = u_xlat78 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat27.xyz = (-u_xlat9.yzx) * u_xlat27.xxx + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat9.xyz;
    u_xlat2.xyz = u_xlat9.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat78) * u_xlat9.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_85 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_89 = u_xlat16_85 + -1.0;
    u_xlat80 = (-u_xlat16_89) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_90 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat80 * u_xlat16_90;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat5.z = u_xlat1.x * u_xlat80;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat16_11.xyz);
    u_xlat1.x = u_xlat16_85 * u_xlat16_90;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat5.y = u_xlat16_65 * u_xlat1.x;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat5.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_14.xyz = vec3(u_xlat16_85) * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat80 * u_xlat4.x;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat27.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat1.x * u_xlat4.x;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat81 = u_xlat4.x * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_11.xyz;
    u_xlat31 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat15.xyz = vec3(u_xlat31) * u_xlat15.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat1.x * u_xlat31;
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat80 * u_xlat16_65;
    u_xlat31 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_11.x) + 1.0;
    u_xlat84 = u_xlat80 * u_xlat1.x;
    u_xlat16.z = u_xlat31 * u_xlat84;
    u_xlat31 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat31 = u_xlat84 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat86 = u_xlat84 * 0.318309873;
    u_xlat31 = u_xlat31 * u_xlat86;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat81 = u_xlat81 * u_xlat31;
    u_xlat16_11.x = u_xlat57 * u_xlat57;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat57 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat57 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_17 = (-u_xlat16_15) + u_xlat16_16;
    u_xlat18.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat57 = dot(u_xlat16_14.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat18.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat62.xy = u_xlat18.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_62.xy = texture(_RasterCardTex, u_xlat62.xy).xy;
    u_xlat16_11.xz = u_xlat16_62.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xz = min(max(u_xlat16_11.xz, 0.0), 1.0);
#else
    u_xlat16_11.xz = clamp(u_xlat16_11.xz, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_11.x = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_11.xxxx * u_xlat16_17 + u_xlat16_15;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_39.xyz = u_xlat16_13.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat16_39.xyz;
    u_xlat82 = u_xlat16_39.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat18.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat5.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_12.xyz * u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat26) * u_xlat18.xyz;
    u_xlat21.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat81;
    u_xlat16_11.x = dot(u_xlat27.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat80 * u_xlat16_11.x;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_11.x) + 1.0;
    u_xlat22.z = u_xlat81 * u_xlat84;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat84 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat86 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat87 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat80 * u_xlat87;
    u_xlat16_11.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_11.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat21.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat4.x * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat81 = u_xlat81 * u_xlat87;
    u_xlat16_11.x = u_xlat31 * u_xlat31;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat31 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat31 + 1.0;
    u_xlat47.xyz = u_xlat16_39.xyz * vec3(u_xlat31);
    u_xlat47.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat47.xyz;
    u_xlat47.xyz = vec3(u_xlat81) * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat47.xyz * _directSpecularColor.xyz;
    u_xlat47.xyz = u_xlat21.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat47.xyz * u_xlat16_7.xyz + u_xlat18.xyz;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_20.xyz = u_xlat16_37.xxx * u_xlat18.xyz;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_20.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_20.xyz);
    u_xlat3.z = u_xlat80 * u_xlat3.x;
    u_xlat18.y = u_xlat1.x * u_xlat81;
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat8.xyz);
    u_xlat18.x = u_xlat80 * u_xlat16_85;
    u_xlat80 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat80 * u_xlat84;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat84 / u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat86 * u_xlat80;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat3.y = u_xlat1.x * u_xlat16_85;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat4.x * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat80;
    u_xlat16_37.x = u_xlat81 * u_xlat81;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_92 = u_xlat81 * u_xlat16_37.x;
    u_xlat80 = (-u_xlat16_37.x) * u_xlat81 + 1.0;
    u_xlat29.xyz = u_xlat16_39.xyz * vec3(u_xlat80);
    u_xlat29.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat29.xyz;
    u_xlat29.xyz = u_xlat1.xxx * u_xlat29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.xyz;
    u_xlat29.xyz = u_xlat3.xxx * u_xlat29.xyz;
    u_xlat16_37.x = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_11.x = u_xlat16_37.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_23.x, u_xlat16_11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_37.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat16_20.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat29.xyz = u_xlat29.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat29.xyz * vec3(u_xlat26) + u_xlat16_19.xyz;
    u_xlat16_85 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat21.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_85) + u_xlat16_11.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_85;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_85));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_24.y = u_xlat16_12.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_11.xxx * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati52 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_85 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_17.xyz = u_xlat16_37.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat78) * u_xlat16_17.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_89>=0.0);
#else
    u_xlatb1 = u_xlat16_89>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat83) + u_xlat0.xzw;
    u_xlat16_37.x = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_37.x = min(u_xlat16_37.x, 1.0);
    u_xlat16_37.x = u_xlat16_37.x * abs(u_xlat16_89);
    u_xlat0.xzw = u_xlat16_37.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_37.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_37.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyz = u_xlat6.xyz * vec3(u_xlat83) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_90) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_89)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_37.x = -abs(u_xlat16_89) * 0.800000012 + 1.0;
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_37.x);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat52.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_89;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_37.x);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_46.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_39.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_1.w);
    u_xlat16_37.x = u_xlat16_85 + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_1.x = u_xlat16_37.x * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_1.x = u_xlat16_85 * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_85 = u_xlat16_17.z * 15.0 + (-u_xlat16_85);
    u_xlat16_37.x = (-u_xlat16_78) + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_78;
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_85;
    u_xlat0.x = u_xlat52.x * u_xlat16_85;
    u_xlat16_85 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_11.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_37.x = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_11.x;
    u_xlat16_85 = u_xlat0.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_4.z, u_xlat16_85);
    u_xlat16_11.xyw = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_85 = dot(u_xlat16_11.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_15.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xz = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xz = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_37.xz;
    u_xlat0.xy = u_xlat16_37.xz * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb52 = u_xlat0.x>=0.5;
#endif
    u_xlat78 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat52.x = (u_xlatb52) ? 0.0 : _FlowLightFactory.y;
    u_xlat52.x = u_xlat78 * (-_FlowLightFactory.y) + u_xlat52.x;
    u_xlat2.x = u_xlat52.x * _Time.y;
    u_xlat2.y = _FlowLightFactory.z * _Time.y;
    u_xlat52.xy = fract(u_xlat2.xy);
    u_xlat0.xy = u_xlat52.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_26.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_37.x = u_xlat16_57 * u_xlat16_26.x;
    u_xlat16_89 = u_xlat16_0.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_37.xxx * u_xlat16_16.xyz;
    u_xlat0.xyw = u_xlat16_11.zzz * u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_37.x = u_xlat16_89 * _FlowLightFactory.x;
    u_xlat16_7.xyz = u_xlat16_37.xxx * _FlowLightColor.xyz + u_xlat16_7.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_7.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_14.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_7.x = max(_fresnelRange, 0.0);
    u_xlat16_7.x = u_xlat2.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_26.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
ivec3 u_xlati3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_26;
vec3 u_xlat27;
vec3 u_xlat29;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
vec2 u_xlat52;
int u_xlati52;
bool u_xlatb52;
float u_xlat57;
mediump float u_xlat16_57;
vec2 u_xlat62;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_65;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
float u_xlat80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_92;
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
    u_xlatb78 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb78 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat5.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat8.xyz = vec3(u_xlat83) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat9.xyz = vec3(u_xlat83) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb78)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat78 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat78);
    u_xlat2.x = (-u_xlat78) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat78;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat26 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_26.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat26 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_37.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb78 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb78 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_12.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_89;
    u_xlat16_12.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat78 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat78 = u_xlat78 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat27.x = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat27.xyz = (-u_xlat9.yzx) * u_xlat27.xxx + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat27.yzx * u_xlat9.xyz;
    u_xlat2.xyz = u_xlat9.zxy * u_xlat27.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat3.xyz = vec3(u_xlat78) * u_xlat9.xyz + u_xlat2.zxy;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_85 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_89 = u_xlat16_85 + -1.0;
    u_xlat80 = (-u_xlat16_89) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_90 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat80 = u_xlat80 * u_xlat16_90;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat5.z = u_xlat1.x * u_xlat80;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat16_11.xyz);
    u_xlat1.x = u_xlat16_85 * u_xlat16_90;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat5.y = u_xlat16_65 * u_xlat1.x;
    u_xlat81 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat5.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_14.xyz = vec3(u_xlat16_85) * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat80 * u_xlat4.x;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat27.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat1.x * u_xlat4.x;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat81 = u_xlat4.x * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_11.xyz;
    u_xlat31 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat15.xyz = vec3(u_xlat31) * u_xlat15.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat1.x * u_xlat31;
    u_xlat16_65 = dot(u_xlat27.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat80 * u_xlat16_65;
    u_xlat31 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_11.x) + 1.0;
    u_xlat84 = u_xlat80 * u_xlat1.x;
    u_xlat16.z = u_xlat31 * u_xlat84;
    u_xlat31 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat31 = u_xlat84 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat86 = u_xlat84 * 0.318309873;
    u_xlat31 = u_xlat31 * u_xlat86;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat81 = u_xlat81 * u_xlat31;
    u_xlat16_11.x = u_xlat57 * u_xlat57;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat57 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat57 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat57 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_17 = (-u_xlat16_15) + u_xlat16_16;
    u_xlat18.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat57 = dot(u_xlat16_14.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat18.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat62.xy = u_xlat18.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_62.xy = texture(_RasterCardTex, u_xlat62.xy).xy;
    u_xlat16_11.xz = u_xlat16_62.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xz = min(max(u_xlat16_11.xz, 0.0), 1.0);
#else
    u_xlat16_11.xz = clamp(u_xlat16_11.xz, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_11.x = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_11.xxxx * u_xlat16_17 + u_xlat16_15;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz;
    u_xlat16_39.xyz = u_xlat16_13.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat16_39.xyz;
    u_xlat82 = u_xlat16_39.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat18.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = u_xlat5.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_12.xyz * u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat26) * u_xlat18.xyz;
    u_xlat21.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat81;
    u_xlat16_11.x = dot(u_xlat27.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat80 * u_xlat16_11.x;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_11.x) + 1.0;
    u_xlat22.z = u_xlat81 * u_xlat84;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat81 = u_xlat84 / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat86 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat87 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat80 * u_xlat87;
    u_xlat16_11.x = dot(u_xlat27.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_11.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat21.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat4.x * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat81 = u_xlat81 * u_xlat87;
    u_xlat16_11.x = u_xlat31 * u_xlat31;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat31 * u_xlat16_11.x;
    u_xlat16_37.x = u_xlat31 * u_xlat16_11.x;
    u_xlat31 = (-u_xlat16_11.x) * u_xlat31 + 1.0;
    u_xlat47.xyz = u_xlat16_39.xyz * vec3(u_xlat31);
    u_xlat47.xyz = vec3(u_xlat82) * u_xlat16_37.xxx + u_xlat47.xyz;
    u_xlat47.xyz = vec3(u_xlat81) * u_xlat47.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat47.xyz * _directSpecularColor.xyz;
    u_xlat47.xyz = u_xlat21.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat47.xyz * u_xlat16_7.xyz + u_xlat18.xyz;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_11.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_20.xyz = u_xlat16_37.xxx * u_xlat18.xyz;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_23.yyy + u_xlat16_24.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_85) + u_xlat16_20.xyz;
    u_xlat81 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat8.xyz = vec3(u_xlat81) * u_xlat8.xyz;
    u_xlat81 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_20.xyz);
    u_xlat3.z = u_xlat80 * u_xlat3.x;
    u_xlat18.y = u_xlat1.x * u_xlat81;
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat8.xyz);
    u_xlat18.x = u_xlat80 * u_xlat16_85;
    u_xlat80 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_85) + 1.0;
    u_xlat18.z = u_xlat80 * u_xlat84;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat84 / u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat86 * u_xlat80;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat16_85 = dot(u_xlat27.zxy, u_xlat16_20.xyz);
    u_xlat3.y = u_xlat1.x * u_xlat16_85;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat3.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat4.x * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat80;
    u_xlat16_37.x = u_xlat81 * u_xlat81;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat81 * u_xlat16_37.x;
    u_xlat16_92 = u_xlat81 * u_xlat16_37.x;
    u_xlat80 = (-u_xlat16_37.x) * u_xlat81 + 1.0;
    u_xlat29.xyz = u_xlat16_39.xyz * vec3(u_xlat80);
    u_xlat29.xyz = vec3(u_xlat82) * vec3(u_xlat16_92) + u_xlat29.xyz;
    u_xlat29.xyz = u_xlat1.xxx * u_xlat29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.xyz;
    u_xlat29.xyz = u_xlat3.xxx * u_xlat29.xyz;
    u_xlat16_37.x = u_xlat16_11.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_11.x = float(1.0) / float(u_xlat16_11.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_11.x = u_xlat16_37.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_23.x, u_xlat16_11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_37.x);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat16_20.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat29.xyz = u_xlat29.xyz * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat29.xyz * vec3(u_xlat26) + u_xlat16_19.xyz;
    u_xlat16_85 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat21.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat26) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_12.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_85 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_85) + u_xlat16_11.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_85 = u_xlat16_46.z * u_xlat16_85;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_11.x;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_85));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_24.y = u_xlat16_12.y;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = u_xlat16_11.xxx * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati52 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_85 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_17.xyz = u_xlat16_37.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat78) * u_xlat16_17.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_89>=0.0);
#else
    u_xlatb1 = u_xlat16_89>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat27.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat83) + u_xlat0.xzw;
    u_xlat16_37.x = u_xlat16_90 * 8.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = max(u_xlat16_90, 0.0078125);
    u_xlat16_37.x = min(u_xlat16_37.x, 1.0);
    u_xlat16_37.x = u_xlat16_37.x * abs(u_xlat16_89);
    u_xlat0.xzw = u_xlat16_37.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_37.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_37.x = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_37.xxx + (-u_xlat16_14.xyz);
    u_xlat1.xyz = u_xlat6.xyz * vec3(u_xlat83) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_90) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_89)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_37.x = -abs(u_xlat16_89) * 0.800000012 + 1.0;
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_37.x);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat52.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_89 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_89;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_37.x);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_85) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_46.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_39.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_1.w);
    u_xlat16_37.x = u_xlat16_85 + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_1.x = u_xlat16_37.x * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_1.x = u_xlat16_85 * 16.0 + u_xlat16_1.z;
    u_xlat16_37.xz = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_78 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_85 = u_xlat16_17.z * 15.0 + (-u_xlat16_85);
    u_xlat16_37.x = (-u_xlat16_78) + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_78;
    u_xlat16_85 = u_xlat16_11.x * u_xlat16_85;
    u_xlat0.x = u_xlat52.x * u_xlat16_85;
    u_xlat16_85 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_11.x + u_xlat16_85;
    u_xlat16_11.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_37.x = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_37.x + u_xlat16_11.x;
    u_xlat16_85 = u_xlat0.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_4.z, u_xlat16_85);
    u_xlat16_11.xyw = vec3(u_xlat16_85) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_85 = dot(u_xlat16_11.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_15.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xz = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xz = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_37.xz;
    u_xlat0.xy = u_xlat16_37.xz * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb52 = u_xlat0.x>=0.5;
#endif
    u_xlat78 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat52.x = (u_xlatb52) ? 0.0 : _FlowLightFactory.y;
    u_xlat52.x = u_xlat78 * (-_FlowLightFactory.y) + u_xlat52.x;
    u_xlat2.x = u_xlat52.x * _Time.y;
    u_xlat2.y = _FlowLightFactory.z * _Time.y;
    u_xlat52.xy = fract(u_xlat2.xy);
    u_xlat0.xy = u_xlat52.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_26.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_37.x = u_xlat16_57 * u_xlat16_26.x;
    u_xlat16_89 = u_xlat16_0.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_37.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_37.xxx * u_xlat16_16.xyz;
    u_xlat0.xyw = u_xlat16_11.zzz * u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_37.x = u_xlat16_89 * _FlowLightFactory.x;
    u_xlat16_7.xyz = u_xlat16_37.xxx * _FlowLightColor.xyz + u_xlat16_7.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_7.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_14.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_7.x = max(_fresnelRange, 0.0);
    u_xlat16_7.x = u_xlat2.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_26.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_38;
float u_xlat42;
mediump float u_xlat16_44;
vec2 u_xlat45;
mediump float u_xlat16_51;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
float u_xlat68;
int u_xlati68;
bool u_xlatb68;
mediump float u_xlat16_72;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat21 = u_xlat21 * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat42 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat42 = max(u_xlat42, 1.17549435e-38);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat2.xyz = vec3(u_xlat42) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat42 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat42 = max(u_xlat42, 1.17549435e-38);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat3.xyz;
    u_xlat63 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat63) + u_xlat2.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat7.xyz = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_51 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat63 = u_xlat16_64 * u_xlat16_51;
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat10.y = u_xlat21 * u_xlat63;
    u_xlat16_72 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat65 = (-u_xlat16_64) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_51;
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat10.x = u_xlat16_72 * u_xlat65;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_72) + 1.0;
    u_xlat68 = u_xlat63 * u_xlat65;
    u_xlat10.z = u_xlat66 * u_xlat68;
    u_xlat66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat66 = max(u_xlat66, 6.10351563e-05);
    u_xlat66 = u_xlat68 / u_xlat66;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat68 * u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat68 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat65 * u_xlat6.x;
    u_xlat7.z = u_xlat65 * u_xlat68;
    u_xlat65 = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat63 * u_xlat65;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat7.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat16_72 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat63 * u_xlat16_72;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat6.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat68 + 6.10351563e-05;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat66;
    u_xlat16_72 = u_xlat67 * u_xlat67;
    u_xlat16_72 = u_xlat67 * u_xlat16_72;
    u_xlat16_72 = u_xlat67 * u_xlat16_72;
    u_xlat16_11.x = u_xlat67 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat67 + 1.0;
    u_xlat10.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat67 = dot(u_xlat16_1.xyz, vs_TEXCOORD7.xyz);
    u_xlat67 = u_xlat67 + _U_RasterCardTex;
    u_xlat10.x = u_xlat67 + vs_TEXCOORD3.z;
    u_xlat27.xy = u_xlat10.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_27.xy = texture(_RasterCardTex, u_xlat27.xy).xy;
    u_xlat16_32.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_67 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_72 = u_xlat16_67 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_13 = (-u_xlat16_10) + u_xlat16_12;
    u_xlat16_10 = vec4(u_xlat16_72) * u_xlat16_13 + u_xlat16_10;
    u_xlat16_13.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_8.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat66) * u_xlat16_14.xyz;
    u_xlat66 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat66) * u_xlat16_11.xxx + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat65) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.zxy;
    u_xlat27.xyz = u_xlat6.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_11.xxx * u_xlat16.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb65 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_15.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_15.yyy + u_xlat16_17.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyw);
    u_xlat65 = dot(u_xlat4.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
    u_xlat16_72 = max(u_xlat16_15.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_11.xyw = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_30 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_66 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat66 = u_xlat16_66 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = vec3(u_xlat66) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_30 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_76 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat8.xyw * vec3(u_xlat16_76);
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_76);
    u_xlat16_76 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_15.xyz = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat66) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat68) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(u_xlat65) + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_11.xyw;
    u_xlat16_15.xyz = (-u_xlat3.xyz) * vec3(u_xlat42) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_15.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_30) + u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = u_xlat16_38.z * u_xlat16_72 + u_xlat16_30;
    u_xlat16_76 = u_xlat16_38.z * u_xlat16_76;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_77;
    u_xlat65 = min(u_xlat16_76, 1.0);
    u_xlat66 = min(u_xlat65, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat66) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat66) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat66) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat66) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat66) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_19.y = u_xlat16_15.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_20.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati66 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati68 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_11.xyw;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_64>=0.0);
#else
    u_xlatb66 = u_xlat16_64>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat42) + u_xlat2.xyz;
    u_xlat16_13.x = u_xlat16_51 * 8.0;
    u_xlat16_34.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = abs(u_xlat16_64) * u_xlat16_13.x;
    u_xlat2.xyz = u_xlat16_13.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat66);
    u_xlat16_13.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_13.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat42) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_34.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_64)) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_64 = -abs(u_xlat16_64) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_9.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat2.x = dot(u_xlat16_15.xyz, u_xlat2.xyz);
    u_xlat23 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat2.x * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_13.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat3.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_76) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb2)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_38.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx + u_xlat16_2.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_0.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_0.w);
    u_xlat16_76 = u_xlat16_64 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_0.x = u_xlat16_76 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_0.x = u_xlat16_64 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_64 = u_xlat16_15.z * 15.0 + (-u_xlat16_64);
    u_xlat16_76 = (-u_xlat16_44) + u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_76 + u_xlat16_44;
    u_xlat16_64 = u_xlat16_77 * u_xlat16_64;
    u_xlat2.x = u_xlat23 * u_xlat16_64;
    u_xlat16_64 = u_xlat65 * 0.5;
    u_xlat16_76 = (-u_xlat65) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat16_76 + u_xlat16_64;
    u_xlat16_76 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_14.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_14.x + u_xlat16_76;
    u_xlat16_64 = u_xlat16_64 * u_xlat65;
    u_xlat16_64 = min(u_xlat16_64, u_xlat16_8.z);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat27.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.yzx;
    u_xlat16_64 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_10.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_34.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyw = u_xlat16_34.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_34.xyz = (-u_xlat16_11.xyw) + _FogCol.zxy;
    u_xlat16_11.xyw = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_11.xyw;
    u_xlat2.xyz = u_xlat16_11.xyw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat65 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat65);
    u_xlat0.x = u_xlat65 * 0.0625 + u_xlat0.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_23.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_23.xyz;
    u_xlat16_11.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_11.xy;
    u_xlat3.xy = u_xlat16_11.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(u_xlat3.x>=0.5);
#else
    u_xlatb65 = u_xlat3.x>=0.5;
#endif
    u_xlat45.x = u_xlatb65 ? 1.0 : float(0.0);
    u_xlat65 = (u_xlatb65) ? 0.0 : _FlowLightFactory.y;
    u_xlat65 = u_xlat45.x * (-_FlowLightFactory.y) + u_xlat65;
    u_xlat5.x = u_xlat65 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat45.xy = fract(u_xlat5.xy);
    u_xlat3.xy = u_xlat45.xy + u_xlat3.xy;
    u_xlat16_65 = texture(_FlowLightMap, u_xlat3.xy).x;
    u_xlat16_3.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.x = u_xlat16_67 * u_xlat16_3.x;
    u_xlat16_32.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_34.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
    u_xlat3.xzw = u_xlat16_32.yyy * u_xlat16_34.xyz;
    u_xlat3.xzw = u_xlat3.xzw * vec3(_outlineIntensity);
    u_xlat16_11.x = u_xlat16_32.x * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xzw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat3.xzw = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat65 = dot(u_xlat3.xzw, u_xlat16_1.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = (-u_xlat65) + 1.0;
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = log2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat65 = exp2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat65;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_64 : u_xlat16_13.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_38;
float u_xlat42;
mediump float u_xlat16_44;
vec2 u_xlat45;
mediump float u_xlat16_51;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
float u_xlat68;
int u_xlati68;
bool u_xlatb68;
mediump float u_xlat16_72;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat21 = u_xlat21 * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat42 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat42 = max(u_xlat42, 1.17549435e-38);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat2.xyz = vec3(u_xlat42) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat42 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat42 = max(u_xlat42, 1.17549435e-38);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat3.xyz;
    u_xlat63 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat63) + u_xlat2.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat7.xyz = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_51 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat63 = u_xlat16_64 * u_xlat16_51;
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat10.y = u_xlat21 * u_xlat63;
    u_xlat16_72 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat65 = (-u_xlat16_64) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_51;
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat10.x = u_xlat16_72 * u_xlat65;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_72) + 1.0;
    u_xlat68 = u_xlat63 * u_xlat65;
    u_xlat10.z = u_xlat66 * u_xlat68;
    u_xlat66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat66 = max(u_xlat66, 6.10351563e-05);
    u_xlat66 = u_xlat68 / u_xlat66;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat68 * u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat68 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat6.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat65 * u_xlat6.x;
    u_xlat7.z = u_xlat65 * u_xlat68;
    u_xlat65 = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat63 * u_xlat65;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat7.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat16_72 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat63 * u_xlat16_72;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat6.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat68 + 6.10351563e-05;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat66;
    u_xlat16_72 = u_xlat67 * u_xlat67;
    u_xlat16_72 = u_xlat67 * u_xlat16_72;
    u_xlat16_72 = u_xlat67 * u_xlat16_72;
    u_xlat16_11.x = u_xlat67 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat67 + 1.0;
    u_xlat10.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat67 = dot(u_xlat16_1.xyz, vs_TEXCOORD7.xyz);
    u_xlat67 = u_xlat67 + _U_RasterCardTex;
    u_xlat10.x = u_xlat67 + vs_TEXCOORD3.z;
    u_xlat27.xy = u_xlat10.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_27.xy = texture(_RasterCardTex, u_xlat27.xy).xy;
    u_xlat16_32.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_67 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_72 = u_xlat16_67 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_13 = (-u_xlat16_10) + u_xlat16_12;
    u_xlat16_10 = vec4(u_xlat16_72) * u_xlat16_13 + u_xlat16_10;
    u_xlat16_13.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_8.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat66) * u_xlat16_14.xyz;
    u_xlat66 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat66) * u_xlat16_11.xxx + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat65) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.zxy;
    u_xlat27.xyz = u_xlat6.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_11.xxx * u_xlat16.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb65 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_15.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_15.yyy + u_xlat16_17.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyw);
    u_xlat65 = dot(u_xlat4.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
    u_xlat16_72 = max(u_xlat16_15.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_11.xyw = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_30 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_66 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat66 = u_xlat16_66 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = vec3(u_xlat66) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_30 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_76 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat8.xyw * vec3(u_xlat16_76);
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_76);
    u_xlat16_76 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_15.xyz = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat66) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat68) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(u_xlat65) + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_11.xyw;
    u_xlat16_15.xyz = (-u_xlat3.xyz) * vec3(u_xlat42) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_15.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_30) + u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = u_xlat16_38.z * u_xlat16_72 + u_xlat16_30;
    u_xlat16_76 = u_xlat16_38.z * u_xlat16_76;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_77;
    u_xlat65 = min(u_xlat16_76, 1.0);
    u_xlat66 = min(u_xlat65, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat66) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat66) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat66) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat66) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat66) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat66) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_19.y = u_xlat16_15.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_77) * u_xlat16_20.xyz;
    u_xlati66 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati66].xyz;
    u_xlati66 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati68 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_11.xyw;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_64>=0.0);
#else
    u_xlatb66 = u_xlat16_64>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat42) + u_xlat2.xyz;
    u_xlat16_13.x = u_xlat16_51 * 8.0;
    u_xlat16_34.x = u_xlat16_51 * u_xlat16_51;
    u_xlat16_34.x = max(u_xlat16_34.x, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = abs(u_xlat16_64) * u_xlat16_13.x;
    u_xlat2.xyz = u_xlat16_13.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat66);
    u_xlat16_13.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_13.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat42) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_34.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_64)) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_64 = -abs(u_xlat16_64) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_9.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat2.x = dot(u_xlat16_15.xyz, u_xlat2.xyz);
    u_xlat23 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat2.x * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_13.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat3.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_76) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb2)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_38.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx + u_xlat16_2.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_0.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_0.w);
    u_xlat16_76 = u_xlat16_64 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_0.x = u_xlat16_76 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_0.x = u_xlat16_64 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_64 = u_xlat16_15.z * 15.0 + (-u_xlat16_64);
    u_xlat16_76 = (-u_xlat16_44) + u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_76 + u_xlat16_44;
    u_xlat16_64 = u_xlat16_77 * u_xlat16_64;
    u_xlat2.x = u_xlat23 * u_xlat16_64;
    u_xlat16_64 = u_xlat65 * 0.5;
    u_xlat16_76 = (-u_xlat65) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat16_76 + u_xlat16_64;
    u_xlat16_76 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_14.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_14.x + u_xlat16_76;
    u_xlat16_64 = u_xlat16_64 * u_xlat65;
    u_xlat16_64 = min(u_xlat16_64, u_xlat16_8.z);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat27.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.yzx;
    u_xlat16_64 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_10.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_34.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyw = u_xlat16_34.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_34.xyz = (-u_xlat16_11.xyw) + _FogCol.zxy;
    u_xlat16_11.xyw = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_11.xyw;
    u_xlat2.xyz = u_xlat16_11.xyw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat65 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat65);
    u_xlat0.x = u_xlat65 * 0.0625 + u_xlat0.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_23.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_23.xyz;
    u_xlat16_11.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_11.xy;
    u_xlat3.xy = u_xlat16_11.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(u_xlat3.x>=0.5);
#else
    u_xlatb65 = u_xlat3.x>=0.5;
#endif
    u_xlat45.x = u_xlatb65 ? 1.0 : float(0.0);
    u_xlat65 = (u_xlatb65) ? 0.0 : _FlowLightFactory.y;
    u_xlat65 = u_xlat45.x * (-_FlowLightFactory.y) + u_xlat65;
    u_xlat5.x = u_xlat65 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat45.xy = fract(u_xlat5.xy);
    u_xlat3.xy = u_xlat45.xy + u_xlat3.xy;
    u_xlat16_65 = texture(_FlowLightMap, u_xlat3.xy).x;
    u_xlat16_3.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.x = u_xlat16_67 * u_xlat16_3.x;
    u_xlat16_32.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_34.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
    u_xlat3.xzw = u_xlat16_32.yyy * u_xlat16_34.xyz;
    u_xlat3.xzw = u_xlat3.xzw * vec3(_outlineIntensity);
    u_xlat16_11.x = u_xlat16_32.x * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xzw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat3.xzw = vec3(u_xlat65) * u_xlat4.xyz;
    u_xlat65 = dot(u_xlat3.xzw, u_xlat16_1.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = (-u_xlat65) + 1.0;
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = log2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat65 = exp2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat65;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_64 : u_xlat16_13.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat26;
mediump vec3 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
float u_xlat48;
vec2 u_xlat49;
int u_xlati49;
mediump vec2 u_xlat16_51;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
bool u_xlatb72;
mediump float u_xlat16_73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat22 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_3 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat4.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_73);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat68 = u_xlat68 + _U_RasterCardTex;
    u_xlat4.x = u_xlat68 + vs_TEXCOORD3.z;
    u_xlat4.xy = u_xlat4.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_4.xy = texture(_RasterCardTex, u_xlat4.xy).xy;
    u_xlat16_12.xy = u_xlat16_4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_68 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_73 = u_xlat16_68 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_1 = vec4(u_xlat16_73) * u_xlat16_3 + u_xlat16_1;
    u_xlat16_12.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_1.zxy * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_1.zxy * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat70) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_anisoUse2U);
#else
    u_xlatb70 = 0.5<_anisoUse2U;
#endif
    u_xlat10.xy = (bool(u_xlatb70)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat10.xy = u_xlat10.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_70 = texture(_anisotropicMap, u_xlat10.xy).x;
    u_xlat70 = u_xlat16_70 * 2.0 + -1.0;
    u_xlat70 = u_xlat70 * _sunShift + _sunShiftOffset;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb72 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat72 = (u_xlatb72) ? 1.0 : -1.0;
    u_xlat72 = u_xlat72 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat10.xyz;
    u_xlat18.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat18.xyz = vec3(u_xlat72) * u_xlat18.xyz;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat16_11.xyz);
    u_xlat16_73 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_73 + -1.0;
    u_xlat74 = (-u_xlat16_77) + 1.0;
    u_xlat16_15.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_79 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_79;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat19.z = u_xlat72 * u_xlat74;
    u_xlat72 = dot(u_xlat8.zxy, u_xlat16_11.xyz);
    u_xlat75 = u_xlat16_73 * u_xlat16_79;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat19.y = u_xlat72 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + u_xlat19.x;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat74 * u_xlat76;
    u_xlat16_73 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat16_73 * u_xlat75;
    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat26 = u_xlat26 + u_xlat4.x;
    u_xlat26 = u_xlat26 + 6.10351563e-05;
    u_xlat26 = u_xlat72 * u_xlat26 + 6.10351563e-05;
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat5.xyz;
    u_xlat48 = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat18.y = u_xlat48 * u_xlat75;
    u_xlat48 = u_xlat74 * u_xlat75;
    u_xlat16_73 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat18.x = u_xlat16_73 * u_xlat74;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_73 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_73) + 1.0;
    u_xlat18.z = u_xlat48 * u_xlat72;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat48 / u_xlat27;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat48 = u_xlat48 * u_xlat27;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat26 = u_xlat26 * u_xlat48;
    u_xlat16_73 = u_xlat5.x * u_xlat5.x;
    u_xlat16_73 = u_xlat5.x * u_xlat16_73;
    u_xlat16_73 = u_xlat5.x * u_xlat16_73;
    u_xlat16_80 = u_xlat5.x * u_xlat16_73;
    u_xlat48 = (-u_xlat16_73) * u_xlat5.x + 1.0;
    u_xlat16_12.xzw = u_xlat16_15.yyy * u_xlat16_12.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_12.xzw;
    u_xlat48 = u_xlat16_12.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat48) * vec3(u_xlat16_80) + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_37.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_37.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_37.xyz + u_xlat9.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat16_37.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_37.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_73) + u_xlat16_80;
    u_xlat16_16.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_80 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_73;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_80;
    u_xlat5.xy = min(u_xlat0.xz, vec2(u_xlat16_73));
    u_xlat5.x = min(u_xlat16_3.z, u_xlat5.x);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat5.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat5.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat5.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat5.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat5.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat5.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_37.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_37.xz);
    u_xlat16_20.y = u_xlat16_37.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati5 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati5].xyz;
    u_xlati5 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati49 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati5].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati49].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_14.xyz;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat10.xyz = vec3(u_xlat70) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat10.xyz = vec3(u_xlat70) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb70 = u_xlat16_77>=0.0;
#endif
    u_xlat8.xyz = (bool(u_xlatb70)) ? u_xlat10.xyz : u_xlat8.xyz;
    u_xlat10.xyz = u_xlat16_11.xyz * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.zxy * u_xlat16_11.yzx + (-u_xlat10.xyz);
    u_xlat18.xyz = u_xlat8.xyz * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat10.zxy * u_xlat8.yzx + (-u_xlat18.xyz);
    u_xlat8.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat16_14.x = u_xlat16_79 * 8.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_77) * u_xlat16_14.x;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat8.xyz + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat8.xyz = vec3(u_xlat70) * u_xlat8.xyz;
    u_xlat16_14.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat8.xyz = (-u_xlat8.xyz) * u_xlat16_14.xxx + (-u_xlat16_11.xyz);
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat8.xyz);
    u_xlat5.xzw = vec3(u_xlat16_79) * u_xlat5.xzw + u_xlat8.xyz;
    u_xlat6.xyz = (-u_xlat5.xzw) + u_xlat8.xyz;
    u_xlat5.xzw = abs(vec3(u_xlat16_77)) * u_xlat6.xyz + u_xlat5.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_15.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat70 = dot(u_xlat16_37.xyz, u_xlat8.xyz);
    u_xlat6.x = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat70 * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_79;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat5.xzw, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat5.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xzw * u_xlat5.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb70 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb70)) ? u_xlat16_37.xyz : u_xlat16_14.xyz;
    u_xlat19.y = u_xlat16_15.x;
    u_xlat16_38.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xz = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_5.xxx + u_xlat16_5.zzz;
    u_xlat16_12.xzw = u_xlat16_14.xyz * u_xlat16_12.xzw;
    u_xlat16_0.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_0.x = u_xlat16_77 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_73 = u_xlat16_15.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = u_xlat16_70 + (-u_xlat16_5.x);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_5.x;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat70 = u_xlat6.x * u_xlat16_73;
    u_xlat16_73 = u_xlat5.y * 0.5;
    u_xlat16_77 = (-u_xlat5.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat70 * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_79 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_79 + u_xlat16_77;
    u_xlat16_73 = u_xlat5.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_12.xzw = vec3(u_xlat16_73) * u_xlat16_12.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat4.yzx * u_xlat16_7.yzx + u_xlat16_12.zwx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xzw = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xzw) + _FogCol.zxy;
    u_xlat16_12.xzw = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xzw;
    u_xlat4.xyz = u_xlat16_12.xzw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat70 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat4.x = u_xlat4.x * 15.0 + (-u_xlat70);
    u_xlat0.x = u_xlat70 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_26.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16_26.xyz;
    u_xlat16_51.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_51.xy = u_xlat16_51.xx * vs_TEXCOORD3.xy;
    u_xlat16_51.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_51.xy;
    u_xlat5.xy = u_xlat16_51.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat5.x>=0.5);
#else
    u_xlatb70 = u_xlat5.x>=0.5;
#endif
    u_xlat49.x = u_xlatb70 ? 1.0 : float(0.0);
    u_xlat70 = (u_xlatb70) ? 0.0 : _FlowLightFactory.y;
    u_xlat70 = u_xlat49.x * (-_FlowLightFactory.y) + u_xlat70;
    u_xlat6.x = u_xlat70 * _Time.y;
    u_xlat6.y = _FlowLightFactory.z * _Time.y;
    u_xlat49.xy = fract(u_xlat6.xy);
    u_xlat5.xy = u_xlat49.xy + u_xlat5.xy;
    u_xlat16_70 = texture(_FlowLightMap, u_xlat5.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_51.x = u_xlat16_68 * u_xlat16_5.x;
    u_xlat16_73 = u_xlat16_70 * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_12.xzw = u_xlat16_2.xyz * u_xlat16_51.xxx;
    u_xlat2.xyz = u_xlat16_12.xzw * u_xlat16_12.yyy;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_outlineIntensity);
    u_xlat16_51.x = u_xlat16_73 * _FlowLightFactory.x;
    u_xlat16_12.xyz = u_xlat16_51.xxx * _FlowLightColor.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _outlineColor.xyz + u_xlat16_12.xyz;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat9.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat16_11.xyz);
    u_xlat68 = max(u_xlat68, 0.0);
    u_xlat68 = (-u_xlat68) + 1.0;
    u_xlat68 = max(u_xlat68, 0.0);
    u_xlat68 = log2(u_xlat68);
    u_xlat68 = u_xlat68 * _fresnelPow;
    u_xlat68 = exp2(u_xlat68);
    u_xlat68 = u_xlat68 * _fresnelPow;
    u_xlat16_51.x = max(_fresnelRange, 0.0);
    u_xlat16_51.x = u_xlat68 * u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_51.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_7.x : u_xlat16_29;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(14) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat26;
mediump vec3 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
float u_xlat48;
vec2 u_xlat49;
int u_xlati49;
mediump vec2 u_xlat16_51;
float u_xlat66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
bool u_xlatb72;
mediump float u_xlat16_73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat22 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_3 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat4.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_73);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat68 = u_xlat68 + _U_RasterCardTex;
    u_xlat4.x = u_xlat68 + vs_TEXCOORD3.z;
    u_xlat4.xy = u_xlat4.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_4.xy = texture(_RasterCardTex, u_xlat4.xy).xy;
    u_xlat16_12.xy = u_xlat16_4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_68 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_73 = u_xlat16_68 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_1 = vec4(u_xlat16_73) * u_xlat16_3 + u_xlat16_1;
    u_xlat16_12.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_1.zxy * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_1.zxy * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat70) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_anisoUse2U);
#else
    u_xlatb70 = 0.5<_anisoUse2U;
#endif
    u_xlat10.xy = (bool(u_xlatb70)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat10.xy = u_xlat10.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_70 = texture(_anisotropicMap, u_xlat10.xy).x;
    u_xlat70 = u_xlat16_70 * 2.0 + -1.0;
    u_xlat70 = u_xlat70 * _sunShift + _sunShiftOffset;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb72 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat72 = (u_xlatb72) ? 1.0 : -1.0;
    u_xlat72 = u_xlat72 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat72) * u_xlat10.xyz;
    u_xlat18.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat18.xyz = vec3(u_xlat72) * u_xlat18.xyz;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat16_11.xyz);
    u_xlat16_73 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_73 + -1.0;
    u_xlat74 = (-u_xlat16_77) + 1.0;
    u_xlat16_15.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_79 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_79;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat19.z = u_xlat72 * u_xlat74;
    u_xlat72 = dot(u_xlat8.zxy, u_xlat16_11.xyz);
    u_xlat75 = u_xlat16_73 * u_xlat16_79;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat19.y = u_xlat72 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + u_xlat19.x;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat74 * u_xlat76;
    u_xlat16_73 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat16_73 * u_xlat75;
    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat26 = u_xlat26 + u_xlat4.x;
    u_xlat26 = u_xlat26 + 6.10351563e-05;
    u_xlat26 = u_xlat72 * u_xlat26 + 6.10351563e-05;
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat5.xyz;
    u_xlat48 = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat18.y = u_xlat48 * u_xlat75;
    u_xlat48 = u_xlat74 * u_xlat75;
    u_xlat16_73 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat18.x = u_xlat16_73 * u_xlat74;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_73 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_73) + 1.0;
    u_xlat18.z = u_xlat48 * u_xlat72;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat48 / u_xlat27;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat48 = u_xlat48 * u_xlat27;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat26 = u_xlat26 * u_xlat48;
    u_xlat16_73 = u_xlat5.x * u_xlat5.x;
    u_xlat16_73 = u_xlat5.x * u_xlat16_73;
    u_xlat16_73 = u_xlat5.x * u_xlat16_73;
    u_xlat16_80 = u_xlat5.x * u_xlat16_73;
    u_xlat48 = (-u_xlat16_73) * u_xlat5.x + 1.0;
    u_xlat16_12.xzw = u_xlat16_15.yyy * u_xlat16_12.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_12.xzw;
    u_xlat48 = u_xlat16_12.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat48) * vec3(u_xlat16_80) + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_37.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_37.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_37.xyz + u_xlat9.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat16_37.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_37.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_73) + u_xlat16_80;
    u_xlat16_16.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_80 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_73;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_80;
    u_xlat5.xy = min(u_xlat0.xz, vec2(u_xlat16_73));
    u_xlat5.x = min(u_xlat16_3.z, u_xlat5.x);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat5.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat5.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat5.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat5.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat5.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat5.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_37.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_37.xz);
    u_xlat16_20.y = u_xlat16_37.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati5 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati5].xyz;
    u_xlati5 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati49 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati5].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati49].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_14.xyz;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat10.xyz = vec3(u_xlat70) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat10.xyz = vec3(u_xlat70) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb70 = u_xlat16_77>=0.0;
#endif
    u_xlat8.xyz = (bool(u_xlatb70)) ? u_xlat10.xyz : u_xlat8.xyz;
    u_xlat10.xyz = u_xlat16_11.xyz * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.zxy * u_xlat16_11.yzx + (-u_xlat10.xyz);
    u_xlat18.xyz = u_xlat8.xyz * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat10.zxy * u_xlat8.yzx + (-u_xlat18.xyz);
    u_xlat8.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat16_14.x = u_xlat16_79 * 8.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_77) * u_xlat16_14.x;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat8.xyz + u_xlat9.xyz;
    u_xlat70 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat8.xyz = vec3(u_xlat70) * u_xlat8.xyz;
    u_xlat16_14.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat8.xyz = (-u_xlat8.xyz) * u_xlat16_14.xxx + (-u_xlat16_11.xyz);
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat8.xyz);
    u_xlat5.xzw = vec3(u_xlat16_79) * u_xlat5.xzw + u_xlat8.xyz;
    u_xlat6.xyz = (-u_xlat5.xzw) + u_xlat8.xyz;
    u_xlat5.xzw = abs(vec3(u_xlat16_77)) * u_xlat6.xyz + u_xlat5.xzw;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_15.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat70 = dot(u_xlat16_37.xyz, u_xlat8.xyz);
    u_xlat6.x = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat70 * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_79;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat5.xzw, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat5.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xzw * u_xlat5.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb70 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb70)) ? u_xlat16_37.xyz : u_xlat16_14.xyz;
    u_xlat19.y = u_xlat16_15.x;
    u_xlat16_38.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xz = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_5.xxx + u_xlat16_5.zzz;
    u_xlat16_12.xzw = u_xlat16_14.xyz * u_xlat16_12.xzw;
    u_xlat16_0.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_0.x = u_xlat16_77 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_14.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_73 = u_xlat16_15.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = u_xlat16_70 + (-u_xlat16_5.x);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_5.x;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat70 = u_xlat6.x * u_xlat16_73;
    u_xlat16_73 = u_xlat5.y * 0.5;
    u_xlat16_77 = (-u_xlat5.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat70 * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_79 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_79 + u_xlat16_77;
    u_xlat16_73 = u_xlat5.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_12.xzw = vec3(u_xlat16_73) * u_xlat16_12.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat4.yzx * u_xlat16_7.yzx + u_xlat16_12.zwx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xzw = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xzw) + _FogCol.zxy;
    u_xlat16_12.xzw = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xzw;
    u_xlat4.xyz = u_xlat16_12.xzw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat70 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat4.x = u_xlat4.x * 15.0 + (-u_xlat70);
    u_xlat0.x = u_xlat70 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_26.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16_26.xyz;
    u_xlat16_51.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_51.xy = u_xlat16_51.xx * vs_TEXCOORD3.xy;
    u_xlat16_51.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_51.xy;
    u_xlat5.xy = u_xlat16_51.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat5.x>=0.5);
#else
    u_xlatb70 = u_xlat5.x>=0.5;
#endif
    u_xlat49.x = u_xlatb70 ? 1.0 : float(0.0);
    u_xlat70 = (u_xlatb70) ? 0.0 : _FlowLightFactory.y;
    u_xlat70 = u_xlat49.x * (-_FlowLightFactory.y) + u_xlat70;
    u_xlat6.x = u_xlat70 * _Time.y;
    u_xlat6.y = _FlowLightFactory.z * _Time.y;
    u_xlat49.xy = fract(u_xlat6.xy);
    u_xlat5.xy = u_xlat49.xy + u_xlat5.xy;
    u_xlat16_70 = texture(_FlowLightMap, u_xlat5.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_51.x = u_xlat16_68 * u_xlat16_5.x;
    u_xlat16_73 = u_xlat16_70 * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_12.xzw = u_xlat16_2.xyz * u_xlat16_51.xxx;
    u_xlat2.xyz = u_xlat16_12.xzw * u_xlat16_12.yyy;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_outlineIntensity);
    u_xlat16_51.x = u_xlat16_73 * _FlowLightFactory.x;
    u_xlat16_12.xyz = u_xlat16_51.xxx * _FlowLightColor.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _outlineColor.xyz + u_xlat16_12.xyz;
    u_xlat68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat9.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat16_11.xyz);
    u_xlat68 = max(u_xlat68, 0.0);
    u_xlat68 = (-u_xlat68) + 1.0;
    u_xlat68 = max(u_xlat68, 0.0);
    u_xlat68 = log2(u_xlat68);
    u_xlat68 = u_xlat68 * _fresnelPow;
    u_xlat68 = exp2(u_xlat68);
    u_xlat68 = u_xlat68 * _fresnelPow;
    u_xlat16_51.x = max(_fresnelRange, 0.0);
    u_xlat16_51.x = u_xlat68 * u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_51.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_7.x : u_xlat16_29;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
bool u_xlatb21;
float u_xlat23;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_38;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
float u_xlat67;
float u_xlat68;
mediump float u_xlat16_72;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21.x = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat21.x = u_xlat21.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat42.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat42.x = max(u_xlat42.x, 1.17549435e-38);
    u_xlat42.x = inversesqrt(u_xlat42.x);
    u_xlat2.xyz = u_xlat42.xxx * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat42.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat42.x = max(u_xlat42.x, 1.17549435e-38);
    u_xlat42.x = inversesqrt(u_xlat42.x);
    u_xlat4.xyz = u_xlat42.xxx * u_xlat3.xyz;
    u_xlat63 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat63) + u_xlat2.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat21.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat21.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat6.xyz = u_xlat21.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat21.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_51 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat63 = u_xlat16_64 * u_xlat16_51;
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat10.y = u_xlat21.x * u_xlat63;
    u_xlat16_72 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat16_64) + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat16_51;
    u_xlat21.x = max(u_xlat21.x, 0.00100000005);
    u_xlat10.x = u_xlat16_72 * u_xlat21.x;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_72) + 1.0;
    u_xlat67 = u_xlat21.x * u_xlat63;
    u_xlat10.z = u_xlat65 * u_xlat67;
    u_xlat65 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat65 = max(u_xlat65, 6.10351563e-05);
    u_xlat65 = u_xlat67 / u_xlat65;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat67 * u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat67 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat68 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat21.x * u_xlat68;
    u_xlat7.z = u_xlat21.x * u_xlat67;
    u_xlat21.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat21.x * u_xlat63;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat7.x;
    u_xlat16_72 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat63 * u_xlat16_72;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat21.z = u_xlat63 + u_xlat6.x;
    u_xlat21.xz = u_xlat21.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.z + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat65;
    u_xlat16_72 = u_xlat66 * u_xlat66;
    u_xlat16_72 = u_xlat66 * u_xlat16_72;
    u_xlat16_72 = u_xlat66 * u_xlat16_72;
    u_xlat16_11.x = u_xlat66 * u_xlat16_72;
    u_xlat63 = (-u_xlat16_72) * u_xlat66 + 1.0;
    u_xlat10.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat65 = dot(u_xlat16_1.xyz, vs_TEXCOORD7.xyz);
    u_xlat65 = u_xlat65 + _U_RasterCardTex;
    u_xlat10.x = u_xlat65 + vs_TEXCOORD3.z;
    u_xlat27.xy = u_xlat10.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_27.xy = texture(_RasterCardTex, u_xlat27.xy).xy;
    u_xlat16_32.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_65 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_72 = u_xlat16_65 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_13 = (-u_xlat16_10) + u_xlat16_12;
    u_xlat16_10 = vec4(u_xlat16_72) * u_xlat16_13 + u_xlat16_10;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_8.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat63) * u_xlat16_14.xyz;
    u_xlat63 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat63) * u_xlat16_11.xxx + u_xlat27.xyz;
    u_xlat27.xyz = u_xlat21.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat6.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_11.xxx * u_xlat16.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_15.yyy + u_xlat16_17.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyw);
    u_xlat21.x = dot(u_xlat4.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
    u_xlat16_72 = max(u_xlat16_15.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_11.xyw = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_30 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_63 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat63 = u_xlat16_63 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = vec3(u_xlat63) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_30 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_76 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat8.xyw * vec3(u_xlat16_76);
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat66 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_76);
    u_xlat16_76 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_15.xyz = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat63) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat66) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat21.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyw;
    u_xlat16_15.xyz = (-u_xlat3.xyz) * u_xlat42.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_15.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_30) + u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_30 = u_xlat16_38.z * u_xlat16_72 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_38.z * u_xlat16_30;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_30 = u_xlat16_72 * u_xlat16_30;
    u_xlat21.x = min(u_xlat16_30, 1.0);
    u_xlat63 = min(u_xlat21.x, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat63) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat63) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat63) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat63) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_19.y = u_xlat16_15.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_72) * u_xlat16_20.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati63 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_30 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_11.xyw;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_64>=0.0);
#else
    u_xlatb0 = u_xlat16_64>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat42.xxx + u_xlat2.xyz;
    u_xlat16_13.x = u_xlat16_51 * 8.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = abs(u_xlat16_64) * u_xlat16_13.x;
    u_xlat2.xyz = u_xlat16_13.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_13.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_13.xxx + (-u_xlat16_1.xyz);
    u_xlat0.xzw = u_xlat3.xyz * u_xlat42.xxx + (-u_xlat2.xyz);
    u_xlat0.xzw = vec3(u_xlat16_51) * u_xlat0.xzw + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat0.xzw) + u_xlat2.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_64)) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_64 = -abs(u_xlat16_64) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_9.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat2.x = dot(u_xlat16_15.xyz, u_xlat2.xyz);
    u_xlat23 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat2.x * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_13.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_38.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_76 = u_xlat16_64 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_3.x = u_xlat16_76 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_64 = u_xlat16_15.z * 15.0 + (-u_xlat16_64);
    u_xlat16_76 = (-u_xlat16_42) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_76 + u_xlat16_42;
    u_xlat16_64 = u_xlat16_72 * u_xlat16_64;
    u_xlat0.x = u_xlat23 * u_xlat16_64;
    u_xlat16_64 = u_xlat21.x * 0.5;
    u_xlat16_76 = (-u_xlat21.x) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_76 + u_xlat16_64;
    u_xlat16_76 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_14.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_14.x + u_xlat16_76;
    u_xlat16_64 = u_xlat21.x * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_64, u_xlat16_8.z);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_10.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_34.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyw = u_xlat16_34.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_34.xyz = (-u_xlat16_11.xyw) + _FogCol.xyz;
    u_xlat16_11.xyw = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_11.xyw;
    u_xlat16_34.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_34.xy = u_xlat16_34.xx * vs_TEXCOORD3.xy;
    u_xlat16_34.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_34.xy;
    u_xlat0.xy = u_xlat16_34.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb42 = u_xlat0.x>=0.5;
#endif
    u_xlat63 = u_xlatb42 ? 1.0 : float(0.0);
    u_xlat42.x = (u_xlatb42) ? 0.0 : _FlowLightFactory.y;
    u_xlat42.x = u_xlat63 * (-_FlowLightFactory.y) + u_xlat42.x;
    u_xlat2.x = u_xlat42.x * _Time.y;
    u_xlat2.y = _FlowLightFactory.z * _Time.y;
    u_xlat42.xy = fract(u_xlat2.xy);
    u_xlat0.xy = u_xlat42.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_21.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_34.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat16_55 = u_xlat16_0.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_34.xxx;
    u_xlat0.xyw = u_xlat16_32.yyy * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_53 = u_xlat16_55 * _FlowLightFactory.x;
    u_xlat16_11.xyz = vec3(u_xlat16_53) * _FlowLightColor.xyz + u_xlat16_11.xyw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_21.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_64 : u_xlat16_13.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(5) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(6) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
bool u_xlatb21;
float u_xlat23;
vec3 u_xlat27;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_30;
mediump vec2 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_38;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat63;
mediump float u_xlat16_63;
int u_xlati63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
float u_xlat66;
int u_xlati66;
bool u_xlatb66;
float u_xlat67;
float u_xlat68;
mediump float u_xlat16_72;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21.x = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat21.x = u_xlat21.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat42.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat42.x = max(u_xlat42.x, 1.17549435e-38);
    u_xlat42.x = inversesqrt(u_xlat42.x);
    u_xlat2.xyz = u_xlat42.xxx * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat42.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat42.x = max(u_xlat42.x, 1.17549435e-38);
    u_xlat42.x = inversesqrt(u_xlat42.x);
    u_xlat4.xyz = u_xlat42.xxx * u_xlat3.xyz;
    u_xlat63 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat63) + u_xlat2.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat21.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat21.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat6.xyz = u_xlat21.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat21.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_51 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat63 = u_xlat16_64 * u_xlat16_51;
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat63 = max(u_xlat63, 0.00100000005);
    u_xlat10.y = u_xlat21.x * u_xlat63;
    u_xlat16_72 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat16_64) + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat16_51;
    u_xlat21.x = max(u_xlat21.x, 0.00100000005);
    u_xlat10.x = u_xlat16_72 * u_xlat21.x;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_72) + 1.0;
    u_xlat67 = u_xlat21.x * u_xlat63;
    u_xlat10.z = u_xlat65 * u_xlat67;
    u_xlat65 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat65 = max(u_xlat65, 6.10351563e-05);
    u_xlat65 = u_xlat67 / u_xlat65;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat67 * u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat67 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat68 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat21.x * u_xlat68;
    u_xlat7.z = u_xlat21.x * u_xlat67;
    u_xlat21.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat21.x * u_xlat63;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat7.x;
    u_xlat16_72 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat63 * u_xlat16_72;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat21.z = u_xlat63 + u_xlat6.x;
    u_xlat21.xz = u_xlat21.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.z + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat65;
    u_xlat16_72 = u_xlat66 * u_xlat66;
    u_xlat16_72 = u_xlat66 * u_xlat16_72;
    u_xlat16_72 = u_xlat66 * u_xlat16_72;
    u_xlat16_11.x = u_xlat66 * u_xlat16_72;
    u_xlat63 = (-u_xlat16_72) * u_xlat66 + 1.0;
    u_xlat10.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat65 = dot(u_xlat16_1.xyz, vs_TEXCOORD7.xyz);
    u_xlat65 = u_xlat65 + _U_RasterCardTex;
    u_xlat10.x = u_xlat65 + vs_TEXCOORD3.z;
    u_xlat27.xy = u_xlat10.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_27.xy = texture(_RasterCardTex, u_xlat27.xy).xy;
    u_xlat16_32.xy = u_xlat16_27.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_65 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_72 = u_xlat16_65 * u_xlat16_32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_13 = (-u_xlat16_10) + u_xlat16_12;
    u_xlat16_10 = vec4(u_xlat16_72) * u_xlat16_13 + u_xlat16_10;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_8.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = vec3(u_xlat63) * u_xlat16_14.xyz;
    u_xlat63 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat27.xyz = vec3(u_xlat63) * u_xlat16_11.xxx + u_xlat27.xyz;
    u_xlat27.xyz = u_xlat21.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat6.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_11.xxx * u_xlat16.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_15.yyy + u_xlat16_17.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_11.xyw);
    u_xlat21.x = dot(u_xlat4.xyz, u_xlat16_11.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
    u_xlat16_72 = max(u_xlat16_15.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_11.xyw = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_30 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat16_13.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_63 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat63 = u_xlat16_63 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = vec3(u_xlat63) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_30 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_76 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat8.xyw * vec3(u_xlat16_76);
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat66 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_30 = max(u_xlat16_30, u_xlat16_76);
    u_xlat16_76 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_72;
    u_xlat16_15.xyz = vec3(u_xlat16_30) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat63) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat66) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * u_xlat21.xxx + u_xlat16_15.xyz;
    u_xlat16_11.xyw = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyw;
    u_xlat16_15.xyz = (-u_xlat3.xyz) * u_xlat42.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat4.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_15.xyz;
    u_xlat16_30 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_30) + u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_30 = u_xlat16_38.z * u_xlat16_72 + u_xlat16_30;
    u_xlat16_30 = u_xlat16_38.z * u_xlat16_30;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_30 = u_xlat16_72 * u_xlat16_30;
    u_xlat21.x = min(u_xlat16_30, 1.0);
    u_xlat63 = min(u_xlat21.x, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat63) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat63) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat63) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat63) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat63) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_19.y = u_xlat16_15.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_72) * u_xlat16_20.xyz;
    u_xlati63 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati63].xyz;
    u_xlati63 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_30 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_11.xyw;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_64>=0.0);
#else
    u_xlatb0 = u_xlat16_64>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * u_xlat42.xxx + u_xlat2.xyz;
    u_xlat16_13.x = u_xlat16_51 * 8.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = max(u_xlat16_51, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = abs(u_xlat16_64) * u_xlat16_13.x;
    u_xlat2.xyz = u_xlat16_13.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_13.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_13.xxx + (-u_xlat16_1.xyz);
    u_xlat0.xzw = u_xlat3.xyz * u_xlat42.xxx + (-u_xlat2.xyz);
    u_xlat0.xzw = vec3(u_xlat16_51) * u_xlat0.xzw + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat0.xzw) + u_xlat2.xyz;
    u_xlat0.xzw = abs(vec3(u_xlat16_64)) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_64 = -abs(u_xlat16_64) * 0.800000012 + 1.0;
    u_xlat16_64 = u_xlat16_9.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_64);
    u_xlat2.x = dot(u_xlat16_15.xyz, u_xlat2.xyz);
    u_xlat23 = dot(u_xlat16_15.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat2.x * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_13.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat0.xzw, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_30) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_38.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_3.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_76 = u_xlat16_64 + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_3.x = u_xlat16_76 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_64 = u_xlat16_15.z * 15.0 + (-u_xlat16_64);
    u_xlat16_76 = (-u_xlat16_42) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_76 + u_xlat16_42;
    u_xlat16_64 = u_xlat16_72 * u_xlat16_64;
    u_xlat0.x = u_xlat23 * u_xlat16_64;
    u_xlat16_64 = u_xlat21.x * 0.5;
    u_xlat16_76 = (-u_xlat21.x) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_76 + u_xlat16_64;
    u_xlat16_76 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_14.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_14.x + u_xlat16_76;
    u_xlat16_64 = u_xlat21.x * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_64, u_xlat16_8.z);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyw = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_10.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_34.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyw = u_xlat16_34.xyz * u_xlat16_14.xyz + u_xlat16_11.xyw;
    u_xlat16_34.xyz = (-u_xlat16_11.xyw) + _FogCol.xyz;
    u_xlat16_11.xyw = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_11.xyw;
    u_xlat16_34.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_34.xy = u_xlat16_34.xx * vs_TEXCOORD3.xy;
    u_xlat16_34.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_34.xy;
    u_xlat0.xy = u_xlat16_34.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb42 = u_xlat0.x>=0.5;
#endif
    u_xlat63 = u_xlatb42 ? 1.0 : float(0.0);
    u_xlat42.x = (u_xlatb42) ? 0.0 : _FlowLightFactory.y;
    u_xlat42.x = u_xlat63 * (-_FlowLightFactory.y) + u_xlat42.x;
    u_xlat2.x = u_xlat42.x * _Time.y;
    u_xlat2.y = _FlowLightFactory.z * _Time.y;
    u_xlat42.xy = fract(u_xlat2.xy);
    u_xlat0.xy = u_xlat42.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_21.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_34.x = u_xlat16_65 * u_xlat16_21.x;
    u_xlat16_55 = u_xlat16_0.x * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat16_34.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_34.xxx;
    u_xlat0.xyw = u_xlat16_32.yyy * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_53 = u_xlat16_55 * _FlowLightFactory.x;
    u_xlat16_11.xyz = vec3(u_xlat16_53) * _FlowLightColor.xyz + u_xlat16_11.xyw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_21.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_64 : u_xlat16_13.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat26;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
float u_xlat44;
bool u_xlatb44;
float u_xlat48;
mediump vec2 u_xlat16_51;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_77;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat22 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_3 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat4.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_73);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat66 = u_xlat66 + _U_RasterCardTex;
    u_xlat4.x = u_xlat66 + vs_TEXCOORD3.z;
    u_xlat4.xy = u_xlat4.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_4.xy = texture(_RasterCardTex, u_xlat4.xy).xy;
    u_xlat16_12.xy = u_xlat16_4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_66 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_73 = u_xlat16_66 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_1 = vec4(u_xlat16_73) * u_xlat16_3 + u_xlat16_1;
    u_xlat16_12.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_1.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_1.xyz * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat68) * u_xlat16_15.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat68) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5<_anisoUse2U);
#else
    u_xlatb22 = 0.5<_anisoUse2U;
#endif
    u_xlat10.xy = (bool(u_xlatb22)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat10.xy = u_xlat10.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_22.x = texture(_anisotropicMap, u_xlat10.xy).x;
    u_xlat22 = u_xlat16_22.x * 2.0 + -1.0;
    u_xlat22 = u_xlat22 * _sunShift + _sunShiftOffset;
    u_xlat22 = u_xlat22 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat70) + u_xlat8.xyz;
    u_xlat70 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat8.xyz = vec3(u_xlat70) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat68) * u_xlat10.xyz;
    u_xlat18.xyz = vec3(u_xlat22) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat68 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat18.xyz = vec3(u_xlat68) * u_xlat18.xyz;
    u_xlat68 = dot(u_xlat18.xyz, u_xlat16_11.xyz);
    u_xlat16_73 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_73 + -1.0;
    u_xlat70 = (-u_xlat16_77) + 1.0;
    u_xlat16_15.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_79 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat70 = u_xlat70 * u_xlat16_79;
    u_xlat70 = max(u_xlat70, 0.00100000005);
    u_xlat19.z = u_xlat68 * u_xlat70;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat16_11.xyz);
    u_xlat72 = u_xlat16_73 * u_xlat16_79;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat19.y = u_xlat68 * u_xlat72;
    u_xlat19.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat19.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat74 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat70 * u_xlat74;
    u_xlat16_73 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat72 * u_xlat16_73;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat4.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat26.x + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat26.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat5.xyz = u_xlat26.xxx * u_xlat5.xyz;
    u_xlat26.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat18.y = u_xlat26.x * u_xlat72;
    u_xlat26.x = u_xlat70 * u_xlat72;
    u_xlat16_73 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat18.x = u_xlat70 * u_xlat16_73;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_73 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_73) + 1.0;
    u_xlat18.z = u_xlat48 * u_xlat26.x;
    u_xlat48 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat48 = max(u_xlat48, 6.10351563e-05);
    u_xlat48 = u_xlat26.x / u_xlat48;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat26.x = u_xlat26.x * u_xlat48;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat68 = u_xlat68 * u_xlat26.x;
    u_xlat16_73 = u_xlat70 * u_xlat70;
    u_xlat16_73 = u_xlat70 * u_xlat16_73;
    u_xlat16_73 = u_xlat70 * u_xlat16_73;
    u_xlat16_80 = u_xlat70 * u_xlat16_73;
    u_xlat26.x = (-u_xlat16_73) * u_xlat70 + 1.0;
    u_xlat16_12.xzw = u_xlat16_15.yyy * u_xlat16_12.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat26.xxx * u_xlat16_12.xzw;
    u_xlat5.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat68) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat26.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_37.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_37.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_37.xyz + u_xlat9.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat16_37.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_37.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_73) + u_xlat16_80;
    u_xlat16_16.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_80 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_73;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_80;
    u_xlat0.xz = min(u_xlat0.xz, vec2(u_xlat16_73));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_37.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_37.xz);
    u_xlat16_20.y = u_xlat16_37.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati68 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_14.xyz;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat8.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = u_xlat8.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat5.xyz;
    u_xlat16_14.x = u_xlat16_79 * 8.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_77) * u_xlat16_14.x;
    u_xlat5.xyz = u_xlat16_14.xxx * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_14.x = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_14.xxx + (-u_xlat16_11.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_79) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_77)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_15.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat0.x = dot(u_xlat16_37.xyz, u_xlat5.xyz);
    u_xlat22 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat0.x * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_79;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_14.xyz;
    u_xlat19.y = u_xlat16_15.x;
    u_xlat16_38.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_12.xzw = u_xlat16_14.xyz * u_xlat16_12.xzw;
    u_xlat16_5.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_5.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_5.x = u_xlat16_77 * 16.0 + u_xlat16_5.z;
    u_xlat16_14.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_5.x = u_xlat16_73 * 16.0 + u_xlat16_5.z;
    u_xlat16_14.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_68 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_73 = u_xlat16_15.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = u_xlat16_0.x + (-u_xlat16_68);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_68;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat22 * u_xlat16_73;
    u_xlat16_73 = u_xlat0.z * 0.5;
    u_xlat16_77 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_79 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_79 + u_xlat16_77;
    u_xlat16_73 = u_xlat0.z * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_12.xzw = vec3(u_xlat16_73) * u_xlat16_12.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_12.xzw;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xzw) + _FogCol.xyz;
    u_xlat16_12.xzw = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xzw;
    u_xlat16_51.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_51.xy = u_xlat16_51.xx * vs_TEXCOORD3.xy;
    u_xlat16_51.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_51.xy;
    u_xlat0.xy = u_xlat16_51.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb44 = u_xlat0.x>=0.5;
#endif
    u_xlat68 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat44 = (u_xlatb44) ? 0.0 : _FlowLightFactory.y;
    u_xlat44 = u_xlat68 * (-_FlowLightFactory.y) + u_xlat44;
    u_xlat4.x = u_xlat44 * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_22.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_51.x = u_xlat16_66 * u_xlat16_22.x;
    u_xlat16_73 = u_xlat16_0.x * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_51.xxx;
    u_xlat0.xyw = u_xlat16_12.yyy * u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_51.x = u_xlat16_73 * _FlowLightFactory.x;
    u_xlat16_12.xyz = u_xlat16_51.xxx * _FlowLightColor.xyz + u_xlat16_12.xzw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_12.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_11.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_51.x = max(_fresnelRange, 0.0);
    u_xlat16_51.x = u_xlat2.x * u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_51.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_22.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_29;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
out mediump vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    vs_TEXCOORD7.w = 0.0;
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
uniform 	vec4 _RasterCardTex_ST;
uniform 	mediump float _outlineIntensity;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _U_RasterCardTex;
uniform 	mediump float _V_RasterCardTex;
uniform 	mediump vec4 _fresnelColor;
uniform 	mediump float _fresnelRange;
uniform 	mediump float _fresnelPow;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap2;
UNITY_LOCATION(7) uniform mediump sampler2D _RasterCardTex;
UNITY_LOCATION(8) uniform mediump sampler2D _outlineMask;
UNITY_LOCATION(9) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(10) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(11) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat26;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
float u_xlat44;
bool u_xlatb44;
float u_xlat48;
mediump vec2 u_xlat16_51;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat68;
mediump float u_xlat16_68;
int u_xlati68;
bool u_xlatb68;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_77;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat22 = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_3 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat4.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xyz = u_xlat5.xyz * vec3(u_xlat16_73);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat16_11.xyz, vs_TEXCOORD7.xyz);
    u_xlat66 = u_xlat66 + _U_RasterCardTex;
    u_xlat4.x = u_xlat66 + vs_TEXCOORD3.z;
    u_xlat4.xy = u_xlat4.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_4.xy = texture(_RasterCardTex, u_xlat4.xy).xy;
    u_xlat16_12.xy = u_xlat16_4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_66 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_73 = u_xlat16_66 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_1 = vec4(u_xlat16_73) * u_xlat16_3 + u_xlat16_1;
    u_xlat16_12.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_1.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_1.xyz * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat68) * u_xlat16_15.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_16.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat68 = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_79);
    u_xlat16_79 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_16.x, u_xlat16_77);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = vec3(u_xlat22) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat68) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5<_anisoUse2U);
#else
    u_xlatb22 = 0.5<_anisoUse2U;
#endif
    u_xlat10.xy = (bool(u_xlatb22)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat10.xy = u_xlat10.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_22.x = texture(_anisotropicMap, u_xlat10.xy).x;
    u_xlat22 = u_xlat16_22.x * 2.0 + -1.0;
    u_xlat22 = u_xlat22 * _sunShift + _sunShiftOffset;
    u_xlat22 = u_xlat22 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat70 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat70) + u_xlat8.xyz;
    u_xlat70 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat8.xyz = vec3(u_xlat70) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat68) * u_xlat10.xyz;
    u_xlat18.xyz = vec3(u_xlat22) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat68 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat18.xyz = vec3(u_xlat68) * u_xlat18.xyz;
    u_xlat68 = dot(u_xlat18.xyz, u_xlat16_11.xyz);
    u_xlat16_73 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_77 = u_xlat16_73 + -1.0;
    u_xlat70 = (-u_xlat16_77) + 1.0;
    u_xlat16_15.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_79 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat70 = u_xlat70 * u_xlat16_79;
    u_xlat70 = max(u_xlat70, 0.00100000005);
    u_xlat19.z = u_xlat68 * u_xlat70;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat16_11.xyz);
    u_xlat72 = u_xlat16_73 * u_xlat16_79;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat19.y = u_xlat68 * u_xlat72;
    u_xlat19.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat19.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat74 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat70 * u_xlat74;
    u_xlat16_73 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat72 * u_xlat16_73;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat4.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat26.x + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat26.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat5.xyz = u_xlat26.xxx * u_xlat5.xyz;
    u_xlat26.x = dot(u_xlat18.xyz, u_xlat5.xyz);
    u_xlat18.y = u_xlat26.x * u_xlat72;
    u_xlat26.x = u_xlat70 * u_xlat72;
    u_xlat16_73 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat18.x = u_xlat70 * u_xlat16_73;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_73 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_73) + 1.0;
    u_xlat18.z = u_xlat48 * u_xlat26.x;
    u_xlat48 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat48 = max(u_xlat48, 6.10351563e-05);
    u_xlat48 = u_xlat26.x / u_xlat48;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat26.x = u_xlat26.x * u_xlat48;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat68 = u_xlat68 * u_xlat26.x;
    u_xlat16_73 = u_xlat70 * u_xlat70;
    u_xlat16_73 = u_xlat70 * u_xlat16_73;
    u_xlat16_73 = u_xlat70 * u_xlat16_73;
    u_xlat16_80 = u_xlat70 * u_xlat16_73;
    u_xlat26.x = (-u_xlat16_73) * u_xlat70 + 1.0;
    u_xlat16_12.xzw = u_xlat16_15.yyy * u_xlat16_12.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat26.xxx * u_xlat16_12.xzw;
    u_xlat5.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat68) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat26.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_37.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_37.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_37.xyz + u_xlat9.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat16_37.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_37.xyz;
    u_xlat16_73 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_73) + u_xlat16_80;
    u_xlat16_16.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_80 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_38.z * u_xlat16_73;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_80;
    u_xlat0.xz = min(u_xlat0.xz, vec2(u_xlat16_73));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_37.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_37.xz);
    u_xlat16_20.y = u_xlat16_37.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati68 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati68].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_14.xyz;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat16_14.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_77>=0.0);
#else
    u_xlatb0 = u_xlat16_77>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat8.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = u_xlat8.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat5.xyz;
    u_xlat16_14.x = u_xlat16_79 * 8.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = max(u_xlat16_79, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_77) * u_xlat16_14.x;
    u_xlat5.xyz = u_xlat16_14.xxx * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_14.x = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_14.xxx + (-u_xlat16_11.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_79) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_77)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_77 = -abs(u_xlat16_77) * 0.800000012 + 1.0;
    u_xlat16_77 = u_xlat16_15.x * u_xlat16_77;
    u_xlat16_77 = u_xlat16_77 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_77);
    u_xlat0.x = dot(u_xlat16_37.xyz, u_xlat5.xyz);
    u_xlat22 = dot(u_xlat16_37.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_38.y = u_xlat0.x * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_79;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_73) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_14.xyz;
    u_xlat19.y = u_xlat16_15.x;
    u_xlat16_38.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_12.xzw = u_xlat16_14.xyz * u_xlat16_12.xzw;
    u_xlat16_5.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_5.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_5.x = u_xlat16_77 * 16.0 + u_xlat16_5.z;
    u_xlat16_14.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_5.x = u_xlat16_73 * 16.0 + u_xlat16_5.z;
    u_xlat16_14.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_68 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_73 = u_xlat16_15.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = u_xlat16_0.x + (-u_xlat16_68);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_68;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat22 * u_xlat16_73;
    u_xlat16_73 = u_xlat0.z * 0.5;
    u_xlat16_77 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_79 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_79 + u_xlat16_77;
    u_xlat16_73 = u_xlat0.z * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_3.z, u_xlat16_73);
    u_xlat16_12.xzw = vec3(u_xlat16_73) * u_xlat16_12.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xyz + u_xlat16_12.xzw;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat16_12.xzw) + _FogCol.xyz;
    u_xlat16_12.xzw = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_12.xzw;
    u_xlat16_51.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_51.xy = u_xlat16_51.xx * vs_TEXCOORD3.xy;
    u_xlat16_51.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_51.xy;
    u_xlat0.xy = u_xlat16_51.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(u_xlat0.x>=0.5);
#else
    u_xlatb44 = u_xlat0.x>=0.5;
#endif
    u_xlat68 = u_xlatb44 ? 1.0 : float(0.0);
    u_xlat44 = (u_xlatb44) ? 0.0 : _FlowLightFactory.y;
    u_xlat44 = u_xlat68 * (-_FlowLightFactory.y) + u_xlat44;
    u_xlat4.x = u_xlat44 * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat0.xy).x;
    u_xlat16_22.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_51.x = u_xlat16_66 * u_xlat16_22.x;
    u_xlat16_73 = u_xlat16_0.x * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_51.xxx;
    u_xlat0.xyw = u_xlat16_12.yyy * u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_51.x = u_xlat16_73 * _FlowLightFactory.x;
    u_xlat16_12.xyz = u_xlat16_51.xxx * _FlowLightColor.xyz + u_xlat16_12.xzw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_12.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_11.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_51.x = max(_fresnelRange, 0.0);
    u_xlat16_51.x = u_xlat2.x * u_xlat16_51.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51.x = min(max(u_xlat16_51.x, 0.0), 1.0);
#else
    u_xlat16_51.x = clamp(u_xlat16_51.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_51.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_22.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_29;
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
  GpuProgramID 115771
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_RasterCardGUI"
}