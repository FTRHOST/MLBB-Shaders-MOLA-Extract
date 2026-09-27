//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/Lit/PBR(SkirtTrasparent)" {
Properties {

_renderingMode ("渲染模式", Float) = 0.0

_albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

_materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

_normalMap ("normalMap", 2D) = "bump" { }

[Toggle(_VISIBILITY_BAKE)] _VisibilityBake ("VisiblityBake", Float) = 0.0

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_detailsControl ("细节控制", Vector) = (4,0.179,0,0)

[Toggle] _flowMapUse2U ("FlowMapUse2U", Float) = 0.0

_flowMap ("Flow Map", 2D) = "black" { }

_FeatureMask ("FeatureMask", 2D) = "black" { }

_flowParams ("Flow Params", Vector) = (0.5,0.5,0,0)

_WaveFlowTintColor ("WaveFlowTintColor", Color) = (1,1,1,1)

_cull ("__cull", Float) = 2.0

}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Transparent" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 4035
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
uniform 	mediump vec4 _albedoMap_ST;
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _WaveFlowTintColor;
uniform 	mediump float _flowMapUse2U;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _flowParams;
uniform 	mediump vec4 _detailsControl;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _flowMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FeatureMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
float u_xlat11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump float u_xlat16_17;
int u_xlati17;
bool u_xlatb17;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat24;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_37;
float u_xlat41;
float u_xlat43;
mediump float u_xlat16_44;
mediump float u_xlat16_48;
mediump float u_xlat16_51;
bool u_xlatb51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
int u_xlati55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
float u_xlat60;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD5.wwww, vec4(0.100000001, 0.949999988, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz;
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * _albedoColor.xyz;
    u_xlat16_53 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat4.z;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat4.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_5.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat4.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_22.xyz = u_xlat16_5.xxx * u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat16_57 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_10 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_10);
    u_xlat16_18.xyz = u_xlat16_18.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_3.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_20 = max(u_xlat16_20, 0.0078125);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_20, 0.0078125);
    u_xlat16_10 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_27.x = (-u_xlat16_10) + u_xlat16_27.x;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_27.x + u_xlat16_10;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_10;
    u_xlat16_10 = u_xlat16_57 * u_xlat16_10;
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_5.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat17 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat9.xyz = vec3(u_xlat17) * u_xlat9.xyz;
    u_xlat17 = dot(u_xlat4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat16_27.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat58 = u_xlat16_20 + -1.0;
    u_xlat17 = u_xlat17 * u_xlat58 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_20 / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat59 = (-u_xlat9.x) * u_xlat16_20 + u_xlat9.x;
    u_xlat59 = u_xlat9.x * u_xlat59 + u_xlat16_20;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat9.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat43 = (-u_xlat55) * u_xlat16_20 + u_xlat55;
    u_xlat43 = u_xlat55 * u_xlat43 + u_xlat16_20;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat55 + u_xlat43;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat59 * u_xlat43;
    u_xlat43 = float(1.0) / u_xlat43;
    u_xlat43 = min(u_xlat43, 16.0);
    u_xlat60 = (-u_xlat16_27.x) + 1.0;
    u_xlat16_27.x = u_xlat60 * u_xlat60;
    u_xlat16_27.x = u_xlat60 * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat60 * u_xlat16_27.x;
    u_xlat16_44 = u_xlat60 * u_xlat16_27.x;
    u_xlat11 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_27.x) * u_xlat60 + 1.0;
    u_xlat28.xyz = u_xlat16_18.xyz * vec3(u_xlat60);
    u_xlat28.xyz = vec3(u_xlat11) * vec3(u_xlat16_44) + u_xlat28.xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat17 = u_xlat17 * u_xlat43;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat17);
    u_xlat28.xyz = u_xlat28.xyz * _directSpecularColor.xyz;
    u_xlat28.xyz = vec3(u_xlat55) * u_xlat28.xyz;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_29.xyz = u_xlat16_29.xxx * u_xlat13.xyz;
    u_xlat16_14.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_31 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_48 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_29.xyz);
    u_xlat16_48 = u_xlat16_48 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_31 = max(u_xlat16_31, u_xlat16_48);
    u_xlat16_48 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48;
    u_xlat16_12.x = max(u_xlat16_14.x, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_31 * u_xlat16_12.x;
    u_xlat16_14.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xxx + u_xlat16_29.xyz;
    u_xlat17 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat7.xyz = vec3(u_xlat17) * u_xlat7.xyz;
    u_xlat17 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_29.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat58 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_20 / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat24.x = (-u_xlat7.x) * u_xlat16_20 + u_xlat7.x;
    u_xlat24.x = u_xlat7.x * u_xlat24.x + u_xlat16_20;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat7.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat24.x * u_xlat59;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat41 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat41 * u_xlat41;
    u_xlat16_5.x = u_xlat41 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat41 * u_xlat16_5.x;
    u_xlat16_12.x = u_xlat41 * u_xlat16_5.x;
    u_xlat41 = (-u_xlat16_5.x) * u_xlat41 + 1.0;
    u_xlat13.xyz = u_xlat16_18.xyz * vec3(u_xlat41);
    u_xlat13.xyz = vec3(u_xlat11) * u_xlat16_12.xxx + u_xlat13.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat7.xxx * u_xlat16_12.xyz;
    u_xlat17 = u_xlat17 * u_xlat24.x;
    u_xlat24.xyz = u_xlat13.xyz * vec3(u_xlat17);
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat24.xyz;
    u_xlat7.xyz = u_xlat16_14.xyz * u_xlat7.xyz;
    u_xlat16_14.xyz = u_xlat28.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_12.y = u_xlat16_6.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati17 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_5.x = min(u_xlat16_0.z, u_xlat16_10);
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_63 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_5.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_5.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlati55 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati55].xyz;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlati17 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_12.xyw;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_5.x = dot((-u_xlat16_22.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat7.xyz = (-u_xlat4.xyz) * u_xlat16_5.xxx + (-u_xlat16_22.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat8.xyz = vec3(u_xlat16_20) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_20 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_5.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_37.x = floor(u_xlat16_7.w);
    u_xlat16_54 = u_xlat16_37.x + 1.0;
    u_xlat16_54 = min(u_xlat16_54, 15.0);
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_37.x);
    u_xlat16_7.x = u_xlat16_37.x * 16.0 + u_xlat16_7.y;
    u_xlat16_16.x = u_xlat16_54 * 16.0 + u_xlat16_7.y;
    u_xlat16_37.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_37.xy = u_xlat16_37.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xy).x;
    u_xlat16_16.y = u_xlat16_7.z;
    u_xlat16_37.xy = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_37.xy = u_xlat16_37.xy * vec2(0.00390625, 0.0625);
    u_xlat16_17 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xy).x;
    u_xlat16_37.x = (-u_xlat16_0.x) + u_xlat16_17;
    u_xlat16_37.x = u_xlat16_5.x * u_xlat16_37.x + u_xlat16_0.x;
    u_xlat16_37.x = u_xlat16_57 * u_xlat16_37.x;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_10 * 0.5;
    u_xlat16_54 = (-u_xlat16_10) * 0.5 + 1.0;
    u_xlat16_37.x = u_xlat0.x * u_xlat16_54 + u_xlat16_37.x;
    u_xlat16_54 = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat16_5.x = (-u_xlat16_37.x) * 2.0 + 1.0;
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_5.x + u_xlat16_54;
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_10;
    u_xlat16_37.x = min(u_xlat16_0.z, u_xlat16_37.x);
    u_xlat16_54 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_54;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_20);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb0.x) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat9.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_18.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.xyw = u_xlat16_18.xyz * u_xlat16_37.xxx + u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_53;
    u_xlat16_3.xyw = u_xlat16_14.xyz + u_xlat16_27.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + u_xlat16_3.xyw;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_37.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_18.xyz) + _FogCol.xyz;
    u_xlat16_18.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat16_18.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0<u_xlat16_1.x);
