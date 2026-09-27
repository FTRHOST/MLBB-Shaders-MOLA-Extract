//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PCSSAO/Lit/PBR_SingleParallax" {
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

_SingleParallaxTex ("视差贴图", 2D) = "white" { }

_SingleParallaxMask ("视差遮罩贴图", 2D) = "white" { }

_SingleParallaxColor ("视差颜色", Color) = (0,0,0,1)

_SingleParallaxFactory ("视差参数", Vector) = (1,0,0,0)

_SingleParallaxWarpTex ("视差扭曲贴图", 2D) = "white" { }

_SingleParallaxWarp ("视差扭曲强度", Range(0, 1)) = 0.0

_SingleParallaxWarpSpeed ("视差扭曲速度", Range(-1, 1)) = 0.0

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
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 48746
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
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
vec2 u_xlat40;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37.x;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.zxy * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_8.xyz;
    u_xlat54 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37.x) + 1.0;
    u_xlat16_37.x = u_xlat65 * u_xlat65;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_55 = u_xlat65 * u_xlat16_37.x;
    u_xlat65 = (-u_xlat16_37.x) * u_xlat65 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37.x = max(u_xlat16_37.x, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37.x);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_15.xyz = u_xlat16_37.xxx * u_xlat5.xyz;
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37.x = max(u_xlat16_37.x, u_xlat16_16.x);
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
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_37.x;
    u_xlat16_16.xyz = u_xlat16_37.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_37.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_56 = u_xlat16_0.x * u_xlat16_7.z;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
    u_xlat16_57 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_24 = (-u_xlat16_57) + u_xlat16_24;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_24 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 + -1.0;
    u_xlat16_24 = _OcclusionScale * u_xlat16_24 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_24;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_56);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_24) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_7.x = u_xlat16_21.x * 16.0 + u_xlat16_7.z;
    u_xlat16_42.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_42.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_3.x);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat18.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat18.xy;
    u_xlat18.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat18.xy;
    u_xlat4.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat4.xy;
    u_xlat4.xy = (-_SingleParallaxFactory.xx) * u_xlat18.xy + u_xlat4.xy;
    u_xlat40.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat18.xy = (-_SingleParallaxFactory.xx) * u_xlat18.xy + u_xlat40.xy;
    u_xlat18.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat18.xy;
    u_xlat16_18.x = texture(_SingleParallaxWarpTex, u_xlat18.xy).x;
    u_xlat16_37.x = u_xlat16_18.x * 2.0 + -1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vec2(_SingleParallaxWarp) + u_xlat4.xy;
    u_xlat16_18.xyz = texture(_SingleParallaxTex, u_xlat16_37.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_18.zxy * _SingleParallaxColor.zxy;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
vec2 u_xlat40;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37.x;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.zxy * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_8.xyz;
    u_xlat54 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37.x) + 1.0;
    u_xlat16_37.x = u_xlat65 * u_xlat65;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_55 = u_xlat65 * u_xlat16_37.x;
    u_xlat65 = (-u_xlat16_37.x) * u_xlat65 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37.x = max(u_xlat16_37.x, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37.x);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_15.xyz = u_xlat16_37.xxx * u_xlat5.xyz;
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37.x = max(u_xlat16_37.x, u_xlat16_16.x);
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
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_37.x;
    u_xlat16_16.xyz = u_xlat16_37.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_37.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_56 = u_xlat16_0.x * u_xlat16_7.z;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
    u_xlat16_57 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_24 = (-u_xlat16_57) + u_xlat16_24;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_24 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 + -1.0;
    u_xlat16_24 = _OcclusionScale * u_xlat16_24 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_24;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_56);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_24) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_7.x = u_xlat16_21.x * 16.0 + u_xlat16_7.z;
    u_xlat16_42.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_42.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_3.x);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat18.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat18.xy;
    u_xlat18.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat18.xy;
    u_xlat4.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat4.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat4.xy;
    u_xlat4.xy = (-_SingleParallaxFactory.xx) * u_xlat18.xy + u_xlat4.xy;
    u_xlat40.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat18.xy = (-_SingleParallaxFactory.xx) * u_xlat18.xy + u_xlat40.xy;
    u_xlat18.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat18.xy;
    u_xlat16_18.x = texture(_SingleParallaxWarpTex, u_xlat18.xy).x;
    u_xlat16_37.x = u_xlat16_18.x * 2.0 + -1.0;
    u_xlat16_37.xy = u_xlat16_37.xx * vec2(_SingleParallaxWarp) + u_xlat4.xy;
    u_xlat16_18.xyz = texture(_SingleParallaxTex, u_xlat16_37.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_18.zxy * _SingleParallaxColor.zxy;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(14) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_8;
bool u_xlatb8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
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
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat26;
int u_xlati26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat32;
mediump vec3 u_xlat16_32;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
int u_xlati48;
float u_xlat51;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat57;
ivec2 u_xlati57;
bool u_xlatb57;
vec2 u_xlat61;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
mediump float u_xlat10_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat85;
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
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_9.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_9.z * _ShadowStrength;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_83 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_83);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat13.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat13.xyz = (bool(u_xlatb24)) ? u_xlat13.xyz : vs_TEXCOORD0.xyz;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat14;
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
    u_xlat15 = u_xlat13.yyyy * u_xlat15;
    u_xlat14 = u_xlat14 * u_xlat13.xxxx + u_xlat15;
    u_xlat13 = u_xlat16 * u_xlat13.zzzz + u_xlat14;
    u_xlat13 = u_xlat17 + u_xlat13;
    u_xlat24.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat13.z;
    u_xlat48 = max((-u_xlat13.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat13.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat13.w<1.0);
#else
        u_xlatb24 = u_xlat13.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat57.xy = u_xlat13.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat57.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
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
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat38.x);
#else
            u_xlatb24 = 0.0<u_xlat38.x;
#endif
            u_xlat26 = u_xlat38.y / u_xlat38.x;
            u_xlat26 = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat26 = (-u_xlat26) + u_xlat13.w;
            u_xlat26 = u_xlat26 * _PCSSLightSize;
            u_xlat48 = max(u_xlat24.y, u_xlat26);
            u_xlat48 = max(u_xlat48, 1.0);
            u_xlat48 = min(u_xlat48, 20.0);
            u_xlat24.x = (u_xlatb24) ? u_xlat48 : 1.0;
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlati48 = max(_PCSSSampleCount, 4);
            u_xlati48 = min(u_xlati48, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati26 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26>=16);
#else
                u_xlatb80 = u_xlati26>=16;
#endif
                if(u_xlatb80){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26<u_xlati48);
#else
                u_xlatb80 = u_xlati26<u_xlati48;
