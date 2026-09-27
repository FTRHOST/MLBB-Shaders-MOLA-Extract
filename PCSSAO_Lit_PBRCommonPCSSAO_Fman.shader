//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PCSSAO/Lit/PBR(Common)PCSSAO_Fman" {
Properties {

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

[Toggle] _EMISSIVE_BREATHE ("自发光呼吸开关", Float) = 0.0

_emissiveBreathe ("emissiveBreath", Vector) = (0,0,0,0)

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrengthMap ("shadowStrengthMap", 2D) = "white" { }

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_USE_FLOW_LIGHT ("流光开关关键字", Float) = 0.0

[Toggle] _UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

[Toggle] _LASER_ON ("镭射开关", Float) = 0.0

_LaserMask ("镭射遮罩", 2D) = "white" { }

_LaserRamp ("镭射渐变图", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (1,1,1,1)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_cull ("__cull", Float) = 2.0

_srcblend ("__src", Float) = 1.0

_dstblend ("__dst", Float) = 0.0

_srcblendalpha ("__srcA", Float) = 1.0

_dstblendalpha ("__dstA", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_alphatomask ("__alphaToMask", Float) = 0.0

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 46803
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
float u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
vec3 u_xlat35;
float u_xlat42;
mediump float u_xlat16_45;
float u_xlat55;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_64 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_66 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_67 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_67) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb21 = u_xlat16_6.w>=0.5;
#endif
    u_xlat42 = _emissiveBreathe.y * _Time.y;
    u_xlat42 = cos(u_xlat42);
    u_xlat21.x = (u_xlatb21) ? abs(u_xlat42) : 1.0;
    u_xlat21.x = max(u_xlat21.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat21.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_11.xyz = vec3(u_xlat16_67) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_12.xyz;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_74 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_74);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_24.x) + u_xlat16_45;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat23 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat13.xyz = vec3(u_xlat23) * u_xlat13.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat72 = u_xlat16_3.x + -1.0;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat73 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat73 = u_xlat13.x * u_xlat73 + u_xlat16_3.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat55 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat55 = u_xlat71 * u_xlat55 + u_xlat16_3.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat71 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat73 * u_xlat55;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat76 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat76 * u_xlat76;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_26.x = u_xlat76 * u_xlat16_45;
    u_xlat14 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_45) * u_xlat76 + 1.0;
    u_xlat35.xyz = u_xlat16_1.xyz * vec3(u_xlat76);
    u_xlat35.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat35.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat23 = u_xlat23 * u_xlat55;
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat35.xyz * _directSpecularColor.xyz;
    u_xlat35.xyz = vec3(u_xlat71) * u_xlat35.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_18.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_18.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat23 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16.xyz = vec3(u_xlat23) * u_xlat16.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat76 = (-u_xlat55) * u_xlat16_3.x + u_xlat55;
    u_xlat76 = u_xlat55 * u_xlat76 + u_xlat16_3.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat55;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat73 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat16.x = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat16.x * u_xlat16.x;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_26.x = u_xlat16.x * u_xlat16_45;
    u_xlat16.x = (-u_xlat16_45) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat55) * u_xlat16_17.xyz;
    u_xlat23 = u_xlat23 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat55) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat21.xxx * u_xlat16.xyz;
    u_xlat16_18.xyz = u_xlat35.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_17.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_45 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat35.xyz;
    u_xlat16_19.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_19.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_19.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat21.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat10.xyz = u_xlat21.xxx * u_xlat10.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat72 + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_3.x / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat71 = (-u_xlat23) * u_xlat16_3.x + u_xlat23;
    u_xlat71 = u_xlat23 * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat23 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat73;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat72 * u_xlat72;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_67 = u_xlat72 * u_xlat16_45;
    u_xlat72 = (-u_xlat16_45) * u_xlat72 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat14) * vec3(u_xlat16_67) + u_xlat10.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.yyy * u_xlat16_17.xyz;
    u_xlat21.x = u_xlat21.x * u_xlat71;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat21.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat23) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_19.xyz * u_xlat10.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_17.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati21 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat42 = min(u_xlat16_24.x, 1.0);
    u_xlat23 = min(u_xlat42, u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_20.xyz;
    u_xlati21 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_24.x = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_24.x = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat10.xyz = (-u_xlat2.xzw) * u_xlat16_24.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_26.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_24.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_24.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_67 = u_xlat16_26.z * 15.0 + (-u_xlat16_24.x);
    u_xlat16_6.x = u_xlat16_24.x * 16.0 + u_xlat16_6.y;
    u_xlat16_11.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_24.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_11.y = u_xlat16_6.z;
    u_xlat16_24.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_24.x = (-u_xlat16_0.x) + u_xlat16_21.x;
    u_xlat16_24.x = u_xlat16_67 * u_xlat16_24.x + u_xlat16_0.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat42 * 0.5;
    u_xlat16_45 = (-u_xlat42) * 0.5 + 1.0;
    u_xlat16_24.x = u_xlat0.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_45 = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat16_67 = (-u_xlat16_24.x) * 2.0 + 1.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_67 + u_xlat16_45;
    u_xlat16_24.x = u_xlat42 * u_xlat16_24.x;
    u_xlat16_24.x = min(u_xlat16_24.x, u_xlat16_66);
    u_xlat16_45 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_45;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_3.xzw * vec3(u_xlat16_67);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_26.xyz : u_xlat16_3.xzw;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_24.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_66 = u_xlat16_0.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_64;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_64 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_64) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat21.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat21.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat21.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat21.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
float u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
vec3 u_xlat35;
float u_xlat42;
mediump float u_xlat16_45;
float u_xlat55;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_64 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_66 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_67 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_67) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb21 = u_xlat16_6.w>=0.5;
#endif
    u_xlat42 = _emissiveBreathe.y * _Time.y;
    u_xlat42 = cos(u_xlat42);
    u_xlat21.x = (u_xlatb21) ? abs(u_xlat42) : 1.0;
    u_xlat21.x = max(u_xlat21.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat21.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_11.xyz = vec3(u_xlat16_67) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_12.xyz;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_74 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_74);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_24.x) + u_xlat16_45;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat23 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat13.xyz = vec3(u_xlat23) * u_xlat13.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat72 = u_xlat16_3.x + -1.0;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat73 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat73 = u_xlat13.x * u_xlat73 + u_xlat16_3.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat55 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat55 = u_xlat71 * u_xlat55 + u_xlat16_3.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat71 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat73 * u_xlat55;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat76 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat76 * u_xlat76;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_26.x = u_xlat76 * u_xlat16_45;
    u_xlat14 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_45) * u_xlat76 + 1.0;
    u_xlat35.xyz = u_xlat16_1.xyz * vec3(u_xlat76);
    u_xlat35.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat35.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat23 = u_xlat23 * u_xlat55;
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat35.xyz * _directSpecularColor.xyz;
    u_xlat35.xyz = vec3(u_xlat71) * u_xlat35.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_18.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_18.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat23 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16.xyz = vec3(u_xlat23) * u_xlat16.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat76 = (-u_xlat55) * u_xlat16_3.x + u_xlat55;
    u_xlat76 = u_xlat55 * u_xlat76 + u_xlat16_3.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat55;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat73 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat16.x = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat16.x * u_xlat16.x;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_26.x = u_xlat16.x * u_xlat16_45;
    u_xlat16.x = (-u_xlat16_45) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat55) * u_xlat16_17.xyz;
    u_xlat23 = u_xlat23 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat55) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat21.xxx * u_xlat16.xyz;
    u_xlat16_18.xyz = u_xlat35.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_17.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_45 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat35.xyz;
    u_xlat16_19.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_19.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_19.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat21.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat10.xyz = u_xlat21.xxx * u_xlat10.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat72 + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_3.x / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat71 = (-u_xlat23) * u_xlat16_3.x + u_xlat23;
    u_xlat71 = u_xlat23 * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat23 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat73;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat72 * u_xlat72;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_67 = u_xlat72 * u_xlat16_45;
    u_xlat72 = (-u_xlat16_45) * u_xlat72 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat14) * vec3(u_xlat16_67) + u_xlat10.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.yyy * u_xlat16_17.xyz;
    u_xlat21.x = u_xlat21.x * u_xlat71;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat21.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat23) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_19.xyz * u_xlat10.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_17.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati21 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat42 = min(u_xlat16_24.x, 1.0);
    u_xlat23 = min(u_xlat42, u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_20.xyz;
    u_xlati21 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_24.x = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_24.x = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat10.xyz = (-u_xlat2.xzw) * u_xlat16_24.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_26.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_24.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_24.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_67 = u_xlat16_26.z * 15.0 + (-u_xlat16_24.x);
    u_xlat16_6.x = u_xlat16_24.x * 16.0 + u_xlat16_6.y;
    u_xlat16_11.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_24.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_11.y = u_xlat16_6.z;
    u_xlat16_24.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_24.x = (-u_xlat16_0.x) + u_xlat16_21.x;
    u_xlat16_24.x = u_xlat16_67 * u_xlat16_24.x + u_xlat16_0.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat42 * 0.5;
    u_xlat16_45 = (-u_xlat42) * 0.5 + 1.0;
    u_xlat16_24.x = u_xlat0.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_45 = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat16_67 = (-u_xlat16_24.x) * 2.0 + 1.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_67 + u_xlat16_45;
    u_xlat16_24.x = u_xlat42 * u_xlat16_24.x;
    u_xlat16_24.x = min(u_xlat16_24.x, u_xlat16_66);
    u_xlat16_45 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_45;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_3.xzw * vec3(u_xlat16_67);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_26.xyz : u_xlat16_3.xzw;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_24.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_66 = u_xlat16_0.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_64;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_64 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_64) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat21.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat21.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat21.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat21.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