#else
    u_xlatb51 = 0.0<u_xlat16_1.x;
#endif
    if(u_xlatb51){
        u_xlat16_51 = texture(_FeatureMask, vs_TEXCOORD3.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<_flowMapUse2U);
#else
        u_xlatb4 = 0.0<_flowMapUse2U;
#endif
        u_xlat16_1 = (bool(u_xlatb4)) ? vs_TEXCOORD3.zwzw : vs_TEXCOORD3.xyxy;
        u_xlat16_4.xy = texture(_flowMap, u_xlat16_1.zw).xy;
        u_xlat1 = u_xlat16_4.xyxy * _detailsControl.zzzz + u_xlat16_1;
        u_xlat1 = u_xlat1 + vec4(0.0, 0.5, 0.0, 0.5);
        u_xlat2 = _flowParams * _Time.yyyy;
        u_xlat2 = fract(u_xlat2);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat16_4.x = texture(_flowMap, u_xlat1.xy).x;
        u_xlat16_21 = texture(_flowMap, u_xlat1.zw).y;
        u_xlat16_3.x = max(u_xlat16_21, u_xlat16_4.x);
        u_xlat16_3.xyz = u_xlat16_3.xxx * _WaveFlowTintColor.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _WaveFlowTintColor.www;
        u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
        SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_51) + u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat0.xyz;
    }
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
uniform 	mediump vec4 _albedoMap_ST;
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _WaveFlowTintColor;
uniform 	mediump float _flowMapUse2U;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _flowParams;
uniform 	mediump vec4 _detailsControl;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _flowMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FeatureMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
float u_xlat11;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
mediump float u_xlat16_17;
int u_xlati17;
bool u_xlatb17;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat24;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_37;
float u_xlat41;
float u_xlat43;
mediump float u_xlat16_44;
mediump float u_xlat16_48;
mediump float u_xlat16_51;
bool u_xlatb51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
float u_xlat55;
int u_xlati55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
float u_xlat60;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD5.wwww, vec4(0.100000001, 0.949999988, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz;
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * _albedoColor.xyz;
    u_xlat16_53 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat4.z;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat4.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_5.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat4.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_22.xyz = u_xlat16_5.xxx * u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat16_57 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_10 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_10);
    u_xlat16_18.xyz = u_xlat16_18.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_3.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_20 = max(u_xlat16_20, 0.0078125);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_20, 0.0078125);
    u_xlat16_10 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_27.x = (-u_xlat16_10) + u_xlat16_27.x;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_27.x + u_xlat16_10;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_10;
    u_xlat16_10 = u_xlat16_57 * u_xlat16_10;
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_5.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat17 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat9.xyz = vec3(u_xlat17) * u_xlat9.xyz;
    u_xlat17 = dot(u_xlat4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat16_27.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat58 = u_xlat16_20 + -1.0;
    u_xlat17 = u_xlat17 * u_xlat58 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_20 / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat59 = (-u_xlat9.x) * u_xlat16_20 + u_xlat9.x;
    u_xlat59 = u_xlat9.x * u_xlat59 + u_xlat16_20;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat9.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat43 = (-u_xlat55) * u_xlat16_20 + u_xlat55;
    u_xlat43 = u_xlat55 * u_xlat43 + u_xlat16_20;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat55 + u_xlat43;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat59 * u_xlat43;
    u_xlat43 = float(1.0) / u_xlat43;
    u_xlat43 = min(u_xlat43, 16.0);
    u_xlat60 = (-u_xlat16_27.x) + 1.0;
    u_xlat16_27.x = u_xlat60 * u_xlat60;
    u_xlat16_27.x = u_xlat60 * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat60 * u_xlat16_27.x;
    u_xlat16_44 = u_xlat60 * u_xlat16_27.x;
    u_xlat11 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_27.x) * u_xlat60 + 1.0;
    u_xlat28.xyz = u_xlat16_18.xyz * vec3(u_xlat60);
    u_xlat28.xyz = vec3(u_xlat11) * vec3(u_xlat16_44) + u_xlat28.xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat17 = u_xlat17 * u_xlat43;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat17);
    u_xlat28.xyz = u_xlat28.xyz * _directSpecularColor.xyz;
    u_xlat28.xyz = vec3(u_xlat55) * u_xlat28.xyz;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_29.xyz = u_xlat16_29.xxx * u_xlat13.xyz;
    u_xlat16_14.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_31 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_48 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_29.xyz);
    u_xlat16_48 = u_xlat16_48 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_31 = max(u_xlat16_31, u_xlat16_48);
    u_xlat16_48 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48;
    u_xlat16_12.x = max(u_xlat16_14.x, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_31 * u_xlat16_12.x;
    u_xlat16_14.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xxx + u_xlat16_29.xyz;
    u_xlat17 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat7.xyz = vec3(u_xlat17) * u_xlat7.xyz;
    u_xlat17 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_29.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat58 + 1.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat16_20 / u_xlat17;
    u_xlat17 = u_xlat17 * 0.318309873;
    u_xlat17 = min(u_xlat17, 16.0);
    u_xlat24.x = (-u_xlat7.x) * u_xlat16_20 + u_xlat7.x;
    u_xlat24.x = u_xlat7.x * u_xlat24.x + u_xlat16_20;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat7.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat24.x * u_xlat59;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat41 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat41 * u_xlat41;
    u_xlat16_5.x = u_xlat41 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat41 * u_xlat16_5.x;
    u_xlat16_12.x = u_xlat41 * u_xlat16_5.x;
    u_xlat41 = (-u_xlat16_5.x) * u_xlat41 + 1.0;
    u_xlat13.xyz = u_xlat16_18.xyz * vec3(u_xlat41);
    u_xlat13.xyz = vec3(u_xlat11) * u_xlat16_12.xxx + u_xlat13.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat7.xxx * u_xlat16_12.xyz;
    u_xlat17 = u_xlat17 * u_xlat24.x;
    u_xlat24.xyz = u_xlat13.xyz * vec3(u_xlat17);
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat24.xyz;
    u_xlat7.xyz = u_xlat16_14.xyz * u_xlat7.xyz;
    u_xlat16_14.xyz = u_xlat28.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_12.y = u_xlat16_6.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati17 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_5.x = min(u_xlat16_0.z, u_xlat16_10);
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_63 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_5.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_5.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlati55 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati55].xyz;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlati17 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_12.xyw;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_5.x = dot((-u_xlat16_22.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat7.xyz = (-u_xlat4.xyz) * u_xlat16_5.xxx + (-u_xlat16_22.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat8.xyz = vec3(u_xlat16_20) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_20 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_5.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_37.x = floor(u_xlat16_7.w);
    u_xlat16_54 = u_xlat16_37.x + 1.0;
    u_xlat16_54 = min(u_xlat16_54, 15.0);
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_37.x);
    u_xlat16_7.x = u_xlat16_37.x * 16.0 + u_xlat16_7.y;
    u_xlat16_16.x = u_xlat16_54 * 16.0 + u_xlat16_7.y;
    u_xlat16_37.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_37.xy = u_xlat16_37.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xy).x;
    u_xlat16_16.y = u_xlat16_7.z;
    u_xlat16_37.xy = u_xlat16_16.xy + vec2(0.5, 0.5);
    u_xlat16_37.xy = u_xlat16_37.xy * vec2(0.00390625, 0.0625);
    u_xlat16_17 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xy).x;
    u_xlat16_37.x = (-u_xlat16_0.x) + u_xlat16_17;
    u_xlat16_37.x = u_xlat16_5.x * u_xlat16_37.x + u_xlat16_0.x;
    u_xlat16_37.x = u_xlat16_57 * u_xlat16_37.x;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat16_10 * 0.5;
    u_xlat16_54 = (-u_xlat16_10) * 0.5 + 1.0;
    u_xlat16_37.x = u_xlat0.x * u_xlat16_54 + u_xlat16_37.x;
    u_xlat16_54 = u_xlat16_37.x + u_xlat16_37.x;
    u_xlat16_5.x = (-u_xlat16_37.x) * 2.0 + 1.0;
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_5.x + u_xlat16_54;
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_10;
    u_xlat16_37.x = min(u_xlat16_0.z, u_xlat16_37.x);
    u_xlat16_54 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_54;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_20);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb0.x) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat9.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_18.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.xyw = u_xlat16_18.xyz * u_xlat16_37.xxx + u_xlat16_14.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_53;
    u_xlat16_3.xyw = u_xlat16_14.xyz + u_xlat16_27.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz + u_xlat16_3.xyw;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_37.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_18.xyz) + _FogCol.xyz;
    u_xlat16_18.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat16_18.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0<u_xlat16_1.x);
