//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_Rains" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_UseEmissive2U ("自发光使用2U", Float) = 0.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_EmissiveBreathe ("自发光呼吸参数", Vector) = (0,0,0,0)

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMap ("流光纹理", 2D) = "white" { }

_FlowLightMask ("流光遮罩", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_RainsMask ("雨滴遮罩", 2D) = "white" { }

_RainsSpeed ("雨滴流速", Range(-5, 5)) = 1.0

_RainsScale ("雨滴缩放", Range(0, 100)) = 1.0

_RainsHeight ("雨滴高度", Range(-10, 0)) = 0.0

_WarpIntensity ("雨滴折射强度", Range(-5, 5)) = 1.0

_NormalIntensity ("雨滴法线强度", Range(-5, 5)) = 1.0

_StaticRainsScale ("静止雨滴缩放", Range(0, 100)) = 10.0

_StaticRainsFadeSpeed ("静止雨滴消失速度", Range(-5, 5)) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_shadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 34762
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(9) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
vec3 u_xlat28;
vec2 u_xlat30;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37.xyz = u_xlat16_14.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.x = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat6.xyz;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat73 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat73;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat74 = (-u_xlat16_15.x) * u_xlat73 + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat6.xyz = u_xlat16_37.xyz * vec3(u_xlat74);
    u_xlat6.xyz = u_xlat27.xxx * u_xlat16_15.xxx + u_xlat6.xyz;
    u_xlat16_15.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_39.x = u_xlat3.x * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.yyy;
    u_xlat16_14.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat3.x = (-u_xlat4.x) * u_xlat16_14.x + u_xlat4.x;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + u_xlat16_14.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat7.x) * u_xlat16_14.x + u_xlat7.x;
    u_xlat73 = u_xlat7.x * u_xlat73 + u_xlat16_14.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat74 = u_xlat16_14.x + -1.0;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat50.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_17.xyz = u_xlat8.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_17.xyz;
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_16.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat75 = (-u_xlat16_16.x) + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat75;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat53.x = (-u_xlat16_16.x) * u_xlat75 + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat8.xyz = u_xlat16_37.xyz * u_xlat53.xxx;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat16_16.xxx + u_xlat8.xyz;
    u_xlat75 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat75 = u_xlat3.x * u_xlat75 + u_xlat16_14.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat3.x + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat73 * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat50.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_18.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_16.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat16_16.x = max(u_xlat16_16.x, u_xlat16_17.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_50 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat50.x = u_xlat16_50 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_18.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_19.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat74 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_14.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_37.xyz * u_xlat51.xxx;
    u_xlat28.xyz = u_xlat27.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat27.x = dot(u_xlat26.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat27.x) * u_xlat16_14.x + u_xlat27.x;
    u_xlat6.x = u_xlat27.x * u_xlat6.x + u_xlat16_14.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat27.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat6.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.xyz = u_xlat28.xyz * vec3(u_xlat73);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = u_xlat27.xxx * u_xlat5.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_20.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb73 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_16.x = (u_xlatb73) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_16.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat50.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat5.xyz * u_xlat50.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat50.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat27.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_19.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlati27 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati4.x].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.x = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_16.x * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_16.x) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_86 + u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_80 * u_xlat16_16.x;
    u_xlat3.x = min(u_xlat16_16.x, 1.0);
    u_xlat4.x = min(u_xlat16_1.z, u_xlat3.x);
    u_xlat16_22.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_22.xyz * u_xlat4.xxx + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_21.xyz * u_xlat4.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_11.xyz + u_xlat16_17.xyz;
    u_xlat16_16.x = dot((-u_xlat16_15.xyz), u_xlat26.xyz);
    u_xlat16_16.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat16_16.xxx + (-u_xlat16_15.xyz);
    u_xlat16_39.y = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat73 = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xyz);
    u_xlat26.xyz = u_xlat16_14.xxx * u_xlat26.xyz + u_xlat4.xyz;
    u_xlat16_15.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_15.x = u_xlat16_14.x + 1.0;
    u_xlat16_15.x = min(u_xlat16_15.x, 15.0);
    u_xlat16_2.x = u_xlat16_15.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_14.x = u_xlat16_15.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_15.x = (-u_xlat16_27) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_15.x + u_xlat16_27;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat4.x = u_xlat73 * u_xlat16_80;
    u_xlat16_80 = u_xlat3.x * 0.5;
    u_xlat16_14.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_80 = u_xlat4.x * u_xlat16_14.x + u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 + u_xlat16_80;
    u_xlat16_15.x = (-u_xlat16_80) * 2.0 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_80 = u_xlat3.x * u_xlat16_80;
    u_xlat16_80 = min(u_xlat16_1.z, u_xlat16_80);
    u_xlat16_14.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat7.y = u_xlat16_39.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat15.y = u_xlat26.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_16.yzx + u_xlat16_18.yzx;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.wxy * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.zxy + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat72 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat72);
    u_xlat0.x = u_xlat72 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(9) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
vec3 u_xlat28;
vec2 u_xlat30;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37.xyz = u_xlat16_14.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.x = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat6.xyz;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat73 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat73;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat74 = (-u_xlat16_15.x) * u_xlat73 + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat6.xyz = u_xlat16_37.xyz * vec3(u_xlat74);
    u_xlat6.xyz = u_xlat27.xxx * u_xlat16_15.xxx + u_xlat6.xyz;
    u_xlat16_15.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_39.x = u_xlat3.x * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.yyy;
    u_xlat16_14.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat3.x = (-u_xlat4.x) * u_xlat16_14.x + u_xlat4.x;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + u_xlat16_14.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat7.x) * u_xlat16_14.x + u_xlat7.x;
    u_xlat73 = u_xlat7.x * u_xlat73 + u_xlat16_14.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat74 = u_xlat16_14.x + -1.0;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat50.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_17.xyz = u_xlat8.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_17.xyz;
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_16.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat75 = (-u_xlat16_16.x) + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat75;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat53.x = (-u_xlat16_16.x) * u_xlat75 + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat8.xyz = u_xlat16_37.xyz * u_xlat53.xxx;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat16_16.xxx + u_xlat8.xyz;
    u_xlat75 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat75 = u_xlat3.x * u_xlat75 + u_xlat16_14.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat3.x + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat73 * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat50.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_18.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_16.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat16_16.x = max(u_xlat16_16.x, u_xlat16_17.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_50 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat50.x = u_xlat16_50 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_18.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_19.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat74 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_14.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_37.xyz * u_xlat51.xxx;
    u_xlat28.xyz = u_xlat27.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat27.x = dot(u_xlat26.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat27.x) * u_xlat16_14.x + u_xlat27.x;
    u_xlat6.x = u_xlat27.x * u_xlat6.x + u_xlat16_14.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat27.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat6.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.xyz = u_xlat28.xyz * vec3(u_xlat73);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = u_xlat27.xxx * u_xlat5.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_20.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb73 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_16.x = (u_xlatb73) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_16.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat50.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat5.xyz * u_xlat50.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat50.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat27.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_19.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlati27 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati4.x].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.x = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_16.x * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_16.x) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_86 + u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_80 * u_xlat16_16.x;
    u_xlat3.x = min(u_xlat16_16.x, 1.0);
    u_xlat4.x = min(u_xlat16_1.z, u_xlat3.x);
    u_xlat16_22.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_22.xyz * u_xlat4.xxx + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_21.xyz * u_xlat4.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_11.xyz + u_xlat16_17.xyz;
    u_xlat16_16.x = dot((-u_xlat16_15.xyz), u_xlat26.xyz);
    u_xlat16_16.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat16_16.xxx + (-u_xlat16_15.xyz);
    u_xlat16_39.y = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat73 = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xyz);
    u_xlat26.xyz = u_xlat16_14.xxx * u_xlat26.xyz + u_xlat4.xyz;
    u_xlat16_15.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_15.x = u_xlat16_14.x + 1.0;
    u_xlat16_15.x = min(u_xlat16_15.x, 15.0);
    u_xlat16_2.x = u_xlat16_15.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_14.x = u_xlat16_15.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_15.x = (-u_xlat16_27) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_15.x + u_xlat16_27;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat4.x = u_xlat73 * u_xlat16_80;
    u_xlat16_80 = u_xlat3.x * 0.5;
    u_xlat16_14.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_80 = u_xlat4.x * u_xlat16_14.x + u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 + u_xlat16_80;
    u_xlat16_15.x = (-u_xlat16_80) * 2.0 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_80 = u_xlat3.x * u_xlat16_80;
    u_xlat16_80 = min(u_xlat16_1.z, u_xlat16_80);
    u_xlat16_14.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat7.y = u_xlat16_39.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat15.y = u_xlat26.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_16.yzx + u_xlat16_18.yzx;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.wxy * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.zxy + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat72 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat72);
    u_xlat0.x = u_xlat72 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec4 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