bvec4 u_xlatb17;
bvec4 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
mediump float u_xlat16_27;
float u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat32;
mediump float u_xlat16_36;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_51;
vec2 u_xlat58;
mediump float u_xlat10_58;
ivec2 u_xlati58;
bool u_xlatb58;
float u_xlat62;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
int u_xlati83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_76) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb24 = u_xlat16_6.w>=0.5;
#endif
    u_xlat48 = _emissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat24.x = (u_xlatb24) ? abs(u_xlat48) : 1.0;
    u_xlat24.x = max(u_xlat24.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat24.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat2.xzw;
    u_xlat16_84 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_85 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_85);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_84 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat14.xyz = vec3(u_xlat48) * u_xlat14.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat14.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat14.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (bool(u_xlatb24)) ? u_xlat14.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat14.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat14.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat14.zzzz + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat24.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat6.z;
    u_xlat48 = max((-u_xlat6.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat6.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat14.xyz = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat14.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat6.w<1.0);
#else
        u_xlatb24 = u_xlat6.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat58.xy = u_xlat6.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat58.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat6.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat38.y<u_xlat26);
#else
                u_xlatb26 = u_xlat38.y<u_xlat26;
#endif
                u_xlat38.x = 1.0;
                u_xlat38.xy = bool(u_xlatb26) ? u_xlat38.xy : vec2(0.0, 0.0);
            } else {
                u_xlat38.x = float(0.0);
                u_xlat38.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.929388702, 0.293877602) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.457714319, -0.879124641) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.276768446, 0.756483793) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat17.xy = u_xlat15.xx * vec2(0.443233252, 0.53742981) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.975115538, -0.4737342) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.418930233, 0.190901875) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.997065067, 0.914375901) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat17.xy = u_xlat15.xx * vec2(0.199841261, 0.143831611) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.78641367, -0.1410079) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat38.x);
#else
            u_xlatb26 = 0.0<u_xlat38.x;
#endif
            u_xlat80 = u_xlat38.y / u_xlat38.x;
            u_xlat80 = u_xlatb26 ? u_xlat80 : float(0.0);
            u_xlat80 = u_xlat6.w + (-u_xlat80);
            u_xlat80 = u_xlat80 * _PCSSLightSize;
            u_xlat80 = max(u_xlat24.y, u_xlat80);
            u_xlat80 = max(u_xlat80, 1.0);
            u_xlat80 = min(u_xlat80, 20.0);
            u_xlat26 = (u_xlatb26) ? u_xlat80 : 1.0;
            u_xlat26 = u_xlat26 * _ShadowMapTexture_TexelSize.x;
            u_xlati80 = max(_PCSSSampleCount, 4);
            u_xlati80 = min(u_xlati80, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati81 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81>=16);
#else
                u_xlatb58 = u_xlati81>=16;
#endif
                if(u_xlatb58){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81<u_xlati80);
#else
                u_xlatb58 = u_xlati81<u_xlati80;
#endif
                if(u_xlatb58){
                    u_xlat58.xy = u_xlat14.xx * ImmCB_0[u_xlati81].yx;
                    u_xlat16.x = ImmCB_0[u_xlati81].x * u_xlat15.x + (-u_xlat58.x);
                    u_xlat16.y = ImmCB_0[u_xlati81].y * u_xlat15.x + u_xlat58.y;
                    u_xlat58.xy = u_xlat16.xy * vec2(u_xlat26) + u_xlat6.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat58.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat58.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb83 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb83 = u_xlatb38.y && u_xlatb83;
                    u_xlatb83 = u_xlatb39.y && u_xlatb83;
                    if(!u_xlatb83){
                        u_xlati83 = u_xlati81 + 1;
                        u_xlati81 = u_xlati83;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat58.xy,u_xlat6.w);
                    u_xlat10_58 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_58 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati81 = u_xlati81 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat16_43);
#else
            u_xlatb26 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29 = u_xlat16_19.x / u_xlat16_43;
            u_xlat58.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
            u_xlat58.xy = min(u_xlat6.xy, u_xlat58.xy);
            u_xlat80 = min(u_xlat58.y, u_xlat58.x);
            u_xlat80 = u_xlat80 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
            u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
            u_xlat81 = u_xlat16_29 + -1.0;
            u_xlat26 = u_xlatb26 ? u_xlat81 : float(0.0);
            u_xlat26 = u_xlat80 * u_xlat26 + 1.0;
            u_xlat16_26 = u_xlat26;
        } else {
            u_xlat16_26 = 1.0;
        }
        u_xlat16_29 = (-u_xlat16_51) + 1.0;
        u_xlat16_29 = u_xlat16_26 * u_xlat16_29 + u_xlat16_51;
        u_xlat29 = u_xlat16_29;
    } else {
        u_xlat16_85 = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat6.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat81 = (-u_xlat16_85) + 1.0;
        u_xlat29 = u_xlat80 * u_xlat81 + u_xlat16_85;
    }
    u_xlat80 = (-u_xlat29) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat14.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat83 = (-u_xlat14.x) * u_xlat16_3.x + u_xlat14.x;
    u_xlat83 = u_xlat14.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat14.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat62 = (-u_xlat58.x) * u_xlat16_3.x + u_xlat58.x;
    u_xlat62 = u_xlat58.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat58.x + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat83 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat86 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat86 * u_xlat86;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_85 = u_xlat86 * u_xlat16_76;
    u_xlat15.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_76) * u_xlat86 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat39.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat39.xyz;
    u_xlat16_19.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat39.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat58.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat16.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat86 = (-u_xlat62) * u_xlat16_3.x + u_xlat62;
    u_xlat86 = u_xlat62 * u_xlat86 + u_xlat16_3.x;
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat62;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat86 = u_xlat83 * u_xlat86;
    u_xlat86 = float(1.0) / u_xlat86;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat16.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat16.x * u_xlat16.x;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_85 = u_xlat16.x * u_xlat16_76;
    u_xlat16.x = (-u_xlat16_76) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat16.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat62) * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat86;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat62) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_22.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat39.xyz * u_xlat16_19.xyz + u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat58.xxx + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat39.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat39.xyz, u_xlat39.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat39.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat11.xyz = vec3(u_xlat81) * u_xlat11.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58.x = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat58.x = u_xlat10.x * u_xlat58.x + u_xlat16_3.x;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat10.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat58.x * u_xlat83;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat58.x = min(u_xlat58.x, 16.0);
    u_xlat82 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat82 * u_xlat82;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_79 = u_xlat82 * u_xlat16_76;
    u_xlat82 = (-u_xlat16_76) * u_xlat82 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat11.xyz = u_xlat15.xxx * vec3(u_xlat16_79) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat58.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_22.xyz * u_xlat11.xyz;
    u_xlat16_19.xyz = u_xlat11.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_21.y = u_xlat16_13.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_27), u_xlat10.xy);
    u_xlat81 = min(u_xlat16_75, u_xlat10.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_12.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat10.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_12.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xzw);
    u_xlat16_12.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_6.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_36 = u_xlat16_12.z * 15.0 + (-u_xlat16_79);
    u_xlat16_6.x = u_xlat16_79 * 16.0 + u_xlat16_6.y;
    u_xlat16_23.x = u_xlat16_12.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_23.y = u_xlat16_6.z;
    u_xlat16_12.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_79 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_79 = u_xlat16_36 * u_xlat16_79 + u_xlat16_80;
    u_xlat16_79 = u_xlat16_84 * u_xlat16_79;
    u_xlat80 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_79 * u_xlat80;
    u_xlat16_79 = u_xlat10.y * 0.5;
    u_xlat16_12.x = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat80 * u_xlat16_12.x + u_xlat16_79;
    u_xlat16_12.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_36 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_36 + u_xlat16_12.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat10.y;
    u_xlat16_79 = min(u_xlat16_75, u_xlat16_79);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat14.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb8 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_13.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
        u_xlat16_8.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + u_xlat16_4.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_8.zzz * u_xlat16_7.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
    u_xlat8.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat8.xz * vec2(15.0, 0.9375);
    u_xlat80 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat8.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat80 * 0.0625 + u_xlat0.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat32.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_10.xyz = textureLod(_ACESLutTex, u_xlat32.xy, 0.0).xyz;
    u_xlat8.x = u_xlat8.x * 15.0 + (-u_xlat80);
    u_xlat32.xyz = (-u_xlat16_9.xyz) + u_xlat16_10.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat32.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat8.xyz;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
bvec4 u_xlatb17;
bvec4 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
mediump float u_xlat16_27;
float u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat32;
mediump float u_xlat16_36;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_51;
vec2 u_xlat58;
mediump float u_xlat10_58;
ivec2 u_xlati58;
bool u_xlatb58;
float u_xlat62;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
int u_xlati83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_76) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb24 = u_xlat16_6.w>=0.5;
#endif
    u_xlat48 = _emissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat24.x = (u_xlatb24) ? abs(u_xlat48) : 1.0;
    u_xlat24.x = max(u_xlat24.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat24.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat2.xzw;
    u_xlat16_84 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_85 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_85);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_84 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat14.xyz = vec3(u_xlat48) * u_xlat14.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat14.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat14.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (bool(u_xlatb24)) ? u_xlat14.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat14.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat14.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat14.zzzz + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat24.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat6.z;
    u_xlat48 = max((-u_xlat6.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat6.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat14.xyz = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat14.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat6.w<1.0);
#else
        u_xlatb24 = u_xlat6.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat58.xy = u_xlat6.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat58.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat6.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat38.y<u_xlat26);
#else
                u_xlatb26 = u_xlat38.y<u_xlat26;
#endif
                u_xlat38.x = 1.0;
                u_xlat38.xy = bool(u_xlatb26) ? u_xlat38.xy : vec2(0.0, 0.0);
            } else {
                u_xlat38.x = float(0.0);
                u_xlat38.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.929388702, 0.293877602) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.457714319, -0.879124641) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.276768446, 0.756483793) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat17.xy = u_xlat15.xx * vec2(0.443233252, 0.53742981) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.975115538, -0.4737342) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.418930233, 0.190901875) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.997065067, 0.914375901) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat17.xy = u_xlat15.xx * vec2(0.199841261, 0.143831611) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.78641367, -0.1410079) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat38.x);
