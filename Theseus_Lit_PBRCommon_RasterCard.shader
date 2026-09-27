//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_RasterCard" {
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

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_zwrite ("__zw", Float) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 32232
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
float u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec2 u_xlat16_28;
float u_xlat40;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
mediump float u_xlat16_46;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
mediump float u_xlat16_64;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat5.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat64 = dot(u_xlat16_23.xyz, vs_TEXCOORD7.xyz);
    u_xlat64 = u_xlat64 + _U_RasterCardTex;
    u_xlat5.x = u_xlat64 + vs_TEXCOORD3.z;
    u_xlat5.xy = u_xlat5.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_5.xy = texture(_RasterCardTex, u_xlat5.xy).xy;
    u_xlat16_6.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_64 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_62 = u_xlat16_64 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_5) + u_xlat16_7;
    u_xlat16_5 = vec4(u_xlat16_62) * u_xlat16_8 + u_xlat16_5;
    u_xlat16_6.xzw = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_5.zxy * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xzw = u_xlat16_5.zxy * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_10.xyz;
    u_xlat60 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat16_13.xyz;
    u_xlat15.xyz = u_xlat14.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat14.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat15.x;
    u_xlat12.x = u_xlat14.z;
    u_xlat16_16.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.x = u_xlat14.y;
    u_xlat14.y = u_xlat15.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat67 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat12.xyz;
    u_xlat9 = dot(u_xlat14.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat69 = (-u_xlat9) * u_xlat16_21.x + u_xlat9;
    u_xlat69 = u_xlat9 * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat71 = u_xlat15.x * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat15.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat71;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat69 * u_xlat4.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat9) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat11.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat4.xxx * u_xlat11.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat16.xyz = vec3(u_xlat44) * u_xlat16.xyz;
    u_xlat16_41.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat14.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat24 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_21.x / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat69 = (-u_xlat16_41.x) + 1.0;
    u_xlat16_41.x = u_xlat69 * u_xlat69;
    u_xlat16_41.x = u_xlat69 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat69 * u_xlat16_41.x;
    u_xlat16_61 = u_xlat69 * u_xlat16_41.x;
    u_xlat69 = (-u_xlat16_41.x) * u_xlat69 + 1.0;
    u_xlat16.xyz = u_xlat16_10.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_61) + u_xlat16.xyz;
    u_xlat69 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat69) * u_xlat16_21.x + u_xlat69;
    u_xlat72 = u_xlat69 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat69 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat71 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat44 = u_xlat44 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_41.x = max(u_xlat16_41.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = float(1.0) / float(u_xlat16_41.x);
    u_xlat16_41.x = inversesqrt(u_xlat16_41.x);
    u_xlat16_17.xyz = u_xlat16_41.xxx * u_xlat11.xyz;
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41.x = max(u_xlat16_41.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_41.x;
    u_xlat16_18.xyz = u_xlat16_41.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat44 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_21.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20.x = dot(u_xlat14.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat40 * u_xlat16_1.x;
    u_xlat40 = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(u_xlat40);
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat11.xyz;
    u_xlat40 = (-u_xlat20.x) * u_xlat16_21.x + u_xlat20.x;
    u_xlat40 = u_xlat20.x * u_xlat40 + u_xlat16_21.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat71;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat20.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_18.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_13.xyz;
    u_xlat16_62 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xzw = vec3(u_xlat16_62) * u_xlat16_6.xzw;
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_6.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat4.xxx * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat9) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_6.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat12.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat16_62 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
    u_xlat16_62 = dot(u_xlat16_13.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_62) + u_xlat16_3.x;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_3.x + u_xlat16_62;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_62;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_62, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_17.xyz = u_xlat16_6.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_6.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_18.y = u_xlat16_13.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = u_xlat16_3.xxx * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_62 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_6.x = dot((-u_xlat16_23.xyz), u_xlat14.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat20.xyz = (-u_xlat14.xyz) * u_xlat16_6.xxx + (-u_xlat16_23.xyz);
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat20.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_6.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_11.w);
    u_xlat16_46 = u_xlat16_6.x + 1.0;
    u_xlat16_46 = min(u_xlat16_46, 15.0);
    u_xlat16_11.x = u_xlat16_46 * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_11.x = u_xlat16_6.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_6.x = u_xlat16_6.w * 15.0 + (-u_xlat16_6.x);
    u_xlat16_46 = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_46 + u_xlat16_44;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_6.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_6.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_6.x + u_xlat16_3.x;
    u_xlat16_6.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_46 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_46 + u_xlat16_6.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_9.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat67) + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_6.xzw = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xxx * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.zwx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xzw = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    u_xlat16_41.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_41.xy = u_xlat16_41.xx * vs_TEXCOORD3.xy;
    u_xlat16_41.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_41.x>=0.5);
#else
    u_xlatb60 = u_xlat16_41.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb60) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_6.x = (u_xlatb60) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_6.x;
    u_xlat4.x = u_xlat16_3.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat16_41.xy + u_xlat4.xy;
    u_xlat16_41.xy = u_xlat4.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_60 = texture(_FlowLightMap, u_xlat16_41.xy).x;
    u_xlat16_4.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_41.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_41.xxx * u_xlat16_7.xyz;
    u_xlat4.xzw = u_xlat16_6.xzw * u_xlat16_6.yyy;
    u_xlat4.xzw = u_xlat4.xzw * vec3(_outlineIntensity);
    u_xlat16_41.x = u_xlat16_61 * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_41.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xzw * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat60 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xzw = vec3(u_xlat60) * u_xlat14.xyz;
    u_xlat60 = dot(u_xlat4.xzw, u_xlat16_23.xyz);
    u_xlat60 = max(u_xlat60, 0.0);
    u_xlat60 = (-u_xlat60) + 1.0;
    u_xlat60 = max(u_xlat60, 0.0);
    u_xlat60 = log2(u_xlat60);
    u_xlat60 = u_xlat60 * _fresnelPow;
    u_xlat60 = exp2(u_xlat60);
    u_xlat60 = u_xlat60 * _fresnelPow;
    u_xlat16_41.x = max(_fresnelRange, 0.0);
    u_xlat16_41.x = u_xlat60 * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_41.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy + u_xlat0.xyz;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
float u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
ivec3 u_xlati20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec2 u_xlat16_28;
float u_xlat40;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
mediump float u_xlat16_46;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
mediump float u_xlat16_64;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat5.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_23.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat64 = dot(u_xlat16_23.xyz, vs_TEXCOORD7.xyz);
    u_xlat64 = u_xlat64 + _U_RasterCardTex;
    u_xlat5.x = u_xlat64 + vs_TEXCOORD3.z;
    u_xlat5.xy = u_xlat5.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_5.xy = texture(_RasterCardTex, u_xlat5.xy).xy;
    u_xlat16_6.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_64 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_62 = u_xlat16_64 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_5) + u_xlat16_7;
    u_xlat16_5 = vec4(u_xlat16_62) * u_xlat16_8 + u_xlat16_5;
    u_xlat16_6.xzw = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_5.zxy * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xzw = u_xlat16_5.zxy * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_10.xyz;
    u_xlat60 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat16_13.xyz;
    u_xlat15.xyz = u_xlat14.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat14.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat15.x;
    u_xlat12.x = u_xlat14.z;
    u_xlat16_16.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.x = u_xlat14.y;
    u_xlat14.y = u_xlat15.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat67 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat12.xyz;
    u_xlat9 = dot(u_xlat14.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat69 = (-u_xlat9) * u_xlat16_21.x + u_xlat9;
    u_xlat69 = u_xlat9 * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat15.x) * u_xlat16_21.x + u_xlat15.x;
    u_xlat71 = u_xlat15.x * u_xlat71 + u_xlat16_21.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat15.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat71;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat69 * u_xlat4.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat9) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat11.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat4.xxx * u_xlat11.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat16.xyz = vec3(u_xlat44) * u_xlat16.xyz;
    u_xlat16_41.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat14.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat24 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_21.x / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat69 = (-u_xlat16_41.x) + 1.0;
    u_xlat16_41.x = u_xlat69 * u_xlat69;
    u_xlat16_41.x = u_xlat69 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat69 * u_xlat16_41.x;
    u_xlat16_61 = u_xlat69 * u_xlat16_41.x;
    u_xlat69 = (-u_xlat16_41.x) * u_xlat69 + 1.0;
    u_xlat16.xyz = u_xlat16_10.xyz * vec3(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat60) * vec3(u_xlat16_61) + u_xlat16.xyz;
    u_xlat69 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat69) * u_xlat16_21.x + u_xlat69;
    u_xlat72 = u_xlat69 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat69 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat71 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat44 = u_xlat44 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_41.x = max(u_xlat16_41.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = float(1.0) / float(u_xlat16_41.x);
    u_xlat16_41.x = inversesqrt(u_xlat16_41.x);
    u_xlat16_17.xyz = u_xlat16_41.xxx * u_xlat11.xyz;
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_18.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41.x = max(u_xlat16_41.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_41.x = u_xlat16_61 * u_xlat16_41.x;
    u_xlat16_18.xyz = u_xlat16_41.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat44 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_21.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20.x = dot(u_xlat14.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_41.x = u_xlat40 * u_xlat16_1.x;
    u_xlat40 = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(u_xlat40);
    u_xlat11.xyz = vec3(u_xlat60) * u_xlat16_41.xxx + u_xlat11.xyz;
    u_xlat40 = (-u_xlat20.x) * u_xlat16_21.x + u_xlat20.x;
    u_xlat40 = u_xlat20.x * u_xlat40 + u_xlat16_21.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat71;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat20.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_18.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_13.xyz;
    u_xlat16_62 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xzw = vec3(u_xlat16_62) * u_xlat16_6.xzw;
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_6.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat4.xxx * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat9) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_6.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat69) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat12.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat16_62 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
    u_xlat16_62 = dot(u_xlat16_13.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_62) + u_xlat16_3.x;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_3.x + u_xlat16_62;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_62;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_62, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_17.xyz = u_xlat16_6.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_6.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_18.y = u_xlat16_13.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = u_xlat16_3.xxx * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_62 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_6.x = dot((-u_xlat16_23.xyz), u_xlat14.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat20.xyz = (-u_xlat14.xyz) * u_xlat16_6.xxx + (-u_xlat16_23.xyz);
    u_xlat16_8.z = dot(u_xlat16_13.xyz, u_xlat20.xyz);
    u_xlat4.x = dot(u_xlat16_13.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_6.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_11.w);
    u_xlat16_46 = u_xlat16_6.x + 1.0;
    u_xlat16_46 = min(u_xlat16_46, 15.0);
    u_xlat16_11.x = u_xlat16_46 * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_11.x = u_xlat16_6.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_6.x = u_xlat16_6.w * 15.0 + (-u_xlat16_6.x);
    u_xlat16_46 = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_46 + u_xlat16_44;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_6.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_6.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_6.x + u_xlat16_3.x;
    u_xlat16_6.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_46 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_46 + u_xlat16_6.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_9.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat67) + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat16_21.xxx * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_6.xzw = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_21.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xxx * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.zwx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xzw = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    u_xlat16_41.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_41.xy = u_xlat16_41.xx * vs_TEXCOORD3.xy;
    u_xlat16_41.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_41.x>=0.5);