#endif
                if(u_xlatb80){
                    u_xlat57.xy = u_xlat14.xx * ImmCB_0[u_xlati26].yx;
                    u_xlat16.x = ImmCB_0[u_xlati26].x * u_xlat15.x + (-u_xlat57.x);
                    u_xlat16.y = ImmCB_0[u_xlati26].y * u_xlat15.x + u_xlat57.y;
                    u_xlat57.xy = u_xlat16.xy * u_xlat24.xx + u_xlat13.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat57.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat57.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb80 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb80 = u_xlatb38.y && u_xlatb80;
                    u_xlatb80 = u_xlatb39.y && u_xlatb80;
                    if(!u_xlatb80){
                        u_xlati80 = u_xlati26 + 1;
                        u_xlati26 = u_xlati80;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat57.xy,u_xlat13.w);
                    u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_80 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati26 = u_xlati26 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat16_43);
#else
            u_xlatb24 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29.x = u_xlat16_19.x / u_xlat16_43;
            u_xlat57.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
            u_xlat57.xy = min(u_xlat57.xy, u_xlat13.xy);
            u_xlat48 = min(u_xlat57.y, u_xlat57.x);
            u_xlat48 = u_xlat48 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
            u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
            u_xlat26 = u_xlat16_29.x + -1.0;
            u_xlat24.x = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat24.x = u_xlat48 * u_xlat24.x + 1.0;
            u_xlat16_24 = u_xlat24.x;
        } else {
            u_xlat16_24 = 1.0;
        }
        u_xlat16_29.x = (-u_xlat16_51) + 1.0;
        u_xlat16_51 = u_xlat16_24 * u_xlat16_29.x + u_xlat16_51;
        u_xlat51 = u_xlat16_51;
    } else {
        u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat13.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat13.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat57.x = (-u_xlat16_29.x) + 1.0;
        u_xlat51 = u_xlat80 * u_xlat57.x + u_xlat16_29.x;
    }
    u_xlat80 = (-u_xlat51) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat13.xyz = u_xlat57.xxx * u_xlat13.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat61.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat61.x = u_xlat13.x * u_xlat61.x + u_xlat16_3.x;
    u_xlat61.x = sqrt(u_xlat61.x);
    u_xlat61.x = u_xlat61.x + u_xlat13.x;
    u_xlat85 = (-u_xlat81) * u_xlat16_3.x + u_xlat81;
    u_xlat85 = u_xlat81 * u_xlat85 + u_xlat16_3.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat61.y = u_xlat81 + u_xlat85;
    u_xlat61.xy = u_xlat61.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat85 = u_xlat61.y * u_xlat61.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat14.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat14.x * u_xlat14.x;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_76;
    u_xlat38.x = u_xlat16_1.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_76) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat14.xzw;
    u_xlat16_19.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _ShadowColor.zxy;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat57.x = u_xlat57.x * u_xlat85;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _DirectSpecularColor.zxy;
    u_xlat14.xzw = vec3(u_xlat81) * u_xlat14.xzw;
    u_xlat14.xzw = u_xlat14.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat15.xyz;
    u_xlat16_22.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat57.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat15.xyz = u_xlat57.xxx * u_xlat15.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat15.x = (-u_xlat85) * u_xlat16_3.x + u_xlat85;
    u_xlat15.x = u_xlat85 * u_xlat15.x + u_xlat16_3.x;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat85 + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat61.x * u_xlat15.x;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat39.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat39.x * u_xlat39.x;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat39.x * u_xlat16_76;
    u_xlat39.x = (-u_xlat16_76) * u_xlat39.x + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * u_xlat39.xxx;
    u_xlat39.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat39.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat85) * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.x * u_xlat15.x;
    u_xlat15.xyz = u_xlat39.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat85) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_22.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat16_19.xyz = u_xlat14.xzw * u_xlat16_19.xyz + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat81) + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat14.xzw;
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xzw = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat10.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10.xxx;
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat10.x * u_xlat10.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat81 = (-u_xlat9.x) * u_xlat16_3.x + u_xlat9.x;
    u_xlat81 = u_xlat9.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat9.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat61.x;
    u_xlat57.y = float(1.0) / u_xlat81;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat10.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat10.x * u_xlat10.x;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat10.x * u_xlat16_76;
    u_xlat10.x = (-u_xlat16_76) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.yyy * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_22.xyz * u_xlat10.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat9.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat9.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat9.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat9.xy = min(vec2(u_xlat16_27), u_xlat9.xy);
    u_xlat9.x = min(u_xlat16_75, u_xlat9.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat9.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat9.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat9.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat9.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat9.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat9.xzw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_10.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_23.x = u_xlat16_53 * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_23.y = u_xlat16_10.z;
    u_xlat16_29.xy = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_80) + u_xlat16_9.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_80;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat80 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_29.x * u_xlat80;
    u_xlat16_29.x = u_xlat9.y * 0.5;
    u_xlat16_53 = (-u_xlat9.y) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat80 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat9.y;
    u_xlat16_29.x = min(u_xlat16_75, u_xlat16_29.x);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_21.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_21.xyz : u_xlat16_12.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.yzx * u_xlat16_5.yzx + u_xlat16_19.yzx;
    u_xlat16_76 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_76 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat32.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat32.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat32.xy;
    u_xlat32.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat32.xy;
    u_xlat9.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat9.xy;
    u_xlat9.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat9.xy;
    u_xlat57.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat32.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat57.xy;
    u_xlat32.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat32.xy;
    u_xlat16_32.x = texture(_SingleParallaxWarpTex, u_xlat32.xy).x;
    u_xlat16_73 = u_xlat16_32.x * 2.0 + -1.0;
    u_xlat16_4.xy = vec2(u_xlat16_73) * vec2(_SingleParallaxWarp) + u_xlat9.xy;
    u_xlat16_32.xyz = texture(_SingleParallaxTex, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_32.zxy * _SingleParallaxColor.zxy;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    u_xlat16_13.xyz = textureLod(_ACESLutTex, u_xlat32.xy, 0.0).xyz;
    u_xlat8.x = u_xlat8.x * 15.0 + (-u_xlat80);
    u_xlat32.xyz = (-u_xlat16_9.xyz) + u_xlat16_13.xyz;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(14) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_8;
bool u_xlatb8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
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
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat26;
int u_xlati26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec3 u_xlat32;
mediump vec3 u_xlat16_32;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
int u_xlati48;
float u_xlat51;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat57;
ivec2 u_xlati57;
bool u_xlatb57;
vec2 u_xlat61;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
mediump float u_xlat10_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat85;
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
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_9.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_9.z * _ShadowStrength;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_83 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_83);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat13.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat13.xyz = (bool(u_xlatb24)) ? u_xlat13.xyz : vs_TEXCOORD0.xyz;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat14;
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
    u_xlat15 = u_xlat13.yyyy * u_xlat15;
    u_xlat14 = u_xlat14 * u_xlat13.xxxx + u_xlat15;
    u_xlat13 = u_xlat16 * u_xlat13.zzzz + u_xlat14;
    u_xlat13 = u_xlat17 + u_xlat13;
    u_xlat24.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat13.z;
    u_xlat48 = max((-u_xlat13.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat13.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat13.w<1.0);
#else
        u_xlatb24 = u_xlat13.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat57.xy = u_xlat13.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat57.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
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
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat38.x);
#else
            u_xlatb24 = 0.0<u_xlat38.x;