#else
    u_xlatb51 = 0.0<u_xlat16_1.x;
#endif
    if(u_xlatb51){
        u_xlat16_51 = texture(_FeatureMask, vs_TEXCOORD3.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<_flowMapUse2U);
#else
        u_xlatb4 = 0.0<_flowMapUse2U;
#endif
        u_xlat16_1 = (bool(u_xlatb4)) ? vs_TEXCOORD3.zwzw : vs_TEXCOORD3.xyxy;
        u_xlat16_4.xy = texture(_flowMap, u_xlat16_1.zw).xy;
        u_xlat1 = u_xlat16_4.xyxy * _detailsControl.zzzz + u_xlat16_1;
        u_xlat1 = u_xlat1 + vec4(0.0, 0.5, 0.0, 0.5);
        u_xlat2 = _flowParams * _Time.yyyy;
        u_xlat2 = fract(u_xlat2);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat16_4.x = texture(_flowMap, u_xlat1.xy).x;
        u_xlat16_21 = texture(_flowMap, u_xlat1.zw).y;
        u_xlat16_3.x = max(u_xlat16_21, u_xlat16_4.x);
        u_xlat16_3.xyz = u_xlat16_3.xxx * _WaveFlowTintColor.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _WaveFlowTintColor.www;
        u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
        SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_51) + u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat0.xyz;
    }
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
uniform 	mediump vec4 _albedoMap_ST;
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _WaveFlowTintColor;
uniform 	mediump float _flowMapUse2U;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _flowParams;
uniform 	mediump vec4 _detailsControl;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _flowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FeatureMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump float u_xlat16_10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
int u_xlati19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat26;
mediump vec3 u_xlat16_29;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_41;
vec2 u_xlat47;
mediump float u_xlat16_48;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
int u_xlati61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD5.wwww, vec4(0.100000001, 0.949999988, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_20.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_0.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_0.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * _albedoColor.xyz;
    u_xlat16_59 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat4.z;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat4.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_5.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat4.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_24.xyz = u_xlat16_5.xxx * u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_10 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_10);
    u_xlat16_20.xyz = u_xlat16_20.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_20.xyz = u_xlat16_3.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat16_10 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_29.x = (-u_xlat16_10) + u_xlat16_29.x;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_29.x + u_xlat16_10;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_10;
    u_xlat16_10 = u_xlat16_63 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat61 = (-u_xlat61) * u_xlat61 + 1.0;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(u_xlat61) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb19)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat12;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat12 = u_xlat9.yyyy * u_xlat12;
    u_xlat11 = u_xlat11 * u_xlat9.xxxx + u_xlat12;
    u_xlat9 = u_xlat13 * u_xlat9.zzzz + u_xlat11;
    u_xlat9 = u_xlat14 + u_xlat9;
    u_xlat19 = _ShadowBias.x / u_xlat9.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat19 = (-u_xlat19) + u_xlat9.z;
    u_xlat61 = max((-u_xlat9.w), u_xlat19);
    u_xlat61 = (-u_xlat19) + u_xlat61;
    u_xlat9.z = _ShadowBias.y * u_xlat61 + u_xlat19;
    u_xlat9.xyz = u_xlat9.xyz / u_xlat9.www;
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat9.w = max(u_xlat9.z, 9.99999975e-05);
    u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat11.xyz = u_xlat9.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat11.xy,u_xlat11.z);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat12.z = 0.0;
    u_xlat12.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec1 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat12.z = 0.0;
    u_xlat12.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec2 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat12.z = 0.0;
    u_xlat9.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec3 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat19 = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat61 = (-u_xlat16_29.x) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat61 + u_xlat16_29.x;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = (-u_xlat19) * _shadowStrength + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_5.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat4.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat65 = u_xlat16_22 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat65 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_22 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat47.x = (-u_xlat9.x) * u_xlat16_22 + u_xlat9.x;
    u_xlat47.x = u_xlat9.x * u_xlat47.x + u_xlat16_22;
    u_xlat47.x = sqrt(u_xlat47.x);
    u_xlat47.x = u_xlat47.x + u_xlat9.x;
    u_xlat66 = (-u_xlat64) * u_xlat16_22 + u_xlat64;
    u_xlat66 = u_xlat64 * u_xlat66 + u_xlat16_22;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat47.y = u_xlat64 + u_xlat66;
    u_xlat47.xy = u_xlat47.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat66 = u_xlat47.y * u_xlat47.x;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat11.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat11.x * u_xlat11.x;
    u_xlat16_29.x = u_xlat11.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat11.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat11.x * u_xlat16_29.x;
    u_xlat30 = u_xlat16_20.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_29.x) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_20.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_48) + u_xlat11.xzw;
    u_xlat16_29.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_15.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = vec3(u_xlat19) * u_xlat16_15.xyz + u_xlat16_29.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_29.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat19 = u_xlat61 * u_xlat66;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat19);
    u_xlat11.xzw = u_xlat11.xzw * _directSpecularColor.xyz;
    u_xlat11.xzw = vec3(u_xlat64) * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_72);
    u_xlat16_16.xyz = u_xlat12.xyz * u_xlat16_16.xxx;
    u_xlat16_17.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_36 = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_36);
    u_xlat16_36 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_36;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xxx + u_xlat16_16.xyz;
    u_xlat19 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat7.xyz = vec3(u_xlat19) * u_xlat7.xyz;
    u_xlat19 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat65 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_22 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat7.x = (-u_xlat61) * u_xlat16_22 + u_xlat61;
    u_xlat7.x = u_xlat61 * u_xlat7.x + u_xlat16_22;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat61 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat47.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat26 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat26 * u_xlat26;
    u_xlat16_5.x = u_xlat26 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat26 * u_xlat16_5.x;
    u_xlat16_72 = u_xlat26 * u_xlat16_5.x;
    u_xlat26 = (-u_xlat16_5.x) * u_xlat26 + 1.0;
    u_xlat12.xyz = u_xlat16_20.xyz * vec3(u_xlat26);
    u_xlat12.xyz = vec3(u_xlat30) * vec3(u_xlat16_72) + u_xlat12.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = vec3(u_xlat61) * u_xlat16_16.xyz;
    u_xlat19 = u_xlat19 * u_xlat7.x;
    u_xlat7.xyz = u_xlat12.xyz * vec3(u_xlat19);
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_29.xyz = u_xlat11.xzw * u_xlat16_29.xyz + u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_16.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati19 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_5.x = min(u_xlat16_0.z, u_xlat16_10);
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_72 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_5.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlati61 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati61].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlati19 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_5.x = dot((-u_xlat16_24.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat7.xyz = (-u_xlat4.xyz) * u_xlat16_5.xxx + (-u_xlat16_24.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_22 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_5.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_41.x = floor(u_xlat16_7.w);
    u_xlat16_60 = u_xlat16_41.x + 1.0;
    u_xlat16_60 = min(u_xlat16_60, 15.0);
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_41.x);
    u_xlat16_7.x = u_xlat16_41.x * 16.0 + u_xlat16_7.y;
    u_xlat16_18.x = u_xlat16_60 * 16.0 + u_xlat16_7.y;
    u_xlat16_41.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_41.xy).x;
    u_xlat16_18.y = u_xlat16_7.z;
    u_xlat16_41.xy = u_xlat16_18.xy + vec2(0.5, 0.5);
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_41.xy).x;
    u_xlat16_41.x = (-u_xlat16_0.x) + u_xlat16_19;
    u_xlat16_41.x = u_xlat16_5.x * u_xlat16_41.x + u_xlat16_0.x;
    u_xlat16_41.x = u_xlat16_63 * u_xlat16_41.x;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_10 * 0.5;
    u_xlat16_60 = (-u_xlat16_10) * 0.5 + 1.0;
    u_xlat16_41.x = u_xlat0.x * u_xlat16_60 + u_xlat16_41.x;
    u_xlat16_60 = u_xlat16_41.x + u_xlat16_41.x;
    u_xlat16_5.x = (-u_xlat16_41.x) * 2.0 + 1.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_5.x + u_xlat16_60;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_10;
    u_xlat16_41.x = min(u_xlat16_0.z, u_xlat16_41.x);
    u_xlat16_60 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_60;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_22);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb0.x) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat9.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.xyw = u_xlat16_20.xyz * u_xlat16_41.xxx + u_xlat16_29.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_59;
    u_xlat16_3.xyw = u_xlat16_29.xyz + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz + u_xlat16_3.xyw;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_20.xyz) + _FogCol.xyz;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat16_20.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_20.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<u_xlat16_1.x);