#else
    u_xlatb60 = u_xlat16_41.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb60) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_6.x = (u_xlatb60) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_6.x;
    u_xlat4.x = u_xlat16_3.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat16_41.xy + u_xlat4.xy;
    u_xlat16_41.xy = u_xlat4.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_60 = texture(_FlowLightMap, u_xlat16_41.xy).x;
    u_xlat16_4.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_41.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_41.xxx * u_xlat16_7.xyz;
    u_xlat4.xzw = u_xlat16_6.xzw * u_xlat16_6.yyy;
    u_xlat4.xzw = u_xlat4.xzw * vec3(_outlineIntensity);
    u_xlat16_41.x = u_xlat16_61 * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_41.xxx * _FlowLightColor.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xzw * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat60 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xzw = vec3(u_xlat60) * u_xlat14.xyz;
    u_xlat60 = dot(u_xlat4.xzw, u_xlat16_23.xyz);
    u_xlat60 = max(u_xlat60, 0.0);
    u_xlat60 = (-u_xlat60) + 1.0;
    u_xlat60 = max(u_xlat60, 0.0);
    u_xlat60 = log2(u_xlat60);
    u_xlat60 = u_xlat60 * _fresnelPow;
    u_xlat60 = exp2(u_xlat60);
    u_xlat60 = u_xlat60 * _fresnelPow;
    u_xlat16_41.x = max(_fresnelRange, 0.0);
    u_xlat16_41.x = u_xlat60 * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_41.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy + u_xlat0.xyz;
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
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
float u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
vec2 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_32;
vec2 u_xlat44;
mediump float u_xlat16_48;
mediump float u_xlat16_53;
float u_xlat57;
float u_xlat63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
float u_xlat68;
mediump float u_xlat16_69;
float u_xlat70;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat78;
float u_xlat79;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat21 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat21 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_31 = float(1.0) / float(u_xlat16_69);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = u_xlat16_10.x * u_xlat16_31;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb63 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb63)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb63 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb63) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_69) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat16_73 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat2.x = (-u_xlat16_73) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_31 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat3.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_10.xzw = u_xlat1.xyz * vec3(u_xlat16_69);
    u_xlat23.x = dot(u_xlat16_10.xzw, vs_TEXCOORD7.xyz);
    u_xlat23.x = u_xlat23.x + _U_RasterCardTex;
    u_xlat3.x = u_xlat23.x + vs_TEXCOORD3.z;
    u_xlat23.xy = u_xlat3.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_23.xy = texture(_RasterCardTex, u_xlat23.xy).xy;
    u_xlat16_12.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_23.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_74 = u_xlat16_23.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_4 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_3) + u_xlat16_4;
    u_xlat16_3 = vec4(u_xlat16_74) * u_xlat16_8 + u_xlat16_3;
    u_xlat16_12.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_3.zxy * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_3.zxy * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat67 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat2.xzw = vec3(u_xlat67) * vec3(u_xlat16_31) + u_xlat2.xzw;
    u_xlat16_31 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_31 = max(u_xlat16_31, 0.0078125);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_31, 0.0078125);
    u_xlat70 = (-u_xlat63) * u_xlat16_31 + u_xlat63;
    u_xlat70 = u_xlat63 * u_xlat70 + u_xlat16_31;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat63 + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat15.x) * u_xlat16_31 + u_xlat15.x;
    u_xlat57 = u_xlat15.x * u_xlat57 + u_xlat16_31;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat15.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat70 = u_xlat70 * u_xlat57;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat78 = u_xlat16_31 + -1.0;
    u_xlat16.x = u_xlat64 * u_xlat78 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_31 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.318309873;
    u_xlat16.x = min(u_xlat16.x, 16.0);
    u_xlat70 = u_xlat70 * u_xlat16.x;
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = vec3(u_xlat63) * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_11.xyz * u_xlat2.xzw;
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat2.xzw;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat70 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat78 + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_31 / u_xlat70;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16.x = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat16.x * u_xlat16.x;
    u_xlat16_74 = u_xlat16.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16.x * u_xlat16_74;
    u_xlat16_76 = u_xlat16.x * u_xlat16_74;
    u_xlat16.x = (-u_xlat16_74) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat67) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat79 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat79) * u_xlat16_31 + u_xlat79;
    u_xlat17 = u_xlat79 * u_xlat17 + u_xlat16_31;
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = u_xlat79 + u_xlat17;
    u_xlat17 = u_xlat17 + 6.10351563e-05;
    u_xlat17 = u_xlat57 * u_xlat17;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat70 = u_xlat70 * u_xlat17;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_74);
    u_xlat16_74 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat1.xyz * vec3(u_xlat16_69) + u_xlat16_18.xyz;
    u_xlat70 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat70);
    u_xlat16_69 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat78 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat44.x = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44.x = min(max(u_xlat44.x, 0.0), 1.0);
#else
    u_xlat44.x = clamp(u_xlat44.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat65 * u_xlat65;
    u_xlat16_69 = u_xlat65 * u_xlat16_69;
    u_xlat16_69 = u_xlat65 * u_xlat16_69;
    u_xlat16_74 = u_xlat65 * u_xlat16_69;
    u_xlat65 = (-u_xlat16_69) * u_xlat65 + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * vec3(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat67) * vec3(u_xlat16_74) + u_xlat16.xyz;
    u_xlat65 = (-u_xlat44.x) * u_xlat16_31 + u_xlat44.x;
    u_xlat65 = u_xlat44.x * u_xlat65 + u_xlat16_31;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat44.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat57;
    u_xlat2.w = float(1.0) / u_xlat65;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat44.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_19.xyz * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * vec3(u_xlat21) + u_xlat16_14.xyz;
    u_xlat16_69 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xzw = vec3(u_xlat16_69) * u_xlat16_12.xzw;
    u_xlat16_18.xyz = u_xlat16_12.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat21) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat79) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat21) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat44.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_69 = u_xlat16_9.w * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_9.w * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat2.xz = min(u_xlat0.xz, vec2(u_xlat16_69));
    u_xlat2.x = min(u_xlat2.x, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat2.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlati2 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati65 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati2].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_20.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xzw * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_10.xzw), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xzw);
    u_xlat16_9.z = dot(u_xlat16_11.xyz, u_xlat16.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_0.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_0.x = u_xlat16_11.x * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = u_xlat16_65 + (-u_xlat16_67);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_67;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat2.z * 0.5;
    u_xlat16_32.x = (-u_xlat2.z) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat2.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat2.z * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_11.x);
    u_xlat2.xzw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat16.xyz);
    u_xlat2.xzw = vec3(u_xlat16_31) * u_xlat2.xzw + u_xlat16.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xw);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xw);
    u_xlat18.y = u_xlat2.z;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_31 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat15.y = u_xlat16_9.x;
    u_xlat16_2.xz = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.zzz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_31);
    u_xlat16_12.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat2.xzw = u_xlat16_12.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xzw = u_xlat2.xzw * u_xlat2.xzw;
    u_xlat16_12.xzw = u_xlat16_12.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_69) * u_xlat16_12.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xzw = (bool(u_xlatb2)) ? u_xlat16_13.xyz : u_xlat16_12.xzw;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_12.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xzw = min(max(u_xlat16_12.xzw, 0.0), 1.0);
#else
    u_xlat16_12.xzw = clamp(u_xlat16_12.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_12.zwx + u_xlat16_14.yzx;
    u_xlat16_69 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_3.w * _albedoColor.w + u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_2.xzw = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.wxz * _emissiveColor.zxy;
    u_xlat16_12.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_11.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat2.xzw = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xzw = max(u_xlat2.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat2.xzw = log2(u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xzw * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xw * vec2(15.0, 0.9375);
    u_xlat67 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.zw * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat67);
    u_xlat0.x = u_xlat67 * 0.0625 + u_xlat0.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat44.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat44.xy, 0.0).xyz;
    u_xlat15.xyz = (-u_xlat16_5.xyz) + u_xlat16_15.xyz;
    u_xlat2.xzw = u_xlat2.xxx * u_xlat15.xyz + u_xlat16_5.xyz;
    u_xlat16_6.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_6.xy = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat16_6.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat16_6.x>=0.5);
#else
    u_xlatb67 = u_xlat16_6.x>=0.5;
#endif
    u_xlat16_48 = (u_xlatb67) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_11.x = (u_xlatb67) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_48 = u_xlat16_48 + u_xlat16_11.x;
    u_xlat5.x = u_xlat16_48 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_67 = texture(_FlowLightMap, u_xlat16_6.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_5.x;
    u_xlat16_27 = u_xlat16_67 * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_outlineIntensity);
    u_xlat16_6.x = u_xlat16_27 * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _FlowLightColor.xyz + u_xlat2.xzw;
    u_xlat2.xyz = u_xlat4.xyz * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat65 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat7.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat16_10.xzw);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = (-u_xlat65) + 1.0;
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = log2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat65 = exp2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat16_6.x = max(_fresnelRange, 0.0);
    u_xlat16_6.x = u_xlat65 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_69 : u_xlat16_31;
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
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
float u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
vec2 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_32;
vec2 u_xlat44;
mediump float u_xlat16_48;
mediump float u_xlat16_53;
float u_xlat57;
float u_xlat63;
bool u_xlatb63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
float u_xlat68;
mediump float u_xlat16_69;
float u_xlat70;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat78;
float u_xlat79;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat21 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_21 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat21 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_31 = float(1.0) / float(u_xlat16_69);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = u_xlat16_10.x * u_xlat16_31;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb63 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb63)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb63 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb63) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_11.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_69) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat2.xyz = vec3(u_xlat63) * u_xlat2.xyz;
    u_xlat16_73 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat2.x = (-u_xlat16_73) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_31 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat3.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_10.xzw = u_xlat1.xyz * vec3(u_xlat16_69);
    u_xlat23.x = dot(u_xlat16_10.xzw, vs_TEXCOORD7.xyz);
    u_xlat23.x = u_xlat23.x + _U_RasterCardTex;
    u_xlat3.x = u_xlat23.x + vs_TEXCOORD3.z;
    u_xlat23.xy = u_xlat3.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_23.xy = texture(_RasterCardTex, u_xlat23.xy).xy;
    u_xlat16_12.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_23.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_74 = u_xlat16_23.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_4 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_3) + u_xlat16_4;
    u_xlat16_3 = vec4(u_xlat16_74) * u_xlat16_8 + u_xlat16_3;
    u_xlat16_12.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_3.zxy * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_3.zxy * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat67 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat2.xzw = vec3(u_xlat67) * vec3(u_xlat16_31) + u_xlat2.xzw;
    u_xlat16_31 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_31 = max(u_xlat16_31, 0.0078125);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = max(u_xlat16_31, 0.0078125);
    u_xlat70 = (-u_xlat63) * u_xlat16_31 + u_xlat63;
    u_xlat70 = u_xlat63 * u_xlat70 + u_xlat16_31;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat63 + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat15.x) * u_xlat16_31 + u_xlat15.x;
    u_xlat57 = u_xlat15.x * u_xlat57 + u_xlat16_31;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat15.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat70 = u_xlat70 * u_xlat57;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat78 = u_xlat16_31 + -1.0;
    u_xlat16.x = u_xlat64 * u_xlat78 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_31 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.318309873;
    u_xlat16.x = min(u_xlat16.x, 16.0);
    u_xlat70 = u_xlat70 * u_xlat16.x;
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.zxy;
    u_xlat2.xzw = vec3(u_xlat63) * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_11.xyz * u_xlat2.xzw;
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat2.xzw;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat16.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat70 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat78 + 1.0;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat16_31 / u_xlat70;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16.x = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat16.x * u_xlat16.x;
    u_xlat16_74 = u_xlat16.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16.x * u_xlat16_74;
    u_xlat16_76 = u_xlat16.x * u_xlat16_74;
    u_xlat16.x = (-u_xlat16_74) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat67) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat79 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat79) * u_xlat16_31 + u_xlat79;
    u_xlat17 = u_xlat79 * u_xlat17 + u_xlat16_31;
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = u_xlat79 + u_xlat17;
    u_xlat17 = u_xlat17 + 6.10351563e-05;
    u_xlat17 = u_xlat57 * u_xlat17;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat70 = u_xlat70 * u_xlat17;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat79) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_74);
    u_xlat16_74 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat1.xyz * vec3(u_xlat16_69) + u_xlat16_18.xyz;
    u_xlat70 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat70);
    u_xlat16_69 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat78 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat44.x = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44.x = min(max(u_xlat44.x, 0.0), 1.0);