#endif
            u_xlat26 = u_xlat38.y / u_xlat38.x;
            u_xlat26 = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat26 = (-u_xlat26) + u_xlat13.w;
            u_xlat26 = u_xlat26 * _PCSSLightSize;
            u_xlat48 = max(u_xlat24.y, u_xlat26);
            u_xlat48 = max(u_xlat48, 1.0);
            u_xlat48 = min(u_xlat48, 20.0);
            u_xlat24.x = (u_xlatb24) ? u_xlat48 : 1.0;
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlati48 = max(_PCSSSampleCount, 4);
            u_xlati48 = min(u_xlati48, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati26 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26>=16);
#else
                u_xlatb80 = u_xlati26>=16;
#endif
                if(u_xlatb80){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26<u_xlati48);
#else
                u_xlatb80 = u_xlati26<u_xlati48;
#endif
                if(u_xlatb80){
                    u_xlat57.xy = u_xlat14.xx * ImmCB_0[u_xlati26].yx;
                    u_xlat16.x = ImmCB_0[u_xlati26].x * u_xlat15.x + (-u_xlat57.x);
                    u_xlat16.y = ImmCB_0[u_xlati26].y * u_xlat15.x + u_xlat57.y;
                    u_xlat57.xy = u_xlat16.xy * u_xlat24.xx + u_xlat13.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat57.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat57.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb80 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb80 = u_xlatb38.y && u_xlatb80;
                    u_xlatb80 = u_xlatb39.y && u_xlatb80;
                    if(!u_xlatb80){
                        u_xlati80 = u_xlati26 + 1;
                        u_xlati26 = u_xlati80;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat57.xy,u_xlat13.w);
                    u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_80 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati26 = u_xlati26 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat16_43);
#else
            u_xlatb24 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29.x = u_xlat16_19.x / u_xlat16_43;
            u_xlat57.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
            u_xlat57.xy = min(u_xlat57.xy, u_xlat13.xy);
            u_xlat48 = min(u_xlat57.y, u_xlat57.x);
            u_xlat48 = u_xlat48 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
            u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
            u_xlat26 = u_xlat16_29.x + -1.0;
            u_xlat24.x = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat24.x = u_xlat48 * u_xlat24.x + 1.0;
            u_xlat16_24 = u_xlat24.x;
        } else {
            u_xlat16_24 = 1.0;
        }
        u_xlat16_29.x = (-u_xlat16_51) + 1.0;
        u_xlat16_51 = u_xlat16_24 * u_xlat16_29.x + u_xlat16_51;
        u_xlat51 = u_xlat16_51;
    } else {
        u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat13.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat13.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat57.x = (-u_xlat16_29.x) + 1.0;
        u_xlat51 = u_xlat80 * u_xlat57.x + u_xlat16_29.x;
    }
    u_xlat80 = (-u_xlat51) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat13.xyz = u_xlat57.xxx * u_xlat13.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat61.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat61.x = u_xlat13.x * u_xlat61.x + u_xlat16_3.x;
    u_xlat61.x = sqrt(u_xlat61.x);
    u_xlat61.x = u_xlat61.x + u_xlat13.x;
    u_xlat85 = (-u_xlat81) * u_xlat16_3.x + u_xlat81;
    u_xlat85 = u_xlat81 * u_xlat85 + u_xlat16_3.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat61.y = u_xlat81 + u_xlat85;
    u_xlat61.xy = u_xlat61.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat85 = u_xlat61.y * u_xlat61.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat14.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat14.x * u_xlat14.x;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_76;
    u_xlat38.x = u_xlat16_1.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_76) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat14.xzw;
    u_xlat16_19.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _ShadowColor.zxy;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat57.x = u_xlat57.x * u_xlat85;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _DirectSpecularColor.zxy;
    u_xlat14.xzw = vec3(u_xlat81) * u_xlat14.xzw;
    u_xlat14.xzw = u_xlat14.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat15.xyz;
    u_xlat16_22.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat57.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat15.xyz = u_xlat57.xxx * u_xlat15.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat15.x = (-u_xlat85) * u_xlat16_3.x + u_xlat85;
    u_xlat15.x = u_xlat85 * u_xlat15.x + u_xlat16_3.x;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat85 + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat61.x * u_xlat15.x;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat39.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat39.x * u_xlat39.x;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat39.x * u_xlat16_76;
    u_xlat39.x = (-u_xlat16_76) * u_xlat39.x + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * u_xlat39.xxx;
    u_xlat39.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat39.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat85) * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.x * u_xlat15.x;
    u_xlat15.xyz = u_xlat39.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat85) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_22.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat16_19.xyz = u_xlat14.xzw * u_xlat16_19.xyz + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat81) + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat14.xzw;
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xzw = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat10.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10.xxx;
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat10.x * u_xlat10.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat81 = (-u_xlat9.x) * u_xlat16_3.x + u_xlat9.x;
    u_xlat81 = u_xlat9.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat9.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat61.x;
    u_xlat57.y = float(1.0) / u_xlat81;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat10.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat10.x * u_xlat10.x;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat10.x * u_xlat16_76;
    u_xlat10.x = (-u_xlat16_76) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.yyy * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_22.xyz * u_xlat10.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat9.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat9.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat9.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat9.xy = min(vec2(u_xlat16_27), u_xlat9.xy);
    u_xlat9.x = min(u_xlat16_75, u_xlat9.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat9.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat9.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat9.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat9.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat9.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat9.xzw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_10.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_23.x = u_xlat16_53 * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_23.y = u_xlat16_10.z;
    u_xlat16_29.xy = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_80) + u_xlat16_9.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_80;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat80 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_29.x * u_xlat80;
    u_xlat16_29.x = u_xlat9.y * 0.5;
    u_xlat16_53 = (-u_xlat9.y) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat80 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat9.y;
    u_xlat16_29.x = min(u_xlat16_75, u_xlat16_29.x);
    u_xlat8.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_76);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat8.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_21.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_21.xyz : u_xlat16_12.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.yzx * u_xlat16_5.yzx + u_xlat16_19.yzx;
    u_xlat16_76 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_76 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat32.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat32.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat32.xy;
    u_xlat32.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat32.xy;
    u_xlat9.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat9.xy;
    u_xlat9.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat9.xy;
    u_xlat57.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat32.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat57.xy;
    u_xlat32.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat32.xy;
    u_xlat16_32.x = texture(_SingleParallaxWarpTex, u_xlat32.xy).x;
    u_xlat16_73 = u_xlat16_32.x * 2.0 + -1.0;
    u_xlat16_4.xy = vec2(u_xlat16_73) * vec2(_SingleParallaxWarp) + u_xlat9.xy;
    u_xlat16_32.xyz = texture(_SingleParallaxTex, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_32.zxy * _SingleParallaxColor.zxy;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    u_xlat16_13.xyz = textureLod(_ACESLutTex, u_xlat32.xy, 0.0).xyz;
    u_xlat8.x = u_xlat8.x * 15.0 + (-u_xlat80);
    u_xlat32.xyz = (-u_xlat16_9.xyz) + u_xlat16_13.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat32.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat8.xyz;
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
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
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
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
int u_xlati20;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec2 u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat45;
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
    u_xlat16_46 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].zxy;
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
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
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
    u_xlat20 = u_xlat16_3.z * 50.0;
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
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat52) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
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
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
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
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
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
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
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
    u_xlat16_17.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat3.x = u_xlat45 * 0.0625 + u_xlat3.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_15.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
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
mediump vec3 u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat20;
int u_xlati20;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec2 u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat45;
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
    u_xlat16_46 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_46) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_8.xyz = vec3(u_xlat16_46) * _AdditionalLightIntensityAndAngleScale[0].zxy;
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
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
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
    u_xlat20 = u_xlat16_3.z * 50.0;
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
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat52) * u_xlat10.xyz;
    u_xlat16_1.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
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
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
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
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
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
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat10.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
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
    u_xlat16_17.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_17.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_17.xyz + u_xlat16_1.xyz;
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
    u_xlat45 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat3.x = u_xlat45 * 0.0625 + u_xlat3.y;
    u_xlat16_15.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_15.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_15.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ShadowColor;
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
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
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
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_60 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_60;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
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
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
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
    u_xlat36 = u_xlat36 * u_xlat19;
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
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
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
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
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
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
uniform 	mediump vec4 _ShadowColor;
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
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
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
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_60 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_60;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
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
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
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
    u_xlat36 = u_xlat36 * u_xlat19;
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
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
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
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
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
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat38;
int u_xlati38;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_41;
vec2 u_xlat43;
mediump float u_xlat16_43;
mediump vec2 u_xlat16_44;
vec2 u_xlat50;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat66;
float u_xlat68;
float u_xlat70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39.x;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_8.xyz;
    u_xlat57 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat11.xyz = vec3(u_xlat61) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat11.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat64 = (-u_xlat7) * u_xlat16_20.x + u_xlat7;
    u_xlat64 = u_xlat7 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat7;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat12.x) * u_xlat16_20.x + u_xlat12.x;
    u_xlat66 = u_xlat12.x * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat12.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat66;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat68 = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat16_20.x / u_xlat68;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat64 = u_xlat64 * u_xlat68;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_50.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat50.xy = u_xlat16_50.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xy = min(max(u_xlat50.xy, 0.0), 1.0);