vec3 u_xlat28;
vec3 u_xlat29;
vec2 u_xlat30;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_40;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
mediump float u_xlat16_60;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat73) * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb73 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb73)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat4.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.zzzz + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat4.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1.z + (-u_xlat4.x);
    u_xlat27.x = max((-u_xlat1.w), u_xlat4.x);
    u_xlat27.x = (-u_xlat4.x) + u_xlat27.x;
    u_xlat1.z = _ShadowBias.y * u_xlat27.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat4.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_11.x = (-_ShadowBias.w) + 1.0;
    u_xlat27.x = (-u_xlat16_11.x) + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat27.x + u_xlat16_11.x;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_11.x = u_xlat16_27 * _shadowStrength;
    u_xlat4.x = (-u_xlat4.x) * u_xlat16_11.x + 1.0;
    u_xlat27.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_11.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz + _shadowColor.zxy;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat73 = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38.xyz = u_xlat16_15.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_38.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat16_83 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat29.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat29.x;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat52.x = (-u_xlat16_83) * u_xlat29.x + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat29.xyz = u_xlat16_38.xyz * u_xlat52.xxx;
    u_xlat29.xyz = u_xlat5.xxx * vec3(u_xlat16_83) + u_xlat29.xyz;
    u_xlat16_16.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_40.x = u_xlat3.x * u_xlat16_16.x + u_xlat16_15.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy;
    u_xlat16_83 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat3.x = (-u_xlat73) * u_xlat16_83 + u_xlat73;
    u_xlat3.x = u_xlat73 * u_xlat3.x + u_xlat16_83;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat73;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat28.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat53.x = (-u_xlat7.x) * u_xlat16_83 + u_xlat7.x;
    u_xlat53.x = u_xlat7.x * u_xlat53.x + u_xlat16_83;
    u_xlat53.x = sqrt(u_xlat53.x);
    u_xlat53.x = u_xlat53.x + u_xlat7.x;
    u_xlat53.x = u_xlat53.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat53.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat76 = u_xlat16_83 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat76 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_83 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat29.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat73) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_15.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_18.xyz = u_xlat8.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_19.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat16_85 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_83 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat8.x = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat8.x;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat31 = (-u_xlat16_85) * u_xlat8.x + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat8.xyz = u_xlat16_38.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat5.xxx * vec3(u_xlat16_85) + u_xlat8.xyz;
    u_xlat77 = (-u_xlat3.x) * u_xlat16_83 + u_xlat3.x;
    u_xlat77 = u_xlat3.x * u_xlat77 + u_xlat16_83;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat3.x + u_xlat77;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat53.x * u_xlat77;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_19.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_17.x);
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_15.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat27.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_18.xyz;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat8.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_15.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_20.xyz = u_xlat6.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_21.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat28.xyz = u_xlat3.xxx * u_xlat28.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat76 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_83 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_38.xyz * u_xlat51.xxx;
    u_xlat5.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat26.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat74) * u_xlat16_83 + u_xlat74;
    u_xlat6.x = u_xlat74 * u_xlat6.x + u_xlat16_83;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat74 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat53.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_21.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_85);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat27.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat5.xyz * u_xlat27.xxx + u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat73) + u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * vec3(u_xlat74) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz + u_xlat16_11.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_15.x = (-u_xlat16_80) + u_xlat16_15.x;
    u_xlat16_85 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_85 + 1.0;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_15.x + u_xlat16_80;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_80;
    u_xlat16_15.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat16_15.x = _occlusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat4.xy = min(u_xlat4.xz, vec2(u_xlat16_80));
    u_xlat3.x = min(u_xlat16_1.z, u_xlat4.x);
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat3.xxx + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat3.xxx + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = u_xlat16_15.xxx * u_xlat16_22.xyz;
    u_xlati3 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati3].xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_14.x = dot((-u_xlat16_16.xyz), u_xlat26.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat4.xzw = (-u_xlat26.xyz) * u_xlat16_14.xxx + (-u_xlat16_16.xyz);
    u_xlat16_40.y = dot(u_xlat16_20.xyz, u_xlat4.xzw);
    u_xlat3.x = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xzw);
    u_xlat26.xyz = vec3(u_xlat16_83) * u_xlat26.xyz + u_xlat4.xzw;
    u_xlat16_14.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_37.x = u_xlat16_14.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_2.x = u_xlat16_37.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_14.x = u_xlat16_14.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_50) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_37.x + u_xlat16_50;
    u_xlat16_14.x = u_xlat16_15.x * u_xlat16_14.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat4.y * 0.5;
    u_xlat16_37.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_14.x = u_xlat3.x * u_xlat16_37.x + u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat16_60 = (-u_xlat16_14.x) * 2.0 + 1.0;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_60 + u_xlat16_37.x;
    u_xlat16_14.x = u_xlat4.y * u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_1.z, u_xlat16_14.x);
    u_xlat16_37.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat7.y = u_xlat16_40.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_15.xyz = u_xlat16_38.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat16.y = u_xlat26.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_37.x);
    u_xlat16_37.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_37.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_80) * u_xlat16_37.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_37.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_37.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_15.yzx + u_xlat16_19.yzx;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.wxy * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.zxy + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat72 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat72);
    u_xlat0.x = u_xlat72 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec4 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump float u_xlat16_27;
vec3 u_xlat28;
vec3 u_xlat29;
vec2 u_xlat30;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_40;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
mediump float u_xlat16_60;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat73) * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb73 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb73)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat4.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.zzzz + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat4.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1.z + (-u_xlat4.x);
    u_xlat27.x = max((-u_xlat1.w), u_xlat4.x);
    u_xlat27.x = (-u_xlat4.x) + u_xlat27.x;
    u_xlat1.z = _ShadowBias.y * u_xlat27.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat4.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_11.x = (-_ShadowBias.w) + 1.0;
    u_xlat27.x = (-u_xlat16_11.x) + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat27.x + u_xlat16_11.x;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_11.x = u_xlat16_27 * _shadowStrength;
    u_xlat4.x = (-u_xlat4.x) * u_xlat16_11.x + 1.0;
    u_xlat27.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_11.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz + _shadowColor.zxy;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat73 = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38.xyz = u_xlat16_15.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_38.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat16_83 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat29.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat29.x;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat52.x = (-u_xlat16_83) * u_xlat29.x + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat29.xyz = u_xlat16_38.xyz * u_xlat52.xxx;
    u_xlat29.xyz = u_xlat5.xxx * vec3(u_xlat16_83) + u_xlat29.xyz;
    u_xlat16_16.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_40.x = u_xlat3.x * u_xlat16_16.x + u_xlat16_15.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy;
    u_xlat16_83 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat3.x = (-u_xlat73) * u_xlat16_83 + u_xlat73;
    u_xlat3.x = u_xlat73 * u_xlat3.x + u_xlat16_83;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat73;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat28.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat53.x = (-u_xlat7.x) * u_xlat16_83 + u_xlat7.x;
    u_xlat53.x = u_xlat7.x * u_xlat53.x + u_xlat16_83;
    u_xlat53.x = sqrt(u_xlat53.x);
    u_xlat53.x = u_xlat53.x + u_xlat7.x;
    u_xlat53.x = u_xlat53.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat53.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat76 = u_xlat16_83 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat76 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_83 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat29.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.zxy;
    u_xlat6.xyz = vec3(u_xlat73) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_15.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_18.xyz = u_xlat8.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_19.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat16_85 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_83 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat8.x = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat8.x;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat31 = (-u_xlat16_85) * u_xlat8.x + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat8.xyz = u_xlat16_38.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat5.xxx * vec3(u_xlat16_85) + u_xlat8.xyz;
    u_xlat77 = (-u_xlat3.x) * u_xlat16_83 + u_xlat3.x;
    u_xlat77 = u_xlat3.x * u_xlat77 + u_xlat16_83;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat3.x + u_xlat77;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat53.x * u_xlat77;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_19.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_17.x);
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_15.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat27.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_18.xyz;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat8.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_15.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_20.xyz = u_xlat6.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_21.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat28.xyz = u_xlat3.xxx * u_xlat28.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat76 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_83 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_38.xyz * u_xlat51.xxx;
    u_xlat5.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat26.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat74) * u_xlat16_83 + u_xlat74;
    u_xlat6.x = u_xlat74 * u_xlat6.x + u_xlat16_83;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat74 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat53.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_21.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_85);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat27.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat5.xyz * u_xlat27.xxx + u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat73) + u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * vec3(u_xlat74) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz + u_xlat16_11.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_15.x = (-u_xlat16_80) + u_xlat16_15.x;
    u_xlat16_85 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_85 + 1.0;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_15.x + u_xlat16_80;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_80;
    u_xlat16_15.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat16_15.x = _occlusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat4.xy = min(u_xlat4.xz, vec2(u_xlat16_80));
    u_xlat3.x = min(u_xlat16_1.z, u_xlat4.x);
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat3.xxx + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat3.xxx + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = u_xlat16_15.xxx * u_xlat16_22.xyz;
    u_xlati3 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati3].xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_14.x = dot((-u_xlat16_16.xyz), u_xlat26.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat4.xzw = (-u_xlat26.xyz) * u_xlat16_14.xxx + (-u_xlat16_16.xyz);
    u_xlat16_40.y = dot(u_xlat16_20.xyz, u_xlat4.xzw);
    u_xlat3.x = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xzw);
    u_xlat26.xyz = vec3(u_xlat16_83) * u_xlat26.xyz + u_xlat4.xzw;
    u_xlat16_14.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_37.x = u_xlat16_14.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_2.x = u_xlat16_37.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_14.x = u_xlat16_14.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_50) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_37.x + u_xlat16_50;
    u_xlat16_14.x = u_xlat16_15.x * u_xlat16_14.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat4.y * 0.5;
    u_xlat16_37.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_14.x = u_xlat3.x * u_xlat16_37.x + u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat16_60 = (-u_xlat16_14.x) * 2.0 + 1.0;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_60 + u_xlat16_37.x;
    u_xlat16_14.x = u_xlat4.y * u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_1.z, u_xlat16_14.x);
    u_xlat16_37.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat7.y = u_xlat16_40.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_15.xyz = u_xlat16_38.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat16.y = u_xlat26.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_37.x);
    u_xlat16_37.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_37.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_80) * u_xlat16_37.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_37.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_37.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.yzx * u_xlat16_15.yzx + u_xlat16_19.yzx;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.wxy * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.zxy + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat72 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat3.x = u_xlat3.x * 15.0 + (-u_xlat72);
    u_xlat0.x = u_xlat72 * 0.0625 + u_xlat0.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(9) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