#else
    u_xlatb57 = 0.0<u_xlat16_1.x;
#endif
    if(u_xlatb57){
        u_xlat16_57 = texture(_FeatureMask, vs_TEXCOORD3.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<_flowMapUse2U);
#else
        u_xlatb4 = 0.0<_flowMapUse2U;
#endif
        u_xlat16_1 = (bool(u_xlatb4)) ? vs_TEXCOORD3.zwzw : vs_TEXCOORD3.xyxy;
        u_xlat16_4.xy = texture(_flowMap, u_xlat16_1.zw).xy;
        u_xlat1 = u_xlat16_4.xyxy * _detailsControl.zzzz + u_xlat16_1;
        u_xlat1 = u_xlat1 + vec4(0.0, 0.5, 0.0, 0.5);
        u_xlat2 = _flowParams * _Time.yyyy;
        u_xlat2 = fract(u_xlat2);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat16_4.x = texture(_flowMap, u_xlat1.xy).x;
        u_xlat16_23 = texture(_flowMap, u_xlat1.zw).y;
        u_xlat16_3.x = max(u_xlat16_23, u_xlat16_4.x);
        u_xlat16_3.xyz = u_xlat16_3.xxx * _WaveFlowTintColor.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _WaveFlowTintColor.www;
        u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
        SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_57) + u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat0.xyz;
    }
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
uniform 	mediump vec4 _albedoMap_ST;
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _WaveFlowTintColor;
uniform 	mediump float _flowMapUse2U;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _flowParams;
uniform 	mediump vec4 _detailsControl;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _flowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FeatureMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump float u_xlat16_10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
int u_xlati19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat26;
mediump vec3 u_xlat16_29;
float u_xlat30;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_41;
vec2 u_xlat47;
mediump float u_xlat16_48;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
int u_xlati61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD5.wwww, vec4(0.100000001, 0.949999988, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_20.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_0.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_0.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * _albedoColor.xyz;
    u_xlat16_59 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_3.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat4.z;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat4.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_5.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat4.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_24.xyz = u_xlat16_5.xxx * u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_10 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_10);
    u_xlat16_20.xyz = u_xlat16_20.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_20.xyz = u_xlat16_3.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat16_10 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_29.x = (-u_xlat16_10) + u_xlat16_29.x;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_29.x + u_xlat16_10;
    u_xlat16_10 = u_xlat16_3.w * u_xlat16_10;
    u_xlat16_10 = u_xlat16_63 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat61 = (-u_xlat61) * u_xlat61 + 1.0;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(u_xlat61) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb19)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat12;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat12 = u_xlat9.yyyy * u_xlat12;
    u_xlat11 = u_xlat11 * u_xlat9.xxxx + u_xlat12;
    u_xlat9 = u_xlat13 * u_xlat9.zzzz + u_xlat11;
    u_xlat9 = u_xlat14 + u_xlat9;
    u_xlat19 = _ShadowBias.x / u_xlat9.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat19 = (-u_xlat19) + u_xlat9.z;
    u_xlat61 = max((-u_xlat9.w), u_xlat19);
    u_xlat61 = (-u_xlat19) + u_xlat61;
    u_xlat9.z = _ShadowBias.y * u_xlat61 + u_xlat19;
    u_xlat9.xyz = u_xlat9.xyz / u_xlat9.www;
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat9.w = max(u_xlat9.z, 9.99999975e-05);
    u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat11.xyz = u_xlat9.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat11.xy,u_xlat11.z);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat12.z = 0.0;
    u_xlat12.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec1 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat12.z = 0.0;
    u_xlat12.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec2 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat12.z = 0.0;
    u_xlat9.xyz = u_xlat9.xyw + u_xlat12.xyz;
    vec3 txVec3 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat19 = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat61 = (-u_xlat16_29.x) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat61 + u_xlat16_29.x;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = (-u_xlat19) * _shadowStrength + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_5.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat4.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat65 = u_xlat16_22 + -1.0;
    u_xlat61 = u_xlat61 * u_xlat65 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_22 / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat47.x = (-u_xlat9.x) * u_xlat16_22 + u_xlat9.x;
    u_xlat47.x = u_xlat9.x * u_xlat47.x + u_xlat16_22;
    u_xlat47.x = sqrt(u_xlat47.x);
    u_xlat47.x = u_xlat47.x + u_xlat9.x;
    u_xlat66 = (-u_xlat64) * u_xlat16_22 + u_xlat64;
    u_xlat66 = u_xlat64 * u_xlat66 + u_xlat16_22;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat47.y = u_xlat64 + u_xlat66;
    u_xlat47.xy = u_xlat47.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat66 = u_xlat47.y * u_xlat47.x;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat11.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat11.x * u_xlat11.x;
    u_xlat16_29.x = u_xlat11.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat11.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat11.x * u_xlat16_29.x;
    u_xlat30 = u_xlat16_20.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_29.x) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_20.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_48) + u_xlat11.xzw;
    u_xlat16_29.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_15.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = vec3(u_xlat19) * u_xlat16_15.xyz + u_xlat16_29.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_29.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat19 = u_xlat61 * u_xlat66;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat19);
    u_xlat11.xzw = u_xlat11.xzw * _directSpecularColor.xyz;
    u_xlat11.xzw = vec3(u_xlat64) * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_72);
    u_xlat16_16.xyz = u_xlat12.xyz * u_xlat16_16.xxx;
    u_xlat16_17.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_36 = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_36);
    u_xlat16_36 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_36;
    u_xlat16_72 = max(u_xlat16_17.x, u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xxx + u_xlat16_16.xyz;
    u_xlat19 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat7.xyz = vec3(u_xlat19) * u_xlat7.xyz;
    u_xlat19 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat65 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_22 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat7.x = (-u_xlat61) * u_xlat16_22 + u_xlat61;
    u_xlat7.x = u_xlat61 * u_xlat7.x + u_xlat16_22;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat61 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat47.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat26 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat26 * u_xlat26;
    u_xlat16_5.x = u_xlat26 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat26 * u_xlat16_5.x;
    u_xlat16_72 = u_xlat26 * u_xlat16_5.x;
    u_xlat26 = (-u_xlat16_5.x) * u_xlat26 + 1.0;
    u_xlat12.xyz = u_xlat16_20.xyz * vec3(u_xlat26);
    u_xlat12.xyz = vec3(u_xlat30) * vec3(u_xlat16_72) + u_xlat12.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = vec3(u_xlat61) * u_xlat16_16.xyz;
    u_xlat19 = u_xlat19 * u_xlat7.x;
    u_xlat7.xyz = u_xlat12.xyz * vec3(u_xlat19);
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat61) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_29.xyz = u_xlat11.xzw * u_xlat16_29.xyz + u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_16.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati19 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_5.x = min(u_xlat16_0.z, u_xlat16_10);
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_72 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_72);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_5.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlati61 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati61].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_18.xyz;
    u_xlati19 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati19].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_5.x = dot((-u_xlat16_24.xyz), u_xlat4.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat7.xyz = (-u_xlat4.xyz) * u_xlat16_5.xxx + (-u_xlat16_24.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_22 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_5.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_41.x = floor(u_xlat16_7.w);
    u_xlat16_60 = u_xlat16_41.x + 1.0;
    u_xlat16_60 = min(u_xlat16_60, 15.0);
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_41.x);
    u_xlat16_7.x = u_xlat16_41.x * 16.0 + u_xlat16_7.y;
    u_xlat16_18.x = u_xlat16_60 * 16.0 + u_xlat16_7.y;
    u_xlat16_41.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_41.xy).x;
    u_xlat16_18.y = u_xlat16_7.z;
    u_xlat16_41.xy = u_xlat16_18.xy + vec2(0.5, 0.5);
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_41.xy).x;
    u_xlat16_41.x = (-u_xlat16_0.x) + u_xlat16_19;
    u_xlat16_41.x = u_xlat16_5.x * u_xlat16_41.x + u_xlat16_0.x;
    u_xlat16_41.x = u_xlat16_63 * u_xlat16_41.x;
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_10 * 0.5;
    u_xlat16_60 = (-u_xlat16_10) * 0.5 + 1.0;
    u_xlat16_41.x = u_xlat0.x * u_xlat16_60 + u_xlat16_41.x;
    u_xlat16_60 = u_xlat16_41.x + u_xlat16_41.x;
    u_xlat16_5.x = (-u_xlat16_41.x) * 2.0 + 1.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_5.x + u_xlat16_60;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_10;
    u_xlat16_41.x = min(u_xlat16_0.z, u_xlat16_41.x);
    u_xlat16_60 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_60;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_22);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb0.x) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat9.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_3.xyw = u_xlat16_20.xyz * u_xlat16_41.xxx + u_xlat16_29.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_59;
    u_xlat16_3.xyw = u_xlat16_29.xyz + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz + u_xlat16_3.xyw;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_41.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_20.xyz) + _FogCol.xyz;
    u_xlat16_20.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat16_20.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat4.xyz = u_xlat16_20.xyz * u_xlat4.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<u_xlat16_1.x);