#else
    u_xlat50.xy = clamp(u_xlat50.xy, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat50.xxx;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_39.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat23 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_20.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat68 = (-u_xlat16_39.x) + 1.0;
    u_xlat16_39.x = u_xlat68 * u_xlat68;
    u_xlat16_39.x = u_xlat68 * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat68 * u_xlat16_39.x;
    u_xlat16_58 = u_xlat68 * u_xlat16_39.x;
    u_xlat68 = (-u_xlat16_39.x) * u_xlat68 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat68);
    u_xlat13.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat68 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat68) * u_xlat16_20.x + u_xlat68;
    u_xlat70 = u_xlat68 * u_xlat70 + u_xlat16_20.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat68 + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat70 = u_xlat66 * u_xlat70;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat64 = u_xlat64 * u_xlat70;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat68) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_39.x = max(u_xlat16_39.x, 6.10351563e-05);
    u_xlat16_58 = u_xlat16_39.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_59 = float(1.0) / float(u_xlat16_39.x);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat5.xyz;
    u_xlat16_39.x = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_39.x = max(u_xlat16_39.x, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_59 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_58 = max(u_xlat16_58, u_xlat16_59);
    u_xlat16_39.x = u_xlat16_58 * u_xlat16_39.x;
    u_xlat16_16.xyz = u_xlat16_39.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
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
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat38 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat38 * u_xlat38;
    u_xlat16_1.x = u_xlat38 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat38 * u_xlat16_1.x;
    u_xlat16_39.x = u_xlat38 * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat38 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_39.xxx + u_xlat5.xyz;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat66;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat19.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat50.yyy + u_xlat16_14.xyz;
    u_xlat16_59 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat50.yyy * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat50.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat68) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_59 = u_xlat16_0.x * u_xlat16_7.z;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_25 = (-u_xlat16_60) + u_xlat16_25;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_6.w * u_xlat16_25 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_6.w * u_xlat16_60;
    u_xlat16_25 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_25 + -1.0;
    u_xlat16_25 = _OcclusionScale * u_xlat16_25 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_25;
    u_xlat0.x = min(u_xlat16_60, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_59);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_25) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat19.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat5.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat19.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_7.x = u_xlat16_22.x * 16.0 + u_xlat16_7.z;
    u_xlat16_44.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_44.xy = u_xlat16_44.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_44.xy).x;
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_44.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_44.xy = u_xlat16_44.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_44.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_43) + u_xlat16_24;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_43;
    u_xlat16_3.x = u_xlat16_25 * u_xlat16_3.x;
    u_xlat5.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_22.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_59 = min(u_xlat16_59, u_xlat16_3.x);
    u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat5.xyz + u_xlat19.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_20.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat19.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat19.xy;
    u_xlat19.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat19.xy;
    u_xlat5.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat5.xy;
    u_xlat5.xy = (-_SingleParallaxFactory.xx) * u_xlat19.xy + u_xlat5.xy;
    u_xlat43.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat19.xy = (-_SingleParallaxFactory.xx) * u_xlat19.xy + u_xlat43.xy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat19.xy;
    u_xlat16_19.x = texture(_SingleParallaxWarpTex, u_xlat19.xy).x;
    u_xlat16_39.x = u_xlat16_19.x * 2.0 + -1.0;
    u_xlat16_39.xy = u_xlat16_39.xx * vec2(_SingleParallaxWarp) + u_xlat5.xy;
    u_xlat16_19.xyz = texture(_SingleParallaxTex, u_xlat16_39.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_19.xyz * _SingleParallaxColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_20.x;
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
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(11) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat38;
int u_xlati38;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_41;
vec2 u_xlat43;
mediump float u_xlat16_43;
mediump vec2 u_xlat16_44;
vec2 u_xlat50;
mediump vec2 u_xlat16_50;
float u_xlat57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat66;
float u_xlat68;
float u_xlat70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39.x;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_8.xyz;
    u_xlat57 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat11.xyz = vec3(u_xlat61) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat11.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat64 = (-u_xlat7) * u_xlat16_20.x + u_xlat7;
    u_xlat64 = u_xlat7 * u_xlat64 + u_xlat16_20.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat7;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat12.x) * u_xlat16_20.x + u_xlat12.x;
    u_xlat66 = u_xlat12.x * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat12.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat66;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat68 = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat16_20.x / u_xlat68;
    u_xlat68 = u_xlat68 * 0.318309873;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat64 = u_xlat64 * u_xlat68;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_50.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat50.xy = u_xlat16_50.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xy = min(max(u_xlat50.xy, 0.0), 1.0);