#else
            u_xlatb26 = 0.0<u_xlat38.x;
#endif
            u_xlat80 = u_xlat38.y / u_xlat38.x;
            u_xlat80 = u_xlatb26 ? u_xlat80 : float(0.0);
            u_xlat80 = u_xlat6.w + (-u_xlat80);
            u_xlat80 = u_xlat80 * _PCSSLightSize;
            u_xlat80 = max(u_xlat24.y, u_xlat80);
            u_xlat80 = max(u_xlat80, 1.0);
            u_xlat80 = min(u_xlat80, 20.0);
            u_xlat26 = (u_xlatb26) ? u_xlat80 : 1.0;
            u_xlat26 = u_xlat26 * _ShadowMapTexture_TexelSize.x;
            u_xlati80 = max(_PCSSSampleCount, 4);
            u_xlati80 = min(u_xlati80, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati81 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81>=16);
#else
                u_xlatb58 = u_xlati81>=16;
#endif
                if(u_xlatb58){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81<u_xlati80);
#else
                u_xlatb58 = u_xlati81<u_xlati80;
#endif
                if(u_xlatb58){
                    u_xlat58.xy = u_xlat14.xx * ImmCB_0[u_xlati81].yx;
                    u_xlat16.x = ImmCB_0[u_xlati81].x * u_xlat15.x + (-u_xlat58.x);
                    u_xlat16.y = ImmCB_0[u_xlati81].y * u_xlat15.x + u_xlat58.y;
                    u_xlat58.xy = u_xlat16.xy * vec2(u_xlat26) + u_xlat6.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat58.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat58.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb83 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb83 = u_xlatb38.y && u_xlatb83;
                    u_xlatb83 = u_xlatb39.y && u_xlatb83;
                    if(!u_xlatb83){
                        u_xlati83 = u_xlati81 + 1;
                        u_xlati81 = u_xlati83;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat58.xy,u_xlat6.w);
                    u_xlat10_58 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_58 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati81 = u_xlati81 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat16_43);
#else
            u_xlatb26 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29 = u_xlat16_19.x / u_xlat16_43;
            u_xlat58.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
            u_xlat58.xy = min(u_xlat6.xy, u_xlat58.xy);
            u_xlat80 = min(u_xlat58.y, u_xlat58.x);
            u_xlat80 = u_xlat80 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
            u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
            u_xlat81 = u_xlat16_29 + -1.0;
            u_xlat26 = u_xlatb26 ? u_xlat81 : float(0.0);
            u_xlat26 = u_xlat80 * u_xlat26 + 1.0;
            u_xlat16_26 = u_xlat26;
        } else {
            u_xlat16_26 = 1.0;
        }
        u_xlat16_29 = (-u_xlat16_51) + 1.0;
        u_xlat16_29 = u_xlat16_26 * u_xlat16_29 + u_xlat16_51;
        u_xlat29 = u_xlat16_29;
    } else {
        u_xlat16_85 = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat6.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat81 = (-u_xlat16_85) + 1.0;
        u_xlat29 = u_xlat80 * u_xlat81 + u_xlat16_85;
    }
    u_xlat80 = (-u_xlat29) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat14.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat83 = (-u_xlat14.x) * u_xlat16_3.x + u_xlat14.x;
    u_xlat83 = u_xlat14.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat14.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat62 = (-u_xlat58.x) * u_xlat16_3.x + u_xlat58.x;
    u_xlat62 = u_xlat58.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat58.x + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat83 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat86 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat86 * u_xlat86;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_85 = u_xlat86 * u_xlat16_76;
    u_xlat15.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_76) * u_xlat86 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat39.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat39.xyz;
    u_xlat16_19.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat39.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat58.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat16.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat86 = (-u_xlat62) * u_xlat16_3.x + u_xlat62;
    u_xlat86 = u_xlat62 * u_xlat86 + u_xlat16_3.x;
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat62;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat86 = u_xlat83 * u_xlat86;
    u_xlat86 = float(1.0) / u_xlat86;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat16.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat16.x * u_xlat16.x;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_85 = u_xlat16.x * u_xlat16_76;
    u_xlat16.x = (-u_xlat16_76) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat16.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat62) * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat86;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat62) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_22.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat39.xyz * u_xlat16_19.xyz + u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat58.xxx + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat39.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat39.xyz, u_xlat39.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat39.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat11.xyz = vec3(u_xlat81) * u_xlat11.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58.x = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat58.x = u_xlat10.x * u_xlat58.x + u_xlat16_3.x;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat10.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat58.x * u_xlat83;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat58.x = min(u_xlat58.x, 16.0);
    u_xlat82 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat82 * u_xlat82;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_79 = u_xlat82 * u_xlat16_76;
    u_xlat82 = (-u_xlat16_76) * u_xlat82 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat11.xyz = u_xlat15.xxx * vec3(u_xlat16_79) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat58.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_22.xyz * u_xlat11.xyz;
    u_xlat16_19.xyz = u_xlat11.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_21.y = u_xlat16_13.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_27), u_xlat10.xy);
    u_xlat81 = min(u_xlat16_75, u_xlat10.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_12.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat10.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_12.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xzw);
    u_xlat16_12.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_6.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_36 = u_xlat16_12.z * 15.0 + (-u_xlat16_79);
    u_xlat16_6.x = u_xlat16_79 * 16.0 + u_xlat16_6.y;
    u_xlat16_23.x = u_xlat16_12.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_23.y = u_xlat16_6.z;
    u_xlat16_12.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_79 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_79 = u_xlat16_36 * u_xlat16_79 + u_xlat16_80;
    u_xlat16_79 = u_xlat16_84 * u_xlat16_79;
    u_xlat80 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_79 * u_xlat80;
    u_xlat16_79 = u_xlat10.y * 0.5;
    u_xlat16_12.x = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat80 * u_xlat16_12.x + u_xlat16_79;
    u_xlat16_12.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_36 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_36 + u_xlat16_12.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat10.y;
    u_xlat16_79 = min(u_xlat16_75, u_xlat16_79);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat14.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb8 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_13.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
        u_xlat16_8.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + u_xlat16_4.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_8.zzz * u_xlat16_7.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
    u_xlat8.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat8.xz * vec2(15.0, 0.9375);
    u_xlat80 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat8.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat80 * 0.0625 + u_xlat0.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat32.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_10.xyz = textureLod(_ACESLutTex, u_xlat32.xy, 0.0).xyz;
    u_xlat8.x = u_xlat8.x * 15.0 + (-u_xlat80);
    u_xlat32.xyz = (-u_xlat16_9.xyz) + u_xlat16_10.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat32.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat8.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
float u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
vec3 u_xlat35;
float u_xlat42;
mediump float u_xlat16_45;
float u_xlat55;
mediump float u_xlat16_64;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_64 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_66 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_67 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_67) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb21 = u_xlat16_6.w>=0.5;
#endif
    u_xlat42 = _emissiveBreathe.y * _Time.y;
    u_xlat42 = cos(u_xlat42);
    u_xlat21.x = (u_xlatb21) ? abs(u_xlat42) : 1.0;
    u_xlat21.x = max(u_xlat21.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat21.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_11.xyz = vec3(u_xlat16_67) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_12.xyz;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_74 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_74);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_24.x) + u_xlat16_45;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat23 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat13.xyz = vec3(u_xlat23) * u_xlat13.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat72 = u_xlat16_3.x + -1.0;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat73 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat73 = u_xlat13.x * u_xlat73 + u_xlat16_3.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat55 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat55 = u_xlat71 * u_xlat55 + u_xlat16_3.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat71 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat73 * u_xlat55;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat76 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat76 * u_xlat76;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_26.x = u_xlat76 * u_xlat16_45;
    u_xlat14 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_45) * u_xlat76 + 1.0;
    u_xlat35.xyz = u_xlat16_1.xyz * vec3(u_xlat76);
    u_xlat35.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat35.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat23 = u_xlat23 * u_xlat55;
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat35.xyz * _directSpecularColor.xyz;
    u_xlat35.xyz = vec3(u_xlat71) * u_xlat35.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_18.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_18.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat23 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16.xyz = vec3(u_xlat23) * u_xlat16.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat76 = (-u_xlat55) * u_xlat16_3.x + u_xlat55;
    u_xlat76 = u_xlat55 * u_xlat76 + u_xlat16_3.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat55;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat73 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat16.x = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat16.x * u_xlat16.x;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_26.x = u_xlat16.x * u_xlat16_45;
    u_xlat16.x = (-u_xlat16_45) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat55) * u_xlat16_17.xyz;
    u_xlat23 = u_xlat23 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat55) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat21.xxx * u_xlat16.xyz;
    u_xlat16_18.xyz = u_xlat35.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_17.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_45 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat35.xyz;
    u_xlat16_19.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_19.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_19.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat21.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat10.xyz = u_xlat21.xxx * u_xlat10.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat72 + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_3.x / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat71 = (-u_xlat23) * u_xlat16_3.x + u_xlat23;
    u_xlat71 = u_xlat23 * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat23 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat73;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat72 * u_xlat72;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_67 = u_xlat72 * u_xlat16_45;
    u_xlat72 = (-u_xlat16_45) * u_xlat72 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat14) * vec3(u_xlat16_67) + u_xlat10.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.yyy * u_xlat16_17.xyz;
    u_xlat21.x = u_xlat21.x * u_xlat71;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat21.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat23) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_19.xyz * u_xlat10.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_17.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati21 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat42 = min(u_xlat16_24.x, 1.0);
    u_xlat23 = min(u_xlat42, u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_20.xyz;
    u_xlati21 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_24.x = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_24.x = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat10.xyz = (-u_xlat2.xzw) * u_xlat16_24.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_26.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_24.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_24.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_67 = u_xlat16_26.z * 15.0 + (-u_xlat16_24.x);
    u_xlat16_6.x = u_xlat16_24.x * 16.0 + u_xlat16_6.y;
    u_xlat16_11.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_24.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_11.y = u_xlat16_6.z;
    u_xlat16_24.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_24.x = (-u_xlat16_0.x) + u_xlat16_21.x;
    u_xlat16_24.x = u_xlat16_67 * u_xlat16_24.x + u_xlat16_0.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat42 * 0.5;
    u_xlat16_45 = (-u_xlat42) * 0.5 + 1.0;
    u_xlat16_24.x = u_xlat0.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_45 = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat16_67 = (-u_xlat16_24.x) * 2.0 + 1.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_67 + u_xlat16_45;
    u_xlat16_24.x = u_xlat42 * u_xlat16_24.x;
    u_xlat16_24.x = min(u_xlat16_24.x, u_xlat16_66);
    u_xlat16_45 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_45;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_3.xzw * vec3(u_xlat16_67);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_26.xyz : u_xlat16_3.xzw;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_24.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_66 = u_xlat16_0.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_64;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_64 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_64) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