#else
    u_xlat44.x = clamp(u_xlat44.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat65 * u_xlat65;
    u_xlat16_69 = u_xlat65 * u_xlat16_69;
    u_xlat16_69 = u_xlat65 * u_xlat16_69;
    u_xlat16_74 = u_xlat65 * u_xlat16_69;
    u_xlat65 = (-u_xlat16_69) * u_xlat65 + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * vec3(u_xlat65);
    u_xlat16.xyz = vec3(u_xlat67) * vec3(u_xlat16_74) + u_xlat16.xyz;
    u_xlat65 = (-u_xlat44.x) * u_xlat16_31 + u_xlat44.x;
    u_xlat65 = u_xlat44.x * u_xlat65 + u_xlat16_31;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat44.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat57;
    u_xlat2.w = float(1.0) / u_xlat65;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat44.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_19.xyz * u_xlat16.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * vec3(u_xlat21) + u_xlat16_14.xyz;
    u_xlat16_69 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xzw = vec3(u_xlat16_69) * u_xlat16_12.xzw;
    u_xlat16_18.xyz = u_xlat16_12.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat21) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat79) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat21) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat44.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_69 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_69 = u_xlat16_9.w * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_9.w * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat2.xz = min(u_xlat0.xz, vec2(u_xlat16_69));
    u_xlat2.x = min(u_xlat2.x, u_xlat16_8.z);
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat2.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_19.y = u_xlat16_11.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlati2 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati65 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati2].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_20.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xzw * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_10.xzw), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xzw);
    u_xlat16_9.z = dot(u_xlat16_11.xyz, u_xlat16.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_0.w);
    u_xlat16_32.x = u_xlat16_11.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_0.x = u_xlat16_11.x * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_32.x = u_xlat16_65 + (-u_xlat16_67);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_32.x + u_xlat16_67;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat2.z * 0.5;
    u_xlat16_32.x = (-u_xlat2.z) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat2.x * u_xlat16_32.x + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_53 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_11.x = u_xlat2.z * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_11.x);
    u_xlat2.xzw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat16.xyz);
    u_xlat2.xzw = vec3(u_xlat16_31) * u_xlat2.xzw + u_xlat16.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xw);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xw);
    u_xlat18.y = u_xlat2.z;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_31 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat15.y = u_xlat16_9.x;
    u_xlat16_2.xz = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.zzz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_31);
    u_xlat16_12.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat2.xzw = u_xlat16_12.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xzw = u_xlat2.xzw * u_xlat2.xzw;
    u_xlat16_12.xzw = u_xlat16_12.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_69) * u_xlat16_12.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xzw = (bool(u_xlatb2)) ? u_xlat16_13.xyz : u_xlat16_12.xzw;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_32.xyz;
    u_xlat16_12.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xzw = min(max(u_xlat16_12.xzw, 0.0), 1.0);
#else
    u_xlat16_12.xzw = clamp(u_xlat16_12.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_12.zwx + u_xlat16_14.yzx;
    u_xlat16_69 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_3.w * _albedoColor.w + u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_2.xzw = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.wxz * _emissiveColor.zxy;
    u_xlat16_12.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_11.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat2.xzw = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xzw = max(u_xlat2.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat2.xzw = log2(u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xzw * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xw * vec2(15.0, 0.9375);
    u_xlat67 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.zw * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat67);
    u_xlat0.x = u_xlat67 * 0.0625 + u_xlat0.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat44.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat44.xy, 0.0).xyz;
    u_xlat15.xyz = (-u_xlat16_5.xyz) + u_xlat16_15.xyz;
    u_xlat2.xzw = u_xlat2.xxx * u_xlat15.xyz + u_xlat16_5.xyz;
    u_xlat16_6.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_6.xy = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat16_6.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat16_6.x>=0.5);
#else
    u_xlatb67 = u_xlat16_6.x>=0.5;
#endif
    u_xlat16_48 = (u_xlatb67) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_11.x = (u_xlatb67) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_48 = u_xlat16_48 + u_xlat16_11.x;
    u_xlat5.x = u_xlat16_48 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_67 = texture(_FlowLightMap, u_xlat16_6.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_23.x * u_xlat16_5.x;
    u_xlat16_27 = u_xlat16_67 * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat16_12.yyy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_outlineIntensity);
    u_xlat16_6.x = u_xlat16_27 * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _FlowLightColor.xyz + u_xlat2.xzw;
    u_xlat2.xyz = u_xlat4.xyz * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat65 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat4.xyz = vec3(u_xlat65) * u_xlat7.xyz;
    u_xlat65 = dot(u_xlat4.xyz, u_xlat16_10.xzw);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = (-u_xlat65) + 1.0;
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat65 = log2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat65 = exp2(u_xlat65);
    u_xlat65 = u_xlat65 * _fresnelPow;
    u_xlat16_6.x = max(_fresnelRange, 0.0);
    u_xlat16_6.x = u_xlat65 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_69 : u_xlat16_31;
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
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
ivec3 u_xlati22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat44;
int u_xlati44;
mediump float u_xlat16_45;
float u_xlat48;
mediump float u_xlat16_50;
float u_xlat59;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
float u_xlat73;
float u_xlat75;
mediump float u_xlat16_75;
bool u_xlatb75;
float u_xlat77;
float u_xlat78;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_23.x, u_xlat16_1);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_23.xyz;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat4.xyz = vec3(u_xlat66) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat66 * u_xlat66;
    u_xlat16_68 = u_xlat66 * u_xlat16_68;
    u_xlat16_68 = u_xlat66 * u_xlat16_68;
    u_xlat16_3.x = u_xlat66 * u_xlat16_68;
    u_xlat66 = (-u_xlat16_68) * u_xlat66 + 1.0;
    u_xlat5.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_25.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat70 = dot(u_xlat16_25.xyz, vs_TEXCOORD7.xyz);
    u_xlat70 = u_xlat70 + _U_RasterCardTex;
    u_xlat5.x = u_xlat70 + vs_TEXCOORD3.z;
    u_xlat5.xy = u_xlat5.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_5.xy = texture(_RasterCardTex, u_xlat5.xy).xy;
    u_xlat16_6.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_70 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_5) + u_xlat16_7;
    u_xlat16_5 = vec4(u_xlat16_68) * u_xlat16_8 + u_xlat16_5;
    u_xlat16_6.xzw = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_5.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xzw = u_xlat16_5.xyz * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat16_10.xyz;
    u_xlat66 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat16_3.xxx + u_xlat11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_68 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_68) + vs_TEXCOORD2.yzx;
    u_xlat73 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat14.xyz = vec3(u_xlat73) * u_xlat16_13.xyz;
    u_xlat15.xyz = u_xlat14.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat14.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat15.x;
    u_xlat12.x = u_xlat14.z;
    u_xlat16_16.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.x = u_xlat14.y;
    u_xlat14.y = u_xlat15.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat14.xyz = vec3(u_xlat73) * u_xlat12.xyz;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat75 = (-u_xlat9.x) * u_xlat16_23.x + u_xlat9.x;
    u_xlat75 = u_xlat9.x * u_xlat75 + u_xlat16_23.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat9.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat77 = (-u_xlat15.x) * u_xlat16_23.x + u_xlat15.x;
    u_xlat78 = u_xlat15.x * u_xlat77 + u_xlat16_23.x;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat15.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat78;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat26 = u_xlat16_23.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat26 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_23.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat75 * u_xlat4.x;
    u_xlat16.xyz = u_xlat11.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat9.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_4 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat17.xyz = vec3(u_xlat48) * u_xlat17.xyz;
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat14.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat26 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_23.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat80 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat80 * u_xlat80;
    u_xlat16_45 = u_xlat80 * u_xlat16_45;
    u_xlat16_45 = u_xlat80 * u_xlat16_45;
    u_xlat16_67 = u_xlat80 * u_xlat16_45;
    u_xlat80 = (-u_xlat16_45) * u_xlat80 + 1.0;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(u_xlat80);
    u_xlat17.xyz = vec3(u_xlat66) * vec3(u_xlat16_67) + u_xlat17.xyz;
    u_xlat80 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat80) * u_xlat16_23.x + u_xlat80;
    u_xlat59 = u_xlat80 * u_xlat59 + u_xlat16_23.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat80 + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat78 * u_xlat59;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat75 = u_xlat75 * u_xlat59;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat17.xyz;
    u_xlat16_13.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16.xyz;
    u_xlat16_68 = u_xlat16_3.x * u_xlat16_30.x;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_30.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat16_19.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat75);
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_23.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat22.x = dot(u_xlat14.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat44 * u_xlat44;
    u_xlat16_68 = u_xlat44 * u_xlat16_68;
    u_xlat16_68 = u_xlat44 * u_xlat16_68;
    u_xlat16_3.x = u_xlat44 * u_xlat16_68;
    u_xlat44 = (-u_xlat16_68) * u_xlat44 + 1.0;
    u_xlat16.xyz = u_xlat16_10.xyz * vec3(u_xlat44);
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat16_3.xxx + u_xlat16.xyz;
    u_xlat44 = (-u_xlat22.x) * u_xlat16_23.x + u_xlat22.x;
    u_xlat44 = u_xlat22.x * u_xlat44 + u_xlat16_23.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat22.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat78;
    u_xlat0.z = float(1.0) / u_xlat44;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat16.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat22.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_19.xyz * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_13.xyz;
    u_xlat16_68 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xzw = vec3(u_xlat16_68) * u_xlat16_6.xzw;
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_6.xzw;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_6.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * vec3(u_xlat80) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat22.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = (-u_xlat12.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat14.xyz;
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_68) + u_xlat16_3.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_68;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_68, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_19.xyz = u_xlat16_6.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat22.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat22.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_6.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat22.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat22.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat22.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_6.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat22.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_6.x = dot((-u_xlat16_25.xyz), u_xlat14.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat22.xyz = (-u_xlat14.xyz) * u_xlat16_6.xxx + (-u_xlat16_25.xyz);
    u_xlat16_8.z = dot(u_xlat16_18.xyz, u_xlat22.xyz);
    u_xlat9.x = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_6.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_11.w);
    u_xlat16_50 = u_xlat16_6.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_11.x = u_xlat16_50 * 16.0 + u_xlat16_11.z;
    u_xlat16_30.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xy).x;
    u_xlat16_11.x = u_xlat16_6.x * 16.0 + u_xlat16_11.z;
    u_xlat16_30.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(0.00390625, 0.0625);
    u_xlat16_75 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xy).x;
    u_xlat16_6.x = u_xlat16_6.w * 15.0 + (-u_xlat16_6.x);
    u_xlat16_50 = (-u_xlat16_75) + u_xlat16_31;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_50 + u_xlat16_75;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_6.x;
    u_xlat9.x = u_xlat9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_6.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat9.x * u_xlat16_6.x + u_xlat16_3.x;
    u_xlat16_6.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_50 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_50 + u_xlat16_6.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_9.z);
    u_xlat9.xyz = u_xlat12.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_23.xxx * u_xlat9.xyz + u_xlat22.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat18.y = u_xlat0.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_6.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_6.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_68) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xxx * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(u_xlat16_6.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_5.w * _albedoColor.w + u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_6.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_6.xz = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat16_6.xz = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_6.x>=0.5);
#else
    u_xlatb0 = u_xlat16_6.x>=0.5;
