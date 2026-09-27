//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Special/PBR(VertexAnim)" {
Properties {

_warning ("使用了顶点动画", Float) = 0.0

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

_VertexWaveSpeed ("VertexWaveSpeed", Range(0, 5)) = 0.0

_NormalWaveHeightMap ("NormalWaveHeightMap", 2D) = "black" { }

_NormalWaveStrength ("NormalWaveStrength", Range(-2, 2)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Toggle] _LASER_ON ("镭射开关", Float) = 0.0

_LaserMask ("镭射遮罩", 2D) = "white" { }

_LaserTex ("镭射贴图", 2D) = "white" { }

_LaserPosOffset ("镭射位置偏移", Vector) = (0,0,0,1)

_LaserColor ("镭射颜色", Color) = (0,0,0,1)

_LaserRampIntensity ("镭射强度", Range(0, 5)) = 1.0

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
  GpuProgramID 59752
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_26;
vec3 u_xlat32;
vec2 u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_44;
float u_xlat45;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.x = _VertexWaveSpeed * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _NormalWaveStrength;
    u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat18.x = texture(_NormalWaveHeightMap, u_xlat3.xy).x;
    u_xlat18.y = texture(_NormalWaveHeightMap, u_xlat3.zw).x;
    u_xlat16_54 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = (-vec2(u_xlat16_54)) + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * vec2(999.999939, 999.999939);
    u_xlat4.xy = u_xlat0.xx * (-u_xlat18.xy);
    u_xlat4.z = 1.0;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16_18.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xy = u_xlat4.xy * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.z;
    u_xlat6.z = u_xlat0.x * u_xlat16_5.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat4.zxyz;
    u_xlat18.x = dot(u_xlat3.yzw, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_1.x = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat6.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat36.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat6.xyz = u_xlat36.xxx * u_xlat6.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_19.x) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat58 = u_xlat16_19.x + -1.0;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat6.x = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat6.x = u_xlat18.x * u_xlat6.x + u_xlat16_19.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat16_8 = u_xlat16_1.xxxx * u_xlat5;
    u_xlat9.x = dot(u_xlat3.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat9.x) * u_xlat16_19.x + u_xlat9.x;
    u_xlat45 = u_xlat9.x * u_xlat45 + u_xlat16_19.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat9.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat45;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat6.x;
    u_xlat16_37 = u_xlat54 * u_xlat54;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_55 = u_xlat54 * u_xlat16_37;
    u_xlat54 = (-u_xlat16_37) * u_xlat54 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_7.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat16_12.xyz;
    u_xlat54 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat5.wxz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat14.xyz = u_xlat36.xxx * u_xlat14.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat14.x = dot(u_xlat3.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat32.x = u_xlat14.x * u_xlat32.x + u_xlat16_19.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat14.x;
    u_xlat32.x = u_xlat32.x + 6.10351563e-05;
    u_xlat32.x = u_xlat45 * u_xlat32.x;
    u_xlat32.x = float(1.0) / u_xlat32.x;
    u_xlat32.x = min(u_xlat32.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat32.x;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat32.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat32.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat36.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.zxy;
    u_xlat32.xyz = u_xlat14.xxx * u_xlat32.xyz;
    u_xlat16_13.xyz = u_xlat32.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat10.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb36 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb36)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb36 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb36) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat10.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat36.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat58 = dot(u_xlat3.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat63 * u_xlat63;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat63 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat63 + 1.0;
    u_xlat10.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat10.xyz;
    u_xlat54 = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat54 = u_xlat58 * u_xlat54 + u_xlat16_19.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat58;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat45;
    u_xlat36.y = float(1.0) / u_xlat54;
    u_xlat36.xy = min(u_xlat36.xy, vec2(16.0, 16.0));
    u_xlat36.x = u_xlat36.y * u_xlat36.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat36.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_16.xyz * u_xlat10.xyz;
    u_xlat16_1.xzw = u_xlat10.xyz * u_xlat6.www + u_xlat16_13.xyz;
    u_xlat16_56 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xy = u_xlat3.zw * u_xlat16_8.zw;
    u_xlat16_13.xy = u_xlat16_8.yx * u_xlat3.yx + (-u_xlat16_13.yx);
    u_xlat16_56 = u_xlat16_13.y * -0.5 + 0.5;
    u_xlat16_26.x = u_xlat16_13.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_13.x = u_xlat16_26.x + 0.5;
    u_xlat16_56 = (-u_xlat16_56) + _LaserPosOffset.y;
    u_xlat16_13.y = u_xlat16_56 + 1.0;
    u_xlat16_18.xyz = texture(_LaserTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_18.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_18.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_18.zxy * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _LaserColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_56 = dot(u_xlat16_13.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _LaserPosOffset.w;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = u_xlat16_56 * _LaserRampIntensity;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat16_56);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat4.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat3.yzw;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_56) + u_xlat16_26.x;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_26.x + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_26.x;
    u_xlat18.x = min(u_xlat16_56, 1.0);
    u_xlat36.x = min(u_xlat18.x, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat36.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat36.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati54 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.wxz), u_xlat3.yzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat6.xyw = (-u_xlat3.yzw) * u_xlat16_11.xxx + (-u_xlat16_8.wxz);
    u_xlat36.x = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_13.xyz, u_xlat6.xyw);
    u_xlat16_8.xzw = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_8.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_3.w);
    u_xlat16_44 = u_xlat16_8.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_8.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_8.x = u_xlat16_8.w * 15.0 + (-u_xlat16_8.x);
    u_xlat16_44 = u_xlat16_54 + (-u_xlat16_58);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_58;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat36.x = u_xlat36.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat18.x * 0.5;
    u_xlat16_26.x = (-u_xlat18.x) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat36.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_44 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_26.x;
    u_xlat16_8.x = u_xlat18.x * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat9.y = u_xlat16_7.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_26.xyz = u_xlat16_12.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_26.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.yzx * u_xlat16_11.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_10.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_18.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_26;
