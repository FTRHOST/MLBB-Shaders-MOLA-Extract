//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Special/PBR(Common)UnityACES" {
Properties {

_warning ("使用了UnityACES", Float) = 0.0

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "black" { }

_emissiveColor ("emissiveColor", Color) = (1,1,1,1)

_emissiveBreathe ("emissiveBreath", Vector) = (0,0,0,0)

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

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

[Toggle] _UseFlowLight ("流光开关", Float) = 0.0

[Toggle] _UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

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
  GpuProgramID 30611
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump vec3 u_xlat16_22;
float u_xlat30;
float u_xlat38;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_47;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat19.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_58 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_9.xyz = vec3(u_xlat16_58) * vs_TEXCOORD1.zxy;
    u_xlat16_58 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_9.xyz = vec3(u_xlat16_60) * u_xlat16_9.xyz;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_61 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_22.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_22.x * 0.5 + 0.5;
    u_xlat16_41.x = (-u_xlat16_22.x) + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x + u_xlat16_22.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_61 * u_xlat16_61;
    u_xlat21.x = u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat59 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat59 = u_xlat16_0.x * u_xlat59 + u_xlat16_3.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat16_0.x + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat64 = (-u_xlat16_63) * u_xlat16_3.x + u_xlat16_63;
    u_xlat64 = u_xlat16_63 * u_xlat64 + u_xlat16_3.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat16_63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat59 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat11.x = (-u_xlat16_62) + 1.0;
    u_xlat16_61 = u_xlat11.x * u_xlat11.x;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_62 = u_xlat11.x * u_xlat16_61;
    u_xlat30 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_61) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_62) + u_xlat11.xzw;
    u_xlat16_61 = u_xlat2.x * u_xlat64;
    u_xlat16_10.xyz = u_xlat11.xzw * vec3(u_xlat16_61);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _directSpecularColor.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_61 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat11.xzw;
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_62 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_63);
    u_xlat16_63 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_17.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_62 * u_xlat16_61;
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_61 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_61 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_61 * u_xlat16_61;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat64 = (-u_xlat16_63) * u_xlat16_3.x + u_xlat16_63;
    u_xlat64 = u_xlat16_63 * u_xlat64 + u_xlat16_3.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat16_63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat59 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat11.x = (-u_xlat16_62) + 1.0;
    u_xlat16_61 = u_xlat11.x * u_xlat11.x;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_62 = u_xlat11.x * u_xlat16_61;
    u_xlat11.x = (-u_xlat16_61) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_62) + u_xlat11.xzw;
    u_xlat16_61 = u_xlat2.x * u_xlat64;
    u_xlat16_16.xyz = u_xlat11.xzw * vec3(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat16_16.xyz * _directSpecularColor.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_61);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat11.xzw;
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_63);
    u_xlat16_63 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_16.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_62 * u_xlat16_61;
    u_xlat16_16.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat16_15.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_58 * u_xlat16_58;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_62) * u_xlat16_3.x + u_xlat16_62;
    u_xlat21.x = u_xlat16_62 * u_xlat21.x + u_xlat16_3.x;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat16_62;
    u_xlat21.x = u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = u_xlat21.x * u_xlat59;
    u_xlat2.y = float(1.0) / u_xlat21.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat59 = (-u_xlat16_61) + 1.0;
    u_xlat16_58 = u_xlat59 * u_xlat59;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_61 = u_xlat59 * u_xlat16_58;
    u_xlat59 = (-u_xlat16_58) * u_xlat59 + 1.0;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat30) * vec3(u_xlat16_61) + u_xlat7.xyz;
    u_xlat16_58 = u_xlat2.y * u_xlat2.x;
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_58 = min(u_xlat16_2.z, u_xlat16_41.x);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_61 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_61);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_58) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_58 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_58 = u_xlat16_58 + u_xlat16_58;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_58) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_58 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_61 = u_xlat16_3.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_62 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_61 * 16.0 + u_xlat16_7.y;
    u_xlat16_47.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_47.xy = u_xlat16_47.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_47.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_21;
    u_xlat16_3.x = u_xlat16_62 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_41.x * 0.5;
    u_xlat16_60 = (-u_xlat16_41.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_60 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_58);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_58 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_1.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_58 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_58) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_41.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat21.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat21.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_22.xyz = (-vec3(u_xlat16_58)) + u_xlat21.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat21.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat21.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump vec3 u_xlat16_22;