#else
    u_xlat50.xy = clamp(u_xlat50.xy, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * u_xlat50.xxx;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_39.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat23 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_20.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat68 = (-u_xlat16_39.x) + 1.0;
    u_xlat16_39.x = u_xlat68 * u_xlat68;
    u_xlat16_39.x = u_xlat68 * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat68 * u_xlat16_39.x;
    u_xlat16_58 = u_xlat68 * u_xlat16_39.x;
    u_xlat68 = (-u_xlat16_39.x) * u_xlat68 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat68);
    u_xlat13.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat13.xyz;
    u_xlat68 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat68) * u_xlat16_20.x + u_xlat68;
    u_xlat70 = u_xlat68 * u_xlat70 + u_xlat16_20.x;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat68 + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat70 = u_xlat66 * u_xlat70;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat64 = u_xlat64 * u_xlat70;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat68) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_39.x = max(u_xlat16_39.x, 6.10351563e-05);
    u_xlat16_58 = u_xlat16_39.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_59 = float(1.0) / float(u_xlat16_39.x);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat5.xyz;
    u_xlat16_39.x = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_39.x = max(u_xlat16_39.x, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_59 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_58 = max(u_xlat16_58, u_xlat16_59);
    u_xlat16_39.x = u_xlat16_58 * u_xlat16_39.x;
    u_xlat16_16.xyz = u_xlat16_39.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
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
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat38 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat38 * u_xlat38;
    u_xlat16_1.x = u_xlat38 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat38 * u_xlat16_1.x;
    u_xlat16_39.x = u_xlat38 * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat38 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat16_39.xxx + u_xlat5.xyz;
    u_xlat38 = (-u_xlat19.x) * u_xlat16_20.x + u_xlat19.x;
    u_xlat38 = u_xlat19.x * u_xlat38 + u_xlat16_20.x;
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 + u_xlat19.x;
    u_xlat38 = u_xlat38 + 6.10351563e-05;
    u_xlat38 = u_xlat38 * u_xlat66;
    u_xlat0.z = float(1.0) / u_xlat38;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat19.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat50.yyy + u_xlat16_14.xyz;
    u_xlat16_59 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat50.yyy * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat50.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat68) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_59 = u_xlat16_0.x * u_xlat16_7.z;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_25 = (-u_xlat16_60) + u_xlat16_25;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_6.w * u_xlat16_25 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_6.w * u_xlat16_60;
    u_xlat16_25 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_25 + -1.0;
    u_xlat16_25 = _OcclusionScale * u_xlat16_25 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_25;
    u_xlat0.x = min(u_xlat16_60, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_59);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat19.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_25) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat19.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat5.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat19.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_7.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_7.x = u_xlat16_22.x * 16.0 + u_xlat16_7.z;
    u_xlat16_44.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_44.xy = u_xlat16_44.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_44.xy).x;
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_44.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_44.xy = u_xlat16_44.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_44.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_43) + u_xlat16_24;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_43;
    u_xlat16_3.x = u_xlat16_25 * u_xlat16_3.x;
    u_xlat5.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_22.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_59 = min(u_xlat16_59, u_xlat16_3.x);
    u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat5.xyz + u_xlat19.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_20.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat19.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat19.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat19.xy;
    u_xlat19.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat19.xy;
    u_xlat5.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat5.xy;
    u_xlat5.xy = (-_SingleParallaxFactory.xx) * u_xlat19.xy + u_xlat5.xy;
    u_xlat43.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat19.xy = (-_SingleParallaxFactory.xx) * u_xlat19.xy + u_xlat43.xy;
    u_xlat19.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat19.xy;
    u_xlat16_19.x = texture(_SingleParallaxWarpTex, u_xlat19.xy).x;
    u_xlat16_39.x = u_xlat16_19.x * 2.0 + -1.0;
    u_xlat16_39.xy = u_xlat16_39.xx * vec2(_SingleParallaxWarp) + u_xlat5.xy;
    u_xlat16_19.xyz = texture(_SingleParallaxTex, u_xlat16_39.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_19.xyz * _SingleParallaxColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_20.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_8;
bool u_xlatb8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
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
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat26;
int u_xlati26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec2 u_xlat32;
mediump vec3 u_xlat16_32;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
int u_xlati48;
float u_xlat51;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat57;
ivec2 u_xlati57;
bool u_xlatb57;
vec2 u_xlat61;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
mediump float u_xlat10_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat85;
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
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_9.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_9.z * _ShadowStrength;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_83 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_83);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat13.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat13.xyz = (bool(u_xlatb24)) ? u_xlat13.xyz : vs_TEXCOORD0.xyz;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat14;
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
    u_xlat15 = u_xlat13.yyyy * u_xlat15;
    u_xlat14 = u_xlat14 * u_xlat13.xxxx + u_xlat15;
    u_xlat13 = u_xlat16 * u_xlat13.zzzz + u_xlat14;
    u_xlat13 = u_xlat17 + u_xlat13;
    u_xlat24.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat13.z;
    u_xlat48 = max((-u_xlat13.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat13.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat13.w<1.0);
#else
        u_xlatb24 = u_xlat13.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat57.xy = u_xlat13.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat57.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
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
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat38.x);
#else
            u_xlatb24 = 0.0<u_xlat38.x;
#endif
            u_xlat26 = u_xlat38.y / u_xlat38.x;
            u_xlat26 = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat26 = (-u_xlat26) + u_xlat13.w;
            u_xlat26 = u_xlat26 * _PCSSLightSize;
            u_xlat48 = max(u_xlat24.y, u_xlat26);
            u_xlat48 = max(u_xlat48, 1.0);
            u_xlat48 = min(u_xlat48, 20.0);
            u_xlat24.x = (u_xlatb24) ? u_xlat48 : 1.0;
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlati48 = max(_PCSSSampleCount, 4);
            u_xlati48 = min(u_xlati48, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati26 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26>=16);
#else
                u_xlatb80 = u_xlati26>=16;
#endif
                if(u_xlatb80){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26<u_xlati48);
#else
                u_xlatb80 = u_xlati26<u_xlati48;
#endif
                if(u_xlatb80){
                    u_xlat57.xy = u_xlat14.xx * ImmCB_0[u_xlati26].yx;
                    u_xlat16.x = ImmCB_0[u_xlati26].x * u_xlat15.x + (-u_xlat57.x);
                    u_xlat16.y = ImmCB_0[u_xlati26].y * u_xlat15.x + u_xlat57.y;
                    u_xlat57.xy = u_xlat16.xy * u_xlat24.xx + u_xlat13.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat57.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat57.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb80 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb80 = u_xlatb38.y && u_xlatb80;
                    u_xlatb80 = u_xlatb39.y && u_xlatb80;
                    if(!u_xlatb80){
                        u_xlati80 = u_xlati26 + 1;
                        u_xlati26 = u_xlati80;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat57.xy,u_xlat13.w);
                    u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_80 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati26 = u_xlati26 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat16_43);