float u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
int u_xlati21;
bool u_xlatb21;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
vec3 u_xlat35;
float u_xlat42;
mediump float u_xlat16_45;
float u_xlat55;
mediump float u_xlat16_64;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_64 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_66 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_67 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_67) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb21 = u_xlat16_6.w>=0.5;
#endif
    u_xlat42 = _emissiveBreathe.y * _Time.y;
    u_xlat42 = cos(u_xlat42);
    u_xlat21.x = (u_xlatb21) ? abs(u_xlat42) : 1.0;
    u_xlat21.x = max(u_xlat21.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat21.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_11.xyz = vec3(u_xlat16_67) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_12.xyz;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_74 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_74);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_24.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_24.x * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_24.x) + u_xlat16_45;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_5.w * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat23 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat13.xyz = vec3(u_xlat23) * u_xlat13.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat72 = u_xlat16_3.x + -1.0;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat73 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat73 = u_xlat13.x * u_xlat73 + u_xlat16_3.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat55 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat55 = u_xlat71 * u_xlat55 + u_xlat16_3.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat71 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat73 * u_xlat55;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat76 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat76 * u_xlat76;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_45 = u_xlat76 * u_xlat16_45;
    u_xlat16_26.x = u_xlat76 * u_xlat16_45;
    u_xlat14 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_45) * u_xlat76 + 1.0;
    u_xlat35.xyz = u_xlat16_1.xyz * vec3(u_xlat76);
    u_xlat35.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat35.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat23 = u_xlat23 * u_xlat55;
    u_xlat35.xyz = u_xlat35.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat35.xyz * _directSpecularColor.xyz;
    u_xlat35.xyz = vec3(u_xlat71) * u_xlat35.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_18.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_18.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat23 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16.xyz = vec3(u_xlat23) * u_xlat16.xyz;
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat72 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_3.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat76 = (-u_xlat55) * u_xlat16_3.x + u_xlat55;
    u_xlat76 = u_xlat55 * u_xlat76 + u_xlat16_3.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat55;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat73 * u_xlat76;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat16.x = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat16.x * u_xlat16.x;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_45 = u_xlat16.x * u_xlat16_45;
    u_xlat16_26.x = u_xlat16.x * u_xlat16_45;
    u_xlat16.x = (-u_xlat16_45) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = vec3(u_xlat14) * u_xlat16_26.xxx + u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat55) * u_xlat16_17.xyz;
    u_xlat23 = u_xlat23 * u_xlat76;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat23);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat55) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_18.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat21.xxx * u_xlat16.xyz;
    u_xlat16_18.xyz = u_xlat35.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_17.xyz;
    u_xlat16_45 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_45));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_45);
#endif
    u_xlat35.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_45 = dot(u_xlat35.xyz, u_xlat35.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_45);
    u_xlat16_17.xyz = u_xlat16_26.xxx * u_xlat35.xyz;
    u_xlat16_19.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_74);
    u_xlat16_74 = float(1.0) / float(u_xlat16_45);
    u_xlat16_45 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_45 = (-u_xlat16_45) * u_xlat16_45 + 1.0;
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_74;
    u_xlat16_45 = max(u_xlat16_19.x, u_xlat16_45);
    u_xlat16_45 = u_xlat16_26.x * u_xlat16_45;
    u_xlat16_19.xyz = vec3(u_xlat16_45) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat21.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat10.xyz = u_xlat21.xxx * u_xlat10.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_45 = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat2.xzw, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat72 + 1.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat16_3.x / u_xlat21.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat71 = (-u_xlat23) * u_xlat16_3.x + u_xlat23;
    u_xlat71 = u_xlat23 * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat23 + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat73;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat72 * u_xlat72;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_45 = u_xlat72 * u_xlat16_45;
    u_xlat16_67 = u_xlat72 * u_xlat16_45;
    u_xlat72 = (-u_xlat16_45) * u_xlat72 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat72);
    u_xlat10.xyz = vec3(u_xlat14) * vec3(u_xlat16_67) + u_xlat10.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat21.yyy * u_xlat16_17.xyz;
    u_xlat21.x = u_xlat21.x * u_xlat71;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat21.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat23) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_19.xyz * u_xlat10.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat21.yyy + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_17.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati21 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat42 = min(u_xlat16_24.x, 1.0);
    u_xlat23 = min(u_xlat42, u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_20.xyz;
    u_xlati21 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_24.x = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_24.x = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat10.xyz = (-u_xlat2.xzw) * u_xlat16_24.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat10.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_26.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_24.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_24.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_67 = u_xlat16_26.z * 15.0 + (-u_xlat16_24.x);
    u_xlat16_6.x = u_xlat16_24.x * 16.0 + u_xlat16_6.y;
    u_xlat16_11.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_24.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_11.y = u_xlat16_6.z;
    u_xlat16_24.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_24.x = (-u_xlat16_0.x) + u_xlat16_21.x;
    u_xlat16_24.x = u_xlat16_67 * u_xlat16_24.x + u_xlat16_0.x;
    u_xlat16_24.x = u_xlat16_70 * u_xlat16_24.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat42 * 0.5;
    u_xlat16_45 = (-u_xlat42) * 0.5 + 1.0;
    u_xlat16_24.x = u_xlat0.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_45 = u_xlat16_24.x + u_xlat16_24.x;
    u_xlat16_67 = (-u_xlat16_24.x) * 2.0 + 1.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_67 + u_xlat16_45;
    u_xlat16_24.x = u_xlat42 * u_xlat16_24.x;
    u_xlat16_24.x = min(u_xlat16_24.x, u_xlat16_66);
    u_xlat16_45 = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_45;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_67 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_3.xzw * vec3(u_xlat16_67);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_26.xyz : u_xlat16_3.xzw;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_24.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_66 = u_xlat16_0.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_64;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_64 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_64) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_64) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
bvec4 u_xlatb17;
bvec4 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
mediump float u_xlat16_27;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_36;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_51;
vec2 u_xlat58;
mediump float u_xlat10_58;
ivec2 u_xlati58;
bool u_xlatb58;
float u_xlat62;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
int u_xlati83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_76) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb24 = u_xlat16_6.w>=0.5;
#endif
    u_xlat48 = _emissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat24.x = (u_xlatb24) ? abs(u_xlat48) : 1.0;
    u_xlat24.x = max(u_xlat24.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat24.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat2.xzw;
    u_xlat16_84 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_85 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_85);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_84 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat14.xyz = vec3(u_xlat48) * u_xlat14.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat14.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat14.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (bool(u_xlatb24)) ? u_xlat14.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat14.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat14.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat14.zzzz + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat24.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat6.z;
    u_xlat48 = max((-u_xlat6.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat6.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat14.xyz = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat14.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat6.w<1.0);
#else
        u_xlatb24 = u_xlat6.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat58.xy = u_xlat6.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat58.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat6.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat38.y<u_xlat26);
#else
                u_xlatb26 = u_xlat38.y<u_xlat26;
#endif
                u_xlat38.x = 1.0;
                u_xlat38.xy = bool(u_xlatb26) ? u_xlat38.xy : vec2(0.0, 0.0);
            } else {
                u_xlat38.x = float(0.0);
                u_xlat38.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.929388702, 0.293877602) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.457714319, -0.879124641) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.276768446, 0.756483793) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat17.xy = u_xlat15.xx * vec2(0.443233252, 0.53742981) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.975115538, -0.4737342) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.418930233, 0.190901875) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.997065067, 0.914375901) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat17.xy = u_xlat15.xx * vec2(0.199841261, 0.143831611) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.78641367, -0.1410079) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat38.x);
#else
            u_xlatb26 = 0.0<u_xlat38.x;
#endif
            u_xlat80 = u_xlat38.y / u_xlat38.x;
            u_xlat80 = u_xlatb26 ? u_xlat80 : float(0.0);
            u_xlat80 = u_xlat6.w + (-u_xlat80);
            u_xlat80 = u_xlat80 * _PCSSLightSize;
            u_xlat80 = max(u_xlat24.y, u_xlat80);
            u_xlat80 = max(u_xlat80, 1.0);
            u_xlat80 = min(u_xlat80, 20.0);
            u_xlat26 = (u_xlatb26) ? u_xlat80 : 1.0;
            u_xlat26 = u_xlat26 * _ShadowMapTexture_TexelSize.x;
            u_xlati80 = max(_PCSSSampleCount, 4);
            u_xlati80 = min(u_xlati80, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati81 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81>=16);
#else
                u_xlatb58 = u_xlati81>=16;
#endif
                if(u_xlatb58){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81<u_xlati80);
#else
                u_xlatb58 = u_xlati81<u_xlati80;