#endif
    u_xlat16_72 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_8.x = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_72 = u_xlat16_72 + u_xlat16_8.x;
    u_xlat0.x = u_xlat16_72 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_6.xz;
    u_xlat16_6.xz = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_6.xz).x;
    u_xlat16_22.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_70 * u_xlat16_22.x;
    u_xlat16_50 = u_xlat16_0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat0.xyw = u_xlat16_6.yyy * u_xlat16_8.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_6.x = u_xlat16_50 * _FlowLightFactory.x;
    u_xlat16_2.xyz = u_xlat16_6.xxx * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat14.xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_25.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _fresnelPow;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _fresnelPow;
    u_xlat16_2.x = max(_fresnelRange, 0.0);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_68 : u_xlat16_3.x;
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
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
ivec3 u_xlati22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat44;
int u_xlati44;
mediump float u_xlat16_45;
float u_xlat48;
mediump float u_xlat16_50;
float u_xlat59;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
float u_xlat73;
float u_xlat75;
mediump float u_xlat16_75;
bool u_xlatb75;
float u_xlat77;
float u_xlat78;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_23.x, u_xlat16_1);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_23.xyz;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat4.xyz = vec3(u_xlat66) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat66 * u_xlat66;
    u_xlat16_68 = u_xlat66 * u_xlat16_68;
    u_xlat16_68 = u_xlat66 * u_xlat16_68;
    u_xlat16_3.x = u_xlat66 * u_xlat16_68;
    u_xlat66 = (-u_xlat16_68) * u_xlat66 + 1.0;
    u_xlat5.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_25.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat70 = dot(u_xlat16_25.xyz, vs_TEXCOORD7.xyz);
    u_xlat70 = u_xlat70 + _U_RasterCardTex;
    u_xlat5.x = u_xlat70 + vs_TEXCOORD3.z;
    u_xlat5.xy = u_xlat5.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_5.xy = texture(_RasterCardTex, u_xlat5.xy).xy;
    u_xlat16_6.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_70 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_5) + u_xlat16_7;
    u_xlat16_5 = vec4(u_xlat16_68) * u_xlat16_8 + u_xlat16_5;
    u_xlat16_6.xzw = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_5.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xzw = u_xlat16_5.xyz * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat16_10.xyz;
    u_xlat66 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat16_3.xxx + u_xlat11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_68 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_68) + vs_TEXCOORD2.yzx;
    u_xlat73 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat14.xyz = vec3(u_xlat73) * u_xlat16_13.xyz;
    u_xlat15.xyz = u_xlat14.xyz * vs_TEXCOORD1.zxy;
    u_xlat15.xyz = vs_TEXCOORD1.yzx * u_xlat14.yzx + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat15.x;
    u_xlat12.x = u_xlat14.z;
    u_xlat16_16.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = dot(u_xlat16_13.xyz, u_xlat12.xyz);
    u_xlat15.x = u_xlat14.y;
    u_xlat14.y = u_xlat15.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat15.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat14.xyz = vec3(u_xlat73) * u_xlat12.xyz;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat75 = (-u_xlat9.x) * u_xlat16_23.x + u_xlat9.x;
    u_xlat75 = u_xlat9.x * u_xlat75 + u_xlat16_23.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat9.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat14.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat77 = (-u_xlat15.x) * u_xlat16_23.x + u_xlat15.x;
    u_xlat78 = u_xlat15.x * u_xlat77 + u_xlat16_23.x;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat15.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat78;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat26 = u_xlat16_23.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat26 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_23.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat75 * u_xlat4.x;
    u_xlat16.xyz = u_xlat11.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat9.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_2.xyz * u_xlat16.xyz;
    u_xlat16_4 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat17.xyz = vec3(u_xlat48) * u_xlat17.xyz;
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat14.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat26 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_23.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat80 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat80 * u_xlat80;
    u_xlat16_45 = u_xlat80 * u_xlat16_45;
    u_xlat16_45 = u_xlat80 * u_xlat16_45;
    u_xlat16_67 = u_xlat80 * u_xlat16_45;
    u_xlat80 = (-u_xlat16_45) * u_xlat80 + 1.0;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(u_xlat80);
    u_xlat17.xyz = vec3(u_xlat66) * vec3(u_xlat16_67) + u_xlat17.xyz;
    u_xlat80 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat80) * u_xlat16_23.x + u_xlat80;
    u_xlat59 = u_xlat80 * u_xlat59 + u_xlat16_23.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat80 + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat78 * u_xlat59;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat75 = u_xlat75 * u_xlat59;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _directSpecularColor.xyz;
    u_xlat17.xyz = vec3(u_xlat80) * u_xlat17.xyz;
    u_xlat16_13.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16.xyz;
    u_xlat16_68 = u_xlat16_3.x * u_xlat16_30.x;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_30.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat16_19.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat75);
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_23.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat22.x = dot(u_xlat14.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat44 * u_xlat44;
    u_xlat16_68 = u_xlat44 * u_xlat16_68;
    u_xlat16_68 = u_xlat44 * u_xlat16_68;
    u_xlat16_3.x = u_xlat44 * u_xlat16_68;
    u_xlat44 = (-u_xlat16_68) * u_xlat44 + 1.0;
    u_xlat16.xyz = u_xlat16_10.xyz * vec3(u_xlat44);
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat16_3.xxx + u_xlat16.xyz;
    u_xlat44 = (-u_xlat22.x) * u_xlat16_23.x + u_xlat22.x;
    u_xlat44 = u_xlat22.x * u_xlat44 + u_xlat16_23.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat22.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat78;
    u_xlat0.z = float(1.0) / u_xlat44;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat16.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat22.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_19.xyz * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_13.xyz;
    u_xlat16_68 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xzw = vec3(u_xlat16_68) * u_xlat16_6.xzw;
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_6.xzw;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_6.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * vec3(u_xlat80) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat22.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = (-u_xlat12.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat14.xyz;
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_68) + u_xlat16_3.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_68 = u_xlat16_8.w * u_xlat16_68;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat0.x = min(u_xlat16_68, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_19.xyz = u_xlat16_6.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat22.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat22.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_6.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat22.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat22.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat22.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_6.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat22.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_6.x = dot((-u_xlat16_25.xyz), u_xlat14.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat22.xyz = (-u_xlat14.xyz) * u_xlat16_6.xxx + (-u_xlat16_25.xyz);
    u_xlat16_8.z = dot(u_xlat16_18.xyz, u_xlat22.xyz);
    u_xlat9.x = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_6.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_11.w);
    u_xlat16_50 = u_xlat16_6.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_11.x = u_xlat16_50 * 16.0 + u_xlat16_11.z;
    u_xlat16_30.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xy).x;
    u_xlat16_11.x = u_xlat16_6.x * 16.0 + u_xlat16_11.z;
    u_xlat16_30.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(0.00390625, 0.0625);
    u_xlat16_75 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xy).x;
    u_xlat16_6.x = u_xlat16_6.w * 15.0 + (-u_xlat16_6.x);
    u_xlat16_50 = (-u_xlat16_75) + u_xlat16_31;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_50 + u_xlat16_75;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_6.x;
    u_xlat9.x = u_xlat9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_6.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat9.x * u_xlat16_6.x + u_xlat16_3.x;
    u_xlat16_6.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_50 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_50 + u_xlat16_6.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_9.z);
    u_xlat9.xyz = u_xlat12.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_23.xxx * u_xlat9.xyz + u_xlat22.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat18.y = u_xlat0.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_6.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_6.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_68) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xxx * u_xlat16_6.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(u_xlat16_6.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_5.w * _albedoColor.w + u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xzw * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xzw = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_6.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_6.xz = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat16_6.xz = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_6.x>=0.5);
#else
    u_xlatb0 = u_xlat16_6.x>=0.5;
#endif
    u_xlat16_72 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_8.x = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_72 = u_xlat16_72 + u_xlat16_8.x;
    u_xlat0.x = u_xlat16_72 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_6.xz;
    u_xlat16_6.xz = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_6.xz).x;
    u_xlat16_22.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_6.x = u_xlat16_70 * u_xlat16_22.x;
    u_xlat16_50 = u_xlat16_0.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat0.xyw = u_xlat16_6.yyy * u_xlat16_8.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_6.x = u_xlat16_50 * _FlowLightFactory.x;
    u_xlat16_2.xyz = u_xlat16_6.xxx * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat14.xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_25.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _fresnelPow;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _fresnelPow;
    u_xlat16_2.x = max(_fresnelRange, 0.0);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_68 : u_xlat16_3.x;
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
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
vec2 u_xlat22;
mediump vec2 u_xlat16_22;
vec3 u_xlat24;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_31;
int u_xlati40;
float u_xlat41;
mediump float u_xlat16_41;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat60;
bool u_xlatb60;
float u_xlat61;
bool u_xlatb61;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
float u_xlat76;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
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
    u_xlat21 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21 = (-u_xlat1.x) + u_xlat21;
    u_xlat0.z = _ShadowBias.y * u_xlat21 + u_xlat1.x;
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
    u_xlat20 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat20 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat2.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_30 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat3.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_10.xzw = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat22.x = dot(u_xlat16_10.xzw, vs_TEXCOORD7.xyz);
    u_xlat22.x = u_xlat22.x + _U_RasterCardTex;
    u_xlat3.x = u_xlat22.x + vs_TEXCOORD3.z;
    u_xlat22.xy = u_xlat3.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_22.xy = texture(_RasterCardTex, u_xlat22.xy).xy;
    u_xlat16_12.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_22.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_71 = u_xlat16_22.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_4 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_3) + u_xlat16_4;
    u_xlat16_3 = vec4(u_xlat16_71) * u_xlat16_8 + u_xlat16_3;
    u_xlat16_12.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_3.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_3.xyz * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat64 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.xzw = vec3(u_xlat64) * vec3(u_xlat16_30) + u_xlat2.xzw;
    u_xlat16_30 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat67 = (-u_xlat60) * u_xlat16_30 + u_xlat60;
    u_xlat67 = u_xlat60 * u_xlat67 + u_xlat16_30;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat60 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat15.x) * u_xlat16_30 + u_xlat15.x;
    u_xlat55 = u_xlat15.x * u_xlat55 + u_xlat16_30;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat15.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat55;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat75 = u_xlat16_30 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat75 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_30 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat61 = u_xlat67 * u_xlat61;
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = vec3(u_xlat60) * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_11.xyz * u_xlat2.xzw;
    u_xlat2.xzw = vec3(u_xlat20) * u_xlat2.xzw;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16.xyz = vec3(u_xlat61) * u_xlat16.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat75 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_30 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat67 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat67 * u_xlat67;
    u_xlat16_71 = u_xlat67 * u_xlat16_71;
    u_xlat16_71 = u_xlat67 * u_xlat16_71;
    u_xlat16_73 = u_xlat67 * u_xlat16_71;
    u_xlat67 = (-u_xlat16_71) * u_xlat67 + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * vec3(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat64) * vec3(u_xlat16_73) + u_xlat16.xyz;
    u_xlat67 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat67) * u_xlat16_30 + u_xlat67;
    u_xlat76 = u_xlat67 * u_xlat76 + u_xlat16_30;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat67 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat55 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat61 = u_xlat61 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb61 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat61 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat1.xyz = vec3(u_xlat61) * u_xlat1.xyz;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat75 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_30 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat41 * u_xlat41;
    u_xlat16_66 = u_xlat41 * u_xlat16_66;
    u_xlat16_66 = u_xlat41 * u_xlat16_66;
    u_xlat16_71 = u_xlat41 * u_xlat16_66;
    u_xlat41 = (-u_xlat16_66) * u_xlat41 + 1.0;
    u_xlat2.xzw = u_xlat16_13.xyz * vec3(u_xlat41);
    u_xlat2.xzw = vec3(u_xlat64) * vec3(u_xlat16_71) + u_xlat2.xzw;
    u_xlat41 = (-u_xlat21) * u_xlat16_30 + u_xlat21;
    u_xlat41 = u_xlat21 * u_xlat41 + u_xlat16_30;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat55;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _directSpecularColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_18.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat20) + u_xlat16_14.xyz;
    u_xlat16_66 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xzw = vec3(u_xlat16_66) * u_xlat16_12.xzw;
    u_xlat16_17.xyz = u_xlat16_12.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat60) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat67) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat21) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_9.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_9.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _occlusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_17.xyz = u_xlat16_12.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_10.xzw), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xzw);
    u_xlat16_9.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_16.w);
    u_xlat16_31.x = u_xlat16_11.x + 1.0;
    u_xlat16_31.x = min(u_xlat16_31.x, 15.0);
    u_xlat16_16.x = u_xlat16_31.x * 16.0 + u_xlat16_16.z;
    u_xlat16_12.xz = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_16.x = u_xlat16_11.x * 16.0 + u_xlat16_16.z;
    u_xlat16_12.xz = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_41 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_31.x = (-u_xlat16_41) + u_xlat16_21;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_31.x + u_xlat16_41;
    u_xlat16_11.x = u_xlat16_71 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_31.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_31.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_51 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_31.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_30) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat17.y = u_xlat0.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_30 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat15.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_31.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_30);
    u_xlat16_12.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_12.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_12.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xzw = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xzw;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_12.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xzw = min(max(u_xlat16_12.xzw, 0.0), 1.0);
#else
    u_xlat16_12.xzw = clamp(u_xlat16_12.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_14.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_3.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_11.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_11.x>=0.5);
#else
    u_xlatb0 = u_xlat16_11.x>=0.5;