#else
    u_xlatb57 = 0.0<u_xlat16_1.x;
#endif
    if(u_xlatb57){
        u_xlat16_57 = texture(_FeatureMask, vs_TEXCOORD3.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<_flowMapUse2U);
#else
        u_xlatb4 = 0.0<_flowMapUse2U;
#endif
        u_xlat16_1 = (bool(u_xlatb4)) ? vs_TEXCOORD3.zwzw : vs_TEXCOORD3.xyxy;
        u_xlat16_4.xy = texture(_flowMap, u_xlat16_1.zw).xy;
        u_xlat1 = u_xlat16_4.xyxy * _detailsControl.zzzz + u_xlat16_1;
        u_xlat1 = u_xlat1 + vec4(0.0, 0.5, 0.0, 0.5);
        u_xlat2 = _flowParams * _Time.yyyy;
        u_xlat2 = fract(u_xlat2);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat16_4.x = texture(_flowMap, u_xlat1.xy).x;
        u_xlat16_23 = texture(_flowMap, u_xlat1.zw).y;
        u_xlat16_3.x = max(u_xlat16_23, u_xlat16_4.x);
        u_xlat16_3.xyz = u_xlat16_3.xxx * _WaveFlowTintColor.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _WaveFlowTintColor.www;
        u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
        SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_57) + u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat0.xyz;
    }
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Geometry" "RenderType" = "Transparent" }
  GpuProgramID 95764
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
CustomEditor "FTheseusShaderGUI.SkirtTransparentShaderGUI"
}