#else
            u_xlatb24 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29.x = u_xlat16_19.x / u_xlat16_43;
            u_xlat57.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
            u_xlat57.xy = min(u_xlat57.xy, u_xlat13.xy);
            u_xlat48 = min(u_xlat57.y, u_xlat57.x);
            u_xlat48 = u_xlat48 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
            u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
            u_xlat26 = u_xlat16_29.x + -1.0;
            u_xlat24.x = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat24.x = u_xlat48 * u_xlat24.x + 1.0;
            u_xlat16_24 = u_xlat24.x;
        } else {
            u_xlat16_24 = 1.0;
        }
        u_xlat16_29.x = (-u_xlat16_51) + 1.0;
        u_xlat16_51 = u_xlat16_24 * u_xlat16_29.x + u_xlat16_51;
        u_xlat51 = u_xlat16_51;
    } else {
        u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat13.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat13.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat57.x = (-u_xlat16_29.x) + 1.0;
        u_xlat51 = u_xlat80 * u_xlat57.x + u_xlat16_29.x;
    }
    u_xlat80 = (-u_xlat51) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat13.xyz = u_xlat57.xxx * u_xlat13.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat61.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat61.x = u_xlat13.x * u_xlat61.x + u_xlat16_3.x;
    u_xlat61.x = sqrt(u_xlat61.x);
    u_xlat61.x = u_xlat61.x + u_xlat13.x;
    u_xlat85 = (-u_xlat81) * u_xlat16_3.x + u_xlat81;
    u_xlat85 = u_xlat81 * u_xlat85 + u_xlat16_3.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat61.y = u_xlat81 + u_xlat85;
    u_xlat61.xy = u_xlat61.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat85 = u_xlat61.y * u_xlat61.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat14.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat14.x * u_xlat14.x;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_76;
    u_xlat38.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_76) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat14.xzw;
    u_xlat16_19.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _ShadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat57.x = u_xlat57.x * u_xlat85;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _DirectSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat81) * u_xlat14.xzw;
    u_xlat14.xzw = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat15.xyz;
    u_xlat16_22.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat57.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat15.xyz = u_xlat57.xxx * u_xlat15.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat15.x = (-u_xlat85) * u_xlat16_3.x + u_xlat85;
    u_xlat15.x = u_xlat85 * u_xlat15.x + u_xlat16_3.x;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat85 + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat61.x * u_xlat15.x;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat39.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat39.x * u_xlat39.x;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat39.x * u_xlat16_76;
    u_xlat39.x = (-u_xlat16_76) * u_xlat39.x + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * u_xlat39.xxx;
    u_xlat39.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat39.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat85) * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.x * u_xlat15.x;
    u_xlat15.xyz = u_xlat39.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat85) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_22.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat16_19.xyz = u_xlat14.xzw * u_xlat16_19.xyz + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat81) + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat14.xzw;
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xzw = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat10.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10.xxx;
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat10.x * u_xlat10.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat81 = (-u_xlat9.x) * u_xlat16_3.x + u_xlat9.x;
    u_xlat81 = u_xlat9.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat9.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat61.x;
    u_xlat57.y = float(1.0) / u_xlat81;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat10.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat10.x * u_xlat10.x;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat10.x * u_xlat16_76;
    u_xlat10.x = (-u_xlat16_76) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.yyy * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_22.xyz * u_xlat10.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat9.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat9.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat9.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat9.xy = min(vec2(u_xlat16_27), u_xlat9.xy);
    u_xlat9.x = min(u_xlat16_75, u_xlat9.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat9.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat9.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat9.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat9.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat9.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat9.xzw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_10.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_23.x = u_xlat16_53 * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_23.y = u_xlat16_10.z;
    u_xlat16_29.xy = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_80) + u_xlat16_9.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_80;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat80 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_29.x * u_xlat80;
    u_xlat16_29.x = u_xlat9.y * 0.5;
    u_xlat16_53 = (-u_xlat9.y) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat80 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat9.y;
    u_xlat16_29.x = min(u_xlat16_75, u_xlat16_29.x);
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
    u_xlat16_21.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_21.xyz : u_xlat16_12.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_76 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat32.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat32.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat32.xy;
    u_xlat32.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat32.xy;
    u_xlat9.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat9.xy;
    u_xlat9.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat9.xy;
    u_xlat57.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat32.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat57.xy;
    u_xlat32.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat32.xy;
    u_xlat16_32.x = texture(_SingleParallaxWarpTex, u_xlat32.xy).x;
    u_xlat16_73 = u_xlat16_32.x * 2.0 + -1.0;
    u_xlat16_4.xy = vec2(u_xlat16_73) * vec2(_SingleParallaxWarp) + u_xlat9.xy;
    u_xlat16_32.xyz = texture(_SingleParallaxTex, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_32.xyz * _SingleParallaxColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xxx + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxWarpTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _SingleParallaxMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SingleParallaxWarpTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_8;
bool u_xlatb8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
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
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat26;
int u_xlati26;
bool u_xlatb26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_29;
vec2 u_xlat32;
mediump vec3 u_xlat16_32;
vec2 u_xlat38;
bvec2 u_xlatb38;
vec3 u_xlat39;
bvec2 u_xlatb39;
mediump float u_xlat16_43;
float u_xlat48;
int u_xlati48;
float u_xlat51;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat57;
ivec2 u_xlati57;
bool u_xlatb57;
vec2 u_xlat61;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat16_80;
mediump float u_xlat10_80;
int u_xlati80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat85;
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
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_75 = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_9.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_76 = u_xlat16_9.z * _ShadowStrength;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat2.xzw;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_83 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_83);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_27 = u_xlat16_79 * u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat48 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat48 = dot(u_xlat2.xzw, u_xlat13.xyz);
    u_xlat48 = (-u_xlat48) * u_xlat48 + 1.0;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 * _ShadowBias.z;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat48) + vs_TEXCOORD0.xyz;
    u_xlat13.xyz = (bool(u_xlatb24)) ? u_xlat13.xyz : vs_TEXCOORD0.xyz;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat14;
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
    u_xlat15 = u_xlat13.yyyy * u_xlat15;
    u_xlat14 = u_xlat14 * u_xlat13.xxxx + u_xlat15;
    u_xlat13 = u_xlat16 * u_xlat13.zzzz + u_xlat14;
    u_xlat13 = u_xlat17 + u_xlat13;
    u_xlat24.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat24.x) + u_xlat13.z;
    u_xlat48 = max((-u_xlat13.w), u_xlat24.x);
    u_xlat48 = (-u_xlat24.x) + u_xlat48;
    u_xlat13.z = _ShadowBias.y * u_xlat48 + u_xlat24.x;
    u_xlat13.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat13.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb24 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb24){
        u_xlat16_51 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat13.w<1.0);
#else
        u_xlatb24 = u_xlat13.w<1.0;