vec3 u_xlat32;
vec2 u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_44;
float u_xlat45;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.x = _VertexWaveSpeed * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _NormalWaveStrength;
    u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat18.x = texture(_NormalWaveHeightMap, u_xlat3.xy).x;
    u_xlat18.y = texture(_NormalWaveHeightMap, u_xlat3.zw).x;
    u_xlat16_54 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = (-vec2(u_xlat16_54)) + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * vec2(999.999939, 999.999939);
    u_xlat4.xy = u_xlat0.xx * (-u_xlat18.xy);
    u_xlat4.z = 1.0;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16_18.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xy = u_xlat4.xy * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.z;
    u_xlat6.z = u_xlat0.x * u_xlat16_5.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat4.zxyz;
    u_xlat18.x = dot(u_xlat3.yzw, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_1.x = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat6.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat36.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat6.xyz = u_xlat36.xxx * u_xlat6.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_19.x) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat58 = u_xlat16_19.x + -1.0;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat6.x = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat6.x = u_xlat18.x * u_xlat6.x + u_xlat16_19.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat16_8 = u_xlat16_1.xxxx * u_xlat5;
    u_xlat9.x = dot(u_xlat3.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat9.x) * u_xlat16_19.x + u_xlat9.x;
    u_xlat45 = u_xlat9.x * u_xlat45 + u_xlat16_19.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat9.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat45;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat6.x;
    u_xlat16_37 = u_xlat54 * u_xlat54;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_55 = u_xlat54 * u_xlat16_37;
    u_xlat54 = (-u_xlat16_37) * u_xlat54 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_10.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_7.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat16_12.xyz;
    u_xlat54 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat5.wxz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat14.xyz = u_xlat36.xxx * u_xlat14.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat14.x = dot(u_xlat3.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat32.x = u_xlat14.x * u_xlat32.x + u_xlat16_19.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat14.x;
    u_xlat32.x = u_xlat32.x + 6.10351563e-05;
    u_xlat32.x = u_xlat45 * u_xlat32.x;
    u_xlat32.x = float(1.0) / u_xlat32.x;
    u_xlat32.x = min(u_xlat32.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat32.x;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat32.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat32.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat36.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.zxy;
    u_xlat32.xyz = u_xlat14.xxx * u_xlat32.xyz;
    u_xlat16_13.xyz = u_xlat32.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat10.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb36 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb36)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb36 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb36) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat10.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat36.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat58 = dot(u_xlat3.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat63 * u_xlat63;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat63 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat63 + 1.0;
    u_xlat10.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat10.xyz;
    u_xlat54 = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat54 = u_xlat58 * u_xlat54 + u_xlat16_19.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat58;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat45;
    u_xlat36.y = float(1.0) / u_xlat54;
    u_xlat36.xy = min(u_xlat36.xy, vec2(16.0, 16.0));
    u_xlat36.x = u_xlat36.y * u_xlat36.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat36.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_16.xyz * u_xlat10.xyz;
    u_xlat16_1.xzw = u_xlat10.xyz * u_xlat6.www + u_xlat16_13.xyz;
    u_xlat16_56 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xy = u_xlat3.zw * u_xlat16_8.zw;
    u_xlat16_13.xy = u_xlat16_8.yx * u_xlat3.yx + (-u_xlat16_13.yx);
    u_xlat16_56 = u_xlat16_13.y * -0.5 + 0.5;
    u_xlat16_26.x = u_xlat16_13.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_13.x = u_xlat16_26.x + 0.5;
    u_xlat16_56 = (-u_xlat16_56) + _LaserPosOffset.y;
    u_xlat16_13.y = u_xlat16_56 + 1.0;
    u_xlat16_18.xyz = texture(_LaserTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_18.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_18.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_18.zxy * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _LaserColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_56 = dot(u_xlat16_13.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _LaserPosOffset.w;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = u_xlat16_56 * _LaserRampIntensity;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat16_56);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat4.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat3.yzw;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_56) + u_xlat16_26.x;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_26.x + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_26.x;
    u_xlat18.x = min(u_xlat16_56, 1.0);
    u_xlat36.x = min(u_xlat18.x, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat36.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat36.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati54 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.wxz), u_xlat3.yzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat6.xyw = (-u_xlat3.yzw) * u_xlat16_11.xxx + (-u_xlat16_8.wxz);
    u_xlat36.x = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_13.xyz, u_xlat6.xyw);
    u_xlat16_8.xzw = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_8.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_3.w);
    u_xlat16_44 = u_xlat16_8.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_8.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_8.x = u_xlat16_8.w * 15.0 + (-u_xlat16_8.x);
    u_xlat16_44 = u_xlat16_54 + (-u_xlat16_58);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_58;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat36.x = u_xlat36.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat18.x * 0.5;
    u_xlat16_26.x = (-u_xlat18.x) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat36.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_44 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_26.x;
    u_xlat16_8.x = u_xlat18.x * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat9.y = u_xlat16_7.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_26.xyz = u_xlat16_12.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_26.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.yzx * u_xlat16_11.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_10.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_18.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
bool u_xlatb39;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat60;
float u_xlat61;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat61 = _VertexWaveSpeed * _Time.y;
    u_xlat61 = sin(u_xlat61);
    u_xlat61 = u_xlat61 * 0.5;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * _NormalWaveStrength;
    u_xlat5 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat5.x = texture(_NormalWaveHeightMap, u_xlat5.xy).x;
    u_xlat5.y = texture(_NormalWaveHeightMap, u_xlat5.zw).x;
    u_xlat16_43 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat5.xy = (-vec2(u_xlat16_43)) + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * vec2(999.999939, 999.999939);
    u_xlat6.xy = vec2(u_xlat61) * (-u_xlat5.xy);
    u_xlat6.z = 1.0;
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = u_xlat6.xy * vec2(u_xlat61) + u_xlat16_7.xy;
    u_xlat61 = u_xlat61 * u_xlat6.z;
    u_xlat5.z = u_xlat61 * u_xlat16_7.z;
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5 = vec4(u_xlat61) * u_xlat6.zxyz;
    u_xlat4.x = dot(u_xlat5.yzw, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat5.yzw) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb63)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat16_64 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_10.x);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.x = dot(u_xlat5.yzw, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_64 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat20.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_10.xyz;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat5.yzw, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_10.x) + 1.0;
    u_xlat39 = u_xlat3.x * u_xlat3.x;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat58 = u_xlat16_10.x + -1.0;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat3.x = (-u_xlat1.x) * u_xlat16_10.x + u_xlat1.x;
    u_xlat3.x = u_xlat1.x * u_xlat3.x + u_xlat16_10.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat1.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_9 = u_xlat2 * vec4(u_xlat16_64);
    u_xlat4.x = dot(u_xlat5.zwy, u_xlat16_9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat21 = u_xlat4.x * u_xlat21 + u_xlat16_10.x;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat4.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat21;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat3.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat20.x * u_xlat16_29.x;
    u_xlat20.x = (-u_xlat16_29.x) * u_xlat20.x + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat20.xxx * u_xlat16_14.xyz;
    u_xlat20.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat39) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat19.xxx * u_xlat12.xyz;
    u_xlat16.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat39 = dot(u_xlat5.yzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_29.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat60 = dot(u_xlat5.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat60) * u_xlat16_10.x + u_xlat60;
    u_xlat42 = u_xlat60 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat60 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat21 * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat39 = u_xlat39 * u_xlat42;
    u_xlat16_29.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat3.x * u_xlat16_29.x;
    u_xlat3.x = (-u_xlat16_29.x) * u_xlat3.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat3.xxx;
    u_xlat16.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat12.xyz;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb39 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb39)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb39 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb39) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_15.xyz;
    u_xlat39 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xzw = vec3(u_xlat39) * u_xlat2.xzw;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat39 = dot(u_xlat5.yzw, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat20.y = u_xlat39 * 0.318309873;
    u_xlat58 = dot(u_xlat5.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_68 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat2.xzw = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xzw = u_xlat20.xxx * vec3(u_xlat16_68) + u_xlat2.xzw;
    u_xlat20.x = (-u_xlat58) * u_xlat16_10.x + u_xlat58;
    u_xlat20.x = u_xlat58 * u_xlat20.x + u_xlat16_10.x;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat58;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat20.x = u_xlat20.x * u_xlat21;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.xy = min(u_xlat20.xy, vec2(16.0, 16.0));
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat2.xyz = u_xlat2.xzw * u_xlat20.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_29.xyz;
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat60) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xy = u_xlat5.zw * u_xlat16_9.zw;
    u_xlat16_11.xy = u_xlat16_9.yx * u_xlat5.yx + (-u_xlat16_11.yx);
    u_xlat16_64 = u_xlat16_11.y * -0.5 + 0.5;
    u_xlat16_11.x = u_xlat16_11.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_11.x = u_xlat16_11.x + 0.5;
    u_xlat16_64 = (-u_xlat16_64) + _LaserPosOffset.y;
    u_xlat16_11.y = u_xlat16_64 + 1.0;
    u_xlat16_1.xyz = texture(_LaserTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _LaserColor.zxy + (-u_xlat16_7.xyz);
    u_xlat16_64 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _LaserPosOffset.w;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * _LaserRampIntensity;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(u_xlat16_64);
    u_xlat16_19.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_7.xyz = u_xlat16_19.xxx * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat5.yzw;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat5.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_64) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_64;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
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
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_9.wxz), u_xlat5.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat5.yzw) * u_xlat16_13.xxx + (-u_xlat16_9.wxz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat5.yzw);
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
    u_xlat20.xyz = u_xlat6.xyz * vec3(u_xlat61) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_10.xxx * u_xlat20.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_10.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_64 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_64 = u_xlat16_11.z * 15.0 + (-u_xlat16_64);
    u_xlat16_10.x = (-u_xlat16_39) + u_xlat16_20.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_10.x + u_xlat16_39;
    u_xlat16_64 = u_xlat16_68 * u_xlat16_64;
    u_xlat1.x = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat1.x * u_xlat16_10.x + u_xlat16_64;
    u_xlat16_10.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_11.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_11.x + u_xlat16_10.x;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_3.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_14.yzx + u_xlat16_29.yzx;
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_12.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = cos(u_xlat1.x);
    u_xlat1.x = max(abs(u_xlat1.x), _emissiveBreathe.z);
    u_xlat16_20.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_20.zxy * _emissiveColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat1.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat1.xyz * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_29.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat58);
    u_xlat0.x = u_xlat58 * 0.0625 + u_xlat0.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_64 : u_xlat16_10.x;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