vec3 u_xlat28;
vec2 u_xlat30;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37.xyz = u_xlat16_14.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.x = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat6.xyz;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat73 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat73;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat74 = (-u_xlat16_15.x) * u_xlat73 + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat6.xyz = u_xlat16_37.xyz * vec3(u_xlat74);
    u_xlat6.xyz = u_xlat27.xxx * u_xlat16_15.xxx + u_xlat6.xyz;
    u_xlat16_15.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_39.x = u_xlat3.x * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.yyy;
    u_xlat16_14.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat3.x = (-u_xlat4.x) * u_xlat16_14.x + u_xlat4.x;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + u_xlat16_14.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat7.x) * u_xlat16_14.x + u_xlat7.x;
    u_xlat73 = u_xlat7.x * u_xlat73 + u_xlat16_14.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat74 = u_xlat16_14.x + -1.0;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat50.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_17.xyz = u_xlat8.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_17.xyz;
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_16.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat75 = (-u_xlat16_16.x) + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat75;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat53.x = (-u_xlat16_16.x) * u_xlat75 + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat8.xyz = u_xlat16_37.xyz * u_xlat53.xxx;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat16_16.xxx + u_xlat8.xyz;
    u_xlat75 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat75 = u_xlat3.x * u_xlat75 + u_xlat16_14.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat3.x + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat73 * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat50.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_18.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_16.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat16_16.x = max(u_xlat16_16.x, u_xlat16_17.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_50 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat50.x = u_xlat16_50 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_18.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_19.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat74 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_14.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_37.xyz * u_xlat51.xxx;
    u_xlat28.xyz = u_xlat27.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat27.x = dot(u_xlat26.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat27.x) * u_xlat16_14.x + u_xlat27.x;
    u_xlat6.x = u_xlat27.x * u_xlat6.x + u_xlat16_14.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat27.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat6.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.xyz = u_xlat28.xyz * vec3(u_xlat73);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = u_xlat27.xxx * u_xlat5.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_20.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb73 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_16.x = (u_xlatb73) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_16.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat50.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat5.xyz * u_xlat50.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat50.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat27.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_19.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlati27 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati4.x].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.x = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_16.x * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_16.x) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_86 + u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_80 * u_xlat16_16.x;
    u_xlat3.x = min(u_xlat16_16.x, 1.0);
    u_xlat4.x = min(u_xlat16_1.z, u_xlat3.x);
    u_xlat16_22.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_22.xyz * u_xlat4.xxx + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_21.xyz * u_xlat4.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_11.xyz + u_xlat16_17.xyz;
    u_xlat16_16.x = dot((-u_xlat16_15.xyz), u_xlat26.xyz);
    u_xlat16_16.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat16_16.xxx + (-u_xlat16_15.xyz);
    u_xlat16_39.y = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat73 = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xyz);
    u_xlat26.xyz = u_xlat16_14.xxx * u_xlat26.xyz + u_xlat4.xyz;
    u_xlat16_15.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_15.x = u_xlat16_14.x + 1.0;
    u_xlat16_15.x = min(u_xlat16_15.x, 15.0);
    u_xlat16_2.x = u_xlat16_15.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_14.x = u_xlat16_15.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_15.x = (-u_xlat16_27) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_15.x + u_xlat16_27;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat4.x = u_xlat73 * u_xlat16_80;
    u_xlat16_80 = u_xlat3.x * 0.5;
    u_xlat16_14.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_80 = u_xlat4.x * u_xlat16_14.x + u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 + u_xlat16_80;
    u_xlat16_15.x = (-u_xlat16_80) * 2.0 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_80 = u_xlat3.x * u_xlat16_80;
    u_xlat16_80 = min(u_xlat16_1.z, u_xlat16_80);
    u_xlat16_14.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat7.y = u_xlat16_39.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat15.y = u_xlat26.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyw * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.xyz + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(9) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
vec3 u_xlat28;
vec2 u_xlat30;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_39;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_11.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_37.xyz = u_xlat16_14.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.x = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat50.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat6.xyz = u_xlat50.xxx * u_xlat6.xyz;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat73 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat73;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat74 = (-u_xlat16_15.x) * u_xlat73 + 1.0;
    u_xlat16_15.x = u_xlat73 * u_xlat16_15.x;
    u_xlat6.xyz = u_xlat16_37.xyz * vec3(u_xlat74);
    u_xlat6.xyz = u_xlat27.xxx * u_xlat16_15.xxx + u_xlat6.xyz;
    u_xlat16_15.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_39.x = u_xlat3.x * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.yyy;
    u_xlat16_14.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_14.x, 0.0078125);
    u_xlat3.x = (-u_xlat4.x) * u_xlat16_14.x + u_xlat4.x;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + u_xlat16_14.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat5.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat7.x) * u_xlat16_14.x + u_xlat7.x;
    u_xlat73 = u_xlat7.x * u_xlat73 + u_xlat16_14.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat74 = u_xlat16_14.x + -1.0;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat50.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_17.xyz = u_xlat8.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_17.xyz;
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat50.x = inversesqrt(u_xlat50.x);
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_16.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat50.x = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74 + 1.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat16_14.x / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * 0.318309873;
    u_xlat50.x = min(u_xlat50.x, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat75 = (-u_xlat16_16.x) + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat75;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat53.x = (-u_xlat16_16.x) * u_xlat75 + 1.0;
    u_xlat16_16.x = u_xlat75 * u_xlat16_16.x;
    u_xlat8.xyz = u_xlat16_37.xyz * u_xlat53.xxx;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat16_16.xxx + u_xlat8.xyz;
    u_xlat75 = (-u_xlat3.x) * u_xlat16_14.x + u_xlat3.x;
    u_xlat75 = u_xlat3.x * u_xlat75 + u_xlat16_14.x;
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat3.x + u_xlat75;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat73 * u_xlat75;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat50.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_18.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_16.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat16_16.x = max(u_xlat16_16.x, u_xlat16_17.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_50 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat50.x = u_xlat16_50 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat50.xxx * u_xlat8.xyz;
    u_xlat16_18.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_16.x = inversesqrt(u_xlat16_84);
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_16.xxx;
    u_xlat16_16.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_16.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_16.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_80) + u_xlat16_19.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xxx;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat74 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_14.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_37.xyz * u_xlat51.xxx;
    u_xlat28.xyz = u_xlat27.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat27.x = dot(u_xlat26.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat27.x) * u_xlat16_14.x + u_xlat27.x;
    u_xlat6.x = u_xlat27.x * u_xlat6.x + u_xlat16_14.x;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat27.x + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat6.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.xyz = u_xlat28.xyz * vec3(u_xlat73);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = u_xlat27.xxx * u_xlat5.xyz;
    u_xlat16_16.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = float(1.0) / float(u_xlat16_84);
    u_xlat16_16.x = (-u_xlat16_16.x) * u_xlat16_16.x + 1.0;
    u_xlat16_16.x = max(u_xlat16_16.x, 0.0);
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_16.x;
    u_xlat16_84 = max(u_xlat16_20.x, u_xlat16_84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb73 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_16.x = (u_xlatb73) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_16.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat50.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat5.xyz * u_xlat50.xxx + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat50.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat27.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_19.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_19.xyz = vec3(u_xlat16_80) * u_xlat16_19.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlati27 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _occlusionScale * u_xlat16_80 + 1.0;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati4.x].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.x = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_16.x * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_16.x) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_39.z = _occlusionScale * u_xlat16_87 + 1.0;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_86 + u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_39.z * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat16_80 * u_xlat16_16.x;
    u_xlat3.x = min(u_xlat16_16.x, 1.0);
    u_xlat4.x = min(u_xlat16_1.z, u_xlat3.x);
    u_xlat16_22.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat4.xxx * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_22.xyz * u_xlat4.xxx + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_21.xyz * u_xlat4.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * u_xlat16_11.xyz + u_xlat16_17.xyz;
    u_xlat16_16.x = dot((-u_xlat16_15.xyz), u_xlat26.xyz);
    u_xlat16_16.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat16_16.xxx + (-u_xlat16_15.xyz);
    u_xlat16_39.y = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat73 = dot(u_xlat16_19.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xyz);
    u_xlat26.xyz = u_xlat16_14.xxx * u_xlat26.xyz + u_xlat4.xyz;
    u_xlat16_15.xyz = u_xlat16_39.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_15.x = u_xlat16_14.x + 1.0;
    u_xlat16_15.x = min(u_xlat16_15.x, 15.0);
    u_xlat16_2.x = u_xlat16_15.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_14.x = u_xlat16_15.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_15.x = (-u_xlat16_27) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_15.x + u_xlat16_27;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat4.x = u_xlat73 * u_xlat16_80;
    u_xlat16_80 = u_xlat3.x * 0.5;
    u_xlat16_14.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_80 = u_xlat4.x * u_xlat16_14.x + u_xlat16_80;
    u_xlat16_14.x = u_xlat16_80 + u_xlat16_80;
    u_xlat16_15.x = (-u_xlat16_80) * 2.0 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x + u_xlat16_14.x;
    u_xlat16_80 = u_xlat3.x * u_xlat16_80;
    u_xlat16_80 = min(u_xlat16_1.z, u_xlat16_80);
    u_xlat16_14.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat7.y = u_xlat16_39.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat15.y = u_xlat26.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_14.x);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyw * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.xyz + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