#endif
                if(u_xlatb58){
                    u_xlat58.xy = u_xlat14.xx * ImmCB_0[u_xlati81].yx;
                    u_xlat16.x = ImmCB_0[u_xlati81].x * u_xlat15.x + (-u_xlat58.x);
                    u_xlat16.y = ImmCB_0[u_xlati81].y * u_xlat15.x + u_xlat58.y;
                    u_xlat58.xy = u_xlat16.xy * vec2(u_xlat26) + u_xlat6.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat58.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat58.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb83 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb83 = u_xlatb38.y && u_xlatb83;
                    u_xlatb83 = u_xlatb39.y && u_xlatb83;
                    if(!u_xlatb83){
                        u_xlati83 = u_xlati81 + 1;
                        u_xlati81 = u_xlati83;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat58.xy,u_xlat6.w);
                    u_xlat10_58 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_58 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati81 = u_xlati81 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat16_43);
#else
            u_xlatb26 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29 = u_xlat16_19.x / u_xlat16_43;
            u_xlat58.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
            u_xlat58.xy = min(u_xlat6.xy, u_xlat58.xy);
            u_xlat80 = min(u_xlat58.y, u_xlat58.x);
            u_xlat80 = u_xlat80 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
            u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
            u_xlat81 = u_xlat16_29 + -1.0;
            u_xlat26 = u_xlatb26 ? u_xlat81 : float(0.0);
            u_xlat26 = u_xlat80 * u_xlat26 + 1.0;
            u_xlat16_26 = u_xlat26;
        } else {
            u_xlat16_26 = 1.0;
        }
        u_xlat16_29 = (-u_xlat16_51) + 1.0;
        u_xlat16_29 = u_xlat16_26 * u_xlat16_29 + u_xlat16_51;
        u_xlat29 = u_xlat16_29;
    } else {
        u_xlat16_85 = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat6.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat81 = (-u_xlat16_85) + 1.0;
        u_xlat29 = u_xlat80 * u_xlat81 + u_xlat16_85;
    }
    u_xlat80 = (-u_xlat29) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat14.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat83 = (-u_xlat14.x) * u_xlat16_3.x + u_xlat14.x;
    u_xlat83 = u_xlat14.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat14.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat62 = (-u_xlat58.x) * u_xlat16_3.x + u_xlat58.x;
    u_xlat62 = u_xlat58.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat58.x + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat83 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat86 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat86 * u_xlat86;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_85 = u_xlat86 * u_xlat16_76;
    u_xlat15.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_76) * u_xlat86 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat39.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat39.xyz;
    u_xlat16_19.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat39.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat58.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat16.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat86 = (-u_xlat62) * u_xlat16_3.x + u_xlat62;
    u_xlat86 = u_xlat62 * u_xlat86 + u_xlat16_3.x;
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat62;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat86 = u_xlat83 * u_xlat86;
    u_xlat86 = float(1.0) / u_xlat86;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat16.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat16.x * u_xlat16.x;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_85 = u_xlat16.x * u_xlat16_76;
    u_xlat16.x = (-u_xlat16_76) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat16.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat62) * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat86;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat62) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_22.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat39.xyz * u_xlat16_19.xyz + u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat58.xxx + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat39.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat39.xyz, u_xlat39.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat39.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat11.xyz = vec3(u_xlat81) * u_xlat11.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58.x = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat58.x = u_xlat10.x * u_xlat58.x + u_xlat16_3.x;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat10.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat58.x * u_xlat83;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat58.x = min(u_xlat58.x, 16.0);
    u_xlat82 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat82 * u_xlat82;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_79 = u_xlat82 * u_xlat16_76;
    u_xlat82 = (-u_xlat16_76) * u_xlat82 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat11.xyz = u_xlat15.xxx * vec3(u_xlat16_79) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat58.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_22.xyz * u_xlat11.xyz;
    u_xlat16_19.xyz = u_xlat11.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_21.y = u_xlat16_13.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_27), u_xlat10.xy);
    u_xlat81 = min(u_xlat16_75, u_xlat10.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_12.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat10.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_12.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xzw);
    u_xlat16_12.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_6.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_36 = u_xlat16_12.z * 15.0 + (-u_xlat16_79);
    u_xlat16_6.x = u_xlat16_79 * 16.0 + u_xlat16_6.y;
    u_xlat16_23.x = u_xlat16_12.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_23.y = u_xlat16_6.z;
    u_xlat16_12.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_79 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_79 = u_xlat16_36 * u_xlat16_79 + u_xlat16_80;
    u_xlat16_79 = u_xlat16_84 * u_xlat16_79;
    u_xlat80 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_79 * u_xlat80;
    u_xlat16_79 = u_xlat10.y * 0.5;
    u_xlat16_12.x = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat80 * u_xlat16_12.x + u_xlat16_79;
    u_xlat16_12.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_36 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_36 + u_xlat16_12.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat10.y;
    u_xlat16_79 = min(u_xlat16_75, u_xlat16_79);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat14.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb8 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_13.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
        u_xlat16_8.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + u_xlat16_4.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_8.zzz * u_xlat16_7.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
bvec4 u_xlatb17;
bvec4 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
mediump float u_xlat16_27;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_36;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_51;
vec2 u_xlat58;
mediump float u_xlat10_58;
ivec2 u_xlati58;
bool u_xlatb58;
float u_xlat62;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
float u_xlat82;
float u_xlat83;
int u_xlati83;
bool u_xlatb83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_76) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat0.z;
    u_xlat8.y = u_xlat2.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat0.x;
    u_xlat9.y = u_xlat2.w;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_6.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb24 = u_xlat16_6.w>=0.5;
#endif
    u_xlat48 = _emissiveBreathe.y * _Time.y;
    u_xlat48 = cos(u_xlat48);
    u_xlat24.x = (u_xlatb24) ? abs(u_xlat48) : 1.0;
    u_xlat24.x = max(u_xlat24.x, _emissiveBreathe.z);
    u_xlat9.xyz = u_xlat24.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat2.xzw;
    u_xlat16_84 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_84 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_85 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_85);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_84 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat14.xyz = vec3(u_xlat48) * u_xlat14.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat14.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat14.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (bool(u_xlatb24)) ? u_xlat14.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat14.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat14.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat14.zzzz + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat24.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat6.z;
    u_xlat48 = max((-u_xlat6.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat6.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat14.xyz = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat14.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat6.w<1.0);
#else
        u_xlatb24 = u_xlat6.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat58.xy = u_xlat6.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat58.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat6.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat38.y<u_xlat26);
#else
                u_xlatb26 = u_xlat38.y<u_xlat26;
#endif
                u_xlat38.x = 1.0;
                u_xlat38.xy = bool(u_xlatb26) ? u_xlat38.xy : vec2(0.0, 0.0);
            } else {
                u_xlat38.x = float(0.0);
                u_xlat38.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.929388702, 0.293877602) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.457714319, -0.879124641) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.276768446, 0.756483793) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat17.xy = u_xlat15.xx * vec2(0.443233252, 0.53742981) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.975115538, -0.4737342) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.418930233, 0.190901875) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.997065067, 0.914375901) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            u_xlat16 = u_xlat14.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat17.xy = u_xlat15.xx * vec2(0.199841261, 0.143831611) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(0.78641367, -0.1410079) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat6.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat6.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = u_xlat6.w + (-u_xlat80);
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat38.x);
#else
            u_xlatb26 = 0.0<u_xlat38.x;
#endif
            u_xlat80 = u_xlat38.y / u_xlat38.x;
            u_xlat80 = u_xlatb26 ? u_xlat80 : float(0.0);
            u_xlat80 = u_xlat6.w + (-u_xlat80);
            u_xlat80 = u_xlat80 * _PCSSLightSize;
            u_xlat80 = max(u_xlat24.y, u_xlat80);
            u_xlat80 = max(u_xlat80, 1.0);
            u_xlat80 = min(u_xlat80, 20.0);
            u_xlat26 = (u_xlatb26) ? u_xlat80 : 1.0;
            u_xlat26 = u_xlat26 * _ShadowMapTexture_TexelSize.x;
            u_xlati80 = max(_PCSSSampleCount, 4);
            u_xlati80 = min(u_xlati80, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati81 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81>=16);
#else
                u_xlatb58 = u_xlati81>=16;