bool u_xlatb39;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat60;
float u_xlat61;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat61 = _VertexWaveSpeed * _Time.y;
    u_xlat61 = sin(u_xlat61);
    u_xlat61 = u_xlat61 * 0.5;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * _NormalWaveStrength;
    u_xlat5 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat5.x = texture(_NormalWaveHeightMap, u_xlat5.xy).x;
    u_xlat5.y = texture(_NormalWaveHeightMap, u_xlat5.zw).x;
    u_xlat16_43 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat5.xy = (-vec2(u_xlat16_43)) + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * vec2(999.999939, 999.999939);
    u_xlat6.xy = vec2(u_xlat61) * (-u_xlat5.xy);
    u_xlat6.z = 1.0;
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = u_xlat6.xy * vec2(u_xlat61) + u_xlat16_7.xy;
    u_xlat61 = u_xlat61 * u_xlat6.z;
    u_xlat5.z = u_xlat61 * u_xlat16_7.z;
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5 = vec4(u_xlat61) * u_xlat6.zxyz;
    u_xlat4.x = dot(u_xlat5.yzw, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat5.yzw) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb63)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat16_64 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_10.x);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.x = dot(u_xlat5.yzw, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_64 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat20.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_10.xyz;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat5.yzw, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_10.x) + 1.0;
    u_xlat39 = u_xlat3.x * u_xlat3.x;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat58 = u_xlat16_10.x + -1.0;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat3.x = (-u_xlat1.x) * u_xlat16_10.x + u_xlat1.x;
    u_xlat3.x = u_xlat1.x * u_xlat3.x + u_xlat16_10.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat1.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_9 = u_xlat2 * vec4(u_xlat16_64);
    u_xlat4.x = dot(u_xlat5.zwy, u_xlat16_9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat21 = u_xlat4.x * u_xlat21 + u_xlat16_10.x;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat4.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat21;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat3.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat20.x * u_xlat16_29.x;
    u_xlat20.x = (-u_xlat16_29.x) * u_xlat20.x + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat20.xxx * u_xlat16_14.xyz;
    u_xlat20.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat39) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat19.xxx * u_xlat12.xyz;
    u_xlat16.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat39 = dot(u_xlat5.yzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_29.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat60 = dot(u_xlat5.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat60) * u_xlat16_10.x + u_xlat60;
    u_xlat42 = u_xlat60 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat60 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat21 * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat39 = u_xlat39 * u_xlat42;
    u_xlat16_29.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat3.x * u_xlat16_29.x;
    u_xlat3.x = (-u_xlat16_29.x) * u_xlat3.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat3.xxx;
    u_xlat16.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat12.xyz;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb39 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb39)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb39 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb39) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_15.xyz;
    u_xlat39 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xzw = vec3(u_xlat39) * u_xlat2.xzw;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat39 = dot(u_xlat5.yzw, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat20.y = u_xlat39 * 0.318309873;
    u_xlat58 = dot(u_xlat5.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_68 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat2.xzw = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xzw = u_xlat20.xxx * vec3(u_xlat16_68) + u_xlat2.xzw;
    u_xlat20.x = (-u_xlat58) * u_xlat16_10.x + u_xlat58;
    u_xlat20.x = u_xlat58 * u_xlat20.x + u_xlat16_10.x;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat58;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat20.x = u_xlat20.x * u_xlat21;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.xy = min(u_xlat20.xy, vec2(16.0, 16.0));
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat2.xyz = u_xlat2.xzw * u_xlat20.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_29.xyz;
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat60) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xy = u_xlat5.zw * u_xlat16_9.zw;
    u_xlat16_11.xy = u_xlat16_9.yx * u_xlat5.yx + (-u_xlat16_11.yx);
    u_xlat16_64 = u_xlat16_11.y * -0.5 + 0.5;
    u_xlat16_11.x = u_xlat16_11.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_11.x = u_xlat16_11.x + 0.5;
    u_xlat16_64 = (-u_xlat16_64) + _LaserPosOffset.y;
    u_xlat16_11.y = u_xlat16_64 + 1.0;
    u_xlat16_1.xyz = texture(_LaserTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _LaserColor.zxy + (-u_xlat16_7.xyz);
    u_xlat16_64 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _LaserPosOffset.w;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * _LaserRampIntensity;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(u_xlat16_64);
    u_xlat16_19.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_7.xyz = u_xlat16_19.xxx * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat5.yzw;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat5.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_64) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_64;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
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
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_9.wxz), u_xlat5.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat5.yzw) * u_xlat16_13.xxx + (-u_xlat16_9.wxz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat5.yzw);
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
    u_xlat20.xyz = u_xlat6.xyz * vec3(u_xlat61) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_10.xxx * u_xlat20.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_10.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_64 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_64 = u_xlat16_11.z * 15.0 + (-u_xlat16_64);
    u_xlat16_10.x = (-u_xlat16_39) + u_xlat16_20.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_10.x + u_xlat16_39;
    u_xlat16_64 = u_xlat16_68 * u_xlat16_64;
    u_xlat1.x = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat1.x * u_xlat16_10.x + u_xlat16_64;
    u_xlat16_10.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_11.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_11.x + u_xlat16_10.x;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_3.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_14.yzx + u_xlat16_29.yzx;
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_12.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = cos(u_xlat1.x);
    u_xlat1.x = max(abs(u_xlat1.x), _emissiveBreathe.z);
    u_xlat16_20.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_20.zxy * _emissiveColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat1.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat1.xyz * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_29.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat58 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat58);
    u_xlat0.x = u_xlat58 * 0.0625 + u_xlat0.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_64 : u_xlat16_10.x;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_26;