#endif
        if(u_xlatb24){
            u_xlat24.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat24.x = max(u_xlat24.x, 2.0);
            u_xlat24.x = min(u_xlat24.x, 30.0);
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlat57.xy = u_xlat13.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat26 = dot(u_xlat57.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 52.9829178;
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 * 6.28318548;
            u_xlat14.x = sin(u_xlat26);
            u_xlat15.x = cos(u_xlat26);
            u_xlat16 = u_xlat14.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat17.xy = u_xlat15.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat16.xz);
            u_xlat17.zw = u_xlat15.xx * vec2(-0.399062157, -0.768907249) + u_xlat16.yw;
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat38.y = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
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
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlat26<u_xlat80);
#else
                u_xlatb80 = u_xlat26<u_xlat80;
#endif
                u_xlat16.y = u_xlat26 + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb80)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat26 = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat80 = u_xlat13.w * 0.00200000009;
                u_xlat80 = max(u_xlat80, 0.000500000024);
                u_xlat80 = (-u_xlat80) + u_xlat13.w;
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
            u_xlat16 = u_xlat17.xzyw * u_xlat24.xxxx + u_xlat13.xyxy;
            u_xlatb17 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat16);
            u_xlatb18 = lessThan(u_xlat16, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati57.xy = ivec2(uvec2((uint(u_xlatb17.x) * 0xffffffffu) & (uint(u_xlatb18.x) * 0xffffffffu), (uint(u_xlatb17.z) * 0xffffffffu) & (uint(u_xlatb18.z) * 0xffffffffu)));
            u_xlati57.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            u_xlati57.xy = ivec2((uvec2(u_xlatb18.yw) * 0xFFFFFFFFu) & uvec2(u_xlati57.xy));
            if(u_xlati57.x != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.xy).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
            if(u_xlati57.y != 0) {
                u_xlat24.x = texture(_ShadowMapDepth, u_xlat16.zw).x;
                u_xlat26 = u_xlat13.w * 0.00200000009;
                u_xlat26 = max(u_xlat26, 0.000500000024);
                u_xlat26 = (-u_xlat26) + u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb26 = !!(u_xlat24.x<u_xlat26);
#else
                u_xlatb26 = u_xlat24.x<u_xlat26;
#endif
                u_xlat16.y = u_xlat24.x + u_xlat38.y;
                u_xlat16.x = u_xlat38.x + 1.0;
                u_xlat38.xy = (bool(u_xlatb26)) ? u_xlat16.xy : u_xlat38.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat38.x);
#else
            u_xlatb24 = 0.0<u_xlat38.x;
#endif
            u_xlat26 = u_xlat38.y / u_xlat38.x;
            u_xlat26 = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat26 = (-u_xlat26) + u_xlat13.w;
            u_xlat26 = u_xlat26 * _PCSSLightSize;
            u_xlat48 = max(u_xlat24.y, u_xlat26);
            u_xlat48 = max(u_xlat48, 1.0);
            u_xlat48 = min(u_xlat48, 20.0);
            u_xlat24.x = (u_xlatb24) ? u_xlat48 : 1.0;
            u_xlat24.x = u_xlat24.x * _ShadowMapTexture_TexelSize.x;
            u_xlati48 = max(_PCSSSampleCount, 4);
            u_xlati48 = min(u_xlati48, 16);
            u_xlat16_19.x = float(0.0);
            u_xlat16_43 = float(0.0);
            u_xlati26 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26>=16);
#else
                u_xlatb80 = u_xlati26>=16;