float u_xlat30;
float u_xlat38;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_47;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat19.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_58 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_9.xyz = vec3(u_xlat16_58) * vs_TEXCOORD1.zxy;
    u_xlat16_58 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_9.xyz = vec3(u_xlat16_60) * u_xlat16_9.xyz;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_61 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_22.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_22.x * 0.5 + 0.5;
    u_xlat16_41.x = (-u_xlat16_22.x) + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x + u_xlat16_22.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_61 * u_xlat16_61;
    u_xlat21.x = u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat59 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat59 = u_xlat16_0.x * u_xlat59 + u_xlat16_3.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat16_0.x + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat64 = (-u_xlat16_63) * u_xlat16_3.x + u_xlat16_63;
    u_xlat64 = u_xlat16_63 * u_xlat64 + u_xlat16_3.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat16_63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat59 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat11.x = (-u_xlat16_62) + 1.0;
    u_xlat16_61 = u_xlat11.x * u_xlat11.x;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_62 = u_xlat11.x * u_xlat16_61;
    u_xlat30 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_61) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_62) + u_xlat11.xzw;
    u_xlat16_61 = u_xlat2.x * u_xlat64;
    u_xlat16_10.xyz = u_xlat11.xzw * vec3(u_xlat16_61);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _directSpecularColor.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_61 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_61);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat11.xzw;
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_62 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_63);
    u_xlat16_63 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_17.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_62 * u_xlat16_61;
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_61 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_61 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_61 * u_xlat16_61;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat64 = (-u_xlat16_63) * u_xlat16_3.x + u_xlat16_63;
    u_xlat64 = u_xlat16_63 * u_xlat64 + u_xlat16_3.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat16_63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat59 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat11.x = (-u_xlat16_62) + 1.0;
    u_xlat16_61 = u_xlat11.x * u_xlat11.x;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_61 = u_xlat11.x * u_xlat16_61;
    u_xlat16_62 = u_xlat11.x * u_xlat16_61;
    u_xlat11.x = (-u_xlat16_61) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xzw = vec3(u_xlat30) * vec3(u_xlat16_62) + u_xlat11.xzw;
    u_xlat16_61 = u_xlat2.x * u_xlat64;
    u_xlat16_16.xyz = u_xlat11.xzw * vec3(u_xlat16_61);
    u_xlat16_16.xyz = u_xlat16_16.xyz * _directSpecularColor.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_63) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_61 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_61 = max(u_xlat16_61, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_61);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat11.xzw;
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_63);
    u_xlat16_63 = float(1.0) / float(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_16.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_62 * u_xlat16_61;
    u_xlat16_16.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat16_15.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_58 * u_xlat16_58;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_62) * u_xlat16_3.x + u_xlat16_62;
    u_xlat21.x = u_xlat16_62 * u_xlat21.x + u_xlat16_3.x;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat16_62;
    u_xlat21.x = u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = u_xlat21.x * u_xlat59;
    u_xlat2.y = float(1.0) / u_xlat21.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat59 = (-u_xlat16_61) + 1.0;
    u_xlat16_58 = u_xlat59 * u_xlat59;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_61 = u_xlat59 * u_xlat16_58;
    u_xlat59 = (-u_xlat16_58) * u_xlat59 + 1.0;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat30) * vec3(u_xlat16_61) + u_xlat7.xyz;
    u_xlat16_58 = u_xlat2.y * u_xlat2.x;
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_58);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_58 = min(u_xlat16_2.z, u_xlat16_41.x);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_61 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_61);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_58) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_58 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_58 = u_xlat16_58 + u_xlat16_58;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_58) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_58 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_61 = u_xlat16_3.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_62 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_61 * 16.0 + u_xlat16_7.y;
    u_xlat16_47.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_47.xy = u_xlat16_47.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_47.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_21;
    u_xlat16_3.x = u_xlat16_62 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_41.x * 0.5;
    u_xlat16_60 = (-u_xlat16_41.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_60 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_58);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_58 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_1.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_58 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_58) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_41.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat21.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat21.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_22.xyz = (-vec3(u_xlat16_58)) + u_xlat21.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat21.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat21.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