ivec4 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_27;
vec3 u_xlat28;
vec3 u_xlat29;
vec2 u_xlat30;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_40;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
mediump float u_xlat16_60;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat73) * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb73 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb73)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat4.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.zzzz + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat4.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1.z + (-u_xlat4.x);
    u_xlat27.x = max((-u_xlat1.w), u_xlat4.x);
    u_xlat27.x = (-u_xlat4.x) + u_xlat27.x;
    u_xlat1.z = _ShadowBias.y * u_xlat27.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat4.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_11.x = (-_ShadowBias.w) + 1.0;
    u_xlat27.x = (-u_xlat16_11.x) + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat27.x + u_xlat16_11.x;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_11.x = u_xlat16_27 * _shadowStrength;
    u_xlat4.x = (-u_xlat4.x) * u_xlat16_11.x + 1.0;
    u_xlat27.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_11.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz + _shadowColor.xyz;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat73 = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38.xyz = u_xlat16_15.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_38.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat16_83 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat29.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat29.x;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat52.x = (-u_xlat16_83) * u_xlat29.x + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat29.xyz = u_xlat16_38.xyz * u_xlat52.xxx;
    u_xlat29.xyz = u_xlat5.xxx * vec3(u_xlat16_83) + u_xlat29.xyz;
    u_xlat16_16.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_40.x = u_xlat3.x * u_xlat16_16.x + u_xlat16_15.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy;
    u_xlat16_83 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat3.x = (-u_xlat73) * u_xlat16_83 + u_xlat73;
    u_xlat3.x = u_xlat73 * u_xlat3.x + u_xlat16_83;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat73;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat28.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat53.x = (-u_xlat7.x) * u_xlat16_83 + u_xlat7.x;
    u_xlat53.x = u_xlat7.x * u_xlat53.x + u_xlat16_83;
    u_xlat53.x = sqrt(u_xlat53.x);
    u_xlat53.x = u_xlat53.x + u_xlat7.x;
    u_xlat53.x = u_xlat53.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat53.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat76 = u_xlat16_83 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat76 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_83 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat29.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat73) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_15.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_18.xyz = u_xlat8.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_19.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat16_85 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_83 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat8.x = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat8.x;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat31 = (-u_xlat16_85) * u_xlat8.x + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat8.xyz = u_xlat16_38.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat5.xxx * vec3(u_xlat16_85) + u_xlat8.xyz;
    u_xlat77 = (-u_xlat3.x) * u_xlat16_83 + u_xlat3.x;
    u_xlat77 = u_xlat3.x * u_xlat77 + u_xlat16_83;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat3.x + u_xlat77;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat53.x * u_xlat77;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_19.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_17.x);
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_15.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat27.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_18.xyz;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat8.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_15.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_20.xyz = u_xlat6.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_21.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat28.xyz = u_xlat3.xxx * u_xlat28.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat76 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_83 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_38.xyz * u_xlat51.xxx;
    u_xlat5.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat26.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat74) * u_xlat16_83 + u_xlat74;
    u_xlat6.x = u_xlat74 * u_xlat6.x + u_xlat16_83;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat74 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat53.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_21.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_85);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat27.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat5.xyz * u_xlat27.xxx + u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat73) + u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * vec3(u_xlat74) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz + u_xlat16_11.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_15.x = (-u_xlat16_80) + u_xlat16_15.x;
    u_xlat16_85 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_85 + 1.0;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_15.x + u_xlat16_80;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_80;
    u_xlat16_15.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat16_15.x = _occlusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat4.xy = min(u_xlat4.xz, vec2(u_xlat16_80));
    u_xlat3.x = min(u_xlat16_1.z, u_xlat4.x);
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat3.xxx + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat3.xxx + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = u_xlat16_15.xxx * u_xlat16_22.xyz;
    u_xlati3 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati3].xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_14.x = dot((-u_xlat16_16.xyz), u_xlat26.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat4.xzw = (-u_xlat26.xyz) * u_xlat16_14.xxx + (-u_xlat16_16.xyz);
    u_xlat16_40.y = dot(u_xlat16_20.xyz, u_xlat4.xzw);
    u_xlat3.x = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xzw);
    u_xlat26.xyz = vec3(u_xlat16_83) * u_xlat26.xyz + u_xlat4.xzw;
    u_xlat16_14.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_37.x = u_xlat16_14.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_2.x = u_xlat16_37.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_14.x = u_xlat16_14.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_50) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_37.x + u_xlat16_50;
    u_xlat16_14.x = u_xlat16_15.x * u_xlat16_14.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat4.y * 0.5;
    u_xlat16_37.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_14.x = u_xlat3.x * u_xlat16_37.x + u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat16_60 = (-u_xlat16_14.x) * 2.0 + 1.0;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_60 + u_xlat16_37.x;
    u_xlat16_14.x = u_xlat4.y * u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_1.z, u_xlat16_14.x);
    u_xlat16_37.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat7.y = u_xlat16_40.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_15.xyz = u_xlat16_38.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat16.y = u_xlat26.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_37.x);
    u_xlat16_37.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_37.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_80) * u_xlat16_37.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_37.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_37.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyw * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.xyz + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _UseEmissive2U;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _RainsSpeed;