vec3 u_xlat32;
vec2 u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_44;
float u_xlat45;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.x = _VertexWaveSpeed * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _NormalWaveStrength;
    u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat18.x = texture(_NormalWaveHeightMap, u_xlat3.xy).x;
    u_xlat18.y = texture(_NormalWaveHeightMap, u_xlat3.zw).x;
    u_xlat16_54 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = (-vec2(u_xlat16_54)) + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * vec2(999.999939, 999.999939);
    u_xlat4.xy = u_xlat0.xx * (-u_xlat18.xy);
    u_xlat4.z = 1.0;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16_18.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xy = u_xlat4.xy * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.z;
    u_xlat6.z = u_xlat0.x * u_xlat16_5.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat4.zxyz;
    u_xlat18.x = dot(u_xlat3.yzw, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_1.x = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat6.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat36.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat6.xyz = u_xlat36.xxx * u_xlat6.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_19.x) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat58 = u_xlat16_19.x + -1.0;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat6.x = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat6.x = u_xlat18.x * u_xlat6.x + u_xlat16_19.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat16_8 = u_xlat16_1.xxxx * u_xlat5;
    u_xlat9.x = dot(u_xlat3.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat9.x) * u_xlat16_19.x + u_xlat9.x;
    u_xlat45 = u_xlat9.x * u_xlat45 + u_xlat16_19.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat9.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat45;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat6.x;
    u_xlat16_37 = u_xlat54 * u_xlat54;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_55 = u_xlat54 * u_xlat16_37;
    u_xlat54 = (-u_xlat16_37) * u_xlat54 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_7.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat16_12.xyz;
    u_xlat54 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat5.wxz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat14.xyz = u_xlat36.xxx * u_xlat14.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat14.x = dot(u_xlat3.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat32.x = u_xlat14.x * u_xlat32.x + u_xlat16_19.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat14.x;
    u_xlat32.x = u_xlat32.x + 6.10351563e-05;
    u_xlat32.x = u_xlat45 * u_xlat32.x;
    u_xlat32.x = float(1.0) / u_xlat32.x;
    u_xlat32.x = min(u_xlat32.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat32.x;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat32.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat32.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat36.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.xyz;
    u_xlat32.xyz = u_xlat14.xxx * u_xlat32.xyz;
    u_xlat16_13.xyz = u_xlat32.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat10.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb36 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb36)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb36 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb36) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat36.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat58 = dot(u_xlat3.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat63 * u_xlat63;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat63 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat63 + 1.0;
    u_xlat10.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat10.xyz;
    u_xlat54 = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat54 = u_xlat58 * u_xlat54 + u_xlat16_19.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat58;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat45;
    u_xlat36.y = float(1.0) / u_xlat54;
    u_xlat36.xy = min(u_xlat36.xy, vec2(16.0, 16.0));
    u_xlat36.x = u_xlat36.y * u_xlat36.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat36.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_16.xyz * u_xlat10.xyz;
    u_xlat16_1.xzw = u_xlat10.xyz * u_xlat6.www + u_xlat16_13.xyz;
    u_xlat16_56 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xy = u_xlat3.zw * u_xlat16_8.zw;
    u_xlat16_13.xy = u_xlat16_8.yx * u_xlat3.yx + (-u_xlat16_13.yx);
    u_xlat16_56 = u_xlat16_13.y * -0.5 + 0.5;
    u_xlat16_26.x = u_xlat16_13.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_13.x = u_xlat16_26.x + 0.5;
    u_xlat16_56 = (-u_xlat16_56) + _LaserPosOffset.y;
    u_xlat16_13.y = u_xlat16_56 + 1.0;
    u_xlat16_18.xyz = texture(_LaserTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_18.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _LaserColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_56 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _LaserPosOffset.w;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = u_xlat16_56 * _LaserRampIntensity;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat16_56);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat4.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat3.yzw;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_56) + u_xlat16_26.x;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_26.x + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_26.x;
    u_xlat18.x = min(u_xlat16_56, 1.0);
    u_xlat36.x = min(u_xlat18.x, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat36.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat36.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati54 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.wxz), u_xlat3.yzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat6.xyw = (-u_xlat3.yzw) * u_xlat16_11.xxx + (-u_xlat16_8.wxz);
    u_xlat36.x = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_13.xyz, u_xlat6.xyw);
    u_xlat16_8.xzw = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_8.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_3.w);
    u_xlat16_44 = u_xlat16_8.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_8.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_8.x = u_xlat16_8.w * 15.0 + (-u_xlat16_8.x);
    u_xlat16_44 = u_xlat16_54 + (-u_xlat16_58);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_58;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat36.x = u_xlat36.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat18.x * 0.5;
    u_xlat16_26.x = (-u_xlat18.x) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat36.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_44 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_26.x;
    u_xlat16_8.x = u_xlat18.x * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat9.y = u_xlat16_7.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_26.xyz = u_xlat16_12.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_26.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_10.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_26;