#endif
    u_xlat16_51 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_71 = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_51 = u_xlat16_71 + u_xlat16_51;
    u_xlat0.x = u_xlat16_51 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_11.xy).x;
    u_xlat16_20.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.x = u_xlat16_22.x * u_xlat16_20.x;
    u_xlat16_31.x = u_xlat16_0.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.xzw = u_xlat16_4.xyz * u_xlat16_11.xxx;
    u_xlat0.xyw = u_xlat16_11.xzw * u_xlat16_12.yyy;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_11.x = u_xlat16_31.x * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_11.xxx * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_10.xzw);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _fresnelPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _fresnelPow;
    u_xlat16_6.x = max(_fresnelRange, 0.0);
    u_xlat16_6.x = u_xlat1.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_20.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_30;
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
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
vec2 u_xlat22;
mediump vec2 u_xlat16_22;
vec3 u_xlat24;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_31;
int u_xlati40;
float u_xlat41;
mediump float u_xlat16_41;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat60;
bool u_xlatb60;
float u_xlat61;
bool u_xlatb61;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
float u_xlat76;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
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
    u_xlat21 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21 = (-u_xlat1.x) + u_xlat21;
    u_xlat0.z = _ShadowBias.y * u_xlat21 + u_xlat1.x;
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
    u_xlat20 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat20 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat2.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_30 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat3.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat16_10.xzw = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat22.x = dot(u_xlat16_10.xzw, vs_TEXCOORD7.xyz);
    u_xlat22.x = u_xlat22.x + _U_RasterCardTex;
    u_xlat3.x = u_xlat22.x + vs_TEXCOORD3.z;
    u_xlat22.xy = u_xlat3.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_22.xy = texture(_RasterCardTex, u_xlat22.xy).xy;
    u_xlat16_12.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xy = min(max(u_xlat16_12.xy, 0.0), 1.0);
#else
    u_xlat16_12.xy = clamp(u_xlat16_12.xy, 0.0, 1.0);
#endif
    u_xlat16_22.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_71 = u_xlat16_22.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_4 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_3) + u_xlat16_4;
    u_xlat16_3 = vec4(u_xlat16_71) * u_xlat16_8 + u_xlat16_3;
    u_xlat16_12.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_3.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xzw = u_xlat16_3.xyz * u_xlat16_12.xzw;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_13.xyz;
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat64 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.xzw = vec3(u_xlat64) * vec3(u_xlat16_30) + u_xlat2.xzw;
    u_xlat16_30 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat67 = (-u_xlat60) * u_xlat16_30 + u_xlat60;
    u_xlat67 = u_xlat60 * u_xlat67 + u_xlat16_30;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat60 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat15.x = dot(u_xlat7.xyz, u_xlat16_10.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat15.x) * u_xlat16_30 + u_xlat15.x;
    u_xlat55 = u_xlat15.x * u_xlat55 + u_xlat16_30;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat15.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat55;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat75 = u_xlat16_30 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat75 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_30 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat61 = u_xlat67 * u_xlat61;
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xzw = min(max(u_xlat2.xzw, 0.0), 1.0);
#else
    u_xlat2.xzw = clamp(u_xlat2.xzw, 0.0, 1.0);
#endif
    u_xlat2.xzw = u_xlat2.xzw * _directSpecularColor.xyz;
    u_xlat2.xzw = vec3(u_xlat60) * u_xlat2.xzw;
    u_xlat2.xzw = u_xlat16_11.xyz * u_xlat2.xzw;
    u_xlat2.xzw = vec3(u_xlat20) * u_xlat2.xzw;
    u_xlat16.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16.xyz = vec3(u_xlat61) * u_xlat16.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat75 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_30 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat67 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat67 * u_xlat67;
    u_xlat16_71 = u_xlat67 * u_xlat16_71;
    u_xlat16_71 = u_xlat67 * u_xlat16_71;
    u_xlat16_73 = u_xlat67 * u_xlat16_71;
    u_xlat67 = (-u_xlat16_71) * u_xlat67 + 1.0;
    u_xlat16.xyz = u_xlat16_13.xyz * vec3(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat64) * vec3(u_xlat16_73) + u_xlat16.xyz;
    u_xlat67 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat67) * u_xlat16_30 + u_xlat67;
    u_xlat76 = u_xlat67 * u_xlat76 + u_xlat16_30;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat67 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat55 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat61 = u_xlat61 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16.xyz * u_xlat16_6.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb61 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat61 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat1.xyz = vec3(u_xlat61) * u_xlat1.xyz;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat75 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_30 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat41 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat41 * u_xlat41;
    u_xlat16_66 = u_xlat41 * u_xlat16_66;
    u_xlat16_66 = u_xlat41 * u_xlat16_66;
    u_xlat16_71 = u_xlat41 * u_xlat16_66;
    u_xlat41 = (-u_xlat16_66) * u_xlat41 + 1.0;
    u_xlat2.xzw = u_xlat16_13.xyz * vec3(u_xlat41);
    u_xlat2.xzw = vec3(u_xlat64) * vec3(u_xlat16_71) + u_xlat2.xzw;
    u_xlat41 = (-u_xlat21) * u_xlat16_30 + u_xlat21;
    u_xlat41 = u_xlat21 * u_xlat41 + u_xlat16_30;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat55;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _directSpecularColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_18.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat20) + u_xlat16_14.xyz;
    u_xlat16_66 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xzw = vec3(u_xlat16_66) * u_xlat16_12.xzw;
    u_xlat16_17.xyz = u_xlat16_12.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat60) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat67) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat20) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat21) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_9.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_9.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _occlusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_8.z);
    u_xlat16_17.xyz = u_xlat16_12.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xzw = u_xlat16_12.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_10.xzw), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xzw);
    u_xlat16_9.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_16.w);
    u_xlat16_31.x = u_xlat16_11.x + 1.0;
    u_xlat16_31.x = min(u_xlat16_31.x, 15.0);
    u_xlat16_16.x = u_xlat16_31.x * 16.0 + u_xlat16_16.z;
    u_xlat16_12.xz = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_16.x = u_xlat16_11.x * 16.0 + u_xlat16_16.z;
    u_xlat16_12.xz = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_41 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_31.x = (-u_xlat16_41) + u_xlat16_21;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_31.x + u_xlat16_41;
    u_xlat16_11.x = u_xlat16_71 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_31.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_31.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_51 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_31.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_8.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_30) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat17.y = u_xlat0.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_30 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat15.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_31.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_30);
    u_xlat16_12.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_12.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xzw = u_xlat16_12.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_12.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xzw = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xzw;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_12.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_12.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xzw = min(max(u_xlat16_12.xzw, 0.0), 1.0);
#else
    u_xlat16_12.xzw = clamp(u_xlat16_12.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_14.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_3.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xzw = u_xlat16_11.xyz * u_xlat16_12.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xzw + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_11.x>=0.5);
#else
    u_xlatb0 = u_xlat16_11.x>=0.5;
#endif
    u_xlat16_51 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_71 = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_51 = u_xlat16_71 + u_xlat16_51;
    u_xlat0.x = u_xlat16_51 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_11.xy).x;
    u_xlat16_20.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_11.x = u_xlat16_22.x * u_xlat16_20.x;
    u_xlat16_31.x = u_xlat16_0.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.xzw = u_xlat16_4.xyz * u_xlat16_11.xxx;
    u_xlat0.xyw = u_xlat16_11.xzw * u_xlat16_12.yyy;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_11.x = u_xlat16_31.x * _FlowLightFactory.x;
    u_xlat16_6.xyz = u_xlat16_11.xxx * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_6.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_10.xzw);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _fresnelPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _fresnelPow;
    u_xlat16_6.x = max(_fresnelRange, 0.0);
    u_xlat16_6.x = u_xlat1.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_20.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_30;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
mediump vec2 u_xlat16_21;
vec2 u_xlat34;
bool u_xlatb34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat38;
float u_xlat51;
int u_xlati51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat34.x = dot(u_xlat16_3.xyz, vs_TEXCOORD7.xyz);
    u_xlat34.x = u_xlat34.x + _U_RasterCardTex;
    u_xlat0.x = u_xlat34.x + vs_TEXCOORD3.z;
    u_xlat0.xy = u_xlat0.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_0.xy = texture(_RasterCardTex, u_xlat0.xy).xy;
    u_xlat16_5.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_52 = u_xlat16_0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_6) + u_xlat16_7;
    u_xlat16_6 = vec4(u_xlat16_52) * u_xlat16_8 + u_xlat16_6;
    u_xlat16_5.xzw = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_6.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_5.xzw * u_xlat16_8.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat17.x = u_xlat16_17.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat17.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb34 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb34) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_54) * u_xlat11.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb34 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb34)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat17.xxx * u_xlat16_12.xyz;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat17.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat17.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat17.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat14.x;
    u_xlat11.x = u_xlat17.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_13.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat17.y;
    u_xlat17.y = u_xlat14.z;
    u_xlat17.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_13.xyz, u_xlat17.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat14.xyz = u_xlat17.xxx * u_xlat11.xyz;
    u_xlat34.x = dot(u_xlat14.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
    u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat34.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat34.x = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
    u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat34.xxx + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat51) + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat51 = (-u_xlat34.x) * u_xlat16_52 + u_xlat34.x;
    u_xlat51 = u_xlat34.x * u_xlat51 + u_xlat16_52;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat34.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_52 + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_52;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat9.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat55;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat55 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz;
    u_xlat55 = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_54) + 1.0;
    u_xlat21 = u_xlat55 * u_xlat55;
    u_xlat38 = u_xlat16_52 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat38 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_52 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat51 = u_xlat51 * u_xlat21;
    u_xlat16_54 = u_xlat4.x * u_xlat4.x;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_59 = u_xlat4.x * u_xlat16_54;
    u_xlat4.x = (-u_xlat16_54) * u_xlat4.x + 1.0;
    u_xlat16_5.xzw = u_xlat16_2.yyy * u_xlat16_5.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xzw;
    u_xlat55 = u_xlat16_5.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat55) * vec3(u_xlat16_59) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = u_xlat34.xxx * u_xlat4.xyz;
    u_xlat16_1.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat11.xyz) * u_xlat17.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat14.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_19.xxx * u_xlat16_10.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_54 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_54;
    u_xlat34.x = min(u_xlat16_19.x, 1.0);
    u_xlat51 = min(u_xlat34.x, u_xlat16_9.z);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_16.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = dot((-u_xlat16_3.xyz), u_xlat14.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat15.xyz = (-u_xlat14.xyz) * u_xlat16_8.xxx + (-u_xlat16_3.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat15.xyz);
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_10.x = u_xlat16_53 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_10.x = u_xlat16_36 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_36 = u_xlat16_8.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_55 + (-u_xlat16_58);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_58;
    u_xlat16_36 = u_xlat16_54 * u_xlat16_36;
    u_xlat51 = u_xlat51 * u_xlat16_36;
    u_xlat16_36 = u_xlat34.x * 0.5;
    u_xlat16_53 = (-u_xlat34.x) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat51 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_54 = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_54 + u_xlat16_53;
    u_xlat16_36 = u_xlat34.x * u_xlat16_36;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_9.z);
    u_xlat17.xyz = u_xlat11.xyz * u_xlat17.xxx + (-u_xlat15.xyz);
    u_xlat17.xyz = vec3(u_xlat16_52) * u_xlat17.xyz + u_xlat15.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat8.y = u_xlat17.y;
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_52);
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_8.zxy;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb17)) ? u_xlat16_2.xyw : u_xlat16_10.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xzw;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_5.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xzw = min(max(u_xlat16_5.xzw, 0.0), 1.0);
#else
    u_xlat16_5.xzw = clamp(u_xlat16_5.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw;
    u_xlat16_2.xyz = u_xlat4.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_6.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.zxy * _emissiveColor.zxy;
    u_xlat16_5.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_19.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat17.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.xyz = log2(u_xlat17.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat4.xw = u_xlat17.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat4.x);
    u_xlat4.yz = u_xlat17.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat17.x = u_xlat17.x * 15.0 + (-u_xlat58);
    u_xlat4.x = u_xlat58 * 0.0625 + u_xlat4.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat4.xz, 0.0).xyz;
    u_xlat34.xy = u_xlat4.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat34.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_9.xyz) + u_xlat16_4.xyz;
    u_xlat17.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat16_9.xyz;
    u_xlat16_1.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_1.xy = u_xlat16_1.xx * vs_TEXCOORD3.xy;
    u_xlat16_1.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_1.x>=0.5);