float u_xlat32;
float u_xlat42;
mediump vec2 u_xlat16_45;
mediump vec2 u_xlat16_51;
float u_xlat53;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
mediump float u_xlat16_71;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat21.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_9.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.zxy;
    u_xlat16_64 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_64) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_8.xyz = vec3(u_xlat16_64) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_67) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45.x = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45.x = (-u_xlat16_24.x) + u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x + u_xlat16_24.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_66 * u_xlat16_45.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat11.xyz = u_xlat23.xxx * u_xlat11.xyz;
    u_xlat23.x = dot(u_xlat12.xyz, u_xlat11.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat12.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb2)) ? u_xlat11.xyz : vs_TEXCOORD0.xyz;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat11 = u_xlat2.yyyy * u_xlat11;
    u_xlat10 = u_xlat10 * u_xlat2.xxxx + u_xlat11;
    u_xlat10 = u_xlat13 * u_xlat2.wwww + u_xlat10;
    u_xlat10 = u_xlat14 + u_xlat10;
    u_xlat2.x = _ShadowBias.x / u_xlat10.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat10.z;
    u_xlat23.x = max((-u_xlat10.w), u_xlat2.x);
    u_xlat23.x = (-u_xlat2.x) + u_xlat23.x;
    u_xlat10.z = _ShadowBias.y * u_xlat23.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat10.xyz / u_xlat10.www;
    u_xlat10.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat10.w = max(u_xlat10.z, 9.99999975e-05);
    u_xlat16_67 = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat23.x = (-u_xlat16_67) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23.x + u_xlat16_67;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_67 * u_xlat16_67;
    u_xlat65 = u_xlat16_3.x + -1.0;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat70 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat70 = u_xlat16_0.x * u_xlat70 + u_xlat16_3.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat16_0.x + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat11.x = (-u_xlat16_69) * u_xlat16_3.x + u_xlat16_69;
    u_xlat11.x = u_xlat16_69 * u_xlat11.x + u_xlat16_3.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat16_69 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat70 * u_xlat11.x;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat32 = (-u_xlat16_68) + 1.0;
    u_xlat16_67 = u_xlat32 * u_xlat32;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_68 = u_xlat32 * u_xlat16_67;
    u_xlat53 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat32 = (-u_xlat16_67) * u_xlat32 + 1.0;
    u_xlat13.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat13.xyz = vec3(u_xlat53) * vec3(u_xlat16_68) + u_xlat13.xyz;
    u_xlat16_67 = u_xlat23.x * u_xlat11.x;
    u_xlat16_15.xyz = u_xlat13.xyz * vec3(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat11.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat11.xyw, u_xlat11.xyw);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat11.xyw;
    u_xlat16_19.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_71);
    u_xlat16_71 = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_67 = max(u_xlat16_19.x, u_xlat16_67);
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_67 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_67 = dot(u_xlat12.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_67 * u_xlat16_67;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat11.x = (-u_xlat16_71) * u_xlat16_3.x + u_xlat16_71;
    u_xlat11.x = u_xlat16_71 * u_xlat11.x + u_xlat16_3.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat16_71 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat70 * u_xlat11.x;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat32 = (-u_xlat16_68) + 1.0;
    u_xlat16_67 = u_xlat32 * u_xlat32;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_68 = u_xlat32 * u_xlat16_67;
    u_xlat32 = (-u_xlat16_67) * u_xlat32 + 1.0;
    u_xlat13.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat13.xyz = vec3(u_xlat53) * vec3(u_xlat16_68) + u_xlat13.xyz;
    u_xlat16_67 = u_xlat23.x * u_xlat11.x;
    u_xlat16_18.xyz = u_xlat13.xyz * vec3(u_xlat16_67);
    u_xlat16_18.xyz = u_xlat16_18.xyz * _directSpecularColor.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_69) + u_xlat16_17.xyz;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat11.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat11.xyw, u_xlat11.xyw);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat11.xyw;
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_69);
    u_xlat16_69 = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_18.x, u_xlat16_67);
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
    u_xlat16_18.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + u_xlat16_17.xyz;
    u_xlat16_64 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_19.xyz = vec3(u_xlat16_64) * u_xlat16_19.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_64 * u_xlat16_64;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = (-u_xlat16_68) * u_xlat16_3.x + u_xlat16_68;
    u_xlat23.x = u_xlat16_68 * u_xlat23.x + u_xlat16_3.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat16_68;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat70;
    u_xlat2.y = float(1.0) / u_xlat23.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat65 = (-u_xlat16_67) + 1.0;
    u_xlat16_64 = u_xlat65 * u_xlat65;
    u_xlat16_64 = u_xlat65 * u_xlat16_64;
    u_xlat16_64 = u_xlat65 * u_xlat16_64;
    u_xlat16_67 = u_xlat65 * u_xlat16_64;
    u_xlat65 = (-u_xlat16_64) * u_xlat65 + 1.0;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat53) * vec3(u_xlat16_67) + u_xlat7.xyz;
    u_xlat16_64 = u_xlat2.y * u_xlat2.x;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_64);
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_17.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_45.x);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_67 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_67);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_64) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_19.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_64 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_64) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_64 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_67 = u_xlat16_3.x + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_68 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_67 * 16.0 + u_xlat16_7.y;
    u_xlat16_51.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_51.xy = u_xlat16_51.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_51.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_23;
    u_xlat16_3.x = u_xlat16_68 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_24.x * u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_45.x * 0.5;
    u_xlat16_66 = (-u_xlat16_45.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_66 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_64);
    u_xlat16_24.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = vec3(u_xlat16_64) * u_xlat16_24.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_24.xyz * u_xlat16_1.xyz;
    u_xlat16_24.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_64 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_64) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_45.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_45.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat23.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat23.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_24.xyz = (-vec3(u_xlat16_64)) + u_xlat23.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz + vec3(u_xlat16_64);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat23.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat23.xyz = u_xlat23.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat23.xyz = exp2(u_xlat23.xyz);
    u_xlat23.xyz = u_xlat23.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat23.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