#endif
                if(u_xlatb80){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb80 = !!(u_xlati26<u_xlati48);
#else
                u_xlatb80 = u_xlati26<u_xlati48;
#endif
                if(u_xlatb80){
                    u_xlat57.xy = u_xlat14.xx * ImmCB_0[u_xlati26].yx;
                    u_xlat16.x = ImmCB_0[u_xlati26].x * u_xlat15.x + (-u_xlat57.x);
                    u_xlat16.y = ImmCB_0[u_xlati26].y * u_xlat15.x + u_xlat57.y;
                    u_xlat57.xy = u_xlat16.xy * u_xlat24.xx + u_xlat13.xy;
                    u_xlatb38.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat57.xyxx).xy;
                    u_xlatb39.xy = lessThan(u_xlat57.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb80 = u_xlatb38.x && u_xlatb39.x;
                    u_xlatb80 = u_xlatb38.y && u_xlatb80;
                    u_xlatb80 = u_xlatb39.y && u_xlatb80;
                    if(!u_xlatb80){
                        u_xlati80 = u_xlati26 + 1;
                        u_xlati26 = u_xlati80;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat57.xy,u_xlat13.w);
                    u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_19.x = u_xlat10_80 + u_xlat16_19.x;
                    u_xlat16_43 = u_xlat16_43 + 1.0;
                }
                u_xlati26 = u_xlati26 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb24 = !!(0.0<u_xlat16_43);
#else
            u_xlatb24 = 0.0<u_xlat16_43;
#endif
            u_xlat16_29.x = u_xlat16_19.x / u_xlat16_43;
            u_xlat57.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
            u_xlat57.xy = min(u_xlat57.xy, u_xlat13.xy);
            u_xlat48 = min(u_xlat57.y, u_xlat57.x);
            u_xlat48 = u_xlat48 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
            u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
            u_xlat26 = u_xlat16_29.x + -1.0;
            u_xlat24.x = u_xlatb24 ? u_xlat26 : float(0.0);
            u_xlat24.x = u_xlat48 * u_xlat24.x + 1.0;
            u_xlat16_24 = u_xlat24.x;
        } else {
            u_xlat16_24 = 1.0;
        }
        u_xlat16_29.x = (-u_xlat16_51) + 1.0;
        u_xlat16_51 = u_xlat16_24 * u_xlat16_29.x + u_xlat16_51;
        u_xlat51 = u_xlat16_51;
    } else {
        u_xlat16_29.x = (-_ShadowBias.w) + 1.0;
        u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat14.z = 0.0;
        u_xlat14.xyz = u_xlat13.xyw + u_xlat14.xyz;
        vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
        u_xlat14.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat15.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec3 = vec3(u_xlat15.xy,u_xlat15.z);
        u_xlat14.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat15.z = 0.0;
        u_xlat13.xyz = u_xlat13.xyw + u_xlat15.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat14.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat80 = dot(u_xlat14, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat57.x = (-u_xlat16_29.x) + 1.0;
        u_xlat51 = u_xlat80 * u_xlat57.x + u_xlat16_29.x;
    }
    u_xlat80 = (-u_xlat51) + 1.0;
    u_xlat80 = (-u_xlat80) * u_xlat16_76 + 1.0;
    u_xlat80 = max(u_xlat80, 0.0);
    u_xlat13.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat13.xyz = u_xlat57.xxx * u_xlat13.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat13.x = dot(u_xlat2.xzw, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat82 = u_xlat16_3.x + -1.0;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat61.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat61.x = u_xlat13.x * u_xlat61.x + u_xlat16_3.x;
    u_xlat61.x = sqrt(u_xlat61.x);
    u_xlat61.x = u_xlat61.x + u_xlat13.x;
    u_xlat85 = (-u_xlat81) * u_xlat16_3.x + u_xlat81;
    u_xlat85 = u_xlat81 * u_xlat85 + u_xlat16_3.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat61.y = u_xlat81 + u_xlat85;
    u_xlat61.xy = u_xlat61.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat85 = u_xlat61.y * u_xlat61.x;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat14.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat14.x * u_xlat14.x;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_76 = u_xlat14.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_76;
    u_xlat38.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38.x = min(max(u_xlat38.x, 0.0), 1.0);
#else
    u_xlat38.x = clamp(u_xlat38.x, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_76) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat14.xzw;
    u_xlat16_19.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = vec3(u_xlat80) * u_xlat16_19.xyz + _ShadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat57.x = u_xlat57.x * u_xlat85;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _DirectSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat81) * u_xlat14.xzw;
    u_xlat14.xzw = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat15.xyz;
    u_xlat16_22.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat57.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat15.xyz = u_xlat57.xxx * u_xlat15.xyz;
    u_xlat57.x = dot(u_xlat2.xzw, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat57.x = min(u_xlat57.x, 16.0);
    u_xlat15.x = (-u_xlat85) * u_xlat16_3.x + u_xlat85;
    u_xlat15.x = u_xlat85 * u_xlat15.x + u_xlat16_3.x;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat85 + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 6.10351563e-05;
    u_xlat15.x = u_xlat61.x * u_xlat15.x;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = min(u_xlat15.x, 16.0);
    u_xlat39.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat39.x * u_xlat39.x;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_76 = u_xlat39.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat39.x * u_xlat16_76;
    u_xlat39.x = (-u_xlat16_76) * u_xlat39.x + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * u_xlat39.xxx;
    u_xlat39.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat39.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat85) * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.x * u_xlat15.x;
    u_xlat15.xyz = u_xlat39.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat85) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_22.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat16_19.xyz = u_xlat14.xzw * u_xlat16_19.xyz + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat81) + u_xlat16_21.xyz;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_76 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_76);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat14.xzw;
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_29.x, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_76 = max(u_xlat16_22.x, u_xlat16_76);
    u_xlat16_76 = u_xlat16_29.x * u_xlat16_76;
    u_xlat16_22.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xzw = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_21.xyz;
    u_xlat10.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10.xxx;
    u_xlat10.x = dot(u_xlat2.xzw, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_21.xyz, u_xlat9.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat2.xzw, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat10.x * u_xlat10.x;
    u_xlat57.x = u_xlat57.x * u_xlat82 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_3.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat81 = (-u_xlat9.x) * u_xlat16_3.x + u_xlat9.x;
    u_xlat81 = u_xlat9.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat9.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat61.x;
    u_xlat57.y = float(1.0) / u_xlat81;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat10.x = (-u_xlat16_76) + 1.0;
    u_xlat16_76 = u_xlat10.x * u_xlat10.x;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_76 = u_xlat10.x * u_xlat16_76;
    u_xlat16_29.x = u_xlat10.x * u_xlat16_76;
    u_xlat10.x = (-u_xlat16_76) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = u_xlat38.xxx * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat9.yyy * u_xlat16_21.xyz;
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_22.xyz * u_xlat10.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat9.yyy + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat9.xxx + u_xlat16_20.xyz;
    u_xlat80 = u_xlat80 + -1.0;
    u_xlat9.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat80) + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati80 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat9.xy = min(vec2(u_xlat16_27), u_xlat9.xy);
    u_xlat9.x = min(u_xlat16_75, u_xlat9.x);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat9.xxx * u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat9.xxx * u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat9.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = u_xlat16_23.xyz * u_xlat9.xxx + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_23.xyz;
    u_xlati80 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati80].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_76 = dot((-u_xlat16_11.xyz), u_xlat2.xzw);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat9.xzw = (-u_xlat2.xzw) * vec3(u_xlat16_76) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat0.xxx + (-u_xlat9.xzw);
    u_xlat8.xyz = u_xlat16_3.xxx * u_xlat8.xyz + u_xlat9.xzw;
    u_xlat16_76 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat9.xzw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_10.w);
    u_xlat16_53 = u_xlat16_29.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_77 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_10.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_23.x = u_xlat16_53 * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_80 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_23.y = u_xlat16_10.z;
    u_xlat16_29.xy = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_9.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_80) + u_xlat16_9.x;
    u_xlat16_29.x = u_xlat16_77 * u_xlat16_29.x + u_xlat16_80;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x;
    u_xlat80 = dot(u_xlat16_12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat16_29.x * u_xlat80;
    u_xlat16_29.x = u_xlat9.y * 0.5;
    u_xlat16_53 = (-u_xlat9.y) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat80 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_53 = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_77 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_77 + u_xlat16_53;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat9.y;
    u_xlat16_29.x = min(u_xlat16_75, u_xlat16_29.x);
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
    u_xlat16_21.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb8)) ? u_xlat16_21.xyz : u_xlat16_12.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_29.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_19.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
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
    u_xlat16_76 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb8) ? u_xlat16_76 : u_xlat16_73;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_8.x = texture(_SingleParallaxMask, vs_TEXCOORD3.xy).x;
    u_xlat32.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat32.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat32.xy;
    u_xlat32.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat32.xy;
    u_xlat9.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat9.xy;
    u_xlat9.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat9.xy;
    u_xlat57.xy = _Time.yy * vec2(vec2(_SingleParallaxWarpSpeed, _SingleParallaxWarpSpeed)) + _SingleParallaxTex_ST.zw;
    u_xlat32.xy = (-_SingleParallaxFactory.xx) * u_xlat32.xy + u_xlat57.xy;
    u_xlat32.xy = vs_TEXCOORD3.xy * _SingleParallaxWarpTex_ST.xy + u_xlat32.xy;
    u_xlat16_32.x = texture(_SingleParallaxWarpTex, u_xlat32.xy).x;
    u_xlat16_73 = u_xlat16_32.x * 2.0 + -1.0;
    u_xlat16_4.xy = vec2(u_xlat16_73) * vec2(_SingleParallaxWarp) + u_xlat9.xy;
    u_xlat16_32.xyz = texture(_SingleParallaxTex, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_32.xyz * _SingleParallaxColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    u_xlat16_0.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_17.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
    u_xlat16_0.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
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
    u_xlat16_17.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _ShadowColor;
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
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
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
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_60 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_60;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
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
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
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
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_64 = u_xlat1.x * u_xlat1.x;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_65 = u_xlat1.x * u_xlat16_64;
    u_xlat1.x = (-u_xlat16_64) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
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
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
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
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
uniform 	mediump vec4 _ShadowColor;
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
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
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
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_60 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_60;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
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
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
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
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_64 = u_xlat1.x * u_xlat1.x;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_64 = u_xlat1.x * u_xlat16_64;
    u_xlat16_65 = u_xlat1.x * u_xlat16_64;
    u_xlat1.x = (-u_xlat16_64) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
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
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
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
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_SingleParallaxGUI"
}