#else
    u_xlatb4 = u_xlat16_1.x>=0.5;
#endif
    u_xlat16_35.x = (u_xlatb4) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_19.x = (u_xlatb4) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_35.x = u_xlat16_35.x + u_xlat16_19.x;
    u_xlat4.x = u_xlat16_35.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat16_1.xy + u_xlat4.xy;
    u_xlat16_1.xy = u_xlat4.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_4.x = texture(_FlowLightMap, u_xlat16_1.xy).x;
    u_xlat16_21.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_21.x;
    u_xlat16_18 = u_xlat16_4.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat4.xyw = u_xlat16_19.xyz * u_xlat16_5.yyy;
    u_xlat4.xyw = u_xlat4.xyw * vec3(_outlineIntensity);
    u_xlat16_1.x = u_xlat16_18 * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FlowLightColor.xyz + u_xlat17.xyz;
    u_xlat0.xyz = u_xlat4.xyw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat14.xyz;
    u_xlat51 = dot(u_xlat4.xyw, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _fresnelPow;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat51 * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_21.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
mediump vec2 u_xlat16_21;
vec2 u_xlat34;
bool u_xlatb34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat38;
float u_xlat51;
int u_xlati51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat34.x = dot(u_xlat16_3.xyz, vs_TEXCOORD7.xyz);
    u_xlat34.x = u_xlat34.x + _U_RasterCardTex;
    u_xlat0.x = u_xlat34.x + vs_TEXCOORD3.z;
    u_xlat0.xy = u_xlat0.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_0.xy = texture(_RasterCardTex, u_xlat0.xy).xy;
    u_xlat16_5.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_52 = u_xlat16_0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_6) + u_xlat16_7;
    u_xlat16_6 = vec4(u_xlat16_52) * u_xlat16_8 + u_xlat16_6;
    u_xlat16_5.xzw = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_6.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_6.zxy;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_5.xzw * u_xlat16_8.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat17.x = u_xlat16_17.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat17.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb34 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb34) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_54) * u_xlat11.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb34 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb34)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat17.xxx * u_xlat16_12.xyz;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat17.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat17.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat17.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat14.x;
    u_xlat11.x = u_xlat17.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_13.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat17.y;
    u_xlat17.y = u_xlat14.z;
    u_xlat17.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_13.xyz, u_xlat17.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat14.xyz = u_xlat17.xxx * u_xlat11.xyz;
    u_xlat34.x = dot(u_xlat14.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
    u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat34.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat34.x = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
    u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat34.xxx + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat51) + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat51 = (-u_xlat34.x) * u_xlat16_52 + u_xlat34.x;
    u_xlat51 = u_xlat34.x * u_xlat51 + u_xlat16_52;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat34.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_52 + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_52;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat9.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat55;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat55 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz;
    u_xlat55 = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_54) + 1.0;
    u_xlat21 = u_xlat55 * u_xlat55;
    u_xlat38 = u_xlat16_52 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat38 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_52 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat51 = u_xlat51 * u_xlat21;
    u_xlat16_54 = u_xlat4.x * u_xlat4.x;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_59 = u_xlat4.x * u_xlat16_54;
    u_xlat4.x = (-u_xlat16_54) * u_xlat4.x + 1.0;
    u_xlat16_5.xzw = u_xlat16_2.yyy * u_xlat16_5.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xzw;
    u_xlat55 = u_xlat16_5.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat55) * vec3(u_xlat16_59) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = u_xlat34.xxx * u_xlat4.xyz;
    u_xlat16_1.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat11.xyz) * u_xlat17.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat14.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_19.xxx * u_xlat16_10.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_54 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_54;
    u_xlat34.x = min(u_xlat16_19.x, 1.0);
    u_xlat51 = min(u_xlat34.x, u_xlat16_9.z);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_16.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = dot((-u_xlat16_3.xyz), u_xlat14.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat15.xyz = (-u_xlat14.xyz) * u_xlat16_8.xxx + (-u_xlat16_3.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat15.xyz);
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_10.x = u_xlat16_53 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_10.x = u_xlat16_36 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_36 = u_xlat16_8.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_55 + (-u_xlat16_58);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_58;
    u_xlat16_36 = u_xlat16_54 * u_xlat16_36;
    u_xlat51 = u_xlat51 * u_xlat16_36;
    u_xlat16_36 = u_xlat34.x * 0.5;
    u_xlat16_53 = (-u_xlat34.x) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat51 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_54 = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_54 + u_xlat16_53;
    u_xlat16_36 = u_xlat34.x * u_xlat16_36;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_9.z);
    u_xlat17.xyz = u_xlat11.xyz * u_xlat17.xxx + (-u_xlat15.xyz);
    u_xlat17.xyz = vec3(u_xlat16_52) * u_xlat17.xyz + u_xlat15.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat8.y = u_xlat17.y;
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_52);
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_8.zxy;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb17)) ? u_xlat16_2.xyw : u_xlat16_10.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xzw;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_5.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xzw = min(max(u_xlat16_5.xzw, 0.0), 1.0);
#else
    u_xlat16_5.xzw = clamp(u_xlat16_5.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw;
    u_xlat16_2.xyz = u_xlat4.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_6.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.zxy * _emissiveColor.zxy;
    u_xlat16_5.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_19.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat17.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat17.xyz = max(u_xlat17.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat17.xyz = log2(u_xlat17.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat4.xw = u_xlat17.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat4.x);
    u_xlat4.yz = u_xlat17.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat17.x = u_xlat17.x * 15.0 + (-u_xlat58);
    u_xlat4.x = u_xlat58 * 0.0625 + u_xlat4.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat4.xz, 0.0).xyz;
    u_xlat34.xy = u_xlat4.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat34.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_9.xyz) + u_xlat16_4.xyz;
    u_xlat17.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat16_9.xyz;
    u_xlat16_1.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_1.xy = u_xlat16_1.xx * vs_TEXCOORD3.xy;
    u_xlat16_1.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_1.x>=0.5);
#else
    u_xlatb4 = u_xlat16_1.x>=0.5;
#endif
    u_xlat16_35.x = (u_xlatb4) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_19.x = (u_xlatb4) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_35.x = u_xlat16_35.x + u_xlat16_19.x;
    u_xlat4.x = u_xlat16_35.x * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat16_1.xy + u_xlat4.xy;
    u_xlat16_1.xy = u_xlat4.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_4.x = texture(_FlowLightMap, u_xlat16_1.xy).x;
    u_xlat16_21.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_21.x;
    u_xlat16_18 = u_xlat16_4.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat4.xyw = u_xlat16_19.xyz * u_xlat16_5.yyy;
    u_xlat4.xyw = u_xlat4.xyw * vec3(_outlineIntensity);
    u_xlat16_1.x = u_xlat16_18 * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FlowLightColor.xyz + u_xlat17.xyz;
    u_xlat0.xyz = u_xlat4.xyw * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat14.xyz;
    u_xlat51 = dot(u_xlat4.xyw, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _fresnelPow;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _fresnelPow;
    u_xlat16_1.x = max(_fresnelRange, 0.0);
    u_xlat16_1.x = u_xlat51 * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_21.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_32;
float u_xlat40;
mediump vec2 u_xlat16_44;
vec2 u_xlat47;
float u_xlat57;
mediump float u_xlat16_57;
float u_xlat59;
mediump float u_xlat16_59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_10.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57 = dot(u_xlat16_10.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat1.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat1.xy = u_xlat1.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_1.xy = texture(_RasterCardTex, u_xlat1.xy).xy;
    u_xlat16_11.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_63 = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_4 = (-u_xlat16_1) + u_xlat16_3;
    u_xlat16_1 = vec4(u_xlat16_63) * u_xlat16_4 + u_xlat16_1;
    u_xlat16_11.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_1.zxy * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_1.zxy * u_xlat16_11.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat59) * u_xlat16_14.xyz;
    u_xlat59 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat60 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat60) + u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_63 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat60 = (-u_xlat59) * u_xlat16_63 + u_xlat59;
    u_xlat60 = u_xlat59 * u_xlat60 + u_xlat16_63;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat59 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat9.x) * u_xlat16_63 + u_xlat9.x;
    u_xlat64 = u_xlat9.x * u_xlat64 + u_xlat16_63;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat9.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat64;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat64);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat21 = u_xlat64 * u_xlat64;
    u_xlat40 = u_xlat16_63 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat40 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_63 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat21 = u_xlat60 * u_xlat21;
    u_xlat16_67 = u_xlat2.x * u_xlat2.x;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_69 = u_xlat2.x * u_xlat16_67;
    u_xlat2.x = (-u_xlat16_67) * u_xlat2.x + 1.0;
    u_xlat16_11.xzw = u_xlat16_8.yyy * u_xlat16_11.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat2.xxx * u_xlat16_11.xzw;
    u_xlat2.x = u_xlat16_11.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat2.xxx * vec3(u_xlat16_69) + u_xlat17.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_67) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_67;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat47.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat59 = min(u_xlat16_4.z, u_xlat47.x);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat59) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat59) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat59) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat59) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati59 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati59].xyz;
    u_xlati59 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati60 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_10.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_10.xyz);
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat17.xyz);
    u_xlat59 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_14.w);
    u_xlat16_32.x = u_xlat16_13.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_14.x = u_xlat16_32.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32.x = u_xlat16_60 + (-u_xlat16_64);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32.x + u_xlat16_64;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat59 = u_xlat59 * u_xlat16_69;
    u_xlat16_69 = u_xlat47.y * 0.5;
    u_xlat16_13.x = (-u_xlat47.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat59 * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32.x = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32.x + u_xlat16_13.x;
    u_xlat16_69 = u_xlat47.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_4.z, u_xlat16_69);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat17.xyz);
    u_xlat5.xyz = vec3(u_xlat16_63) * u_xlat5.xyz + u_xlat17.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat13.y = u_xlat5.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_63 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb59 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_11.xzw = vec3(u_xlat16_69) * u_xlat16_11.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.yzx * u_xlat16_6.yzx + u_xlat16_11.zwx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xzw = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xzw) + _FogCol.zxy;
    u_xlat16_11.xzw = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xzw;
    u_xlat2.xyz = u_xlat16_11.xzw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat59 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat59);
    u_xlat1.x = u_xlat59 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_21.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat16_44.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_44.xy = u_xlat16_44.xx * vs_TEXCOORD3.xy;
    u_xlat16_44.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_44.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(u_xlat16_44.x>=0.5);
#else
    u_xlatb59 = u_xlat16_44.x>=0.5;