#endif
                if(u_xlatb58){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb58 = !!(u_xlati81<u_xlati80);
#else
                u_xlatb58 = u_xlati81<u_xlati80;
#endif
                if(u_xlatb58){
                    u_xlat58.xy = u_xlat14.xx * ImmCB_0[u_xlati81].yx;
                    u_xlat16.x = ImmCB_0[u_xlati81].x * u_xlat15.x + (-u_xlat58.x);
                    u_xlat16.y = ImmCB_0[u_xlati81].y * u_xlat15.x + u_xlat58.y;
                    u_xlat58.xy = u_xlat16.xy * vec2(u_xlat26) + u_xlat6.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat58.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat58.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb83 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb83 = u_xlatb38.y && u_xlatb83;
                    u_xlatb83 = u_xlatb39.y && u_xlatb83;
                    if(!u_xlatb83){
                        u_xlati83 = u_xlati81 + 1;
                        u_xlati81 = u_xlati83;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat58.xy,u_xlat6.w);
                    u_xlat10_58 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_58 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati81 = u_xlati81 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb26 = !!(0.0<u_xlat16_43);
#else
            u_xlatb26 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29 = u_xlat16_19.x / u_xlat16_43;
            u_xlat58.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
            u_xlat58.xy = min(u_xlat6.xy, u_xlat58.xy);
            u_xlat80 = min(u_xlat58.y, u_xlat58.x);
            u_xlat80 = u_xlat80 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
            u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
            u_xlat81 = u_xlat16_29 + -1.0;
            u_xlat26 = u_xlatb26 ? u_xlat81 : float(0.0);
            u_xlat26 = u_xlat80 * u_xlat26 + 1.0;
            u_xlat16_26 = u_xlat26;
        } else {
            u_xlat16_26 = 1.0;
        }
        u_xlat16_29 = (-u_xlat16_51) + 1.0;
        u_xlat16_29 = u_xlat16_26 * u_xlat16_29 + u_xlat16_51;
        u_xlat29 = u_xlat16_29;
    } else {
        u_xlat16_85 = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat6.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat6.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat81 = (-u_xlat16_85) + 1.0;
        u_xlat29 = u_xlat80 * u_xlat81 + u_xlat16_85;
    }
    u_xlat80 = (-u_xlat29) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat14.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat14.xyz = vec3(u_xlat81) * u_xlat14.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat83 = (-u_xlat14.x) * u_xlat16_3.x + u_xlat14.x;
    u_xlat83 = u_xlat14.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat14.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat62 = (-u_xlat58.x) * u_xlat16_3.x + u_xlat58.x;
    u_xlat62 = u_xlat58.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat58.x + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat83 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat86 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat86 * u_xlat86;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_76 = u_xlat86 * u_xlat16_76;
    u_xlat16_85 = u_xlat86 * u_xlat16_76;
    u_xlat15.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_76) * u_xlat86 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat39.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat39.xyz;
    u_xlat16_19.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat62;
    u_xlat39.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat58.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat16.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat16.xyz = vec3(u_xlat81) * u_xlat16.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat86 = (-u_xlat62) * u_xlat16_3.x + u_xlat62;
    u_xlat86 = u_xlat62 * u_xlat86 + u_xlat16_3.x;
    u_xlat86 = sqrt(u_xlat86);
    u_xlat86 = u_xlat86 + u_xlat62;
    u_xlat86 = u_xlat86 + 6.10351563e-05;
    u_xlat86 = u_xlat83 * u_xlat86;
    u_xlat86 = float(1.0) / u_xlat86;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat16.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat16.x * u_xlat16.x;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_76 = u_xlat16.x * u_xlat16_76;
    u_xlat16_85 = u_xlat16.x * u_xlat16_76;
    u_xlat16.x = (-u_xlat16_76) * u_xlat16.x + 1.0;
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat16.xyz = u_xlat15.xxx * vec3(u_xlat16_85) + u_xlat16.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat62) * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat86;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat62) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_22.xyz * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat10.xxx * u_xlat16.xyz;
    u_xlat16_19.xyz = u_xlat39.xyz * u_xlat16_19.xyz + u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat58.xxx + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb81 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat39.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat39.xyz, u_xlat39.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = vec3(u_xlat16_85) * u_xlat39.xyz;
    u_xlat16_22.xy = (bool(u_xlatb81)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb81 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb81) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_91;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_85 * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + u_xlat16_21.xyz;
    u_xlat81 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat11.xyz = vec3(u_xlat81) * u_xlat11.xyz;
    u_xlat81 = dot(u_xlat2.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat82 + 1.0;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat16_3.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat58.x = (-u_xlat10.x) * u_xlat16_3.x + u_xlat10.x;
    u_xlat58.x = u_xlat10.x * u_xlat58.x + u_xlat16_3.x;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat10.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat58.x * u_xlat83;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat58.x = min(u_xlat58.x, 16.0);
    u_xlat82 = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat82 * u_xlat82;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_76 = u_xlat82 * u_xlat16_76;
    u_xlat16_79 = u_xlat82 * u_xlat16_76;
    u_xlat82 = (-u_xlat16_76) * u_xlat82 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat11.xyz = u_xlat15.xxx * vec3(u_xlat16_79) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat81 = u_xlat81 * u_xlat58.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_22.xyz * u_xlat11.xyz;
    u_xlat16_19.xyz = u_xlat11.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_21.y = u_xlat16_13.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_27), u_xlat10.xy);
    u_xlat81 = min(u_xlat16_75, u_xlat10.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat81) * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat81) * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat81) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * vec3(u_xlat81) + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlati81 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati81].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_12.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat10.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_12.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat10.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat10.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat10.xzw);
    u_xlat16_12.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_6.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_36 = u_xlat16_12.z * 15.0 + (-u_xlat16_79);
    u_xlat16_6.x = u_xlat16_79 * 16.0 + u_xlat16_6.y;
    u_xlat16_23.x = u_xlat16_12.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_23.y = u_xlat16_6.z;
    u_xlat16_12.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_12.xz = u_xlat16_12.xz * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xz).x;
    u_xlat16_79 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_79 = u_xlat16_36 * u_xlat16_79 + u_xlat16_80;
    u_xlat16_79 = u_xlat16_84 * u_xlat16_79;
    u_xlat80 = dot(u_xlat16_13.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_79 * u_xlat80;
    u_xlat16_79 = u_xlat10.y * 0.5;
    u_xlat16_12.x = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat80 * u_xlat16_12.x + u_xlat16_79;
    u_xlat16_12.x = u_xlat16_79 + u_xlat16_79;
    u_xlat16_36 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_36 + u_xlat16_12.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat10.y;
    u_xlat16_79 = min(u_xlat16_75, u_xlat16_79);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat14.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb8 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_76 = u_xlat16_0.w * _albedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_13.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat9.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
        u_xlat16_8.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_73) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_8.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + u_xlat16_4.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_8.zzz * u_xlat16_7.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec2 u_xlat16_20;
int u_xlati20;
bool u_xlatb20;
vec3 u_xlat22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat69;
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
    u_xlat16_61 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb20 = u_xlat16_6.w>=0.5;
#endif
    u_xlat40 = _emissiveBreathe.y * _Time.y;
    u_xlat40 = cos(u_xlat40);
    u_xlat20.x = (u_xlatb20) ? abs(u_xlat40) : 1.0;
    u_xlat20.x = max(u_xlat20.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat20.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_67);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_23.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_23.x) + u_xlat16_43;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_64 * u_xlat16_23.x;
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat68 * u_xlat68;
    u_xlat62 = u_xlat16_3.x + -1.0;
    u_xlat22.x = u_xlat22.x * u_xlat62 + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_3.x / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat62 = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat62 = u_xlat11.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat11.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat68 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat68 = u_xlat2.x * u_xlat68 + u_xlat16_3.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat2.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat22.z = float(1.0) / u_xlat62;
    u_xlat22.xz = min(u_xlat22.xz, vec2(16.0, 16.0));
    u_xlat68 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat68 * u_xlat68;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_63 = u_xlat68 * u_xlat16_43;
    u_xlat69 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_43) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * vec3(u_xlat68);
    u_xlat14.xyz = vec3(u_xlat69) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat22.x = u_xlat22.z * u_xlat22.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat2.xxx * u_xlat14.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat22.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_17.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_18.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati20 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat40 = min(u_xlat16_23.x, 1.0);
    u_xlat2.x = min(u_xlat40, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyz;
    u_xlati20 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat2.xyw = (-u_xlat8.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_25.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_25.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_25.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_25.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_65 = u_xlat16_25.z * 15.0 + (-u_xlat16_25.x);
    u_xlat16_6.x = u_xlat16_25.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_25.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_12.y = u_xlat16_6.z;
    u_xlat16_25.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_25.x = (-u_xlat16_0.x) + u_xlat16_20.x;
    u_xlat16_25.x = u_xlat16_65 * u_xlat16_25.x + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_25.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat40 * 0.5;
    u_xlat16_25.x = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_25.x + u_xlat16_64;
    u_xlat16_25.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_45 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_64 = u_xlat40 * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_25.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_25.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_25.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_64) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_61;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_15.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_61 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_61) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat20.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat20.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat20.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec2 u_xlat16_20;
int u_xlati20;
bool u_xlatb20;
vec3 u_xlat22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat69;
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
    u_xlat16_61 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb20 = u_xlat16_6.w>=0.5;
#endif
    u_xlat40 = _emissiveBreathe.y * _Time.y;
    u_xlat40 = cos(u_xlat40);
    u_xlat20.x = (u_xlatb20) ? abs(u_xlat40) : 1.0;
    u_xlat20.x = max(u_xlat20.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat20.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_67);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_23.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_23.x) + u_xlat16_43;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_64 * u_xlat16_23.x;
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat68 * u_xlat68;
    u_xlat62 = u_xlat16_3.x + -1.0;
    u_xlat22.x = u_xlat22.x * u_xlat62 + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_3.x / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat62 = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat62 = u_xlat11.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat11.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat68 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat68 = u_xlat2.x * u_xlat68 + u_xlat16_3.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat2.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat22.z = float(1.0) / u_xlat62;
    u_xlat22.xz = min(u_xlat22.xz, vec2(16.0, 16.0));
    u_xlat68 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat68 * u_xlat68;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_63 = u_xlat68 * u_xlat16_43;
    u_xlat69 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_43) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * vec3(u_xlat68);
    u_xlat14.xyz = vec3(u_xlat69) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat22.x = u_xlat22.z * u_xlat22.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat2.xxx * u_xlat14.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat22.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_17.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_18.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati20 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat40 = min(u_xlat16_23.x, 1.0);
    u_xlat2.x = min(u_xlat40, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyz;
    u_xlati20 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat2.xyw = (-u_xlat8.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_25.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_25.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_25.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_25.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_65 = u_xlat16_25.z * 15.0 + (-u_xlat16_25.x);
    u_xlat16_6.x = u_xlat16_25.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_25.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_12.y = u_xlat16_6.z;
    u_xlat16_25.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_25.x = (-u_xlat16_0.x) + u_xlat16_20.x;
    u_xlat16_25.x = u_xlat16_65 * u_xlat16_25.x + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_25.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat40 * 0.5;
    u_xlat16_25.x = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_25.x + u_xlat16_64;
    u_xlat16_25.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_45 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_64 = u_xlat40 * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_25.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_25.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_25.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_64) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_61;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_15.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_61 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_61) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat20.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat20.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat20.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