float u_xlat32;
float u_xlat42;
mediump vec2 u_xlat16_45;
mediump vec2 u_xlat16_51;
float u_xlat53;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
mediump float u_xlat16_71;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat21.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_9.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.zxy;
    u_xlat16_64 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_64) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_8.xyz = vec3(u_xlat16_64) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_67) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45.x = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45.x = (-u_xlat16_24.x) + u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x + u_xlat16_24.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_66 * u_xlat16_45.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat11.xyz = u_xlat23.xxx * u_xlat11.xyz;
    u_xlat23.x = dot(u_xlat12.xyz, u_xlat11.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat12.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb2)) ? u_xlat11.xyz : vs_TEXCOORD0.xyz;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat11 = u_xlat2.yyyy * u_xlat11;
    u_xlat10 = u_xlat10 * u_xlat2.xxxx + u_xlat11;
    u_xlat10 = u_xlat13 * u_xlat2.wwww + u_xlat10;
    u_xlat10 = u_xlat14 + u_xlat10;
    u_xlat2.x = _ShadowBias.x / u_xlat10.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat10.z;
    u_xlat23.x = max((-u_xlat10.w), u_xlat2.x);
    u_xlat23.x = (-u_xlat2.x) + u_xlat23.x;
    u_xlat10.z = _ShadowBias.y * u_xlat23.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat10.xyz / u_xlat10.www;
    u_xlat10.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat10.w = max(u_xlat10.z, 9.99999975e-05);
    u_xlat16_67 = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat23.x = (-u_xlat16_67) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23.x + u_xlat16_67;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_67 * u_xlat16_67;
    u_xlat65 = u_xlat16_3.x + -1.0;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat70 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat70 = u_xlat16_0.x * u_xlat70 + u_xlat16_3.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat16_0.x + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat11.x = (-u_xlat16_69) * u_xlat16_3.x + u_xlat16_69;
    u_xlat11.x = u_xlat16_69 * u_xlat11.x + u_xlat16_3.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat16_69 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat70 * u_xlat11.x;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat32 = (-u_xlat16_68) + 1.0;
    u_xlat16_67 = u_xlat32 * u_xlat32;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_68 = u_xlat32 * u_xlat16_67;
    u_xlat53 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat32 = (-u_xlat16_67) * u_xlat32 + 1.0;
    u_xlat13.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat13.xyz = vec3(u_xlat53) * vec3(u_xlat16_68) + u_xlat13.xyz;
    u_xlat16_67 = u_xlat23.x * u_xlat11.x;
    u_xlat16_15.xyz = u_xlat13.xyz * vec3(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat11.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat11.xyw, u_xlat11.xyw);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat11.xyw;
    u_xlat16_19.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_71);
    u_xlat16_71 = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_67 = max(u_xlat16_19.x, u_xlat16_67);
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_67 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_67 = dot(u_xlat12.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_67 * u_xlat16_67;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat11.x = (-u_xlat16_71) * u_xlat16_3.x + u_xlat16_71;
    u_xlat11.x = u_xlat16_71 * u_xlat11.x + u_xlat16_3.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat16_71 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat11.x = u_xlat70 * u_xlat11.x;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat32 = (-u_xlat16_68) + 1.0;
    u_xlat16_67 = u_xlat32 * u_xlat32;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_67 = u_xlat32 * u_xlat16_67;
    u_xlat16_68 = u_xlat32 * u_xlat16_67;
    u_xlat32 = (-u_xlat16_67) * u_xlat32 + 1.0;
    u_xlat13.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat13.xyz = vec3(u_xlat53) * vec3(u_xlat16_68) + u_xlat13.xyz;
    u_xlat16_67 = u_xlat23.x * u_xlat11.x;
    u_xlat16_18.xyz = u_xlat13.xyz * vec3(u_xlat16_67);
    u_xlat16_18.xyz = u_xlat16_18.xyz * _directSpecularColor.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_69) + u_xlat16_17.xyz;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat11.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat11.xyw, u_xlat11.xyw);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat11.xyw;
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_69);
    u_xlat16_69 = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_18.x, u_xlat16_67);
    u_xlat16_67 = u_xlat16_68 * u_xlat16_67;
    u_xlat16_18.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_19.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + u_xlat16_17.xyz;
    u_xlat16_64 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_19.xyz = vec3(u_xlat16_64) * u_xlat16_19.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_64 * u_xlat16_64;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat23.x = (-u_xlat16_68) * u_xlat16_3.x + u_xlat16_68;
    u_xlat23.x = u_xlat16_68 * u_xlat23.x + u_xlat16_3.x;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat16_68;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat70;
    u_xlat2.y = float(1.0) / u_xlat23.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat65 = (-u_xlat16_67) + 1.0;
    u_xlat16_64 = u_xlat65 * u_xlat65;
    u_xlat16_64 = u_xlat65 * u_xlat16_64;
    u_xlat16_64 = u_xlat65 * u_xlat16_64;
    u_xlat16_67 = u_xlat65 * u_xlat16_64;
    u_xlat65 = (-u_xlat16_64) * u_xlat65 + 1.0;
    u_xlat7.xyz = u_xlat16_1.xyz * vec3(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat53) * vec3(u_xlat16_67) + u_xlat7.xyz;
    u_xlat16_64 = u_xlat2.y * u_xlat2.x;
    u_xlat16_17.xyz = u_xlat7.xyz * vec3(u_xlat16_64);
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_17.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_45.x);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_67 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_67);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_64) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_19.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_64 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_64) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_64 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_67 = u_xlat16_3.x + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_68 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_67 * 16.0 + u_xlat16_7.y;
    u_xlat16_51.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_51.xy = u_xlat16_51.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_51.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_23;
    u_xlat16_3.x = u_xlat16_68 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_24.x * u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_45.x * 0.5;
    u_xlat16_66 = (-u_xlat16_45.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_66 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_64);
    u_xlat16_24.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = vec3(u_xlat16_64) * u_xlat16_24.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_24.xyz * u_xlat16_1.xyz;
    u_xlat16_24.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_64 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_64) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_45.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_45.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat23.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat23.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_24.xyz = (-vec3(u_xlat16_64)) + u_xlat23.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz + vec3(u_xlat16_64);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat23.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat23.xyz = u_xlat23.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat23.xyz = exp2(u_xlat23.xyz);
    u_xlat23.xyz = u_xlat23.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat23.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