#endif
    u_xlat16_67 = (u_xlatb59) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_11.x = (u_xlatb59) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_67 = u_xlat16_67 + u_xlat16_11.x;
    u_xlat5.x = u_xlat16_67 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + u_xlat16_44.xy;
    u_xlat16_44.xy = u_xlat5.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_59 = texture(_FlowLightMap, u_xlat16_44.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_44.x = u_xlat16_57 * u_xlat16_5.x;
    u_xlat16_63 = u_xlat16_59 * u_xlat16_44.x;
    u_xlat16_44.x = u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_11.xzw = u_xlat16_3.xyz * u_xlat16_44.xxx;
    u_xlat3.xyz = u_xlat16_11.xzw * u_xlat16_11.yyy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_outlineIntensity);
    u_xlat16_44.x = u_xlat16_63 * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_44.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat59 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = vec3(u_xlat59) * u_xlat7.xyz;
    u_xlat59 = dot(u_xlat3.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat59 = (-u_xlat59) + 1.0;
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat59 = log2(u_xlat59);
    u_xlat59 = u_xlat59 * _fresnelPow;
    u_xlat59 = exp2(u_xlat59);
    u_xlat59 = u_xlat59 * _fresnelPow;
    u_xlat16_44.x = max(_fresnelRange, 0.0);
    u_xlat16_44.x = u_xlat59 * u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_44.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_6.x : u_xlat16_25;
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
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_32;
float u_xlat40;
mediump vec2 u_xlat16_44;
vec2 u_xlat47;
float u_xlat57;
mediump float u_xlat16_57;
float u_xlat59;
mediump float u_xlat16_59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_10.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57 = dot(u_xlat16_10.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat1.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat1.xy = u_xlat1.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_1.xy = texture(_RasterCardTex, u_xlat1.xy).xy;
    u_xlat16_11.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_63 = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_4 = (-u_xlat16_1) + u_xlat16_3;
    u_xlat16_1 = vec4(u_xlat16_63) * u_xlat16_4 + u_xlat16_1;
    u_xlat16_11.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_1.zxy * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_1.zxy * u_xlat16_11.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat59) * u_xlat16_14.xyz;
    u_xlat59 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat60 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat60) + u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_63 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat60 = (-u_xlat59) * u_xlat16_63 + u_xlat59;
    u_xlat60 = u_xlat59 * u_xlat60 + u_xlat16_63;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat59 + u_xlat60;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat9.x) * u_xlat16_63 + u_xlat9.x;
    u_xlat64 = u_xlat9.x * u_xlat64 + u_xlat16_63;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat9.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat64;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat64);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat21 = u_xlat64 * u_xlat64;
    u_xlat40 = u_xlat16_63 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat40 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_63 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat21 = u_xlat60 * u_xlat21;
    u_xlat16_67 = u_xlat2.x * u_xlat2.x;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_69 = u_xlat2.x * u_xlat16_67;
    u_xlat2.x = (-u_xlat16_67) * u_xlat2.x + 1.0;
    u_xlat16_11.xzw = u_xlat16_8.yyy * u_xlat16_11.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat2.xxx * u_xlat16_11.xzw;
    u_xlat2.x = u_xlat16_11.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat2.xxx * vec3(u_xlat16_69) + u_xlat17.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_67) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_67;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat47.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat59 = min(u_xlat16_4.z, u_xlat47.x);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat59) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat59) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat59) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat59) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati59 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati59].xyz;
    u_xlati59 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati60 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_10.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_10.xyz);
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat17.xyz);
    u_xlat59 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_14.w);
    u_xlat16_32.x = u_xlat16_13.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_14.x = u_xlat16_32.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32.x = u_xlat16_60 + (-u_xlat16_64);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32.x + u_xlat16_64;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat59 = u_xlat59 * u_xlat16_69;
    u_xlat16_69 = u_xlat47.y * 0.5;
    u_xlat16_13.x = (-u_xlat47.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat59 * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32.x = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32.x + u_xlat16_13.x;
    u_xlat16_69 = u_xlat47.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_4.z, u_xlat16_69);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat17.xyz);
    u_xlat5.xyz = vec3(u_xlat16_63) * u_xlat5.xyz + u_xlat17.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat13.y = u_xlat5.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_63 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat5.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb59 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_11.xzw = vec3(u_xlat16_69) * u_xlat16_11.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.yzx * u_xlat16_6.yzx + u_xlat16_11.zwx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xzw = u_xlat16_2.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xzw) + _FogCol.zxy;
    u_xlat16_11.xzw = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xzw;
    u_xlat2.xyz = u_xlat16_11.xzw * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat59 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat59);
    u_xlat1.x = u_xlat59 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_21.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_21.xyz;
    u_xlat16_44.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_44.xy = u_xlat16_44.xx * vs_TEXCOORD3.xy;
    u_xlat16_44.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_44.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(u_xlat16_44.x>=0.5);
#else
    u_xlatb59 = u_xlat16_44.x>=0.5;
#endif
    u_xlat16_67 = (u_xlatb59) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_11.x = (u_xlatb59) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_67 = u_xlat16_67 + u_xlat16_11.x;
    u_xlat5.x = u_xlat16_67 * _Time.y;
    u_xlat5.y = _FlowLightFactory.z * _Time.y;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + u_xlat16_44.xy;
    u_xlat16_44.xy = u_xlat5.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_59 = texture(_FlowLightMap, u_xlat16_44.xy).x;
    u_xlat16_5.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_44.x = u_xlat16_57 * u_xlat16_5.x;
    u_xlat16_63 = u_xlat16_59 * u_xlat16_44.x;
    u_xlat16_44.x = u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_11.xzw = u_xlat16_3.xyz * u_xlat16_44.xxx;
    u_xlat3.xyz = u_xlat16_11.xzw * u_xlat16_11.yyy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_outlineIntensity);
    u_xlat16_44.x = u_xlat16_63 * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_44.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat59 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = vec3(u_xlat59) * u_xlat7.xyz;
    u_xlat59 = dot(u_xlat3.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat59 = (-u_xlat59) + 1.0;
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat59 = log2(u_xlat59);
    u_xlat59 = u_xlat59 * _fresnelPow;
    u_xlat59 = exp2(u_xlat59);
    u_xlat59 = u_xlat59 * _fresnelPow;
    u_xlat16_44.x = max(_fresnelRange, 0.0);
    u_xlat16_44.x = u_xlat59 * u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_44.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_5.yyy + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_6.x : u_xlat16_25;
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
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat38;
float u_xlat51;
int u_xlati51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat34 = dot(u_xlat16_3.xyz, vs_TEXCOORD7.xyz);
    u_xlat34 = u_xlat34 + _U_RasterCardTex;
    u_xlat0.x = u_xlat34 + vs_TEXCOORD3.z;
    u_xlat0.xy = u_xlat0.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_0.xy = texture(_RasterCardTex, u_xlat0.xy).xy;
    u_xlat16_5.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_52 = u_xlat16_0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_6) + u_xlat16_7;
    u_xlat16_6 = vec4(u_xlat16_52) * u_xlat16_8 + u_xlat16_6;
    u_xlat16_5.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_6.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_5.xzw * u_xlat16_8.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat17.x = u_xlat16_17.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat17.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb34 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb34) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_54) * u_xlat11.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb34 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb34)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat17.xxx * u_xlat16_12.xyz;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat17.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat17.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat17.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat14.x;
    u_xlat11.x = u_xlat17.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_13.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat17.y;
    u_xlat17.y = u_xlat14.z;
    u_xlat17.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_13.xyz, u_xlat17.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat14.xyz = u_xlat17.xxx * u_xlat11.xyz;
    u_xlat34 = dot(u_xlat14.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat34) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat34 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat34) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat51) + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat51 = (-u_xlat34) * u_xlat16_52 + u_xlat34;
    u_xlat51 = u_xlat34 * u_xlat51 + u_xlat16_52;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat34;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_52 + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_52;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat9.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat55;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat55 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz;
    u_xlat55 = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_54) + 1.0;
    u_xlat21 = u_xlat55 * u_xlat55;
    u_xlat38 = u_xlat16_52 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat38 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_52 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat51 = u_xlat51 * u_xlat21;
    u_xlat16_54 = u_xlat4.x * u_xlat4.x;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_59 = u_xlat4.x * u_xlat16_54;
    u_xlat4.x = (-u_xlat16_54) * u_xlat4.x + 1.0;
    u_xlat16_5.xzw = u_xlat16_2.yyy * u_xlat16_5.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xzw;
    u_xlat55 = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat55) * vec3(u_xlat16_59) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat16_1.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat11.xyz) * u_xlat17.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat14.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_19.xxx * u_xlat16_10.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_54 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_54;
    u_xlat34 = min(u_xlat16_19.x, 1.0);
    u_xlat51 = min(u_xlat34, u_xlat16_9.z);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = dot((-u_xlat16_3.xyz), u_xlat14.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat15.xyz = (-u_xlat14.xyz) * u_xlat16_8.xxx + (-u_xlat16_3.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat15.xyz);
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_10.x = u_xlat16_53 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_10.x = u_xlat16_36 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_36 = u_xlat16_8.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_55 + (-u_xlat16_58);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_58;
    u_xlat16_36 = u_xlat16_54 * u_xlat16_36;
    u_xlat51 = u_xlat51 * u_xlat16_36;
    u_xlat16_36 = u_xlat34 * 0.5;
    u_xlat16_53 = (-u_xlat34) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat51 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_54 = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_54 + u_xlat16_53;
    u_xlat16_36 = u_xlat34 * u_xlat16_36;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_9.z);
    u_xlat17.xyz = u_xlat11.xyz * u_xlat17.xxx + (-u_xlat15.xyz);
    u_xlat17.xyz = vec3(u_xlat16_52) * u_xlat17.xyz + u_xlat15.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat8.y = u_xlat17.y;
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_52);
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb17)) ? u_xlat16_2.xyw : u_xlat16_10.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xzw;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_5.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xzw = min(max(u_xlat16_5.xzw, 0.0), 1.0);
#else
    u_xlat16_5.xzw = clamp(u_xlat16_5.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw;
    u_xlat16_2.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_6.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat16_5.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_19.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat16_19.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = u_xlat16_19.xx * vs_TEXCOORD3.xy;
    u_xlat16_19.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_19.x>=0.5);
#else
    u_xlatb17 = u_xlat16_19.x>=0.5;
#endif
    u_xlat16_53 = (u_xlatb17) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_54 = (u_xlatb17) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_53 = u_xlat16_53 + u_xlat16_54;
    u_xlat4.x = u_xlat16_53 * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat17.xy = fract(u_xlat4.xy);
    u_xlat17.xy = u_xlat17.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = u_xlat17.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_17.x = texture(_FlowLightMap, u_xlat16_19.xy).x;
    u_xlat16_34.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat16_0.x * u_xlat16_34.x;
    u_xlat16_36 = u_xlat16_17.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_5.xzw = u_xlat16_19.xxx * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_outlineIntensity);
    u_xlat16_19.x = u_xlat16_36 * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_19.xxx * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat16_3.xyz);
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
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_34.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat21;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat38;
float u_xlat51;
int u_xlati51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
mediump float u_xlat16_55;
int u_xlati55;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_52 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_3.xyz = vec3(u_xlat16_52) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_52) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat34 = dot(u_xlat16_3.xyz, vs_TEXCOORD7.xyz);
    u_xlat34 = u_xlat34 + _U_RasterCardTex;
    u_xlat0.x = u_xlat34 + vs_TEXCOORD3.z;
    u_xlat0.xy = u_xlat0.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_0.xy = texture(_RasterCardTex, u_xlat0.xy).xy;
    u_xlat16_5.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_52 = u_xlat16_0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_8 = (-u_xlat16_6) + u_xlat16_7;
    u_xlat16_6 = vec4(u_xlat16_52) * u_xlat16_8 + u_xlat16_6;
    u_xlat16_5.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_6.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_9.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_5.xzw * u_xlat16_8.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_52 = (-u_xlat16_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat17.x = u_xlat16_17.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat17.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb34 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb34) ? 1.0 : 0.0;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_10.xyz = vec3(u_xlat16_54) * u_xlat11.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb34 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_12.xy = (bool(u_xlatb34)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.yyy + u_xlat16_13.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat17.xxx * u_xlat16_12.xyz;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat17.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat17.xyz = u_xlat17.xxx * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat17.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat17.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat14.x;
    u_xlat11.x = u_xlat17.z;
    u_xlat16_15.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_13.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat17.y;
    u_xlat17.y = u_xlat14.z;
    u_xlat17.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_13.xyz, u_xlat17.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_13.xyz, u_xlat14.xyz);
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat17.x = max(u_xlat17.x, 1.17549435e-38);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat14.xyz = u_xlat17.xxx * u_xlat11.xyz;
    u_xlat34 = dot(u_xlat14.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat34) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat34 = dot(u_xlat14.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat34) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat14.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat51) + u_xlat16_10.xyz;
    u_xlat16_2.xy = u_xlat16_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat51 = (-u_xlat34) * u_xlat16_52 + u_xlat34;
    u_xlat51 = u_xlat34 * u_xlat51 + u_xlat16_52;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat34;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat14.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_52 + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_52;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat9.x;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat55;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat55 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz;
    u_xlat55 = dot(u_xlat14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_54) + 1.0;
    u_xlat21 = u_xlat55 * u_xlat55;
    u_xlat38 = u_xlat16_52 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat38 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_52 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat51 = u_xlat51 * u_xlat21;
    u_xlat16_54 = u_xlat4.x * u_xlat4.x;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_54 = u_xlat4.x * u_xlat16_54;
    u_xlat16_59 = u_xlat4.x * u_xlat16_54;
    u_xlat4.x = (-u_xlat16_54) * u_xlat4.x + 1.0;
    u_xlat16_5.xzw = u_xlat16_2.yyy * u_xlat16_5.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xzw;
    u_xlat55 = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat55) * vec3(u_xlat16_59) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat16_1.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat11.xyz) * u_xlat17.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat14.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_19.xxx * u_xlat16_10.xyz;
    u_xlat16_19.x = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_54 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_54;
    u_xlat34 = min(u_xlat16_19.x, 1.0);
    u_xlat51 = min(u_xlat34, u_xlat16_9.z);
    u_xlat16_12.xyz = u_xlat16_8.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat51) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat51) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat51) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat51) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_13.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_16.xyz;
    u_xlati51 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati51].xyz;
    u_xlati51 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati51].xyz + u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = dot((-u_xlat16_3.xyz), u_xlat14.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat15.xyz = (-u_xlat14.xyz) * u_xlat16_8.xxx + (-u_xlat16_3.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat15.xyz);
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_10.x = u_xlat16_53 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_10.x = u_xlat16_36 * 16.0 + u_xlat16_10.z;
    u_xlat16_8.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_36 = u_xlat16_8.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_55 + (-u_xlat16_58);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_58;
    u_xlat16_36 = u_xlat16_54 * u_xlat16_36;
    u_xlat51 = u_xlat51 * u_xlat16_36;
    u_xlat16_36 = u_xlat34 * 0.5;
    u_xlat16_53 = (-u_xlat34) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat51 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_54 = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_54 + u_xlat16_53;
    u_xlat16_36 = u_xlat34 * u_xlat16_36;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_9.z);
    u_xlat17.xyz = u_xlat11.xyz * u_xlat17.xxx + (-u_xlat15.xyz);
    u_xlat17.xyz = vec3(u_xlat16_52) * u_xlat17.xyz + u_xlat15.xyz;
    u_xlat16_8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat8.y = u_xlat17.y;
    u_xlat8.xz = u_xlat16_8.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_8 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_52);
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_8.xyz;
    u_xlat17.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb17)) ? u_xlat16_2.xyw : u_xlat16_10.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xzw;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_5.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xzw = min(max(u_xlat16_5.xzw, 0.0), 1.0);