vec3 u_xlat32;
vec2 u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_44;
float u_xlat45;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.x = _VertexWaveSpeed * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _NormalWaveStrength;
    u_xlat3 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat18.x = texture(_NormalWaveHeightMap, u_xlat3.xy).x;
    u_xlat18.y = texture(_NormalWaveHeightMap, u_xlat3.zw).x;
    u_xlat16_54 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = (-vec2(u_xlat16_54)) + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * vec2(999.999939, 999.999939);
    u_xlat4.xy = u_xlat0.xx * (-u_xlat18.xy);
    u_xlat4.z = 1.0;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16_18.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xy = u_xlat4.xy * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.z;
    u_xlat6.z = u_xlat0.x * u_xlat16_5.z;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat4.zxyz;
    u_xlat18.x = dot(u_xlat3.yzw, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_1.x = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat6.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat36.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat6.xyz = u_xlat36.xxx * u_xlat6.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_19.x) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat58 = u_xlat16_19.x + -1.0;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat6.x = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat6.x = u_xlat18.x * u_xlat6.x + u_xlat16_19.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat16_8 = u_xlat16_1.xxxx * u_xlat5;
    u_xlat9.x = dot(u_xlat3.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat9.x) * u_xlat16_19.x + u_xlat9.x;
    u_xlat45 = u_xlat9.x * u_xlat45 + u_xlat16_19.x;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat9.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat45;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat6.x;
    u_xlat16_37 = u_xlat54 * u_xlat54;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_37 = u_xlat54 * u_xlat16_37;
    u_xlat16_55 = u_xlat54 * u_xlat16_37;
    u_xlat54 = (-u_xlat16_37) * u_xlat54 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_7.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat16_12.xyz;
    u_xlat54 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat18.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat6.xxx * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat5.wxz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat14.xyz = u_xlat36.xxx * u_xlat14.xyz;
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat36.x = min(u_xlat36.x, 16.0);
    u_xlat14.x = dot(u_xlat3.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat32.x = u_xlat14.x * u_xlat32.x + u_xlat16_19.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat14.x;
    u_xlat32.x = u_xlat32.x + 6.10351563e-05;
    u_xlat32.x = u_xlat45 * u_xlat32.x;
    u_xlat32.x = float(1.0) / u_xlat32.x;
    u_xlat32.x = min(u_xlat32.x, 16.0);
    u_xlat36.x = u_xlat36.x * u_xlat32.x;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat32.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat32.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat36.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.xyz;
    u_xlat32.xyz = u_xlat14.xxx * u_xlat32.xyz;
    u_xlat16_13.xyz = u_xlat32.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat10.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb36 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb36)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb36 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb36) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat5.wxz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat36.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36.x = inversesqrt(u_xlat36.x);
    u_xlat10.xyz = u_xlat36.xxx * u_xlat10.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat36.x = dot(u_xlat3.yzw, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat36.x * u_xlat58 + 1.0;
    u_xlat36.x = u_xlat36.x * u_xlat36.x;
    u_xlat36.x = u_xlat16_19.x / u_xlat36.x;
    u_xlat36.x = u_xlat36.x * 0.318309873;
    u_xlat58 = dot(u_xlat3.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat63 * u_xlat63;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat63 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat63 * u_xlat16_1.x;
    u_xlat63 = (-u_xlat16_1.x) * u_xlat63 + 1.0;
    u_xlat10.xyz = u_xlat16_12.xyz * vec3(u_xlat63);
    u_xlat10.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat10.xyz;
    u_xlat54 = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat54 = u_xlat58 * u_xlat54 + u_xlat16_19.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat58;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat45;
    u_xlat36.y = float(1.0) / u_xlat54;
    u_xlat36.xy = min(u_xlat36.xy, vec2(16.0, 16.0));
    u_xlat36.x = u_xlat36.y * u_xlat36.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat36.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_16.xyz * u_xlat10.xyz;
    u_xlat16_1.xzw = u_xlat10.xyz * u_xlat6.www + u_xlat16_13.xyz;
    u_xlat16_56 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat18.xxx * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_13.xy = u_xlat3.zw * u_xlat16_8.zw;
    u_xlat16_13.xy = u_xlat16_8.yx * u_xlat3.yx + (-u_xlat16_13.yx);
    u_xlat16_56 = u_xlat16_13.y * -0.5 + 0.5;
    u_xlat16_26.x = u_xlat16_13.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_13.x = u_xlat16_26.x + 0.5;
    u_xlat16_56 = (-u_xlat16_56) + _LaserPosOffset.y;
    u_xlat16_13.y = u_xlat16_56 + 1.0;
    u_xlat16_18.xyz = texture(_LaserTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_18.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _LaserColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_56 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _LaserPosOffset.w;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = u_xlat16_56 * _LaserRampIntensity;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat16_56);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_13.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xyz = (-u_xlat4.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat3.yzw;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_26.x = (-u_xlat16_56) + u_xlat16_26.x;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_26.x + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_26.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat16_26.x = _occlusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_26.x;
    u_xlat18.x = min(u_xlat16_56, 1.0);
    u_xlat36.x = min(u_xlat18.x, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat36.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat36.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat36.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat36.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati54 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.wxz), u_xlat3.yzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat6.xyw = (-u_xlat3.yzw) * u_xlat16_11.xxx + (-u_xlat16_8.wxz);
    u_xlat36.x = dot(u_xlat16_13.xyz, u_xlat3.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat36.x = min(max(u_xlat36.x, 0.0), 1.0);
#else
    u_xlat36.x = clamp(u_xlat36.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_13.xyz, u_xlat6.xyw);
    u_xlat16_8.xzw = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xzw = min(max(u_xlat16_8.xzw, 0.0), 1.0);
#else
    u_xlat16_8.xzw = clamp(u_xlat16_8.xzw, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_8.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_3.w);
    u_xlat16_44 = u_xlat16_8.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_3.x = u_xlat16_44 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_8.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_8.x = u_xlat16_8.w * 15.0 + (-u_xlat16_8.x);
    u_xlat16_44 = u_xlat16_54 + (-u_xlat16_58);
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_58;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat36.x = u_xlat36.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat18.x * 0.5;
    u_xlat16_26.x = (-u_xlat18.x) * 0.5 + 1.0;
    u_xlat16_8.x = u_xlat36.x * u_xlat16_26.x + u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_44 = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_44 + u_xlat16_26.x;
    u_xlat16_8.x = u_xlat18.x * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat6.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat6.xyw;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat9.y = u_xlat16_7.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_26.xyz = u_xlat16_12.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_11.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_26.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_10.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_10.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_8.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
float u_xlat21;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
bool u_xlatb39;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat60;
float u_xlat61;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat61 = _VertexWaveSpeed * _Time.y;
    u_xlat61 = sin(u_xlat61);
    u_xlat61 = u_xlat61 * 0.5;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * _NormalWaveStrength;
    u_xlat5 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat5.x = texture(_NormalWaveHeightMap, u_xlat5.xy).x;
    u_xlat5.y = texture(_NormalWaveHeightMap, u_xlat5.zw).x;
    u_xlat16_43 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat5.xy = (-vec2(u_xlat16_43)) + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * vec2(999.999939, 999.999939);
    u_xlat6.xy = vec2(u_xlat61) * (-u_xlat5.xy);
    u_xlat6.z = 1.0;
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = u_xlat6.xy * vec2(u_xlat61) + u_xlat16_7.xy;
    u_xlat61 = u_xlat61 * u_xlat6.z;
    u_xlat5.z = u_xlat61 * u_xlat16_7.z;
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5 = vec4(u_xlat61) * u_xlat6.zxyz;
    u_xlat4.x = dot(u_xlat5.yzw, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat5.yzw) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb63)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat16_64 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_10.x);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat5.yzw, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_64 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat20.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_10.xyz;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat5.yzw, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_10.x) + 1.0;
    u_xlat39 = u_xlat3.x * u_xlat3.x;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat58 = u_xlat16_10.x + -1.0;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat3.x = (-u_xlat1.x) * u_xlat16_10.x + u_xlat1.x;
    u_xlat3.x = u_xlat1.x * u_xlat3.x + u_xlat16_10.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat1.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_9 = u_xlat2 * vec4(u_xlat16_64);
    u_xlat4.x = dot(u_xlat5.zwy, u_xlat16_9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat21 = u_xlat4.x * u_xlat21 + u_xlat16_10.x;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat4.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat21;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat3.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat20.x * u_xlat16_29.x;
    u_xlat20.x = (-u_xlat16_29.x) * u_xlat20.x + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat20.xxx * u_xlat16_14.xyz;
    u_xlat20.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat39) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat19.xxx * u_xlat12.xyz;
    u_xlat16.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat39 = dot(u_xlat5.yzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_29.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat60 = dot(u_xlat5.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat60) * u_xlat16_10.x + u_xlat60;
    u_xlat42 = u_xlat60 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat60 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat21 * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat39 = u_xlat39 * u_xlat42;
    u_xlat16_29.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat3.x * u_xlat16_29.x;
    u_xlat3.x = (-u_xlat16_29.x) * u_xlat3.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat3.xxx;
    u_xlat16.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat12.xyz;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb39 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb39)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb39 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb39) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xzw = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_15.xyz;
    u_xlat39 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xzw = vec3(u_xlat39) * u_xlat2.xzw;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat39 = dot(u_xlat5.yzw, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat20.y = u_xlat39 * 0.318309873;
    u_xlat58 = dot(u_xlat5.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_68 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat2.xzw = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xzw = u_xlat20.xxx * vec3(u_xlat16_68) + u_xlat2.xzw;
    u_xlat20.x = (-u_xlat58) * u_xlat16_10.x + u_xlat58;
    u_xlat20.x = u_xlat58 * u_xlat20.x + u_xlat16_10.x;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat58;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat20.x = u_xlat20.x * u_xlat21;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.xy = min(u_xlat20.xy, vec2(16.0, 16.0));
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat2.xyz = u_xlat2.xzw * u_xlat20.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_29.xyz;
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat60) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xy = u_xlat5.zw * u_xlat16_9.zw;
    u_xlat16_11.xy = u_xlat16_9.yx * u_xlat5.yx + (-u_xlat16_11.yx);
    u_xlat16_64 = u_xlat16_11.y * -0.5 + 0.5;
    u_xlat16_11.x = u_xlat16_11.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_11.x = u_xlat16_11.x + 0.5;
    u_xlat16_64 = (-u_xlat16_64) + _LaserPosOffset.y;
    u_xlat16_11.y = u_xlat16_64 + 1.0;
    u_xlat16_1.xyz = texture(_LaserTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _LaserColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _LaserPosOffset.w;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * _LaserRampIntensity;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(u_xlat16_64);
    u_xlat16_19.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_7.xyz = u_xlat16_19.xxx * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat5.yzw;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat5.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_64) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_64;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
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
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_9.wxz), u_xlat5.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat5.yzw) * u_xlat16_13.xxx + (-u_xlat16_9.wxz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat5.yzw);
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
    u_xlat20.xyz = u_xlat6.xyz * vec3(u_xlat61) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_10.xxx * u_xlat20.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_10.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_64 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_64 = u_xlat16_11.z * 15.0 + (-u_xlat16_64);
    u_xlat16_10.x = (-u_xlat16_38) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_10.x + u_xlat16_38;
    u_xlat16_64 = u_xlat16_68 * u_xlat16_64;
    u_xlat0.x = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_10.x + u_xlat16_64;
    u_xlat16_10.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_11.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_11.x + u_xlat16_10.x;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_3.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_29.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_12.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_29.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_64 : u_xlat16_10.x;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _VertexWaveSpeed;