float u_xlat38;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_47;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat19.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_58 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_9.xyz = vec3(u_xlat16_58) * vs_TEXCOORD1.zxy;
    u_xlat16_58 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_9.xyz = vec3(u_xlat16_60) * u_xlat16_9.xyz;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_61 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_22.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_22.x * 0.5 + 0.5;
    u_xlat16_41.x = (-u_xlat16_22.x) + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x + u_xlat16_22.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_58 * u_xlat16_58;
    u_xlat21.x = u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat21.x = u_xlat16_0.x * u_xlat21.x + u_xlat16_3.x;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat16_0.x + u_xlat21.x;
    u_xlat59 = (-u_xlat16_62) * u_xlat16_3.x + u_xlat16_62;
    u_xlat59 = u_xlat16_62 * u_xlat59 + u_xlat16_3.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat21.z = u_xlat59 + u_xlat16_62;
    u_xlat21.xz = u_xlat21.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.z * u_xlat21.x;
    u_xlat2.y = float(1.0) / u_xlat21.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat59 = (-u_xlat16_61) + 1.0;
    u_xlat16_58 = u_xlat59 * u_xlat59;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_61 = u_xlat59 * u_xlat16_58;
    u_xlat7.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_58) * u_xlat59 + 1.0;
    u_xlat26.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat16_61) + u_xlat26.xyz;
    u_xlat16_58 = u_xlat2.y * u_xlat2.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _directSpecularColor.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_10.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_62) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = max(u_xlat16_58, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_58);
    u_xlat16_16.xyz = vec3(u_xlat16_61) * u_xlat7.xyz;
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_62 = float(1.0) / float(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
    u_xlat16_58 = max(u_xlat16_17.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_61 * u_xlat16_58;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = max(u_xlat16_58, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat7.xyz;
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_62 = float(1.0) / float(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
    u_xlat16_58 = max(u_xlat16_16.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_61 * u_xlat16_58;
    u_xlat16_16.xyz = vec3(u_xlat16_58) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_58 = min(u_xlat16_2.z, u_xlat16_41.x);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_61 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_61);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_58) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_58 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_58 = u_xlat16_58 + u_xlat16_58;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_58) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_58 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_61 = u_xlat16_3.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_62 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_61 * 16.0 + u_xlat16_7.y;
    u_xlat16_47.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_47.xy = u_xlat16_47.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_47.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_21;
    u_xlat16_3.x = u_xlat16_62 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_41.x * 0.5;
    u_xlat16_60 = (-u_xlat16_41.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_60 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_58);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_58 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_1.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_58 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_58) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_41.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat21.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat21.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_22.xyz = (-vec3(u_xlat16_58)) + u_xlat21.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat21.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat21.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
float u_xlat38;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_47;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat19.x = _emissiveBreathe.y * _Time.y;
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat38 = (-_emissiveBreathe.z) + 1.0;
    u_xlat19.x = abs(u_xlat19.x) * u_xlat38 + _emissiveBreathe.z;
    u_xlat19.xyz = u_xlat19.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat19.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_58 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_9.xyz = vec3(u_xlat16_58) * vs_TEXCOORD1.zxy;
    u_xlat16_58 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_9.xyz = vec3(u_xlat16_60) * u_xlat16_9.xyz;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_61 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_61) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_22.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_22.x * 0.5 + 0.5;
    u_xlat16_41.x = (-u_xlat16_22.x) + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x + u_xlat16_22.x;
    u_xlat16_41.x = u_xlat16_0.w * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_60 * u_xlat16_41.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_10.xyz = vec3(u_xlat16_58) * u_xlat16_10.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat16_58 * u_xlat16_58;
    u_xlat21.x = u_xlat16_3.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat21.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_3.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat21.x = u_xlat16_0.x * u_xlat21.x + u_xlat16_3.x;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat16_0.x + u_xlat21.x;
    u_xlat59 = (-u_xlat16_62) * u_xlat16_3.x + u_xlat16_62;
    u_xlat59 = u_xlat16_62 * u_xlat59 + u_xlat16_3.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat21.z = u_xlat59 + u_xlat16_62;
    u_xlat21.xz = u_xlat21.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.z * u_xlat21.x;
    u_xlat2.y = float(1.0) / u_xlat21.x;
    u_xlat2.xy = min(u_xlat2.xy, vec2(16.0, 16.0));
    u_xlat59 = (-u_xlat16_61) + 1.0;
    u_xlat16_58 = u_xlat59 * u_xlat59;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_58 = u_xlat59 * u_xlat16_58;
    u_xlat16_61 = u_xlat59 * u_xlat16_58;
    u_xlat7.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_58) * u_xlat59 + 1.0;
    u_xlat26.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat16_61) + u_xlat26.xyz;
    u_xlat16_58 = u_xlat2.y * u_xlat2.x;
    u_xlat16_10.xyz = u_xlat7.xyz * vec3(u_xlat16_58);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _directSpecularColor.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_10.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_62) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = max(u_xlat16_58, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_58);
    u_xlat16_16.xyz = vec3(u_xlat16_61) * u_xlat7.xyz;
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_62 = float(1.0) / float(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
    u_xlat16_58 = max(u_xlat16_17.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_61 * u_xlat16_58;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_58 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_58 = max(u_xlat16_58, 6.10351563e-05);
    u_xlat16_61 = inversesqrt(u_xlat16_58);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat7.xyz;
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_62 = float(1.0) / float(u_xlat16_58);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
    u_xlat16_58 = max(u_xlat16_16.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_61 * u_xlat16_58;
    u_xlat16_16.xyz = vec3(u_xlat16_58) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_58 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_58) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_15.y = u_xlat16_9.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_15.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_58 = min(u_xlat16_2.z, u_xlat16_41.x);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_61 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_61);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_58) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_58) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlati2.x = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_58 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_58 = u_xlat16_58 + u_xlat16_58;
    u_xlat2.xyw = (-u_xlat12.xyz) * vec3(u_xlat16_58) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat2.xyw) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat2.xyw;
    u_xlat16_58 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat2.xyw);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_61 = u_xlat16_3.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_62 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_61 * 16.0 + u_xlat16_7.y;
    u_xlat16_47.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_47.xy = u_xlat16_47.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2.x = texture(_SpecularOcclusionLut3D, u_xlat16_47.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_21;
    u_xlat16_3.x = u_xlat16_62 * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_41.x * 0.5;
    u_xlat16_60 = (-u_xlat16_41.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_60 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_60 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_58);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_58 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_1.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_22.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_58 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_58) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_41.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_41.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat21.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_58 = dot(u_xlat21.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_58 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_22.xyz = (-vec3(u_xlat16_58)) + u_xlat21.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz + vec3(u_xlat16_58);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat21.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat21.xyz = u_xlat21.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat21.xyz = exp2(u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat21.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
float u_xlat28;
float u_xlat42;
mediump vec2 u_xlat16_45;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat21.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_9.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.zxy;
    u_xlat16_64 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_64) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_8.xyz = vec3(u_xlat16_64) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_67) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45.x = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45.x = (-u_xlat16_24.x) + u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x + u_xlat16_24.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_66 * u_xlat16_45.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat11.xyz = u_xlat23.xxx * u_xlat11.xyz;
    u_xlat23.x = dot(u_xlat12.xyz, u_xlat11.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat12.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb2)) ? u_xlat11.xyz : vs_TEXCOORD0.xyz;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat11 = u_xlat2.yyyy * u_xlat11;
    u_xlat10 = u_xlat10 * u_xlat2.xxxx + u_xlat11;
    u_xlat10 = u_xlat13 * u_xlat2.wwww + u_xlat10;
    u_xlat10 = u_xlat14 + u_xlat10;
    u_xlat2.x = _ShadowBias.x / u_xlat10.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat10.z;
    u_xlat23.x = max((-u_xlat10.w), u_xlat2.x);
    u_xlat23.x = (-u_xlat2.x) + u_xlat23.x;
    u_xlat10.z = _ShadowBias.y * u_xlat23.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat10.xyz / u_xlat10.www;
    u_xlat10.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat10.w = max(u_xlat10.z, 9.99999975e-05);
    u_xlat16_67 = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat23.x = (-u_xlat16_67) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23.x + u_xlat16_67;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_64 * u_xlat16_64;
    u_xlat65 = u_xlat16_3.x + -1.0;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat65 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat65 = u_xlat16_0.x * u_xlat65 + u_xlat16_3.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat16_0.x + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat7.x = (-u_xlat16_68) * u_xlat16_3.x + u_xlat16_68;
    u_xlat7.x = u_xlat16_68 * u_xlat7.x + u_xlat16_3.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat16_68 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat7.x;
    u_xlat23.z = float(1.0) / u_xlat65;
    u_xlat23.xz = min(u_xlat23.xz, vec2(16.0, 16.0));
    u_xlat7.x = (-u_xlat16_67) + 1.0;
    u_xlat16_64 = u_xlat7.x * u_xlat7.x;
    u_xlat16_64 = u_xlat7.x * u_xlat16_64;
    u_xlat16_64 = u_xlat7.x * u_xlat16_64;
    u_xlat16_67 = u_xlat7.x * u_xlat16_64;
    u_xlat28 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat16_64) * u_xlat7.x + 1.0;
    u_xlat7.xzw = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat28) * vec3(u_xlat16_67) + u_xlat7.xzw;
    u_xlat16_64 = u_xlat23.z * u_xlat23.x;
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_64);
    u_xlat16_18.xyz = vec3(u_xlat16_67) * u_xlat7.xyz;
    u_xlat16_19.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_67 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_69);
    u_xlat16_69 = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_19.x, u_xlat16_64);
    u_xlat16_64 = u_xlat16_67 * u_xlat16_64;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_64);
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat7.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_68 = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_64 = max(u_xlat16_18.x, u_xlat16_64);
    u_xlat16_64 = u_xlat16_67 * u_xlat16_64;
    u_xlat16_18.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_17.y = u_xlat16_9.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati23 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_45.x);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_67 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_67);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_64) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati65 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati65].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_19.xyz;
    u_xlati23 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_64 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat7.xyz = (-u_xlat12.xyz) * vec3(u_xlat16_64) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat7.xyz) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_64 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_67 = u_xlat16_3.x + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_68 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_67 * 16.0 + u_xlat16_7.y;
    u_xlat16_51.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_51.xy = u_xlat16_51.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_51.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_23.x) + u_xlat16_65;
    u_xlat16_3.x = u_xlat16_68 * u_xlat16_3.x + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat16_66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_24.x * u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_45.x * 0.5;
    u_xlat16_66 = (-u_xlat16_45.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_66 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_64);
    u_xlat16_24.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = vec3(u_xlat16_64) * u_xlat16_24.xyz;
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_24.xyz * u_xlat16_1.xyz;
    u_xlat16_24.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_64 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_64) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_45.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_45.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat23.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat23.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_24.xyz = (-vec3(u_xlat16_64)) + u_xlat23.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz + vec3(u_xlat16_64);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat23.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat23.xyz = u_xlat23.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat23.xyz = exp2(u_xlat23.xyz);
    u_xlat23.xyz = u_xlat23.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat23.xyz : u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