vec3 u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat46;
bool u_xlatb46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_82;
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
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb23 = u_xlat16_6.w>=0.5;
#endif
    u_xlat46 = _emissiveBreathe.y * _Time.y;
    u_xlat46 = cos(u_xlat46);
    u_xlat23.x = (u_xlatb23) ? abs(u_xlat46) : 1.0;
    u_xlat23.x = max(u_xlat23.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat23.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_72 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat12.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_14.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_82 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_82);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat46 = (-u_xlat46) * u_xlat46 + 1.0;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat46) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb23)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat2.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat2.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat2.wwww + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat23.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat23.x) + u_xlat6.z;
    u_xlat46 = max((-u_xlat6.w), u_xlat23.x);
    u_xlat46 = (-u_xlat23.x) + u_xlat46;
    u_xlat6.z = _ShadowBias.y * u_xlat46 + u_xlat23.x;
    u_xlat2.xyw = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
    u_xlat16_49 = (-_ShadowBias.w) + 1.0;
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat15.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat15.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat23.x = dot(u_xlat15, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat46 = (-u_xlat16_49) + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat46 + u_xlat16_49;
    u_xlat23.x = (-u_xlat23.x) + 1.0;
    u_xlat23.x = (-u_xlat23.x) * u_xlat16_72 + 1.0;
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat2.xyw = u_xlat12.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25.x = u_xlat16_3.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_3.x / u_xlat46;
    u_xlat46 = u_xlat46 * 0.318309873;
    u_xlat46 = min(u_xlat46, 16.0);
    u_xlat25.x = (-u_xlat12.x) * u_xlat16_3.x + u_xlat12.x;
    u_xlat25.x = u_xlat12.x * u_xlat25.x + u_xlat16_3.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat12.x;
    u_xlat71 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat71 = u_xlat2.x * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat25.z = u_xlat71 + u_xlat2.x;
    u_xlat25.xz = u_xlat25.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.z * u_xlat25.x;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat71 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat71 * u_xlat71;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_72 = u_xlat71 * u_xlat16_49;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_49) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat77) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat46 = u_xlat46 * u_xlat25.x;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat46);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat2.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_49 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat16.xyz;
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat46) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_20.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_72);
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat46) + u_xlat16_19.xyz;
    u_xlat23.x = u_xlat23.x + -1.0;
    u_xlat23.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat23.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_20.y = u_xlat16_14.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat23.xy = min(u_xlat16_26.xx, u_xlat23.xy);
    u_xlat23.x = min(u_xlat23.x, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_21.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_73 = dot((-u_xlat16_13.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_13.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_6.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_6.x = u_xlat16_73 * 16.0 + u_xlat16_6.y;
    u_xlat16_13.x = u_xlat16_28.x * 16.0 + u_xlat16_6.y;
    u_xlat16_28.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_13.y = u_xlat16_6.z;
    u_xlat16_28.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat23.y * 0.5;
    u_xlat16_28.x = (-u_xlat23.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat23.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_28.xyz;
    u_xlat12.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat69 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat23.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat23.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat23.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
vec3 u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat46;
bool u_xlatb46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_82;
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
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb23 = u_xlat16_6.w>=0.5;
#endif
    u_xlat46 = _emissiveBreathe.y * _Time.y;
    u_xlat46 = cos(u_xlat46);
    u_xlat23.x = (u_xlatb23) ? abs(u_xlat46) : 1.0;
    u_xlat23.x = max(u_xlat23.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat23.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_72 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat12.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_14.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_82 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_82);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat46 = (-u_xlat46) * u_xlat46 + 1.0;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat46) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb23)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat2.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat2.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat2.wwww + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat23.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat23.x) + u_xlat6.z;
    u_xlat46 = max((-u_xlat6.w), u_xlat23.x);
    u_xlat46 = (-u_xlat23.x) + u_xlat46;
    u_xlat6.z = _ShadowBias.y * u_xlat46 + u_xlat23.x;
    u_xlat2.xyw = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
    u_xlat16_49 = (-_ShadowBias.w) + 1.0;
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat15.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat15.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat23.x = dot(u_xlat15, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat46 = (-u_xlat16_49) + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat46 + u_xlat16_49;
    u_xlat23.x = (-u_xlat23.x) + 1.0;
    u_xlat23.x = (-u_xlat23.x) * u_xlat16_72 + 1.0;
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat2.xyw = u_xlat12.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25.x = u_xlat16_3.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_3.x / u_xlat46;
    u_xlat46 = u_xlat46 * 0.318309873;
    u_xlat46 = min(u_xlat46, 16.0);
    u_xlat25.x = (-u_xlat12.x) * u_xlat16_3.x + u_xlat12.x;
    u_xlat25.x = u_xlat12.x * u_xlat25.x + u_xlat16_3.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat12.x;
    u_xlat71 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat71 = u_xlat2.x * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat25.z = u_xlat71 + u_xlat2.x;
    u_xlat25.xz = u_xlat25.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.z * u_xlat25.x;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat71 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat71 * u_xlat71;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_72 = u_xlat71 * u_xlat16_49;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_49) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat77) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat46 = u_xlat46 * u_xlat25.x;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat46);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat2.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_49 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat16.xyz;
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat46) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_20.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_72);
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat46) + u_xlat16_19.xyz;
    u_xlat23.x = u_xlat23.x + -1.0;
    u_xlat23.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat23.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_20.y = u_xlat16_14.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat23.xy = min(u_xlat16_26.xx, u_xlat23.xy);
    u_xlat23.x = min(u_xlat23.x, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_21.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_73 = dot((-u_xlat16_13.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_13.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_6.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_6.x = u_xlat16_73 * 16.0 + u_xlat16_6.y;
    u_xlat16_13.x = u_xlat16_28.x * 16.0 + u_xlat16_6.y;
    u_xlat16_28.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_13.y = u_xlat16_6.z;
    u_xlat16_28.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat23.y * 0.5;
    u_xlat16_28.x = (-u_xlat23.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat23.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_28.xyz;
    u_xlat12.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat69 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat23.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat23.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat23.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Crystal_CustomColorMask;
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
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec2 u_xlat16_20;
int u_xlati20;
bool u_xlatb20;
vec3 u_xlat22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat69;
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
    u_xlat16_61 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb20 = u_xlat16_6.w>=0.5;
#endif
    u_xlat40 = _emissiveBreathe.y * _Time.y;
    u_xlat40 = cos(u_xlat40);
    u_xlat20.x = (u_xlatb20) ? abs(u_xlat40) : 1.0;
    u_xlat20.x = max(u_xlat20.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat20.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_67);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_23.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_23.x) + u_xlat16_43;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_64 * u_xlat16_23.x;
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat68 * u_xlat68;
    u_xlat62 = u_xlat16_3.x + -1.0;
    u_xlat22.x = u_xlat22.x * u_xlat62 + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_3.x / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat62 = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat62 = u_xlat11.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat11.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat68 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat68 = u_xlat2.x * u_xlat68 + u_xlat16_3.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat2.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat22.z = float(1.0) / u_xlat62;
    u_xlat22.xz = min(u_xlat22.xz, vec2(16.0, 16.0));
    u_xlat68 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat68 * u_xlat68;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_63 = u_xlat68 * u_xlat16_43;
    u_xlat69 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_43) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * vec3(u_xlat68);
    u_xlat14.xyz = vec3(u_xlat69) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat22.x = u_xlat22.z * u_xlat22.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat2.xxx * u_xlat14.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat22.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_17.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_18.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati20 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat40 = min(u_xlat16_23.x, 1.0);
    u_xlat2.x = min(u_xlat40, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyz;
    u_xlati20 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat2.xyw = (-u_xlat8.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_25.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_25.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_25.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_25.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_65 = u_xlat16_25.z * 15.0 + (-u_xlat16_25.x);
    u_xlat16_6.x = u_xlat16_25.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_25.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_12.y = u_xlat16_6.z;
    u_xlat16_25.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_25.x = (-u_xlat16_0.x) + u_xlat16_20.x;
    u_xlat16_25.x = u_xlat16_65 * u_xlat16_25.x + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_25.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat40 * 0.5;
    u_xlat16_25.x = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_25.x + u_xlat16_64;
    u_xlat16_25.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_45 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_64 = u_xlat40 * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_25.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_25.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_25.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_64) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_61;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_15.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_61 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_61) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Crystal_CustomColorMask;
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
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec2 u_xlat16_20;
int u_xlati20;
bool u_xlatb20;
vec3 u_xlat22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat40;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat69;
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
    u_xlat16_61 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb20 = u_xlat16_6.w>=0.5;
#endif
    u_xlat40 = _emissiveBreathe.y * _Time.y;
    u_xlat40 = cos(u_xlat40);
    u_xlat20.x = (u_xlatb20) ? abs(u_xlat40) : 1.0;
    u_xlat20.x = max(u_xlat20.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat20.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat11.xyz;
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_67 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_67);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_23.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_23.x * 0.5 + 0.5;
    u_xlat16_43 = (-u_xlat16_23.x) + u_xlat16_43;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_5.w * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat16_64 * u_xlat16_23.x;
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat11.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat68 * u_xlat68;
    u_xlat62 = u_xlat16_3.x + -1.0;
    u_xlat22.x = u_xlat22.x * u_xlat62 + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_3.x / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat62 = (-u_xlat11.x) * u_xlat16_3.x + u_xlat11.x;
    u_xlat62 = u_xlat11.x * u_xlat62 + u_xlat16_3.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat11.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat68 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat68 = u_xlat2.x * u_xlat68 + u_xlat16_3.x;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat2.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat22.z = float(1.0) / u_xlat62;
    u_xlat22.xz = min(u_xlat22.xz, vec2(16.0, 16.0));
    u_xlat68 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat68 * u_xlat68;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_43 = u_xlat68 * u_xlat16_43;
    u_xlat16_63 = u_xlat68 * u_xlat16_43;
    u_xlat69 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat16_43) * u_xlat68 + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * vec3(u_xlat68);
    u_xlat14.xyz = vec3(u_xlat69) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat22.x = u_xlat22.z * u_xlat22.x;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat2.xxx * u_xlat14.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_43 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16.xyz;
    u_xlat16_18.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat22.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + u_xlat16_17.xyz;
    u_xlat16_43 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_43));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_43);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_18.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_63 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_25.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_25.x = u_xlat16_25.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_25.x);
    u_xlat16_25.x = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_25.x;
    u_xlat16_43 = max(u_xlat16_18.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_63 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati20 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat40 = min(u_xlat16_23.x, 1.0);
    u_xlat2.x = min(u_xlat40, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat2.xxx * u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_18.xyz;
    u_xlati20 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati20].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat2.xyw = (-u_xlat8.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_25.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_25.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_25.x = floor(u_xlat16_6.w);
    u_xlat16_45 = u_xlat16_25.x + 1.0;
    u_xlat16_45 = min(u_xlat16_45, 15.0);
    u_xlat16_65 = u_xlat16_25.z * 15.0 + (-u_xlat16_25.x);
    u_xlat16_6.x = u_xlat16_25.x * 16.0 + u_xlat16_6.y;
    u_xlat16_12.x = u_xlat16_45 * 16.0 + u_xlat16_6.y;
    u_xlat16_25.xy = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_12.y = u_xlat16_6.z;
    u_xlat16_25.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_25.xy = u_xlat16_25.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_25.xy).x;
    u_xlat16_25.x = (-u_xlat16_0.x) + u_xlat16_20.x;
    u_xlat16_25.x = u_xlat16_65 * u_xlat16_25.x + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_25.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat40 * 0.5;
    u_xlat16_25.x = (-u_xlat40) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_25.x + u_xlat16_64;
    u_xlat16_25.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_45 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_64 = u_xlat40 * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_25.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_25.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_25.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_64) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_61;
    u_xlat16_12.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_15.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_61 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_61) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_61) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