#else
    u_xlat16_5.xzw = clamp(u_xlat16_5.xzw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xzw;
    u_xlat16_2.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_6.w * _albedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _albedoColor.w;
    u_xlat16_17.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _emissiveColor.xyz;
    u_xlat16_5.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_19.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_5.xzw + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
    u_xlat16_19.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = u_xlat16_19.xx * vs_TEXCOORD3.xy;
    u_xlat16_19.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_19.x>=0.5);
#else
    u_xlatb17 = u_xlat16_19.x>=0.5;
#endif
    u_xlat16_53 = (u_xlatb17) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_54 = (u_xlatb17) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_53 = u_xlat16_53 + u_xlat16_54;
    u_xlat4.x = u_xlat16_53 * _Time.y;
    u_xlat4.y = _FlowLightFactory.z * _Time.y;
    u_xlat17.xy = fract(u_xlat4.xy);
    u_xlat17.xy = u_xlat17.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = u_xlat17.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_17.x = texture(_FlowLightMap, u_xlat16_19.xy).x;
    u_xlat16_34.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat16_0.x * u_xlat16_34.x;
    u_xlat16_36 = u_xlat16_17.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_5.xzw = u_xlat16_19.xxx * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_outlineIntensity);
    u_xlat16_19.x = u_xlat16_36 * _FlowLightFactory.x;
    u_xlat16_1.xyz = u_xlat16_19.xxx * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _outlineColor.xyz + u_xlat16_1.xyz;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat16_3.xyz);
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
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_34.yyy + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
float u_xlat19;
mediump vec2 u_xlat16_19;
float u_xlat20;
float u_xlat21;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat40;
mediump vec2 u_xlat16_44;
float u_xlat57;
mediump float u_xlat16_57;
float u_xlat59;
mediump float u_xlat16_59;
bool u_xlatb59;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_10.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57 = dot(u_xlat16_10.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat1.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat1.xy = u_xlat1.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_1.xy = texture(_RasterCardTex, u_xlat1.xy).xy;
    u_xlat16_11.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_63 = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_4 = (-u_xlat16_1) + u_xlat16_3;
    u_xlat16_1 = vec4(u_xlat16_63) * u_xlat16_4 + u_xlat16_1;
    u_xlat16_11.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_1.xyz * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_1.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat59) * u_xlat16_14.xyz;
    u_xlat59 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat64) + u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_63 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat19 = (-u_xlat59) * u_xlat16_63 + u_xlat59;
    u_xlat19 = u_xlat59 * u_xlat19 + u_xlat16_63;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat19 + u_xlat59;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat9.x) * u_xlat16_63 + u_xlat9.x;
    u_xlat64 = u_xlat9.x * u_xlat64 + u_xlat16_63;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat9.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat19 = u_xlat19 * u_xlat64;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat64);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat21 = u_xlat64 * u_xlat64;
    u_xlat40 = u_xlat16_63 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat40 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_63 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat19 = u_xlat19 * u_xlat21;
    u_xlat16_67 = u_xlat2.x * u_xlat2.x;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_69 = u_xlat2.x * u_xlat16_67;
    u_xlat2.x = (-u_xlat16_67) * u_xlat2.x + 1.0;
    u_xlat16_11.xzw = u_xlat16_8.yyy * u_xlat16_11.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_11.xzw;
    u_xlat64 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat64) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_67) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_67;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati38 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_10.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat18.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_10.xyz);
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_14.w);
    u_xlat16_32.x = u_xlat16_13.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_14.x = u_xlat16_32.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_59 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32.x = u_xlat16_38 + (-u_xlat16_59);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32.x + u_xlat16_59;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32.x = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32.x + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_4.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat18.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat18.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_63 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_11.xzw = vec3(u_xlat16_69) * u_xlat16_11.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_11.xzw;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xzw) + _FogCol.xyz;
    u_xlat16_11.xzw = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xzw;
    u_xlat16_44.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_44.xy = u_xlat16_44.xx * vs_TEXCOORD3.xy;
    u_xlat16_44.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_44.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_44.x>=0.5);
#else
    u_xlatb0 = u_xlat16_44.x>=0.5;
#endif
    u_xlat16_67 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_12.x = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_67 = u_xlat16_67 + u_xlat16_12.x;
    u_xlat0.x = u_xlat16_67 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_44.xy;
    u_xlat16_44.xy = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_44.xy).x;
    u_xlat16_19.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_44.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_0.x * u_xlat16_44.x;
    u_xlat16_44.x = u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_44.xxx;
    u_xlat0.xyw = u_xlat16_11.yyy * u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_44.x = u_xlat16_63 * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_44.xxx * _FlowLightColor.xyz + u_xlat16_11.xzw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_44.x = max(_fresnelRange, 0.0);
    u_xlat16_44.x = u_xlat2.x * u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_44.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_19.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_25;
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
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
float u_xlat19;
mediump vec2 u_xlat16_19;
float u_xlat20;
float u_xlat21;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat40;
mediump vec2 u_xlat16_44;
float u_xlat57;
mediump float u_xlat16_57;
float u_xlat59;
mediump float u_xlat16_59;
bool u_xlatb59;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat19 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.y = vs_TEXCOORD3.w + _V_RasterCardTex;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_10.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57 = dot(u_xlat16_10.xyz, vs_TEXCOORD7.xyz);
    u_xlat57 = u_xlat57 + _U_RasterCardTex;
    u_xlat1.x = u_xlat57 + vs_TEXCOORD3.z;
    u_xlat1.xy = u_xlat1.xy * _RasterCardTex_ST.xy + _RasterCardTex_ST.zw;
    u_xlat16_1.xy = texture(_RasterCardTex, u_xlat1.xy).xy;
    u_xlat16_11.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_57 = texture(_outlineMask, vs_TEXCOORD3.zw).z;
    u_xlat16_63 = u_xlat16_57 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = texture(_albedoMap2, vs_TEXCOORD3.xy);
    u_xlat16_4 = (-u_xlat16_1) + u_xlat16_3;
    u_xlat16_1 = vec4(u_xlat16_63) * u_xlat16_4 + u_xlat16_1;
    u_xlat16_11.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xzw = u_xlat16_1.xyz * u_xlat16_11.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_1.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat59) * u_xlat16_14.xyz;
    u_xlat59 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_69 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_15.x, u_xlat16_67);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat64) + u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_63 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat19 = (-u_xlat59) * u_xlat16_63 + u_xlat59;
    u_xlat19 = u_xlat59 * u_xlat19 + u_xlat16_63;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat19 + u_xlat59;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat9.x) * u_xlat16_63 + u_xlat9.x;
    u_xlat64 = u_xlat9.x * u_xlat64 + u_xlat16_63;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat9.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat19 = u_xlat19 * u_xlat64;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat64 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat64);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat21 = u_xlat64 * u_xlat64;
    u_xlat40 = u_xlat16_63 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat40 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_63 / u_xlat21;
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat19 = u_xlat19 * u_xlat21;
    u_xlat16_67 = u_xlat2.x * u_xlat2.x;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_67 = u_xlat2.x * u_xlat16_67;
    u_xlat16_69 = u_xlat2.x * u_xlat16_67;
    u_xlat2.x = (-u_xlat16_67) * u_xlat2.x + 1.0;
    u_xlat16_11.xzw = u_xlat16_8.yyy * u_xlat16_11.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_11.xzw;
    u_xlat64 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat64) * vec3(u_xlat16_69) + u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    u_xlat16_67 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_67) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_69 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_8.w * u_xlat16_67;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati38 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_10.xyz), u_xlat7.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat18.xyz = (-u_xlat7.xyz) * u_xlat16_13.xxx + (-u_xlat16_10.xyz);
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_14.w);
    u_xlat16_32.x = u_xlat16_13.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_14.x = u_xlat16_32.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_32.xz = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_59 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32.x = u_xlat16_38 + (-u_xlat16_59);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32.x + u_xlat16_59;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32.x = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32.x + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_4.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat18.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat18.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_63 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_63);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_11.xzw = vec3(u_xlat16_69) * u_xlat16_11.xzw;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_11.xzw;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xzw = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xzw) + _FogCol.xyz;
    u_xlat16_11.xzw = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xzw;
    u_xlat16_44.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_44.xy = u_xlat16_44.xx * vs_TEXCOORD3.xy;
    u_xlat16_44.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD3.zw + u_xlat16_44.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_44.x>=0.5);
#else
    u_xlatb0 = u_xlat16_44.x>=0.5;
#endif
    u_xlat16_67 = (u_xlatb0) ? (-_FlowLightFactory.y) : 0.0;
    u_xlat16_12.x = (u_xlatb0) ? 0.0 : _FlowLightFactory.y;
    u_xlat16_67 = u_xlat16_67 + u_xlat16_12.x;
    u_xlat0.x = u_xlat16_67 * _Time.y;
    u_xlat0.y = _FlowLightFactory.z * _Time.y;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_44.xy;
    u_xlat16_44.xy = u_xlat0.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_0.x = texture(_FlowLightMap, u_xlat16_44.xy).x;
    u_xlat16_19.xy = texture(_outlineMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_44.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat16_63 = u_xlat16_0.x * u_xlat16_44.x;
    u_xlat16_44.x = u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_44.xxx;
    u_xlat0.xyw = u_xlat16_11.yyy * u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_outlineIntensity);
    u_xlat16_44.x = u_xlat16_63 * _FlowLightFactory.x;
    u_xlat16_11.xyz = u_xlat16_44.xxx * _FlowLightColor.xyz + u_xlat16_11.xzw;
    u_xlat0.xyw = u_xlat0.xyw * _outlineColor.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _fresnelPow;
    u_xlat16_44.x = max(_fresnelRange, 0.0);
    u_xlat16_44.x = u_xlat2.x * u_xlat16_44.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44.x = min(max(u_xlat16_44.x, 0.0), 1.0);
#else
    u_xlat16_44.x = clamp(u_xlat16_44.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_44.xxx * _fresnelColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_19.yyy + u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_25;
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
  GpuProgramID 87735
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_RasterCardGUI"
}