float u_xlat28;
float u_xlat42;
mediump vec2 u_xlat16_45;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_emissiveBreathe.x>=0.5);
#else
    u_xlatb0 = _emissiveBreathe.x>=0.5;
#endif
    u_xlat21.x = _emissiveBreathe.y * _Time.y;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat42 = (-_emissiveBreathe.z) + 1.0;
    u_xlat21.x = abs(u_xlat21.x) * u_xlat42 + _emissiveBreathe.z;
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat21.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xy = u_xlat16_2.yx * vec2(_metallicMultiplier, _roughnessMultiplier);
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_9.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.zxy;
    u_xlat16_64 = dot(vs_TEXCOORD2.zxy, u_xlat16_9.xyz);
    u_xlat16_10.xyz = (-u_xlat16_9.zxy) * vec3(u_xlat16_64) + vs_TEXCOORD2.yzx;
    u_xlat2.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat16_9.zxy * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat12.x = u_xlat7.z;
    u_xlat12.y = u_xlat11.x;
    u_xlat12.z = u_xlat16_9.y;
    u_xlat12.x = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat13.x = u_xlat7.x;
    u_xlat13.y = u_xlat11.z;
    u_xlat13.z = u_xlat16_9.z;
    u_xlat12.y = dot(u_xlat16_8.xyz, u_xlat13.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat11.z = u_xlat16_9.x;
    u_xlat12.z = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_8.xyz = vec3(u_xlat16_64) * u_xlat7.xyz;
    u_xlat16_9.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat16_66 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_9.xyz = vec3(u_xlat16_66) * u_xlat16_9.xyz;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_67) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45.x = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45.x = (-u_xlat16_24.x) + u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x + u_xlat16_24.x;
    u_xlat16_45.x = u_xlat16_0.w * u_xlat16_45.x;
    u_xlat16_45.x = u_xlat16_66 * u_xlat16_45.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat11.xyz = u_xlat23.xxx * u_xlat11.xyz;
    u_xlat23.x = dot(u_xlat12.xyz, u_xlat11.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat12.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb2)) ? u_xlat11.xyz : vs_TEXCOORD0.xyz;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat14;
    u_xlat11 = u_xlat2.yyyy * u_xlat11;
    u_xlat10 = u_xlat10 * u_xlat2.xxxx + u_xlat11;
    u_xlat10 = u_xlat13 * u_xlat2.wwww + u_xlat10;
    u_xlat10 = u_xlat14 + u_xlat10;
    u_xlat2.x = _ShadowBias.x / u_xlat10.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat10.z;
    u_xlat23.x = max((-u_xlat10.w), u_xlat2.x);
    u_xlat23.x = (-u_xlat2.x) + u_xlat23.x;
    u_xlat10.z = _ShadowBias.y * u_xlat23.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat10.xyz / u_xlat10.www;
    u_xlat10.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat10.w = max(u_xlat10.z, 9.99999975e-05);
    u_xlat16_67 = (-_ShadowBias.w) + 1.0;
    u_xlat11.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat11.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat11.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat13.z = 0.0;
    u_xlat2.xyw = u_xlat10.xyw + u_xlat13.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat11.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat11, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat23.x = (-u_xlat16_67) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23.x + u_xlat16_67;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_67 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_0.x = dot(u_xlat12.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat23.x = u_xlat16_64 * u_xlat16_64;
    u_xlat65 = u_xlat16_3.x + -1.0;
    u_xlat23.x = u_xlat23.x * u_xlat65 + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat16_3.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * 0.318309873;
    u_xlat65 = (-u_xlat16_0.x) * u_xlat16_3.x + u_xlat16_0.x;
    u_xlat65 = u_xlat16_0.x * u_xlat65 + u_xlat16_3.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat16_0.x + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat7.x = (-u_xlat16_68) * u_xlat16_3.x + u_xlat16_68;
    u_xlat7.x = u_xlat16_68 * u_xlat7.x + u_xlat16_3.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat16_68 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat7.x;
    u_xlat23.z = float(1.0) / u_xlat65;
    u_xlat23.xz = min(u_xlat23.xz, vec2(16.0, 16.0));
    u_xlat7.x = (-u_xlat16_67) + 1.0;
    u_xlat16_64 = u_xlat7.x * u_xlat7.x;
    u_xlat16_64 = u_xlat7.x * u_xlat16_64;
    u_xlat16_64 = u_xlat7.x * u_xlat16_64;
    u_xlat16_67 = u_xlat7.x * u_xlat16_64;
    u_xlat28 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat16_64) * u_xlat7.x + 1.0;
    u_xlat7.xzw = u_xlat16_1.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat28) * vec3(u_xlat16_67) + u_xlat7.xzw;
    u_xlat16_64 = u_xlat23.z * u_xlat23.x;
    u_xlat16_15.xyz = u_xlat7.xyz * vec3(u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _directSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = _AdditionalLightIntensityAndAngleScale[0].xyz * _light_0_Color.xyz;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_64);
    u_xlat16_18.xyz = vec3(u_xlat16_67) * u_xlat7.xyz;
    u_xlat16_19.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_67 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_69);
    u_xlat16_69 = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_19.x, u_xlat16_64);
    u_xlat16_64 = u_xlat16_67 * u_xlat16_64;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_64);
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat7.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_68 = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_64 = max(u_xlat16_18.x, u_xlat16_64);
    u_xlat16_64 = u_xlat16_67 * u_xlat16_64;
    u_xlat16_18.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_64 = dot(u_xlat12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_17.y = u_xlat16_9.y;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati23 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_45.x);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_67 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_67);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat16_64) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * vec3(u_xlat16_64) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati65 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati65].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_19.xyz;
    u_xlati23 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_64 = dot((-u_xlat16_8.xyz), u_xlat12.xyz);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat7.xyz = (-u_xlat12.xyz) * vec3(u_xlat16_64) + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = (-u_xlat7.xyz) + u_xlat12.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_64 = u_xlat16_0.y * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.y);
    u_xlat16_0.z = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat16_9.xyz = u_xlat16_0.yzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_9.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_67 = u_xlat16_3.x + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_68 = u_xlat16_9.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.y;
    u_xlat16_9.x = u_xlat16_67 * 16.0 + u_xlat16_7.y;
    u_xlat16_51.xy = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_51.xy = u_xlat16_51.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_51.xy).x;
    u_xlat16_9.y = u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = (-u_xlat16_23.x) + u_xlat16_65;
    u_xlat16_3.x = u_xlat16_68 * u_xlat16_3.x + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat16_66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_24.x * u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_45.x * 0.5;
    u_xlat16_66 = (-u_xlat16_45.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_66 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_66 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_9.y = u_xlat16_8.y;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat16_9.xyz, u_xlat16_64);
    u_xlat16_24.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_24.xyz = vec3(u_xlat16_64) * u_xlat16_24.xyz;
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat16_0.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_24.xyz * u_xlat16_1.xyz;
    u_xlat16_24.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_24.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseFlowLight>=0.5);