uniform 	mediump float _NormalWaveStrength;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _NormalWaveHeightMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
float u_xlat21;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_38;
int u_xlati38;
float u_xlat39;
bool u_xlatb39;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat60;
float u_xlat61;
bool u_xlatb63;
mediump float u_xlat16_64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat61 = _VertexWaveSpeed * _Time.y;
    u_xlat61 = sin(u_xlat61);
    u_xlat61 = u_xlat61 * 0.5;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * _NormalWaveStrength;
    u_xlat5 = vs_TEXCOORD3.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat5.x = texture(_NormalWaveHeightMap, u_xlat5.xy).x;
    u_xlat5.y = texture(_NormalWaveHeightMap, u_xlat5.zw).x;
    u_xlat16_43 = texture(_NormalWaveHeightMap, vs_TEXCOORD3.xy).x;
    u_xlat5.xy = (-vec2(u_xlat16_43)) + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * vec2(999.999939, 999.999939);
    u_xlat6.xy = vec2(u_xlat61) * (-u_xlat5.xy);
    u_xlat6.z = 1.0;
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xy = u_xlat6.xy * vec2(u_xlat61) + u_xlat16_7.xy;
    u_xlat61 = u_xlat61 * u_xlat6.z;
    u_xlat5.z = u_xlat61 * u_xlat16_7.z;
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat8.xyz = vec3(u_xlat61) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5 = vec4(u_xlat61) * u_xlat6.zxyz;
    u_xlat4.x = dot(u_xlat5.yzw, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat5.yzw) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb63 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb63)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat16_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_64);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat16_64 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_10.x);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.x = dot(u_xlat5.yzw, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_64 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat20.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_10.xyz;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat5.yzw, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_10.x) + 1.0;
    u_xlat39 = u_xlat3.x * u_xlat3.x;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat58 = u_xlat16_10.x + -1.0;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat3.x = (-u_xlat1.x) * u_xlat16_10.x + u_xlat1.x;
    u_xlat3.x = u_xlat1.x * u_xlat3.x + u_xlat16_10.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat1.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_9 = u_xlat2 * vec4(u_xlat16_64);
    u_xlat4.x = dot(u_xlat5.zwy, u_xlat16_9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat4.x) * u_xlat16_10.x + u_xlat4.x;
    u_xlat21 = u_xlat4.x * u_xlat21 + u_xlat16_10.x;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat4.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat21;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat3.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat20.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat20.x * u_xlat16_29.x;
    u_xlat20.x = (-u_xlat16_29.x) * u_xlat20.x + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat20.xxx * u_xlat16_14.xyz;
    u_xlat20.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat39) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat19.xxx * u_xlat12.xyz;
    u_xlat16.xyz = u_xlat2.wxz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat39 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
    u_xlat39 = dot(u_xlat5.yzw, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_29.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat60 = dot(u_xlat5.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat60) * u_xlat16_10.x + u_xlat60;
    u_xlat42 = u_xlat60 * u_xlat42 + u_xlat16_10.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat60 + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat21 * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat39 = u_xlat39 * u_xlat42;
    u_xlat16_29.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_29.x;
    u_xlat16_48 = u_xlat3.x * u_xlat16_29.x;
    u_xlat3.x = (-u_xlat16_29.x) * u_xlat3.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat3.xxx;
    u_xlat16.xyz = u_xlat20.xxx * vec3(u_xlat16_48) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_29.xyz = u_xlat16.xyz * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat12.xyz;
    u_xlat16_68 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb39 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb39)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb39 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb39) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xzw = u_xlat2.wxz * vec3(u_xlat16_64) + u_xlat16_15.xyz;
    u_xlat39 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xzw = vec3(u_xlat39) * u_xlat2.xzw;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat39 = dot(u_xlat5.yzw, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat58 + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_10.x / u_xlat39;
    u_xlat20.y = u_xlat39 * 0.318309873;
    u_xlat58 = dot(u_xlat5.yzw, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat2.x * u_xlat2.x;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_64 = u_xlat2.x * u_xlat16_64;
    u_xlat16_68 = u_xlat2.x * u_xlat16_64;
    u_xlat2.x = (-u_xlat16_64) * u_xlat2.x + 1.0;
    u_xlat2.xzw = u_xlat16_14.xyz * u_xlat2.xxx;
    u_xlat2.xzw = u_xlat20.xxx * vec3(u_xlat16_68) + u_xlat2.xzw;
    u_xlat20.x = (-u_xlat58) * u_xlat16_10.x + u_xlat58;
    u_xlat20.x = u_xlat58 * u_xlat20.x + u_xlat16_10.x;
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat58;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat20.x = u_xlat20.x * u_xlat21;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.xy = min(u_xlat20.xy, vec2(16.0, 16.0));
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat2.xyz = u_xlat2.xzw * u_xlat20.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_29.xyz = u_xlat2.xyz * u_xlat19.yyy + u_xlat16_29.xyz;
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat60) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xy = u_xlat5.zw * u_xlat16_9.zw;
    u_xlat16_11.xy = u_xlat16_9.yx * u_xlat5.yx + (-u_xlat16_11.yx);
    u_xlat16_64 = u_xlat16_11.y * -0.5 + 0.5;
    u_xlat16_11.x = u_xlat16_11.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_11.x = u_xlat16_11.x + 0.5;
    u_xlat16_64 = (-u_xlat16_64) + _LaserPosOffset.y;
    u_xlat16_11.y = u_xlat16_64 + 1.0;
    u_xlat16_1.xyz = texture(_LaserTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _LaserColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _LaserPosOffset.w;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = u_xlat16_64 * _LaserRampIntensity;
    u_xlat16_11.xyz = u_xlat16_15.xyz * vec3(u_xlat16_64);
    u_xlat16_19.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_7.xyz = u_xlat16_19.xxx * u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat5.yzw;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat5.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_64) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_8.w * u_xlat16_64;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
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
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_9.wxz), u_xlat5.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat5.yzw) * u_xlat16_13.xxx + (-u_xlat16_9.wxz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat5.yzw);
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
    u_xlat20.xyz = u_xlat6.xyz * vec3(u_xlat61) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_10.xxx * u_xlat20.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_10.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat4.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_10.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_64 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_64 = u_xlat16_11.z * 15.0 + (-u_xlat16_64);
    u_xlat16_10.x = (-u_xlat16_38) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_10.x + u_xlat16_38;
    u_xlat16_64 = u_xlat16_68 * u_xlat16_64;
    u_xlat0.x = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_10.x + u_xlat16_64;
    u_xlat16_10.x = u_xlat16_64 + u_xlat16_64;
    u_xlat16_11.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_11.x + u_xlat16_10.x;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_3.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_29.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_12.w * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat16_29.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_29.xyz + u_xlat16_7.xyz;
    u_xlat16_29.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_64 : u_xlat16_10.x;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
ivec3 u_xlati12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
float u_xlat48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
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
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = u_xlat0.zxyz * vec4(u_xlat53);
    u_xlat10.x = dot(u_xlat7.yzw, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.x = dot(u_xlat7.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat26.x = dot(u_xlat7.yzw, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat26.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_49 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_49;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat6 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_51 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8 = vec4(u_xlat16_51) * u_xlat6;
    u_xlat26.xyz = u_xlat6.wxz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat5.y = u_xlat21 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat21 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat26.xyz = vec3(u_xlat21) * u_xlat26.xyz;
    u_xlat21 = dot(u_xlat7.yzw, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_51) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat42 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_49 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_51 = u_xlat26.x * u_xlat26.x;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_52 = u_xlat26.x * u_xlat16_51;
    u_xlat21 = (-u_xlat16_51) * u_xlat26.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat16_3.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat21) * vec3(u_xlat16_52) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xy = u_xlat7.zw * u_xlat16_8.zw;
    u_xlat16_9.xy = u_xlat16_8.yx * u_xlat7.yx + (-u_xlat16_9.yx);
    u_xlat16_18.x = u_xlat16_9.y * -0.5 + 0.5;
    u_xlat16_51 = u_xlat16_9.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_9.x = u_xlat16_51 + 0.5;
    u_xlat16_18.x = (-u_xlat16_18.x) + _LaserPosOffset.y;
    u_xlat16_9.y = u_xlat16_18.x + 1.0;
    u_xlat16_12.xyz = texture(_LaserTex, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_12.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.zxy;
    u_xlat16_13.xyz = u_xlat16_9.xyz * _LaserColor.zxy + (-u_xlat16_1.xyz);
    u_xlat16_18.x = dot(u_xlat16_9.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18.x = log2(u_xlat16_18.x);
    u_xlat16_18.x = u_xlat16_18.x * _LaserPosOffset.w;
    u_xlat16_18.x = exp2(u_xlat16_18.x);
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_18.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_18.xxx;
    u_xlat16_5.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.xyz = u_xlat16_5.xxx * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.yzw;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_18.x) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_51 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_18.x, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat21) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati12.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati12.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati12.x) & 1u));
    u_xlati7 = (u_xlati12.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati7].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.wxz), u_xlat7.yzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat12.xyz = (-u_xlat7.yzw) * u_xlat16_4.xxx + (-u_xlat16_8.wxz);
    u_xlat21 = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_6.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_34 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_23) + u_xlat16_7;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_23;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_34;
    u_xlat21 = u_xlat21 * u_xlat16_34;
    u_xlat16_34 = u_xlat5.x * 0.5;
    u_xlat16_50 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat21 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_51 = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat5.x;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat12.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_16.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_16.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_16.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_16.xyz;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