uniform 	mediump float _RainsScale;
uniform 	mediump float _RainsHeight;
uniform 	mediump float _WarpIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _StaticRainsScale;
uniform 	mediump float _StaticRainsFadeSpeed;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _RainsMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
ivec4 u_xlati4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_27;
vec3 u_xlat28;
vec3 u_xlat29;
vec2 u_xlat30;
float u_xlat31;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_38;
mediump vec3 u_xlat16_40;
vec2 u_xlat49;
mediump float u_xlat16_49;
vec2 u_xlat50;
mediump float u_xlat16_50;
vec2 u_xlat51;
vec2 u_xlat52;
vec2 u_xlat53;
mediump float u_xlat16_60;
float u_xlat72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_80;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = vs_TEXCOORD3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat16_1.x = max(_RainsScale, 9.99999975e-05);
    u_xlat16_2 = u_xlat16_0.wzww * u_xlat16_1.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat16_0 * u_xlat16_1.xxxx + vec4(0.500999987, 0.5, 0.5, 0.500999987);
    u_xlat3.xyz = u_xlat16_2.yww * vec3(12.0, 20.0, 10.0);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 12345.5645;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat72 = _RainsSpeed * _Time.y;
    u_xlat4.x = u_xlat72 * 0.75 + u_xlat16_2.w;
    u_xlat3.x = u_xlat3.x + u_xlat4.x;
    u_xlat1.yz = u_xlat3.xx * vec2(2.0, 2.0);
    u_xlat1.xw = u_xlat16_2.yw * vec2(12.0, 18.5);
    u_xlat4.xy = floor(u_xlat1.xz);
    u_xlat1 = fract(u_xlat1);
    u_xlat3.x = dot(u_xlat4.xy, vec2(35.2000008, 2376.1001));
    u_xlat4.xyz = u_xlat3.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat4.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = u_xlat3.xxx + u_xlat4.xyz;
    u_xlat27.xz = u_xlat4.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.zx * u_xlat27.xz;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xz = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat3.x = _Time.y * _RainsSpeed + u_xlat4.y;
    u_xlat27.x = -abs(u_xlat4.x) + 0.5;
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat49.x = u_xlat1.z + u_xlat3.z;
    u_xlat5.z = u_xlat49.x + -0.5;
    u_xlat26.x = u_xlat16_2.w * 30.0 + u_xlat3.y;
    u_xlat26.x = sin(u_xlat26.x);
    u_xlat26.x = u_xlat27.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat4.z + u_xlat4.x;
    u_xlat5.x = u_xlat26.x * 0.300000012;
    u_xlat4.xyz = u_xlat1.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat26.xy = (-u_xlat5.xz) + u_xlat4.xy;
    u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + -0.300000012;
    u_xlat26.x = u_xlat26.x * -3.33333325;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat49.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat26.x * u_xlat49.x;
    u_xlat3.z = u_xlat3.x + -1.0;
    u_xlat3.xz = u_xlat3.xz * vec2(1.17647052, -6.66666794);
    u_xlat3.xz = min(u_xlat3.xz, vec2(1.0, 1.0));
    u_xlat73 = u_xlat3.z * -2.0 + 3.0;
    u_xlat49.x = u_xlat3.z * u_xlat3.z;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat73 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat73;
    u_xlat3.x = u_xlat3.x * u_xlat49.x + -0.5;
    u_xlat3.x = u_xlat3.x * 0.800000012 + 0.5;
    u_xlat49.x = u_xlat4.x * 0.333333343;
    u_xlat5.y = (-u_xlat49.x) * u_xlat49.x + u_xlat3.x;
    u_xlat3.x = u_xlat5.y + -1.0;
    u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49.x;
    u_xlat49.x = sqrt(u_xlat3.x);
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat50.x = u_xlat4.y + 0.0199999996;
    u_xlat50.x = u_xlat50.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat73;
    u_xlat26.x = u_xlat26.x * u_xlat50.x;
    u_xlat50.x = u_xlat3.x * u_xlat50.x;
    u_xlat27.xz = u_xlat4.xy * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat49.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 0.230000004;
    u_xlat3.x = u_xlat3.x * 0.150000006 + (-u_xlat49.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat49.x = dot(u_xlat27.xz, u_xlat27.xz);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat49.x = u_xlat49.x + -0.400000006;
    u_xlat49.x = u_xlat49.x * -2.5;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat4.x * u_xlat49.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yw * vec2(vec2(_StaticRainsScale, _StaticRainsScale));
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat49.x = dot(u_xlat5.xy, vec2(107.449997, 3543.65405));
    u_xlat5.xyz = u_xlat49.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat5.zyx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat49.xxx + u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat4.xy;
    u_xlat49.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x + -0.200000003;
    u_xlat49.x = u_xlat49.x * -5.0;
    u_xlat49.x = max(u_xlat49.x, 0.0);
    u_xlat4.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat5.z * 10.0;
    u_xlat4.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.y + -1.0;
    u_xlat4.xy = u_xlat4.xy * vec2(-1.02564096, 40.0);
    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.0));
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat4.y * -2.0 + 3.0;
    u_xlat27.x = u_xlat4.y * u_xlat4.y;
    u_xlat27.x = u_xlat27.x * u_xlat73;
    u_xlat4.x = u_xlat4.x * u_xlat27.x;
    u_xlat26.x = u_xlat49.x * u_xlat4.x + u_xlat26.x;
    u_xlat4.xy = u_xlat16_2.yz * vec2(22.2000008, 37.0);
    u_xlat49.x = floor(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.y);
    u_xlat4.x = u_xlat16_2.w * 55.5 + u_xlat4.x;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat49.x = u_xlat49.x * 12345.5645;
    u_xlat49.x = sin(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 7658.75977;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat27.x = u_xlat72 * 0.75;
    u_xlat5.xy = vec2(u_xlat72) * vec2(0.75, 0.75) + u_xlat0.yw;
    u_xlat72 = u_xlat16_2.x * 1.85000002 + u_xlat27.x;
    u_xlat6.x = u_xlat16_2.y * 22.2000008;
    u_xlat49.x = u_xlat49.x + u_xlat72;
    u_xlat6.yz = u_xlat49.xx * vec2(2.0, 2.0);
    u_xlat49.xy = floor(u_xlat6.xz);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat49.x = dot(u_xlat49.xy, vec2(35.2000008, 2376.1001));
    u_xlat7.xyz = u_xlat49.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat7.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat49.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat7.xyz = u_xlat49.xxx + u_xlat7.xyz;
    u_xlat49.xy = u_xlat7.yz + u_xlat7.xy;
    u_xlat49.xy = u_xlat7.zx * u_xlat49.xy;
    u_xlat49.xy = fract(u_xlat49.xy);
    u_xlat51.xy = u_xlat49.xy + vec2(-0.5, -0.5);
    u_xlat49.x = _Time.y * _RainsSpeed + u_xlat49.y;
    u_xlat49.x = fract(u_xlat49.x);
    u_xlat72 = -abs(u_xlat51.x) + 0.5;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = u_xlat72 * u_xlat51.y + u_xlat51.x;
    u_xlat7.x = u_xlat72 * 0.300000012;
    u_xlat72 = u_xlat1.w + u_xlat6.z;
    u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat7.z = u_xlat72 + -0.5;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xz);
    u_xlat72 = dot(u_xlat4.xw, u_xlat4.xw);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + -0.300000012;
    u_xlat72 = u_xlat72 * -3.33333325;
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat4.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat4.x = u_xlat49.x + -1.0;
    u_xlat49.x = u_xlat49.x * 1.17647052;
    u_xlat49.x = min(u_xlat49.x, 1.0);
    u_xlat4.x = u_xlat4.x * -6.66666794;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat73;
    u_xlat73 = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat73;
    u_xlat49.x = u_xlat49.x * u_xlat4.x + -0.5;
    u_xlat49.x = u_xlat49.x * 0.800000012 + 0.5;
    u_xlat4.x = u_xlat6.x * 0.333333343;
    u_xlat7.y = (-u_xlat4.x) * u_xlat4.x + u_xlat49.x;
    u_xlat49.x = u_xlat7.y + -1.0;
    u_xlat4.xw = u_xlat6.xy + (-u_xlat7.xy);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat6.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat49.x);
    u_xlat72 = u_xlat72 * u_xlat51.x;
    u_xlat74 = u_xlat4.w + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat6.x;
    u_xlat72 = u_xlat72 * u_xlat74;
    u_xlat74 = u_xlat49.x * u_xlat74;
    u_xlat6.xy = u_xlat4.xw * vec2(1.0, 6.0);
    u_xlat4.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat4.x);
    u_xlat73 = u_xlat51.x * 0.230000004;
    u_xlat49.x = u_xlat49.x * 0.150000006 + (-u_xlat73);
    u_xlat49.x = float(1.0) / u_xlat49.x;
    u_xlat49.x = u_xlat49.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat49.x = min(max(u_xlat49.x, 0.0), 1.0);