#else
    u_xlatb2 = _UseFlowLight>=0.5;
#endif
    if(u_xlatb2){
        u_xlat16_64 = (-_UseFlowLight2U) + 1.0;
        u_xlat16_3.xy = vec2(u_xlat16_64) * vs_TEXCOORD3.xy;
        u_xlat16_3.xy = vec2(vec2(_UseFlowLight2U, _UseFlowLight2U)) * vs_TEXCOORD4.xy + u_xlat16_3.xy;
        u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_3.xy;
        u_xlat16_45.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_0 = texture(_FlowLightTex, u_xlat16_45.xy);
        u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat16_3.xy).xyz;
        u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
        u_xlat16_3.xyz = u_xlat16_3.xyz * _FlowLightFactory.xxx;
        u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
        u_xlat16_1.xyz = u_xlat16_3.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb2 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(1.60000002, 1.60000002, 1.60000002);
    u_xlat23.xyz = min(u_xlat16_3.xyz, vec3(50.0, 50.0, 50.0));
    u_xlat16_64 = dot(u_xlat23.xyz, vec3(0.272228986, 0.674081981, 0.0536894985));
    u_xlat16_3.x = u_xlat16_64 * 5.4453001 + 6.9972105;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + 0.800000012;
    u_xlat16_24.xyz = (-vec3(u_xlat16_64)) + u_xlat23.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz + vec3(u_xlat16_64);
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(0.0245785993, 0.0245785993, 0.0245785993);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-9.05370034e-05, -9.05370034e-05, -9.05370034e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.983729005, 0.983729005, 0.983729005) + vec3(0.432951003, 0.432951003, 0.432951003);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.238080993, 0.238080993, 0.238080993);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat23.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat23.xyz = u_xlat23.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat23.xyz = exp2(u_xlat23.xyz);
    u_xlat23.xyz = u_xlat23.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat23.xyz : u_xlat16_1.xyz;
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
  GpuProgramID 81178
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