ivec3 u_xlati12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
float u_xlat48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
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
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = u_xlat0.zxyz * vec4(u_xlat53);
    u_xlat10.x = dot(u_xlat7.yzw, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.x = dot(u_xlat7.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat26.x = dot(u_xlat7.yzw, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat26.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_49 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_49;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat6 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_51 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8 = vec4(u_xlat16_51) * u_xlat6;
    u_xlat26.xyz = u_xlat6.wxz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat5.y = u_xlat21 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat21 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat26.xyz = vec3(u_xlat21) * u_xlat26.xyz;
    u_xlat21 = dot(u_xlat7.yzw, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_51) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat42 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_49 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_51 = u_xlat26.x * u_xlat26.x;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_52 = u_xlat26.x * u_xlat16_51;
    u_xlat21 = (-u_xlat16_51) * u_xlat26.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat16_3.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat21) * vec3(u_xlat16_52) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_9.xy = u_xlat7.zw * u_xlat16_8.zw;
    u_xlat16_9.xy = u_xlat16_8.yx * u_xlat7.yx + (-u_xlat16_9.yx);
    u_xlat16_18.x = u_xlat16_9.y * -0.5 + 0.5;
    u_xlat16_51 = u_xlat16_9.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_9.x = u_xlat16_51 + 0.5;
    u_xlat16_18.x = (-u_xlat16_18.x) + _LaserPosOffset.y;
    u_xlat16_9.y = u_xlat16_18.x + 1.0;
    u_xlat16_12.xyz = texture(_LaserTex, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_12.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.zxy;
    u_xlat16_13.xyz = u_xlat16_9.xyz * _LaserColor.zxy + (-u_xlat16_1.xyz);
    u_xlat16_18.x = dot(u_xlat16_9.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18.x = log2(u_xlat16_18.x);
    u_xlat16_18.x = u_xlat16_18.x * _LaserPosOffset.w;
    u_xlat16_18.x = exp2(u_xlat16_18.x);
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_18.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_18.xxx;
    u_xlat16_5.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.xyz = u_xlat16_5.xxx * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.yzw;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_18.x) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_51 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_18.x, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat21) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati12.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati12.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati12.x) & 1u));
    u_xlati7 = (u_xlati12.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati7].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.wxz), u_xlat7.yzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat12.xyz = (-u_xlat7.yzw) * u_xlat16_4.xxx + (-u_xlat16_8.wxz);
    u_xlat21 = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_6.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_34 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_23) + u_xlat16_7;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_23;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_34;
    u_xlat21 = u_xlat21 * u_xlat16_34;
    u_xlat16_34 = u_xlat5.x * 0.5;
    u_xlat16_50 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat21 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_51 = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat5.x;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat12.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_16.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_16.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_16.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_16.xyz;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_28;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat6 = vec4(u_xlat59) * u_xlat5.zxyz;
    u_xlat22.x = dot(u_xlat6.yzw, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat6.yzw) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_10.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_10.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_18.z * _shadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_10.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat6.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat4 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_65 = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7 = u_xlat4 * vec4(u_xlat16_65);
    u_xlat1.xyz = u_xlat4.wxz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat6.zwy, u_xlat16_7.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat6.yzw, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_66 = u_xlat1.x * u_xlat16_65;
    u_xlat1.x = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_3.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat56 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xy = u_xlat6.zw * u_xlat16_7.zw;
    u_xlat16_14.xy = u_xlat16_7.yx * u_xlat6.yx + (-u_xlat16_14.yx);
    u_xlat16_65 = u_xlat16_14.y * -0.5 + 0.5;
    u_xlat16_66 = u_xlat16_14.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_14.x = u_xlat16_66 + 0.5;
    u_xlat16_65 = (-u_xlat16_65) + _LaserPosOffset.y;
    u_xlat16_14.y = u_xlat16_65 + 1.0;
    u_xlat16_4.xyz = texture(_LaserTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_4.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_4.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _LaserColor.zxy + (-u_xlat16_13.xyz);
    u_xlat16_65 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = log2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 * _LaserPosOffset.w;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat16_65 * _LaserRampIntensity;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_65);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_13.xyz = u_xlat16_18.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat6.yzw;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_7.wxz), u_xlat6.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat6.yzw) * u_xlat16_13.xxx + (-u_xlat16_7.wxz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.z;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_64 = u_xlat16_13.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat56 * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_66 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_66 + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat1.yzx * u_xlat16_10.yzx + u_xlat16_11.yzx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_18.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_28;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_28;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat6 = vec4(u_xlat59) * u_xlat5.zxyz;
    u_xlat22.x = dot(u_xlat6.yzw, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat6.yzw) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_10.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_10.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_18.z * _shadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_10.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat6.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat4 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_65 = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7 = u_xlat4 * vec4(u_xlat16_65);
    u_xlat1.xyz = u_xlat4.wxz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat6.zwy, u_xlat16_7.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat6.yzw, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_66 = u_xlat1.x * u_xlat16_65;
    u_xlat1.x = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_3.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat56 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xy = u_xlat6.zw * u_xlat16_7.zw;
    u_xlat16_14.xy = u_xlat16_7.yx * u_xlat6.yx + (-u_xlat16_14.yx);
    u_xlat16_65 = u_xlat16_14.y * -0.5 + 0.5;
    u_xlat16_66 = u_xlat16_14.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_14.x = u_xlat16_66 + 0.5;
    u_xlat16_65 = (-u_xlat16_65) + _LaserPosOffset.y;
    u_xlat16_14.y = u_xlat16_65 + 1.0;
    u_xlat16_4.xyz = texture(_LaserTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_4.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_4.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _LaserColor.zxy + (-u_xlat16_13.xyz);
    u_xlat16_65 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = log2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 * _LaserPosOffset.w;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat16_65 * _LaserRampIntensity;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_65);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_13.xyz = u_xlat16_18.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat6.yzw;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_7.wxz), u_xlat6.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat6.yzw) * u_xlat16_13.xxx + (-u_xlat16_7.wxz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.z;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_64 = u_xlat16_13.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat56 * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_66 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_66 + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat1.yzx * u_xlat16_10.yzx + u_xlat16_11.yzx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_18.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_28;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
ivec3 u_xlati12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
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
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = u_xlat0.zxyz * vec4(u_xlat53);
    u_xlat10.x = dot(u_xlat7.yzw, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.x = dot(u_xlat7.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat26.x = dot(u_xlat7.yzw, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat26.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_49 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_49;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat6 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_51 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8 = vec4(u_xlat16_51) * u_xlat6;
    u_xlat26.xyz = u_xlat6.wxz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat5.y = u_xlat21 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat21 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat26.xyz = vec3(u_xlat21) * u_xlat26.xyz;
    u_xlat21 = dot(u_xlat7.yzw, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_51) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat42 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_49 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_51 = u_xlat26.x * u_xlat26.x;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_52 = u_xlat26.x * u_xlat16_51;
    u_xlat21 = (-u_xlat16_51) * u_xlat26.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat16_3.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat21) * vec3(u_xlat16_52) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xy = u_xlat7.zw * u_xlat16_8.zw;
    u_xlat16_9.xy = u_xlat16_8.yx * u_xlat7.yx + (-u_xlat16_9.yx);
    u_xlat16_18.x = u_xlat16_9.y * -0.5 + 0.5;
    u_xlat16_51 = u_xlat16_9.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_9.x = u_xlat16_51 + 0.5;
    u_xlat16_18.x = (-u_xlat16_18.x) + _LaserPosOffset.y;
    u_xlat16_9.y = u_xlat16_18.x + 1.0;
    u_xlat16_12.xyz = texture(_LaserTex, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * _LaserColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_18.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18.x = log2(u_xlat16_18.x);
    u_xlat16_18.x = u_xlat16_18.x * _LaserPosOffset.w;
    u_xlat16_18.x = exp2(u_xlat16_18.x);
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_18.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_18.xxx;
    u_xlat16_5.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.xyz = u_xlat16_5.xxx * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.yzw;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_18.x) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_51 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_18.x, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat21) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati12.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati12.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati12.x) & 1u));
    u_xlati7 = (u_xlati12.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati7].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.wxz), u_xlat7.yzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat12.xyz = (-u_xlat7.yzw) * u_xlat16_4.xxx + (-u_xlat16_8.wxz);
    u_xlat21 = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_6.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_34 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_23) + u_xlat16_7;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_23;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_34;
    u_xlat21 = u_xlat21 * u_xlat16_34;
    u_xlat16_34 = u_xlat5.x * 0.5;
    u_xlat16_50 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat21 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_51 = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat5.x;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat12.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_16.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