#else
    u_xlat49.x = clamp(u_xlat49.x, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat4.x = u_xlat4.x + -0.400000006;
    u_xlat4.x = u_xlat4.x * -2.5;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat73 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat72 = u_xlat73 * u_xlat4.x + u_xlat72;
    u_xlat26.x = u_xlat72 + u_xlat26.x;
    u_xlat26.x = max(u_xlat26.x, 0.00100000005);
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = u_xlat26.x + (-_RainsHeight);
    u_xlat72 = (-_RainsHeight) + 5.0;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat26.x = u_xlat72 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat26.x * -2.0 + 3.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat6.x = u_xlat26.x * u_xlat4.x;
    u_xlat26.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat26.x;
    u_xlat3.x = u_xlat50.x * u_xlat3.x;
    u_xlat26.x = u_xlat49.x * -2.0 + 3.0;
    u_xlat49.x = u_xlat49.x * u_xlat49.x;
    u_xlat26.x = u_xlat49.x * u_xlat26.x;
    u_xlat26.x = u_xlat74 * u_xlat26.x;
    u_xlat6.y = max(u_xlat26.x, u_xlat3.x);
    u_xlat16_3.x = texture(_RainsMask, vs_TEXCOORD3.xy).x;
    u_xlat26.xy = u_xlat16_3.xx * u_xlat6.xy;
    u_xlat4.x = u_xlat6.x * u_xlat16_3.x + -0.300000012;
    u_xlat4.x = u_xlat4.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat6.xzw = u_xlat0.yzw * vec3(18.5, 12.0, 20.0);
    u_xlat50.x = floor(u_xlat6.z);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat7.x = u_xlat50.x + u_xlat5.y;
    u_xlat7.y = u_xlat0.z;
    u_xlat28.xyz = u_xlat7.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat28.xz);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat50.xxx + u_xlat8.xyz;
    u_xlat50.xy = u_xlat8.yz + u_xlat8.xy;
    u_xlat50.xy = u_xlat8.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat7.xw = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat7.x) + 0.5;
    u_xlat52.x = sin(u_xlat6.w);
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat52.x = u_xlat0.w * 30.0 + u_xlat52.x;
    u_xlat52.x = sin(u_xlat52.x);
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat7.w + u_xlat7.x;
    u_xlat8.x = u_xlat73 * 0.300000012;
    u_xlat9.xyz = u_xlat0.wzw * vec3(10.0, 22.2000008, 37.0);
    u_xlat73 = fract(u_xlat9.x);
    u_xlat73 = u_xlat73 + u_xlat28.z;
    u_xlat28.xyz = u_xlat28.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat8.z = u_xlat73 + -0.5;
    u_xlat52.xy = u_xlat28.xy + (-u_xlat8.xz);
    u_xlat73 = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat52.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat52.x = u_xlat52.x * -6.66666794;
    u_xlat52.x = min(u_xlat52.x, 1.0);
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat75 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat75;
    u_xlat50.x = u_xlat50.x * u_xlat52.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat52.x = u_xlat28.x * 0.333333343;
    u_xlat8.y = (-u_xlat52.x) * u_xlat52.x + u_xlat50.x;
    u_xlat50.x = u_xlat8.y + -1.0;
    u_xlat28.xy = u_xlat28.xy + (-u_xlat8.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat73 = u_xlat73 * u_xlat52.x;
    u_xlat52.x = u_xlat50.x * u_xlat52.x;
    u_xlat7.xw = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat74) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat74 * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat51.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat7.xw, u_xlat7.xw);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat73 = u_xlat51.x * u_xlat28.x + u_xlat73;
    u_xlat1 = u_xlat0 * vec4(vec4(_StaticRainsScale, _StaticRainsScale, _StaticRainsScale, _StaticRainsScale));
    u_xlat2 = floor(u_xlat1);
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat28.x = dot(u_xlat2.zw, vec2(107.449997, 3543.65405));
    u_xlat51.x = dot(u_xlat2.xy, vec2(107.449997, 3543.65405));
    u_xlat8.xyz = u_xlat51.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat28.xyz = u_xlat28.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat10.xyz = u_xlat28.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat75 = dot(u_xlat28.zyx, u_xlat10.xyz);
    u_xlat28.xyz = u_xlat28.xyz + vec3(u_xlat75);
    u_xlat10.xyz = u_xlat28.yxx + u_xlat28.zzy;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat10.xyz;
    u_xlat28.xyz = fract(u_xlat28.xyz);
    u_xlat28.xy = u_xlat28.xy + vec2(-0.5, -0.5);
    u_xlat28.xy = (-u_xlat28.xy) * vec2(0.5, 0.5) + u_xlat1.zw;
    u_xlat28.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + -0.200000003;
    u_xlat28.x = u_xlat28.x * -5.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat51.x = u_xlat28.z * 10.0;
    u_xlat51.y = _Time.y * _StaticRainsFadeSpeed + u_xlat28.z;
    u_xlat51.xy = fract(u_xlat51.xy);
    u_xlat28.x = u_xlat51.x * u_xlat28.x;
    u_xlat51.x = u_xlat51.y + -1.0;
    u_xlat51.xy = u_xlat51.xy * vec2(-1.02564096, 40.0);
    u_xlat51.xy = min(u_xlat51.xy, vec2(1.0, 1.0));
    u_xlat75 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat51.y * -2.0 + 3.0;
    u_xlat74 = u_xlat51.y * u_xlat51.y;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat73 = u_xlat28.x * u_xlat51.x + u_xlat73;
    u_xlat28.x = floor(u_xlat9.y);
    u_xlat51.x = sin(u_xlat9.z);
    u_xlat28.y = u_xlat0.w * 55.5 + u_xlat51.x;
    u_xlat28.x = u_xlat28.x * 12345.5645;
    u_xlat28.xy = sin(u_xlat28.xy);
    u_xlat28.x = u_xlat28.x * 7658.75977;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat74 = u_xlat0.w * 1.85000002 + u_xlat27.x;
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat27.x;
    u_xlat7.z = u_xlat28.x + u_xlat74;
    u_xlat7.xyz = u_xlat7.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat28.xz = floor(u_xlat7.xz);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat28.x = dot(u_xlat28.xz, vec2(35.2000008, 2376.1001));
    u_xlat9.xyz = u_xlat28.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat10.xyz = u_xlat9.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat28.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat9.xyz = u_xlat28.xxx + u_xlat9.xyz;
    u_xlat28.xz = u_xlat9.yz + u_xlat9.xy;
    u_xlat28.xz = u_xlat9.zx * u_xlat28.xz;
    u_xlat28.xz = fract(u_xlat28.xz);
    u_xlat9.xy = u_xlat28.xz + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat28.z;
    u_xlat74 = -abs(u_xlat9.x) + 0.5;
    u_xlat51.x = u_xlat74 * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat9.y + u_xlat9.x;
    u_xlat9.x = u_xlat51.x * 0.300000012;
    u_xlat28.y = u_xlat0.w * 18.5;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat51.x = u_xlat28.y + u_xlat7.z;
    u_xlat7.xyz = u_xlat7.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat51.x + -0.5;
    u_xlat51.xy = u_xlat7.xy + (-u_xlat9.xz);
    u_xlat51.x = dot(u_xlat51.xy, u_xlat51.xy);
    u_xlat51.x = sqrt(u_xlat51.x);
    u_xlat51.x = u_xlat51.x + -0.300000012;
    u_xlat51.x = u_xlat51.x * -3.33333325;
    u_xlat51.x = max(u_xlat51.x, 0.0);
    u_xlat74 = u_xlat51.x * -2.0 + 3.0;
    u_xlat51.x = u_xlat51.x * u_xlat51.x;
    u_xlat51.x = u_xlat51.x * u_xlat74;
    u_xlat28.z = u_xlat28.x + -1.0;
    u_xlat28.xz = u_xlat28.xz * vec2(1.17647052, -6.66666794);
    u_xlat28.xz = min(u_xlat28.xz, vec2(1.0, 1.0));
    u_xlat75 = u_xlat28.z * -2.0 + 3.0;
    u_xlat74 = u_xlat28.z * u_xlat28.z;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat75 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat75;
    u_xlat28.x = u_xlat28.x * u_xlat74 + -0.5;
    u_xlat28.x = u_xlat28.x * 0.800000012 + 0.5;
    u_xlat74 = u_xlat7.x * 0.333333343;
    u_xlat9.y = (-u_xlat74) * u_xlat74 + u_xlat28.x;
    u_xlat28.x = u_xlat9.y + -1.0;
    u_xlat7.xy = u_xlat7.xy + (-u_xlat9.xy);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat74;
    u_xlat74 = sqrt(u_xlat28.x);
    u_xlat51.x = u_xlat74 * u_xlat51.x;
    u_xlat75 = u_xlat7.y + 0.0199999996;
    u_xlat75 = u_xlat75 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat53.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat53.x;
    u_xlat51.x = u_xlat51.x * u_xlat75;
    u_xlat75 = u_xlat28.x * u_xlat75;
    u_xlat30.xy = u_xlat7.xy * vec2(1.0, 6.0);
    u_xlat7.x = (-u_xlat74) * 0.230000004 + abs(u_xlat7.x);
    u_xlat74 = u_xlat74 * 0.230000004;
    u_xlat28.x = u_xlat28.x * 0.150000006 + (-u_xlat74);
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat30.xy, u_xlat30.xy);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat74 = u_xlat74 + -0.400000006;
    u_xlat74 = u_xlat74 * -2.5;
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat7.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat51.x = u_xlat7.x * u_xlat74 + u_xlat51.x;
    u_xlat73 = u_xlat73 + u_xlat51.x;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = u_xlat73 + (-_RainsHeight);
    u_xlat73 = u_xlat72 * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat28.x = u_xlat75 * u_xlat28.x;
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat50.x = u_xlat52.x * u_xlat50.x;
    u_xlat50.x = max(u_xlat28.x, u_xlat50.x);
    u_xlat50.x = u_xlat16_3.x * u_xlat50.x;
    u_xlat50.x = u_xlat6.y * u_xlat16_3.x + (-u_xlat50.x);
    u_xlat50.x = u_xlat73 + (-u_xlat50.x);
    u_xlat7.y = u_xlat26.y * u_xlat50.x + (-u_xlat73);
    u_xlat16_11.y = (-u_xlat73) * _WarpIntensity;
    u_xlat28.xyz = u_xlat0.xyy * vec3(12.0, 20.0, 10.0);
    u_xlat50.x = floor(u_xlat28.x);
    u_xlat50.x = u_xlat50.x * 12345.5645;
    u_xlat50.x = sin(u_xlat50.x);
    u_xlat50.x = u_xlat50.x * 7658.75977;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat9.x = u_xlat50.x + u_xlat5.x;
    u_xlat9.y = u_xlat0.x;
    u_xlat10.xyz = u_xlat9.yxx * vec3(12.0, 2.0, 2.0);
    u_xlat50.xy = floor(u_xlat10.xz);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat50.x = dot(u_xlat50.xy, vec2(35.2000008, 2376.1001));
    u_xlat12.xyz = u_xlat50.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat12.xyz = fract(u_xlat12.xyz);
    u_xlat13.xyz = u_xlat12.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat50.x = dot(u_xlat12.xyz, u_xlat13.xyz);
    u_xlat12.xyz = u_xlat50.xxx + u_xlat12.xyz;
    u_xlat50.xy = u_xlat12.yz + u_xlat12.xy;
    u_xlat50.xy = u_xlat12.zx * u_xlat50.xy;
    u_xlat50.xy = fract(u_xlat50.xy);
    u_xlat5.xy = u_xlat50.xy + vec2(-0.5, -0.5);
    u_xlat50.x = _Time.y * _RainsSpeed + u_xlat50.y;
    u_xlat50.x = fract(u_xlat50.x);
    u_xlat73 = -abs(u_xlat5.x) + 0.5;
    u_xlat51.x = sin(u_xlat28.y);
    u_xlat74 = fract(u_xlat28.z);
    u_xlat74 = u_xlat74 + u_xlat10.z;
    u_xlat10.xyz = u_xlat10.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat12.z = u_xlat74 + -0.5;
    u_xlat51.x = u_xlat0.y * 30.0 + u_xlat51.x;
    u_xlat51.x = sin(u_xlat51.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat73 = u_xlat73 * u_xlat5.y + u_xlat5.x;
    u_xlat12.x = u_xlat73 * 0.300000012;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xz);
    u_xlat73 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + -0.300000012;
    u_xlat73 = u_xlat73 * -3.33333325;
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat5.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat5.x;
    u_xlat5.x = u_xlat50.x + -1.0;
    u_xlat50.x = u_xlat50.x * 1.17647052;
    u_xlat50.x = min(u_xlat50.x, 1.0);
    u_xlat5.x = u_xlat5.x * -6.66666794;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat28.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x + -0.5;
    u_xlat50.x = u_xlat50.x * 0.800000012 + 0.5;
    u_xlat5.x = u_xlat10.x * 0.333333343;
    u_xlat12.y = (-u_xlat5.x) * u_xlat5.x + u_xlat50.x;
    u_xlat50.x = u_xlat12.y + -1.0;
    u_xlat5.xy = u_xlat10.xy + (-u_xlat12.xy);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat10.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat51.x = u_xlat50.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat50.x * u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat51.x;
    u_xlat51.x = sqrt(u_xlat50.x);
    u_xlat73 = u_xlat73 * u_xlat51.x;
    u_xlat74 = u_xlat5.y + 0.0199999996;
    u_xlat74 = u_xlat74 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat52.x = u_xlat74 * -2.0 + 3.0;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat52.x;
    u_xlat73 = u_xlat73 * u_xlat74;
    u_xlat74 = u_xlat50.x * u_xlat74;
    u_xlat52.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat5.x = (-u_xlat51.x) * 0.230000004 + abs(u_xlat5.x);
    u_xlat28.x = u_xlat51.x * 0.230000004;
    u_xlat50.x = u_xlat50.x * 0.150000006 + (-u_xlat28.x);
    u_xlat50.x = float(1.0) / u_xlat50.x;
    u_xlat50.x = u_xlat50.x * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.x = min(max(u_xlat50.x, 0.0), 1.0);