vec3 u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat46;
bool u_xlatb46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_82;
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
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb23 = u_xlat16_6.w>=0.5;
#endif
    u_xlat46 = _emissiveBreathe.y * _Time.y;
    u_xlat46 = cos(u_xlat46);
    u_xlat23.x = (u_xlatb23) ? abs(u_xlat46) : 1.0;
    u_xlat23.x = max(u_xlat23.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat23.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_72 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat12.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_14.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_82 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_82);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat46 = (-u_xlat46) * u_xlat46 + 1.0;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat46) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb23)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat2.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat2.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat2.wwww + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat23.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat23.x) + u_xlat6.z;
    u_xlat46 = max((-u_xlat6.w), u_xlat23.x);
    u_xlat46 = (-u_xlat23.x) + u_xlat46;
    u_xlat6.z = _ShadowBias.y * u_xlat46 + u_xlat23.x;
    u_xlat2.xyw = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
    u_xlat16_49 = (-_ShadowBias.w) + 1.0;
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat15.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat15.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat23.x = dot(u_xlat15, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat46 = (-u_xlat16_49) + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat46 + u_xlat16_49;
    u_xlat23.x = (-u_xlat23.x) + 1.0;
    u_xlat23.x = (-u_xlat23.x) * u_xlat16_72 + 1.0;
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat2.xyw = u_xlat12.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25.x = u_xlat16_3.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_3.x / u_xlat46;
    u_xlat46 = u_xlat46 * 0.318309873;
    u_xlat46 = min(u_xlat46, 16.0);
    u_xlat25.x = (-u_xlat12.x) * u_xlat16_3.x + u_xlat12.x;
    u_xlat25.x = u_xlat12.x * u_xlat25.x + u_xlat16_3.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat12.x;
    u_xlat71 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat71 = u_xlat2.x * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat25.z = u_xlat71 + u_xlat2.x;
    u_xlat25.xz = u_xlat25.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.z * u_xlat25.x;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat71 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat71 * u_xlat71;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_72 = u_xlat71 * u_xlat16_49;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_49) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat77) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat46 = u_xlat46 * u_xlat25.x;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat46);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat2.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_49 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat16.xyz;
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat46) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_20.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_72);
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat46) + u_xlat16_19.xyz;
    u_xlat23.x = u_xlat23.x + -1.0;
    u_xlat23.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat23.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_20.y = u_xlat16_14.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat23.xy = min(u_xlat16_26.xx, u_xlat23.xy);
    u_xlat23.x = min(u_xlat23.x, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_21.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_73 = dot((-u_xlat16_13.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_13.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_6.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_6.x = u_xlat16_73 * 16.0 + u_xlat16_6.y;
    u_xlat16_13.x = u_xlat16_28.x * 16.0 + u_xlat16_6.y;
    u_xlat16_28.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_13.y = u_xlat16_6.z;
    u_xlat16_28.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat23.y * 0.5;
    u_xlat16_28.x = (-u_xlat23.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat23.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_28.xyz;
    u_xlat12.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
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
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec4 u_xlat15;
vec4 u_xlat16;
vec4 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump float u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
vec3 u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat46;
bool u_xlatb46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
float u_xlat77;
mediump float u_xlat16_82;
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
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_6 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_6.w>=0.5);
#else
    u_xlatb23 = u_xlat16_6.w>=0.5;
#endif
    u_xlat46 = _emissiveBreathe.y * _Time.y;
    u_xlat46 = cos(u_xlat46);
    u_xlat23.x = (u_xlatb23) ? abs(u_xlat46) : 1.0;
    u_xlat23.x = max(u_xlat23.x, _emissiveBreathe.z);
    u_xlat10.xyz = u_xlat23.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_72 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_73 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_13.xyz = vec3(u_xlat16_73) * u_xlat12.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_14.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_82 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_82);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
    u_xlat46 = (-u_xlat46) * u_xlat46 + 1.0;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 * _ShadowBias.z;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat46) + vs_TEXCOORD0.xyz;
    u_xlat2.xyw = (bool(u_xlatb23)) ? u_xlat2.xyw : vs_TEXCOORD0.xyz;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat6;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat16;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat17;
    u_xlat15 = u_xlat2.yyyy * u_xlat15;
    u_xlat6 = u_xlat6 * u_xlat2.xxxx + u_xlat15;
    u_xlat6 = u_xlat16 * u_xlat2.wwww + u_xlat6;
    u_xlat6 = u_xlat17 + u_xlat6;
    u_xlat23.x = _ShadowBias.x / u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat23.x = (-u_xlat23.x) + u_xlat6.z;
    u_xlat46 = max((-u_xlat6.w), u_xlat23.x);
    u_xlat46 = (-u_xlat23.x) + u_xlat46;
    u_xlat6.z = _ShadowBias.y * u_xlat46 + u_xlat23.x;
    u_xlat2.xyw = u_xlat6.xyz / u_xlat6.www;
    u_xlat6.xyz = u_xlat2.xyw * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat6.w = max(u_xlat6.z, 9.99999975e-05);
    u_xlat16_49 = (-_ShadowBias.w) + 1.0;
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat15.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat15.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat16.z = 0.0;
    u_xlat2.xyw = u_xlat6.xyw + u_xlat16.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.w);
    u_xlat15.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat23.x = dot(u_xlat15, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat46 = (-u_xlat16_49) + 1.0;
    u_xlat23.x = u_xlat23.x * u_xlat46 + u_xlat16_49;
    u_xlat23.x = (-u_xlat23.x) + 1.0;
    u_xlat23.x = (-u_xlat23.x) * u_xlat16_72 + 1.0;
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat2.xyw = u_xlat12.xyz * vec3(u_xlat16_73) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25.x = u_xlat16_3.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_3.x / u_xlat46;
    u_xlat46 = u_xlat46 * 0.318309873;
    u_xlat46 = min(u_xlat46, 16.0);
    u_xlat25.x = (-u_xlat12.x) * u_xlat16_3.x + u_xlat12.x;
    u_xlat25.x = u_xlat12.x * u_xlat25.x + u_xlat16_3.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat12.x;
    u_xlat71 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat71 = u_xlat2.x * u_xlat71 + u_xlat16_3.x;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat25.z = u_xlat71 + u_xlat2.x;
    u_xlat25.xz = u_xlat25.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.z * u_xlat25.x;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat71 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat71 * u_xlat71;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_49 = u_xlat71 * u_xlat16_49;
    u_xlat16_72 = u_xlat71 * u_xlat16_49;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat71 = (-u_xlat16_49) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat77) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat46 = u_xlat46 * u_xlat25.x;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat46);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat2.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_49 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat16.xyz;
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat46) * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + u_xlat16_20.xyz;
    u_xlat16_49 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.00100000005>=abs(u_xlat16_49));
#else
    u_xlatb46 = 0.00100000005>=abs(u_xlat16_49);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_49);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_72);
    u_xlat16_21.xy = (bool(u_xlatb46)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb46 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb46) ? 1.0 : 0.0;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_73 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_73;
    u_xlat16_49 = max(u_xlat16_21.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_72 * u_xlat16_49;
    u_xlat16_21.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat11.yyy * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * vec3(u_xlat46) + u_xlat16_19.xyz;
    u_xlat23.x = u_xlat23.x + -1.0;
    u_xlat23.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat23.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_20.y = u_xlat16_14.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat23.xy = min(u_xlat16_26.xx, u_xlat23.xy);
    u_xlat23.x = min(u_xlat23.x, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat23.xxx * u_xlat16_26.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_21.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_73 = dot((-u_xlat16_13.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_13.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_14.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_6.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_6.x = u_xlat16_73 * 16.0 + u_xlat16_6.y;
    u_xlat16_13.x = u_xlat16_28.x * 16.0 + u_xlat16_6.y;
    u_xlat16_28.xz = u_xlat16_6.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_13.y = u_xlat16_6.z;
    u_xlat16_28.xz = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat23.y * 0.5;
    u_xlat16_28.x = (-u_xlat23.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat23.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_28.xyz;
    u_xlat12.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_3.x = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_13.xyz = u_xlat15.xyz * u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
  GpuProgramID 119693
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
CustomEditor "HeroShowRenderingGUI.HeroShowShaderGUI"
}