ivec3 u_xlati12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat21;
int u_xlati21;
mediump float u_xlat16_23;
vec3 u_xlat26;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
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
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = u_xlat0.zxyz * vec4(u_xlat53);
    u_xlat10.x = dot(u_xlat7.yzw, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat10.x = dot(u_xlat7.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat26.x = dot(u_xlat7.yzw, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat26.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_49 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_49;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat6 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_51 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8 = vec4(u_xlat16_51) * u_xlat6;
    u_xlat26.xyz = u_xlat6.wxz * vec3(u_xlat16_51) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat11.x = dot(u_xlat7.zwy, u_xlat16_8.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat11.x) * u_xlat16_49 + u_xlat11.x;
    u_xlat21 = u_xlat11.x * u_xlat21 + u_xlat16_49;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat5.y = u_xlat21 + u_xlat11.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat21 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat26.xyz = vec3(u_xlat21) * u_xlat26.xyz;
    u_xlat21 = dot(u_xlat7.yzw, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_51) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat42 = u_xlat16_49 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat42 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_49 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat16_51 = u_xlat26.x * u_xlat26.x;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_51 = u_xlat26.x * u_xlat16_51;
    u_xlat16_52 = u_xlat26.x * u_xlat16_51;
    u_xlat21 = (-u_xlat16_51) * u_xlat26.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = u_xlat16_3.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat21) * vec3(u_xlat16_52) + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat10.xxx * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xy = u_xlat7.zw * u_xlat16_8.zw;
    u_xlat16_9.xy = u_xlat16_8.yx * u_xlat7.yx + (-u_xlat16_9.yx);
    u_xlat16_18.x = u_xlat16_9.y * -0.5 + 0.5;
    u_xlat16_51 = u_xlat16_9.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_9.x = u_xlat16_51 + 0.5;
    u_xlat16_18.x = (-u_xlat16_18.x) + _LaserPosOffset.y;
    u_xlat16_9.y = u_xlat16_18.x + 1.0;
    u_xlat16_12.xyz = texture(_LaserTex, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * _LaserColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_18.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18.x = log2(u_xlat16_18.x);
    u_xlat16_18.x = u_xlat16_18.x * _LaserPosOffset.w;
    u_xlat16_18.x = exp2(u_xlat16_18.x);
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_18.x = u_xlat16_18.x * _LaserRampIntensity;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_18.xxx;
    u_xlat16_5.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.xyz = u_xlat16_5.xxx * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.yzw;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_9.xyz = u_xlat16_18.xxx * u_xlat16_9.xyz;
    u_xlat16_18.x = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_18.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_18.x) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_51 + u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.w * u_xlat16_18.x;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_18.x, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat21) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat21) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati12.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_15.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati12.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati12.x) & 1u));
    u_xlati7 = (u_xlati12.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati7].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.wxz), u_xlat7.yzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat12.xyz = (-u_xlat7.yzw) * u_xlat16_4.xxx + (-u_xlat16_8.wxz);
    u_xlat21 = dot(u_xlat16_9.xyz, u_xlat7.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_6.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_34 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_34 = u_xlat16_4.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = (-u_xlat16_23) + u_xlat16_7;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_23;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_34;
    u_xlat21 = u_xlat21 * u_xlat16_34;
    u_xlat16_34 = u_xlat5.x * 0.5;
    u_xlat16_50 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat21 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_51 = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_34 = u_xlat16_34 * u_xlat5.x;
    u_xlat16_34 = min(u_xlat16_34, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat12.xyz);
    u_xlat0.xyz = vec3(u_xlat16_49) * u_xlat0.xyz + u_xlat12.xyz;
    u_xlat16_49 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_49);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_18.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_49 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_16.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_28;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat6 = vec4(u_xlat59) * u_xlat5.zxyz;
    u_xlat22.x = dot(u_xlat6.yzw, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat6.yzw) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_10.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_10.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_18.z * _shadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_10.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat6.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat4 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_65 = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7 = u_xlat4 * vec4(u_xlat16_65);
    u_xlat1.xyz = u_xlat4.wxz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat6.zwy, u_xlat16_7.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat6.yzw, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_66 = u_xlat1.x * u_xlat16_65;
    u_xlat1.x = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_3.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat56 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xy = u_xlat6.zw * u_xlat16_7.zw;
    u_xlat16_14.xy = u_xlat16_7.yx * u_xlat6.yx + (-u_xlat16_14.yx);
    u_xlat16_65 = u_xlat16_14.y * -0.5 + 0.5;
    u_xlat16_66 = u_xlat16_14.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_14.x = u_xlat16_66 + 0.5;
    u_xlat16_65 = (-u_xlat16_65) + _LaserPosOffset.y;
    u_xlat16_14.y = u_xlat16_65 + 1.0;
    u_xlat16_4.xyz = texture(_LaserTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _LaserColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_65 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = log2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 * _LaserPosOffset.w;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat16_65 * _LaserRampIntensity;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_65);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_13.xyz = u_xlat16_18.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat6.yzw;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
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
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_7.wxz), u_xlat6.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat6.yzw) * u_xlat16_13.xxx + (-u_xlat16_7.wxz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.z;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_64 = u_xlat16_13.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat56 * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_66 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_66 + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_28;
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
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _LaserRampIntensity;
uniform 	mediump vec4 _LaserPosOffset;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(5) uniform mediump sampler2D _LaserMask;
UNITY_LOCATION(6) uniform mediump sampler2D _LaserTex;
UNITY_LOCATION(7) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(8) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
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
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_28;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat6 = vec4(u_xlat59) * u_xlat5.zxyz;
    u_xlat22.x = dot(u_xlat6.yzw, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat6.yzw) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_10.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_10.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_10.x = u_xlat16_18.z * _shadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_10.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat6.yzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_15.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat1.x = dot(u_xlat6.yzw, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_15.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat18.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat4 = (-vs_TEXCOORD0.yzzx) + _WorldSpaceCameraPos.yzzx;
    u_xlat16_65 = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_7 = u_xlat4 * vec4(u_xlat16_65);
    u_xlat1.xyz = u_xlat4.wxz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat6.zwy, u_xlat16_7.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat6.yzw, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_66 = u_xlat1.x * u_xlat16_65;
    u_xlat1.x = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_3.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_11.xyz;
    u_xlat56 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xy = u_xlat6.zw * u_xlat16_7.zw;
    u_xlat16_14.xy = u_xlat16_7.yx * u_xlat6.yx + (-u_xlat16_14.yx);
    u_xlat16_65 = u_xlat16_14.y * -0.5 + 0.5;
    u_xlat16_66 = u_xlat16_14.x * -0.5 + _LaserPosOffset.x;
    u_xlat16_14.x = u_xlat16_66 + 0.5;
    u_xlat16_65 = (-u_xlat16_65) + _LaserPosOffset.y;
    u_xlat16_14.y = u_xlat16_65 + 1.0;
    u_xlat16_4.xyz = texture(_LaserTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _LaserColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_65 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = log2(u_xlat16_65);
    u_xlat16_65 = u_xlat16_65 * _LaserPosOffset.w;
    u_xlat16_65 = exp2(u_xlat16_65);
    u_xlat16_65 = min(u_xlat16_65, 1.0);
    u_xlat16_65 = u_xlat16_65 * _LaserRampIntensity;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_65);
    u_xlat16_18.x = texture(_LaserMask, vs_TEXCOORD3.xy).x;
    u_xlat16_13.xyz = u_xlat16_18.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat6.yzw;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
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
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_7.wxz), u_xlat6.yzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat6.yzw) * u_xlat16_13.xxx + (-u_xlat16_7.wxz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat6.yzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat4.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat14.y = u_xlat0.z;
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_64 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_64 = u_xlat16_13.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat56 * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_66 = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_66 + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_2.z, u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat16_18.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_10.x : u_xlat16_28;
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
  GpuProgramID 76658
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