#else
    u_xlat50.x = clamp(u_xlat50.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat52.xy, u_xlat52.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat5.x = u_xlat5.x + -0.400000006;
    u_xlat5.x = u_xlat5.x * -2.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat73 = u_xlat28.x * u_xlat5.x + u_xlat73;
    u_xlat5.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat5.x = dot(u_xlat8.zyx, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat8.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat5.xy = (-u_xlat5.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.200000003;
    u_xlat5.x = u_xlat5.x * -5.0;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat28.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
    u_xlat28.x = u_xlat5.z * 10.0;
    u_xlat28.y = _Time.y * _StaticRainsFadeSpeed + u_xlat5.z;
    u_xlat28.xy = fract(u_xlat28.xy);
    u_xlat5.x = u_xlat28.x * u_xlat5.x;
    u_xlat28.x = u_xlat28.y + -1.0;
    u_xlat28.xy = u_xlat28.xy * vec2(-1.02564096, 40.0);
    u_xlat28.xy = min(u_xlat28.xy, vec2(1.0, 1.0));
    u_xlat52.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat52.x;
    u_xlat52.x = u_xlat28.y * -2.0 + 3.0;
    u_xlat51.x = u_xlat28.y * u_xlat28.y;
    u_xlat51.x = u_xlat51.x * u_xlat52.x;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat73 = u_xlat5.x * u_xlat28.x + u_xlat73;
    u_xlat5.xy = u_xlat0.xy * vec2(22.2000008, 37.0);
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 12345.5645;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.x = u_xlat5.x * 7658.75977;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat9.z = u_xlat27.x + u_xlat5.x;
    u_xlat8.xyz = u_xlat9.yzz * vec3(22.2000008, 2.0, 2.0);
    u_xlat27.x = u_xlat0.y * 55.5 + u_xlat5.y;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat5.xy = floor(u_xlat8.xz);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat5.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat5.xxx * vec3(0.103100002, 0.113689996, 0.137869999);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat9.xyz = u_xlat5.yzx + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat52.x = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat5.xyz = u_xlat5.xyz + u_xlat52.xxx;
    u_xlat52.xy = u_xlat5.yz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.zx * u_xlat52.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xz = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat28.x = _Time.y * _RainsSpeed + u_xlat5.y;
    u_xlat5.y = fract(u_xlat28.x);
    u_xlat52.x = -abs(u_xlat5.x) + 0.5;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.z + u_xlat5.x;
    u_xlat9.x = u_xlat27.x * 0.300000012;
    u_xlat27.x = u_xlat6.x + u_xlat8.z;
    u_xlat6.xzw = u_xlat8.xyz + vec3(-0.5, -0.0, -1.0);
    u_xlat9.z = u_xlat27.x + -0.5;
    u_xlat5.xz = u_xlat6.xz + (-u_xlat9.xz);
    u_xlat27.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x + -0.300000012;
    u_xlat27.x = u_xlat27.x * -3.33333325;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat5.x = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat27.x = u_xlat27.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.y + -1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(-6.66666794, 1.17647052);
    u_xlat5.xy = min(u_xlat5.xy, vec2(1.0, 1.0));
    u_xlat51.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat51.x;
    u_xlat51.x = u_xlat5.y * -2.0 + 3.0;
    u_xlat28.x = u_xlat5.y * u_xlat5.y;
    u_xlat28.x = u_xlat28.x * u_xlat51.x;
    u_xlat5.x = u_xlat28.x * u_xlat5.x + -0.5;
    u_xlat5.x = u_xlat5.x * 0.800000012 + 0.5;
    u_xlat28.x = u_xlat6.x * 0.333333343;
    u_xlat9.y = (-u_xlat28.x) * u_xlat28.x + u_xlat5.x;
    u_xlat5.x = u_xlat9.y + -1.0;
    u_xlat28.xy = u_xlat6.xz + (-u_xlat9.xy);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat6.x;
    u_xlat6.x = sqrt(u_xlat5.x);
    u_xlat27.x = u_xlat27.x * u_xlat6.x;
    u_xlat52.x = u_xlat28.y + 0.0199999996;
    u_xlat52.x = u_xlat52.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.x = min(max(u_xlat52.x, 0.0), 1.0);
#else
    u_xlat52.x = clamp(u_xlat52.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat52.x * -2.0 + 3.0;
    u_xlat52.x = u_xlat52.x * u_xlat52.x;
    u_xlat52.x = u_xlat52.x * u_xlat75;
    u_xlat27.x = u_xlat27.x * u_xlat52.x;
    u_xlat52.x = u_xlat5.x * u_xlat52.x;
    u_xlat53.xy = u_xlat28.xy * vec2(1.0, 6.0);
    u_xlat28.x = (-u_xlat6.x) * 0.230000004 + abs(u_xlat28.x);
    u_xlat51.x = u_xlat6.x * 0.230000004;
    u_xlat5.x = u_xlat5.x * 0.150000006 + (-u_xlat51.x);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat28.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat53.xy, u_xlat53.xy);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat28.x = u_xlat28.x + -0.400000006;
    u_xlat28.x = u_xlat28.x * -2.5;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat51.x = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat27.x = u_xlat51.x * u_xlat28.x + u_xlat27.x;
    u_xlat27.x = u_xlat27.x + u_xlat73;
    u_xlat27.x = max(u_xlat27.x, 0.00100000005);
    u_xlat27.x = float(1.0) / u_xlat27.x;
    u_xlat27.x = u_xlat27.x + (-_RainsHeight);
    u_xlat72 = u_xlat72 * u_xlat27.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat27.x = u_xlat72 * -2.0 + 3.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat26.x = u_xlat72 * u_xlat16_3.x + (-u_xlat26.x);
    u_xlat72 = u_xlat50.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat50.x * u_xlat50.x;
    u_xlat72 = u_xlat72 * u_xlat27.x;
    u_xlat72 = u_xlat74 * u_xlat72;
    u_xlat27.x = u_xlat5.x * -2.0 + 3.0;
    u_xlat50.x = u_xlat5.x * u_xlat5.x;
    u_xlat27.x = u_xlat50.x * u_xlat27.x;
    u_xlat27.x = u_xlat52.x * u_xlat27.x;
    u_xlat72 = max(u_xlat72, u_xlat27.x);
    u_xlat72 = u_xlat16_3.x * u_xlat72;
    u_xlat72 = u_xlat6.y * u_xlat16_3.x + (-u_xlat72);
    u_xlat72 = (-u_xlat26.x) + u_xlat72;
    u_xlat7.x = u_xlat26.y * u_xlat72 + u_xlat26.x;
    u_xlat16_11.x = u_xlat26.x * _WarpIntensity;
    u_xlat16_11.xy = u_xlat16_11.xy + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat16_11.xy);
    u_xlat5.xy = u_xlat7.xy * vec2(_NormalIntensity);
    u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat26.x = min(u_xlat26.x, 1.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat5.z = max(u_xlat26.x, 1.00000002e-16);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_11.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_11.xxx + vs_TEXCOORD2.yzx;
    u_xlat26.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat27.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat7.xyz = u_xlat27.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat27.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.x = u_xlat27.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat27.y;
    u_xlat27.y = u_xlat7.z;
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_11.xyz, u_xlat6.xyz);
    u_xlat27.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_11.xyz, u_xlat27.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat27.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat8.xyz * u_xlat26.xxx + (-u_xlat27.xyz);
    u_xlat26.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat72 = u_xlat4.x * u_xlat4.x;
    u_xlat26.x = (-u_xlat26.x) * u_xlat72 + 1.0;
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
    u_xlat3.x = u_xlat16_3.x * u_xlat26.x;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat27.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat73) * u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat26.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat26.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb73 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb73)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat4.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat4.zzzz + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat4.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat1.z + (-u_xlat4.x);
    u_xlat27.x = max((-u_xlat1.w), u_xlat4.x);
    u_xlat27.x = (-u_xlat4.x) + u_xlat27.x;
    u_xlat1.z = _ShadowBias.y * u_xlat27.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat4.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_11.x = (-_ShadowBias.w) + 1.0;
    u_xlat27.x = (-u_xlat16_11.x) + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat27.x + u_xlat16_11.x;
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_11.x = u_xlat16_27 * _shadowStrength;
    u_xlat4.x = (-u_xlat4.x) * u_xlat16_11.x + 1.0;
    u_xlat27.x = u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_11.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat4.xxx * u_xlat16_11.xyz + _shadowColor.xyz;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat73 = dot(u_xlat26.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38.xyz = u_xlat16_15.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_38.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat6.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz;
    u_xlat16_83 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat29.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat29.x;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat52.x = (-u_xlat16_83) * u_xlat29.x + 1.0;
    u_xlat16_83 = u_xlat29.x * u_xlat16_83;
    u_xlat29.xyz = u_xlat16_38.xyz * u_xlat52.xxx;
    u_xlat29.xyz = u_xlat5.xxx * vec3(u_xlat16_83) + u_xlat29.xyz;
    u_xlat16_16.xy = (-u_xlat16_1.xy) * vec2(_roughnessMultiplier, _metallicMultiplier) + vec2(0.00999999978, 1.0);
    u_xlat16_40.x = u_xlat3.x * u_xlat16_16.x + u_xlat16_15.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy;
    u_xlat16_83 = u_xlat16_40.x * u_xlat16_40.x;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat3.x = (-u_xlat73) * u_xlat16_83 + u_xlat73;
    u_xlat3.x = u_xlat73 * u_xlat3.x + u_xlat16_83;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat73;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat28.xyz * vec3(u_xlat16_80);
    u_xlat7.x = dot(u_xlat26.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat53.x = (-u_xlat7.x) * u_xlat16_83 + u_xlat7.x;
    u_xlat53.x = u_xlat7.x * u_xlat53.x + u_xlat16_83;
    u_xlat53.x = sqrt(u_xlat53.x);
    u_xlat53.x = u_xlat53.x + u_xlat7.x;
    u_xlat53.x = u_xlat53.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat53.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat76 = u_xlat16_83 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat76 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_83 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat29.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _directSpecularColor.xyz;
    u_xlat6.xyz = vec3(u_xlat73) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_15.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_18.xyz = u_xlat8.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_19.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat16_85 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat26.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_83 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_17.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat8.x = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat8.x;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat31 = (-u_xlat16_85) * u_xlat8.x + 1.0;
    u_xlat16_85 = u_xlat8.x * u_xlat16_85;
    u_xlat8.xyz = u_xlat16_38.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat5.xxx * vec3(u_xlat16_85) + u_xlat8.xyz;
    u_xlat77 = (-u_xlat3.x) * u_xlat16_83 + u_xlat3.x;
    u_xlat77 = u_xlat3.x * u_xlat77 + u_xlat16_83;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat3.x + u_xlat77;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat53.x * u_xlat77;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_19.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_85 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_17.x);
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_15.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat27.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_18.xyz;
    u_xlat8.xyz = u_xlat27.xxx * u_xlat8.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_15.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_15.x = max(u_xlat16_15.x, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_15.x);
    u_xlat16_20.xyz = u_xlat6.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_21.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat16_80) + u_xlat16_20.xyz;
    u_xlat3.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat28.xyz = u_xlat3.xxx * u_xlat28.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat76 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_83 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat28.x = (-u_xlat16_80) + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat28.x;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat51.x = (-u_xlat16_80) * u_xlat28.x + 1.0;
    u_xlat16_80 = u_xlat28.x * u_xlat16_80;
    u_xlat28.xyz = u_xlat16_38.xyz * u_xlat51.xxx;
    u_xlat5.xyz = u_xlat5.xxx * vec3(u_xlat16_80) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat26.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat6.x = (-u_xlat74) * u_xlat16_83 + u_xlat74;
    u_xlat6.x = u_xlat74 * u_xlat6.x + u_xlat16_83;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat74 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat6.x * u_xlat53.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat16_85 = u_xlat16_15.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_15.x);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_85;
    u_xlat16_15.x = max(u_xlat16_21.x, u_xlat16_15.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_85);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat27.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat5.xyz * u_xlat27.xxx + u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat73) + u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_20.xyz * vec3(u_xlat74) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_19.xyz + u_xlat16_11.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = (-u_xlat26.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat26.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_20.xyz;
    u_xlat16_80 = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_15.x = (-u_xlat16_80) + u_xlat16_15.x;
    u_xlat16_85 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _occlusionScale * u_xlat16_85 + 1.0;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_15.x + u_xlat16_80;
    u_xlat16_80 = u_xlat16_40.z * u_xlat16_80;
    u_xlat16_15.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat16_15.x = _occlusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_15.x;
    u_xlat4.xy = min(u_xlat4.xz, vec2(u_xlat16_80));
    u_xlat3.x = min(u_xlat16_1.z, u_xlat4.x);
    u_xlat16_21.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat3.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat3.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat3.xxx + (-u_xlat16_22.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat3.xxx + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = u_xlat16_15.xxx * u_xlat16_22.xyz;
    u_xlati3 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati3].xyz;
    u_xlati3 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati3].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_14.x = dot((-u_xlat16_16.xyz), u_xlat26.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat4.xzw = (-u_xlat26.xyz) * u_xlat16_14.xxx + (-u_xlat16_16.xyz);
    u_xlat16_40.y = dot(u_xlat16_20.xyz, u_xlat4.xzw);
    u_xlat3.x = dot(u_xlat16_20.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz + (-u_xlat4.xzw);
    u_xlat26.xyz = vec3(u_xlat16_83) * u_xlat26.xyz + u_xlat4.xzw;
    u_xlat16_14.xyz = u_xlat16_40.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_14.x = floor(u_xlat16_2.w);
    u_xlat16_37.x = u_xlat16_14.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_2.x = u_xlat16_37.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_37.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_37.xz = u_xlat16_37.xz * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_37.xz).x;
    u_xlat16_14.x = u_xlat16_14.z * 15.0 + (-u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_50) + u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_37.x + u_xlat16_50;
    u_xlat16_14.x = u_xlat16_15.x * u_xlat16_14.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat4.y * 0.5;
    u_xlat16_37.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_14.x = u_xlat3.x * u_xlat16_37.x + u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat16_60 = (-u_xlat16_14.x) * 2.0 + 1.0;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_60 + u_xlat16_37.x;
    u_xlat16_14.x = u_xlat4.y * u_xlat16_14.x;
    u_xlat16_14.x = min(u_xlat16_1.z, u_xlat16_14.x);
    u_xlat16_37.x = u_xlat16_40.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_40.x);
    u_xlat7.y = u_xlat16_40.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_15.xyz = u_xlat16_38.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat16.y = u_xlat26.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_37.x);
    u_xlat16_37.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_37.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_80) * u_xlat16_37.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_37.xyz = (bool(u_xlatb3)) ? u_xlat16_17.xyz : u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_37.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_0.w * _albedoColor.w + u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_14.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_37.x = (-_UseEmissive2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseEmissive2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat3.x = _EmissiveBreathe.y * _Time.y;
    u_xlat3.x = u_xlat3.x * _EmissiveBreathe.x;
    u_xlat3.x = cos(u_xlat3.x);
    u_xlat3.x = max(abs(u_xlat3.x), _EmissiveBreathe.z);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_37.xyz;
    u_xlat16_37.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_37.xyz = u_xlat3.xyz * u_xlat16_37.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_37.xyz + u_xlat16_11.xyz;
    u_xlat3.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_37.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vs_TEXCOORD3.xy;
    u_xlat16_37.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat16_37.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat16_37.xy;
    u_xlat16_49 = texture(_FlowLightMask, u_xlat16_37.xy).x;
    u_xlat16_37.xy = u_xlat3.xy * _FlowLightMap_ST.xy + _FlowLightMap_ST.zw;
    u_xlat16_3.xyw = texture(_FlowLightMap, u_xlat16_37.xy).xyz;
    u_xlat16_37.xyz = u_xlat16_3.xyw * _FlowLightFactory.xxx;
    u_xlat16_37.xyz = vec3(u_xlat16_49) * u_xlat16_37.xyz;
    u_xlat16_11.xyz = u_xlat16_37.xyz * _FlowLightColor.xyz + u_xlat16_11.xyz;
    u_xlat16_37.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_37.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_80 : u_xlat16_14.x;
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
  GpuProgramID 128509
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_RainsGUI"
}