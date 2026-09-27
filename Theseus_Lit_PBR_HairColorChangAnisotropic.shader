//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_HairColorChang(Anisotropic)" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_AlbedoTex ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_AlbedoChangTex ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后Albedo颜色", Color) = (1,1,1,1)

_ChangColorDissolveTex ("边缘扰动贴图", 2D) = "white" { }

_UpChangEdgeColor ("上层换色边缘颜色", Color) = (1,1,1,1)

_UpChangColorShrink ("上层换色边缘压缩", Float) = 4.0

_UpChangColorRange ("上层换色边缘范围", Float) = 1.0

_ChangEdgeColor ("下层换色边缘颜色", Color) = (1,1,1,1)

_ChangColorShrink ("下层换色边缘压缩", Float) = 4.0

_ChangColorRange ("下层换色边缘范围", Float) = 1.0

_ChangColorAmount ("换色进度", Range(0, 1)) = 1.0

_AnisotropicTex ("各向异性扰动贴图", 2D) = "white" { }

_SunShift ("主要各向异性扭曲", Float) = 1.0

_SunShiftOffset ("主要各向异性偏移", Float) = 1.0

_AnisotropicMultiplier ("主要各项异性强度", Range(0, 1)) = 1.0

_SunShift2nd ("次要各向异性扭曲", Float) = 1.0

_SunShiftOffset2nd ("次要各向异性偏移", Float) = 1.0

_AnisotropicMultiplier2nd ("次要各项异性强度", Range(0, 1)) = 1.0

_DirectSpecularColor ("主要各向异性高光颜色", Color) = (1,1,1,1)

_DirectSpecularColor2nd ("次要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor ("换色后主要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor2nd ("换色后次要各向异性高光颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 1645
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat34;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_47;
float u_xlat55;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_22.xy).x;
    u_xlat23 = u_xlat16_0.x * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_0.x = u_xlat23 + -0.100000001;
    u_xlat16_22.x = u_xlat23 + u_xlat23;
    u_xlat23 = u_xlat16_22.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_22.x = (-u_xlat23) + 1.0;
    u_xlat16_22.xyz = u_xlat16_22.xxx * _UpChangEdgeColor.zxy;
    u_xlat16_0.x = u_xlat16_0.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_2.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat1.x + u_xlat1.x;
    u_xlat16_2.x = u_xlat1.x + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_66 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = (-u_xlat1.x) + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_66) * _ChangEdgeColor.zxy;
    u_xlat16_66 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_2.x;
    u_xlat16_66 = min(u_xlat16_66, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_2.xyz = u_xlat16_3.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_2.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat67;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat70 = (-u_xlat16_25.x) * u_xlat67 + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(u_xlat70);
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_25.xxx + u_xlat6.xyz;
    u_xlat16_25.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_25.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat70 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_25.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_25.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat8.xyz = u_xlat16_25.xyz * vec3(u_xlat72);
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat73 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat73) + u_xlat8.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat11.xyz;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat5.xyz);
    u_xlat16_25.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_47 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat71 = u_xlat16_25.x * u_xlat16_47;
    u_xlat16_25.x = u_xlat16_25.x + -1.0;
    u_xlat73 = (-u_xlat16_25.x) + 1.0;
    u_xlat73 = u_xlat16_47 * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat12.y = u_xlat70 * u_xlat71;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat12.z = u_xlat70 * u_xlat74;
    u_xlat16_25.x = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat12.x = u_xlat16_25.x * u_xlat73;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat74 / u_xlat75;
    u_xlat74 = u_xlat74 * 0.318309873;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat75 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat73 * u_xlat75;
    u_xlat12.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_69 * u_xlat71;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat12.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_13.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat73 * u_xlat76;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat8.zxy, u_xlat16_13.xyz);
    u_xlat11.y = u_xlat71 * u_xlat73;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat75 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat74 * u_xlat71;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat71);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat71 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat71 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_79 = u_xlat16_66 + -1.0;
    u_xlat74 = u_xlat16_66 * u_xlat16_47;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat75 = (-u_xlat16_79) + 1.0;
    u_xlat75 = u_xlat16_47 * u_xlat75;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat12.z = u_xlat71 * u_xlat75;
    u_xlat12.y = u_xlat16_69 * u_xlat74;
    u_xlat71 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat12.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat16.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat75 * u_xlat76;
    u_xlat11.y = u_xlat73 * u_xlat74;
    u_xlat73 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat11.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat5.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat5.y = u_xlat5.x * u_xlat74;
    u_xlat5.x = u_xlat16_25.x * u_xlat75;
    u_xlat76 = u_xlat74 * u_xlat75;
    u_xlat5.z = u_xlat70 * u_xlat76;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat5.x = u_xlat76 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat5.x;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat71 * u_xlat70;
    u_xlat27.xyz = u_xlat6.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_15.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat12.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat16_25.xxx * u_xlat6.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.zzz + u_xlat16_18.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat70) * u_xlat6.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat70;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat55 = (-u_xlat16_69) * u_xlat70 + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat34.xyz = u_xlat16_2.xyz * vec3(u_xlat55);
    u_xlat34.xyz = u_xlat1.xxx * vec3(u_xlat16_69) + u_xlat34.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat6.xyz);
    u_xlat14.y = u_xlat70 * u_xlat74;
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat6.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat14.z = u_xlat70 * u_xlat76;
    u_xlat14.x = u_xlat16_69 * u_xlat75;
    u_xlat70 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat5.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat6.x = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat75;
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat16_17.xyz);
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat6.y = u_xlat16_69 * u_xlat74;
    u_xlat28.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat6.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat73 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat70 = u_xlat70 * u_xlat28.x;
    u_xlat34.xyz = u_xlat34.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xyz = min(max(u_xlat34.xyz, 0.0), 1.0);
#else
    u_xlat34.xyz = clamp(u_xlat34.xyz, 0.0, 1.0);
#endif
    u_xlat34.xyz = u_xlat16_15.xyz * u_xlat34.xyz;
    u_xlat34.xyz = u_xlat6.xxx * u_xlat34.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_25.x = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_25.x = max(u_xlat16_25.x, u_xlat16_81);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_25.x;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_17.xyz;
    u_xlat16_28.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat34.xyz * u_xlat28.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_25.xxx * u_xlat27.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_25.zzz + u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_19.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat70;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.x = (-u_xlat16_68) * u_xlat70 + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.xyz = u_xlat16_2.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_68) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16_19.xyz);
    u_xlat14.z = u_xlat70 * u_xlat75;
    u_xlat16.y = u_xlat1.x * u_xlat74;
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat4.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat1.x * u_xlat76;
    u_xlat16.x = u_xlat16_68 * u_xlat75;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat76 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat5.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat16_19.xyz);
    u_xlat14.y = u_xlat16_68 * u_xlat74;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat14.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_25.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_25.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_66 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_66) * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat28.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_66) + u_xlat16_68;
    u_xlat16_25.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_25.x + 1.0;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_68 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat1.x = min(u_xlat16_66, 1.0);
    u_xlat23 = min(u_xlat1.x, u_xlat16_1.z);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat23) + (-u_xlat16_21.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_15.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat16_15.xyz + u_xlat10.xyz;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb23 = u_xlat16_79>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : u_xlat8.xyz;
    u_xlat5.xyz = u_xlat16_13.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat16_13.yzx + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat4.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_25.x = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = u_xlat16_25.x * abs(u_xlat16_79);
    u_xlat4.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat23 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_25.x = dot((-u_xlat16_13.xyz), u_xlat4.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_25.xxx + (-u_xlat16_13.xyz);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat5.xyz = vec3(u_xlat16_47) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_79)) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat16_25.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_25.x = u_xlat16_3.x * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_25.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_25.x);
    u_xlat67 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat16_42.y = u_xlat67 * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_47;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb67)) ? u_xlat16_13.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_3.x;
    u_xlat16_42.x = u_xlat16_3.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_25.xyz * u_xlat16_2.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_69 = u_xlat16_66 + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_3.x = u_xlat16_69 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_3.x = u_xlat16_67 + (-u_xlat16_4.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_4.x;
    u_xlat16_66 = u_xlat16_68 * u_xlat16_66;
    u_xlat23 = u_xlat23 * u_xlat16_66;
    u_xlat16_66 = u_xlat1.x * 0.5;
    u_xlat16_68 = (-u_xlat1.x) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23 * u_xlat16_68 + u_xlat16_66;
    u_xlat16_68 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_3.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat1.x;
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat67 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat67);
    u_xlat0.x = u_xlat67 * 0.0625 + u_xlat0.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_23.xyz) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat34;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_47;
float u_xlat55;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_22.xy).x;
    u_xlat23 = u_xlat16_0.x * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_0.x = u_xlat23 + -0.100000001;
    u_xlat16_22.x = u_xlat23 + u_xlat23;
    u_xlat23 = u_xlat16_22.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_22.x = (-u_xlat23) + 1.0;
    u_xlat16_22.xyz = u_xlat16_22.xxx * _UpChangEdgeColor.zxy;
    u_xlat16_0.x = u_xlat16_0.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_2.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat1.x + u_xlat1.x;
    u_xlat16_2.x = u_xlat1.x + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_66 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = (-u_xlat1.x) + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_66) * _ChangEdgeColor.zxy;
    u_xlat16_66 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_2.x;
    u_xlat16_66 = min(u_xlat16_66, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_2.xyz = u_xlat16_3.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_2.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat67;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat70 = (-u_xlat16_25.x) * u_xlat67 + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(u_xlat70);
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_25.xxx + u_xlat6.xyz;
    u_xlat16_25.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_25.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat70 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_25.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_25.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat8.xyz = u_xlat16_25.xyz * vec3(u_xlat72);
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat73 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat73) + u_xlat8.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat11.xyz;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat5.xyz);
    u_xlat16_25.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_47 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat71 = u_xlat16_25.x * u_xlat16_47;
    u_xlat16_25.x = u_xlat16_25.x + -1.0;
    u_xlat73 = (-u_xlat16_25.x) + 1.0;
    u_xlat73 = u_xlat16_47 * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat12.y = u_xlat70 * u_xlat71;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat12.z = u_xlat70 * u_xlat74;
    u_xlat16_25.x = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat12.x = u_xlat16_25.x * u_xlat73;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat74 / u_xlat75;
    u_xlat74 = u_xlat74 * 0.318309873;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat75 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat73 * u_xlat75;
    u_xlat12.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_69 * u_xlat71;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat12.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_13.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat73 * u_xlat76;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat8.zxy, u_xlat16_13.xyz);
    u_xlat11.y = u_xlat71 * u_xlat73;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat75 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat74 * u_xlat71;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat71);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat71 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat71 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_79 = u_xlat16_66 + -1.0;
    u_xlat74 = u_xlat16_66 * u_xlat16_47;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat75 = (-u_xlat16_79) + 1.0;
    u_xlat75 = u_xlat16_47 * u_xlat75;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat12.z = u_xlat71 * u_xlat75;
    u_xlat12.y = u_xlat16_69 * u_xlat74;
    u_xlat71 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat12.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat16.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat75 * u_xlat76;
    u_xlat11.y = u_xlat73 * u_xlat74;
    u_xlat73 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat11.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat5.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat5.y = u_xlat5.x * u_xlat74;
    u_xlat5.x = u_xlat16_25.x * u_xlat75;
    u_xlat76 = u_xlat74 * u_xlat75;
    u_xlat5.z = u_xlat70 * u_xlat76;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat5.x = u_xlat76 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat5.x;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat71 * u_xlat70;
    u_xlat27.xyz = u_xlat6.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_15.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat12.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat16_25.xxx * u_xlat6.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.zzz + u_xlat16_18.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat70) * u_xlat6.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat70;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat55 = (-u_xlat16_69) * u_xlat70 + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat34.xyz = u_xlat16_2.xyz * vec3(u_xlat55);
    u_xlat34.xyz = u_xlat1.xxx * vec3(u_xlat16_69) + u_xlat34.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat6.xyz);
    u_xlat14.y = u_xlat70 * u_xlat74;
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat6.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat14.z = u_xlat70 * u_xlat76;
    u_xlat14.x = u_xlat16_69 * u_xlat75;
    u_xlat70 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat5.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat6.x = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat75;
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat16_17.xyz);
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat6.y = u_xlat16_69 * u_xlat74;
    u_xlat28.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat6.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat73 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat70 = u_xlat70 * u_xlat28.x;
    u_xlat34.xyz = u_xlat34.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xyz = min(max(u_xlat34.xyz, 0.0), 1.0);
#else
    u_xlat34.xyz = clamp(u_xlat34.xyz, 0.0, 1.0);
#endif
    u_xlat34.xyz = u_xlat16_15.xyz * u_xlat34.xyz;
    u_xlat34.xyz = u_xlat6.xxx * u_xlat34.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_25.x = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_25.x = max(u_xlat16_25.x, u_xlat16_81);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_25.x;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_17.xyz;
    u_xlat16_28.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat34.xyz * u_xlat28.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_25.xxx * u_xlat27.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_25.zzz + u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_19.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat70;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.x = (-u_xlat16_68) * u_xlat70 + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.xyz = u_xlat16_2.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_68) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16_19.xyz);
    u_xlat14.z = u_xlat70 * u_xlat75;
    u_xlat16.y = u_xlat1.x * u_xlat74;
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat4.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat1.x * u_xlat76;
    u_xlat16.x = u_xlat16_68 * u_xlat75;
    u_xlat1.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat76 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat5.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat16_19.xyz);
    u_xlat14.y = u_xlat16_68 * u_xlat74;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat14.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_25.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_25.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_66 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_66) * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat28.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_66) + u_xlat16_68;
    u_xlat16_25.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_25.x + 1.0;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_68 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat1.x = min(u_xlat16_66, 1.0);
    u_xlat23 = min(u_xlat1.x, u_xlat16_1.z);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat23) + (-u_xlat16_21.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_15.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat16_15.xyz + u_xlat10.xyz;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb23 = u_xlat16_79>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : u_xlat8.xyz;
    u_xlat5.xyz = u_xlat16_13.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat16_13.yzx + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat4.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_25.x = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = u_xlat16_25.x * abs(u_xlat16_79);
    u_xlat4.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat23 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_25.x = dot((-u_xlat16_13.xyz), u_xlat4.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_25.xxx + (-u_xlat16_13.xyz);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat5.xyz = vec3(u_xlat16_47) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_79)) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat16_25.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_25.x = u_xlat16_3.x * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_25.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_25.x);
    u_xlat67 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat16_42.y = u_xlat67 * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_47;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb67)) ? u_xlat16_13.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_3.x;
    u_xlat16_42.x = u_xlat16_3.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_25.xyz * u_xlat16_2.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_69 = u_xlat16_66 + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_3.x = u_xlat16_69 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_3.x = u_xlat16_67 + (-u_xlat16_4.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_4.x;
    u_xlat16_66 = u_xlat16_68 * u_xlat16_66;
    u_xlat23 = u_xlat23 * u_xlat16_66;
    u_xlat16_66 = u_xlat1.x * 0.5;
    u_xlat16_68 = (-u_xlat1.x) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23 * u_xlat16_68 + u_xlat16_66;
    u_xlat16_68 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_3.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat1.x;
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat67 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat67);
    u_xlat0.x = u_xlat67 * 0.0625 + u_xlat0.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_23.xyz) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
vec3 u_xlat27;
float u_xlat28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat58;
mediump float u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
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
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat5.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat77 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat9.xyz = vec3(u_xlat77) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb72)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat72 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat72) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat72);
    u_xlat2.x = (-u_xlat72) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat72;
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
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _ShadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_79 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat25 = u_xlat16_79 * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_79 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_79 = u_xlat25 + -0.100000001;
    u_xlat16_11.x = u_xlat25 + u_xlat25;
    u_xlat25 = u_xlat16_11.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat25) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _UpChangEdgeColor.zxy;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat1.x + u_xlat1.x;
    u_xlat16_83 = u_xlat1.x + -0.100000001;
    u_xlat16_83 = u_xlat16_83 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_79 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_79 = (-u_xlat1.x) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _ChangEdgeColor.zxy;
    u_xlat16_79 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoChangColor.zxy + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat3.xyz = vec3(u_xlat73) * u_xlat3.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat73;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat74 = (-u_xlat16_84) * u_xlat73 + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat74);
    u_xlat4.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_37.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_37.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat74 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat74 = u_xlat74 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat76 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat76) + u_xlat8.xyz;
    u_xlat76 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat5.xyz = vec3(u_xlat76) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0078125);
    u_xlat75 = u_xlat16_84 * u_xlat16_37.x;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat76 = (-u_xlat16_84) + 1.0;
    u_xlat76 = u_xlat76 * u_xlat16_37.x;
    u_xlat76 = max(u_xlat76, 0.00100000005);
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat74 * u_xlat75;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat14.x = u_xlat76 * u_xlat16_84;
    u_xlat74 = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat76 * u_xlat75;
    u_xlat14.z = u_xlat74 * u_xlat78;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat78 / u_xlat80;
    u_xlat78 = u_xlat78 * 0.318309873;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.z = u_xlat76 * u_xlat80;
    u_xlat14.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.y = u_xlat75 * u_xlat16_61;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat14.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat81 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat76 * u_xlat81;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat10.y = u_xlat75 * u_xlat76;
    u_xlat75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat10.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat80 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat78 * u_xlat75;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat75);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_17.xyz;
    u_xlat16.xyz = u_xlat14.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16.xyz = u_xlat16_7.xyz * u_xlat16.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat73) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_79 + -1.0;
    u_xlat78 = u_xlat16_79 * u_xlat16_37.x;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat80 = (-u_xlat16_85) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_37.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat80;
    u_xlat14.y = u_xlat16_61 * u_xlat78;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat14.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat80 * u_xlat81;
    u_xlat10.y = u_xlat76 * u_xlat78;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat3.xyz);
    u_xlat3.y = u_xlat3.x * u_xlat78;
    u_xlat3.x = u_xlat16_84 * u_xlat80;
    u_xlat81 = u_xlat78 * u_xlat80;
    u_xlat3.z = u_xlat74 * u_xlat81;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat3.x = u_xlat81 * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat3.x;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat74 = u_xlat75 * u_xlat74;
    u_xlat27.xyz = u_xlat4.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_17.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat14.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_7.xyz + u_xlat16.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_20.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_19.xyz;
    u_xlat74 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat4.xyz = vec3(u_xlat74) * u_xlat4.xyz;
    u_xlat16_84 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat74;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat58 = (-u_xlat16_84) * u_xlat74 + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat38.xyz = u_xlat16_12.xyz * vec3(u_xlat58);
    u_xlat38.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat38.xyz;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat74 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat4.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat74 * u_xlat81;
    u_xlat16.x = u_xlat80 * u_xlat16_84;
    u_xlat74 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat3.x * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat4.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_19.xyz);
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat4.y = u_xlat78 * u_xlat16_84;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat4.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat76 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat74 = u_xlat74 * u_xlat28;
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat16_17.xyz * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat4.xxx * u_xlat38.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_20.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_61);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat38.xyz = u_xlat38.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat24.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat27.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat74 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat2.xyz = vec3(u_xlat74) * u_xlat2.xyz;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat74;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.x = (-u_xlat16_83) * u_xlat74 + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.xyz = u_xlat16_12.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_83) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat2.xyz);
    u_xlat74 = dot(u_xlat18.xyz, u_xlat16_21.xyz);
    u_xlat16.z = u_xlat74 * u_xlat80;
    u_xlat18.y = u_xlat1.x * u_xlat78;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat1.x * u_xlat81;
    u_xlat18.x = u_xlat80 * u_xlat16_83;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat81 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat16.y = u_xlat78 * u_xlat16_83;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat16.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat76 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat24.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat14.xxx + u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_79) + u_xlat16_83;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_83 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_79;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat73) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_37.x * 8.0;
    u_xlat16_35 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_35 = max(u_xlat16_35, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = u_xlat16_11.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_11.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_13.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_35;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_44.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_12.x = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_12.x = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_24.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
vec3 u_xlat27;
float u_xlat28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat58;
mediump float u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
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
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat5.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat77 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat9.xyz = vec3(u_xlat77) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb72)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat72 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat72) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat72);
    u_xlat2.x = (-u_xlat72) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat72;
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
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _ShadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_79 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat25 = u_xlat16_79 * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_79 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_79 = u_xlat25 + -0.100000001;
    u_xlat16_11.x = u_xlat25 + u_xlat25;
    u_xlat25 = u_xlat16_11.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat25) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _UpChangEdgeColor.zxy;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat1.x + u_xlat1.x;
    u_xlat16_83 = u_xlat1.x + -0.100000001;
    u_xlat16_83 = u_xlat16_83 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_79 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_79 = (-u_xlat1.x) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _ChangEdgeColor.zxy;
    u_xlat16_79 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoColor.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoChangColor.zxy + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat3.xyz = vec3(u_xlat73) * u_xlat3.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat73;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat74 = (-u_xlat16_84) * u_xlat73 + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat74);
    u_xlat4.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_37.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_37.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat74 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat74 = u_xlat74 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat76 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat76) + u_xlat8.xyz;
    u_xlat76 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat5.xyz = vec3(u_xlat76) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0078125);
    u_xlat75 = u_xlat16_84 * u_xlat16_37.x;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat76 = (-u_xlat16_84) + 1.0;
    u_xlat76 = u_xlat76 * u_xlat16_37.x;
    u_xlat76 = max(u_xlat76, 0.00100000005);
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat74 * u_xlat75;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat14.x = u_xlat76 * u_xlat16_84;
    u_xlat74 = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat76 * u_xlat75;
    u_xlat14.z = u_xlat74 * u_xlat78;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat78 / u_xlat80;
    u_xlat78 = u_xlat78 * 0.318309873;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.z = u_xlat76 * u_xlat80;
    u_xlat14.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.y = u_xlat75 * u_xlat16_61;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat14.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat81 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat76 * u_xlat81;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat10.y = u_xlat75 * u_xlat76;
    u_xlat75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat10.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat80 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat78 * u_xlat75;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat75);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_17.xyz;
    u_xlat16.xyz = u_xlat14.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16.xyz = u_xlat16_7.xyz * u_xlat16.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat73) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_79 + -1.0;
    u_xlat78 = u_xlat16_79 * u_xlat16_37.x;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat80 = (-u_xlat16_85) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_37.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat80;
    u_xlat14.y = u_xlat16_61 * u_xlat78;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat14.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat80 * u_xlat81;
    u_xlat10.y = u_xlat76 * u_xlat78;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat3.xyz);
    u_xlat3.y = u_xlat3.x * u_xlat78;
    u_xlat3.x = u_xlat16_84 * u_xlat80;
    u_xlat81 = u_xlat78 * u_xlat80;
    u_xlat3.z = u_xlat74 * u_xlat81;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat3.x = u_xlat81 * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat3.x;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat74 = u_xlat75 * u_xlat74;
    u_xlat27.xyz = u_xlat4.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_17.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat14.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_7.xyz + u_xlat16.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_20.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_19.xyz;
    u_xlat74 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat4.xyz = vec3(u_xlat74) * u_xlat4.xyz;
    u_xlat16_84 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat74;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat58 = (-u_xlat16_84) * u_xlat74 + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat38.xyz = u_xlat16_12.xyz * vec3(u_xlat58);
    u_xlat38.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat38.xyz;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat74 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat4.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat74 * u_xlat81;
    u_xlat16.x = u_xlat80 * u_xlat16_84;
    u_xlat74 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat3.x * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat4.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_19.xyz);
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat4.y = u_xlat78 * u_xlat16_84;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat4.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat76 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat74 = u_xlat74 * u_xlat28;
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat16_17.xyz * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat4.xxx * u_xlat38.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_20.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_61);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat38.xyz = u_xlat38.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat24.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat27.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat74 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat2.xyz = vec3(u_xlat74) * u_xlat2.xyz;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat74;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.x = (-u_xlat16_83) * u_xlat74 + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.xyz = u_xlat16_12.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_83) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat2.xyz);
    u_xlat74 = dot(u_xlat18.xyz, u_xlat16_21.xyz);
    u_xlat16.z = u_xlat74 * u_xlat80;
    u_xlat18.y = u_xlat1.x * u_xlat78;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat1.x * u_xlat81;
    u_xlat18.x = u_xlat80 * u_xlat16_83;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat81 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat16.y = u_xlat78 * u_xlat16_83;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat16.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat76 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat24.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat14.xxx + u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_79) + u_xlat16_83;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_83 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_79;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat73) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_37.x * 8.0;
    u_xlat16_35 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_35 = max(u_xlat16_35, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = u_xlat16_11.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_11.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_13.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_35;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_44.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_12.x = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_12.x = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_24.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
float u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat34;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_47;
float u_xlat55;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_22.xy).x;
    u_xlat23 = u_xlat16_0.x * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1 = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_0.x = u_xlat23 + -0.100000001;
    u_xlat16_22.x = u_xlat23 + u_xlat23;
    u_xlat23 = u_xlat16_22.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_22.x = (-u_xlat23) + 1.0;
    u_xlat16_22.xyz = u_xlat16_22.xxx * _UpChangEdgeColor.xyz;
    u_xlat16_0.x = u_xlat16_0.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_2.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat1 + u_xlat1;
    u_xlat16_2.x = u_xlat1 + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1 = u_xlat16_66 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat16_66 = (-u_xlat1) + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_66) * _ChangEdgeColor.xyz;
    u_xlat16_66 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_2.x;
    u_xlat16_66 = min(u_xlat16_66, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_2.xyz = u_xlat16_3.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat67;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat70 = (-u_xlat16_25.x) * u_xlat67 + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat1) * u_xlat16_25.xxx + u_xlat6.xyz;
    u_xlat16_25.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_25.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat70 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_25.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_25.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat8.xyz = u_xlat16_25.xyz * vec3(u_xlat72);
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat73 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat73) + u_xlat8.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat11.xyz;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat5.xyz);
    u_xlat16_25.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_47 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat71 = u_xlat16_25.x * u_xlat16_47;
    u_xlat16_25.x = u_xlat16_25.x + -1.0;
    u_xlat73 = (-u_xlat16_25.x) + 1.0;
    u_xlat73 = u_xlat16_47 * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat12.y = u_xlat70 * u_xlat71;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat12.z = u_xlat70 * u_xlat74;
    u_xlat16_25.x = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat12.x = u_xlat16_25.x * u_xlat73;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat74 / u_xlat75;
    u_xlat74 = u_xlat74 * 0.318309873;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat75 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat73 * u_xlat75;
    u_xlat12.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_69 * u_xlat71;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat12.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_13.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat73 * u_xlat76;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat8.zxy, u_xlat16_13.xyz);
    u_xlat11.y = u_xlat71 * u_xlat73;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat75 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat74 * u_xlat71;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat71);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat71 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat71 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_79 = u_xlat16_66 + -1.0;
    u_xlat74 = u_xlat16_66 * u_xlat16_47;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat75 = (-u_xlat16_79) + 1.0;
    u_xlat75 = u_xlat16_47 * u_xlat75;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat12.z = u_xlat71 * u_xlat75;
    u_xlat12.y = u_xlat16_69 * u_xlat74;
    u_xlat71 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat12.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat16.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat75 * u_xlat76;
    u_xlat11.y = u_xlat73 * u_xlat74;
    u_xlat73 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat11.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat5.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat5.y = u_xlat5.x * u_xlat74;
    u_xlat5.x = u_xlat16_25.x * u_xlat75;
    u_xlat76 = u_xlat74 * u_xlat75;
    u_xlat5.z = u_xlat70 * u_xlat76;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat5.x = u_xlat76 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat5.x;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat71 * u_xlat70;
    u_xlat27.xyz = u_xlat6.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_15.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat12.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat16_25.xxx * u_xlat6.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.zzz + u_xlat16_18.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat70) * u_xlat6.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat70;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat55 = (-u_xlat16_69) * u_xlat70 + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat34.xyz = u_xlat16_2.xyz * vec3(u_xlat55);
    u_xlat34.xyz = vec3(u_xlat1) * vec3(u_xlat16_69) + u_xlat34.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat6.xyz);
    u_xlat14.y = u_xlat70 * u_xlat74;
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat6.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat14.z = u_xlat70 * u_xlat76;
    u_xlat14.x = u_xlat16_69 * u_xlat75;
    u_xlat70 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat5.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat6.x = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat75;
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat16_17.xyz);
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat6.y = u_xlat16_69 * u_xlat74;
    u_xlat28.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat6.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat73 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat70 = u_xlat70 * u_xlat28.x;
    u_xlat34.xyz = u_xlat34.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xyz = min(max(u_xlat34.xyz, 0.0), 1.0);
#else
    u_xlat34.xyz = clamp(u_xlat34.xyz, 0.0, 1.0);
#endif
    u_xlat34.xyz = u_xlat16_15.xyz * u_xlat34.xyz;
    u_xlat34.xyz = u_xlat6.xxx * u_xlat34.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_25.x = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_25.x = max(u_xlat16_25.x, u_xlat16_81);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_25.x;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_17.xyz;
    u_xlat16_28.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat34.xyz * u_xlat28.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_25.xxx * u_xlat27.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_25.zzz + u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_19.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat70;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.x = (-u_xlat16_68) * u_xlat70 + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.xyz = u_xlat16_2.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat1) * vec3(u_xlat16_68) + u_xlat27.xyz;
    u_xlat1 = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16_19.xyz);
    u_xlat14.z = u_xlat70 * u_xlat75;
    u_xlat16.y = u_xlat1 * u_xlat74;
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat4.xyz);
    u_xlat1 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat1 * u_xlat76;
    u_xlat16.x = u_xlat16_68 * u_xlat75;
    u_xlat1 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1 = max(u_xlat1, 6.10351563e-05);
    u_xlat1 = u_xlat76 / u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat5.x * u_xlat1;
    u_xlat1 = min(u_xlat1, 16.0);
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat16_19.xyz);
    u_xlat14.y = u_xlat16_68 * u_xlat74;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat14.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1 = u_xlat1 * u_xlat4.x;
    u_xlat4.xyz = u_xlat27.xyz * vec3(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_25.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_25.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_66 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_66) * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat28.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_66) + u_xlat16_68;
    u_xlat16_25.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_25.x + 1.0;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_68 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat1 = min(u_xlat16_66, 1.0);
    u_xlat23 = min(u_xlat1, u_xlat16_1.z);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat23) + (-u_xlat16_21.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_15.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat16_15.xyz + u_xlat10.xyz;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb23 = u_xlat16_79>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : u_xlat8.xyz;
    u_xlat5.xyz = u_xlat16_13.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat16_13.yzx + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat4.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_25.x = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = u_xlat16_25.x * abs(u_xlat16_79);
    u_xlat4.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat23 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_25.x = dot((-u_xlat16_13.xyz), u_xlat4.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_25.xxx + (-u_xlat16_13.xyz);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat5.xyz = vec3(u_xlat16_47) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_79)) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat16_25.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_25.x = u_xlat16_3.x * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_25.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_25.x);
    u_xlat67 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat16_42.y = u_xlat67 * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_47;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb67)) ? u_xlat16_13.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_3.x;
    u_xlat16_42.x = u_xlat16_3.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_25.xyz * u_xlat16_2.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_69 = u_xlat16_66 + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_3.x = u_xlat16_69 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_3.x = u_xlat16_67 + (-u_xlat16_4.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_4.x;
    u_xlat16_66 = u_xlat16_68 * u_xlat16_66;
    u_xlat23 = u_xlat23 * u_xlat16_66;
    u_xlat16_66 = u_xlat1 * 0.5;
    u_xlat16_68 = (-u_xlat1) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23 * u_xlat16_68 + u_xlat16_66;
    u_xlat16_68 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_3.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat1;
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
float u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat34;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_47;
float u_xlat55;
mediump float u_xlat16_66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_22.xy).x;
    u_xlat23 = u_xlat16_0.x * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1 = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_0.x = u_xlat23 + -0.100000001;
    u_xlat16_22.x = u_xlat23 + u_xlat23;
    u_xlat23 = u_xlat16_22.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_22.x = (-u_xlat23) + 1.0;
    u_xlat16_22.xyz = u_xlat16_22.xxx * _UpChangEdgeColor.xyz;
    u_xlat16_0.x = u_xlat16_0.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_2.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat1 + u_xlat1;
    u_xlat16_2.x = u_xlat1 + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1 = u_xlat16_66 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat16_66 = (-u_xlat1) + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_66) * _ChangEdgeColor.xyz;
    u_xlat16_66 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_2.x;
    u_xlat16_66 = min(u_xlat16_66, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_2.xyz = u_xlat16_3.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat67;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat70 = (-u_xlat16_25.x) * u_xlat67 + 1.0;
    u_xlat16_25.x = u_xlat67 * u_xlat16_25.x;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat1) * u_xlat16_25.xxx + u_xlat6.xyz;
    u_xlat16_25.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_25.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat70 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat70 = u_xlat70 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb71 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat71 = (u_xlatb71) ? 1.0 : -1.0;
    u_xlat71 = u_xlat71 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_25.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_25.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat8.xyz = u_xlat16_25.xyz * vec3(u_xlat72);
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat72 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat7.xyz;
    u_xlat73 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat8.xyz = (-u_xlat9.yzx) * vec3(u_xlat73) + u_xlat8.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat11.xyz;
    u_xlat70 = dot(u_xlat11.xyz, u_xlat5.xyz);
    u_xlat16_25.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_47 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat71 = u_xlat16_25.x * u_xlat16_47;
    u_xlat16_25.x = u_xlat16_25.x + -1.0;
    u_xlat73 = (-u_xlat16_25.x) + 1.0;
    u_xlat73 = u_xlat16_47 * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat12.y = u_xlat70 * u_xlat71;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat12.z = u_xlat70 * u_xlat74;
    u_xlat16_25.x = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat12.x = u_xlat16_25.x * u_xlat73;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat74 / u_xlat75;
    u_xlat74 = u_xlat74 * 0.318309873;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat75 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat73 * u_xlat75;
    u_xlat12.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat16_69 * u_xlat71;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat12.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_13.xyz = vec3(u_xlat16_68) * u_xlat4.xyz;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat73 * u_xlat76;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat8.zxy, u_xlat16_13.xyz);
    u_xlat11.y = u_xlat71 * u_xlat73;
    u_xlat71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat11.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat75 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat74 * u_xlat71;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat71);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat71 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat71 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_79 = u_xlat16_66 + -1.0;
    u_xlat74 = u_xlat16_66 * u_xlat16_47;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat75 = (-u_xlat16_79) + 1.0;
    u_xlat75 = u_xlat16_47 * u_xlat75;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat12.z = u_xlat71 * u_xlat75;
    u_xlat12.y = u_xlat16_69 * u_xlat74;
    u_xlat71 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat12.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat76 = dot(u_xlat16.xyz, u_xlat16_13.xyz);
    u_xlat11.z = u_xlat75 * u_xlat76;
    u_xlat11.y = u_xlat73 * u_xlat74;
    u_xlat73 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat11.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat71 = u_xlat73 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat5.x = dot(u_xlat16.xyz, u_xlat5.xyz);
    u_xlat5.y = u_xlat5.x * u_xlat74;
    u_xlat5.x = u_xlat16_25.x * u_xlat75;
    u_xlat76 = u_xlat74 * u_xlat75;
    u_xlat5.z = u_xlat70 * u_xlat76;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat5.x = u_xlat76 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat5.x;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat71 * u_xlat70;
    u_xlat27.xyz = u_xlat6.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_15.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat12.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat16_25.xxx * u_xlat6.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.zzz + u_xlat16_18.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_17.xyz;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat6.xyz = vec3(u_xlat70) * u_xlat6.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_69) + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat70;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat55 = (-u_xlat16_69) * u_xlat70 + 1.0;
    u_xlat16_69 = u_xlat70 * u_xlat16_69;
    u_xlat34.xyz = u_xlat16_2.xyz * vec3(u_xlat55);
    u_xlat34.xyz = vec3(u_xlat1) * vec3(u_xlat16_69) + u_xlat34.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat6.xyz);
    u_xlat14.y = u_xlat70 * u_xlat74;
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat6.xyz);
    u_xlat70 = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat14.z = u_xlat70 * u_xlat76;
    u_xlat14.x = u_xlat16_69 * u_xlat75;
    u_xlat70 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat76 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat5.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat6.x = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat75;
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(u_xlat8.zxy, u_xlat16_17.xyz);
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat6.y = u_xlat16_69 * u_xlat74;
    u_xlat28.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat6.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat73 * u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat70 = u_xlat70 * u_xlat28.x;
    u_xlat34.xyz = u_xlat34.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xyz = min(max(u_xlat34.xyz, 0.0), 1.0);
#else
    u_xlat34.xyz = clamp(u_xlat34.xyz, 0.0, 1.0);
#endif
    u_xlat34.xyz = u_xlat16_15.xyz * u_xlat34.xyz;
    u_xlat34.xyz = u_xlat6.xxx * u_xlat34.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb70 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_25.x = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_25.x = max(u_xlat16_25.x, u_xlat16_81);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_25.x;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_17.xyz;
    u_xlat16_28.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat34.xyz * u_xlat28.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_25.x = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = u_xlat16_25.xxx * u_xlat27.xyz;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb70 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xz = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_25.zzz + u_xlat16_20.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_19.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat70;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.x = (-u_xlat16_68) * u_xlat70 + 1.0;
    u_xlat16_68 = u_xlat70 * u_xlat16_68;
    u_xlat27.xyz = u_xlat16_2.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat1) * vec3(u_xlat16_68) + u_xlat27.xyz;
    u_xlat1 = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16_19.xyz);
    u_xlat14.z = u_xlat70 * u_xlat75;
    u_xlat16.y = u_xlat1 * u_xlat74;
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat4.xyz);
    u_xlat1 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat1 * u_xlat76;
    u_xlat16.x = u_xlat16_68 * u_xlat75;
    u_xlat1 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat1 = max(u_xlat1, 6.10351563e-05);
    u_xlat1 = u_xlat76 / u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat5.x * u_xlat1;
    u_xlat1 = min(u_xlat1, 16.0);
    u_xlat16_68 = dot(u_xlat8.zxy, u_xlat16_19.xyz);
    u_xlat14.y = u_xlat16_68 * u_xlat74;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat4.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat14.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat73 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat1 = u_xlat1 * u_xlat4.x;
    u_xlat4.xyz = u_xlat27.xyz * vec3(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_15.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat16_69 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = max(u_xlat16_25.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_25.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_25.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat4.xyz * u_xlat28.yyy + u_xlat16_18.xyz;
    u_xlat16_66 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_66) * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat28.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_19.xyz = vec3(u_xlat16_66) * u_xlat16_19.xyz;
    u_xlat16_66 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_66) + u_xlat16_68;
    u_xlat16_25.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_25.x + 1.0;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_68 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_42.z * u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat1 = min(u_xlat16_66, 1.0);
    u_xlat23 = min(u_xlat1, u_xlat16_1.z);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat23) * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat23) + (-u_xlat16_21.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_21.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati4.x = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyw;
    u_xlat16_21.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_15.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat16_15.xyz + u_xlat10.xyz;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb23 = u_xlat16_79>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : u_xlat8.xyz;
    u_xlat5.xyz = u_xlat16_13.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat16_13.yzx + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat4.xyz = (-u_xlat7.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_25.x = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = u_xlat16_25.x * abs(u_xlat16_79);
    u_xlat4.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat23 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_25.x = dot((-u_xlat16_13.xyz), u_xlat4.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_25.xxx + (-u_xlat16_13.xyz);
    u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat5.xyz = vec3(u_xlat16_47) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_79)) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat16_25.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_25.x = u_xlat16_3.x * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_25.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_25.x);
    u_xlat67 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
    u_xlat16_42.y = u_xlat67 * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_47;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_66) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb67)) ? u_xlat16_13.xyz : u_xlat16_25.xyz;
    u_xlat11.y = u_xlat16_3.x;
    u_xlat16_42.x = u_xlat16_3.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_25.xyz * u_xlat16_2.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_69 = u_xlat16_66 + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_3.x = u_xlat16_69 * 16.0 + u_xlat16_3.z;
    u_xlat16_13.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_3.x = u_xlat16_67 + (-u_xlat16_4.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_4.x;
    u_xlat16_66 = u_xlat16_68 * u_xlat16_66;
    u_xlat23 = u_xlat23 * u_xlat16_66;
    u_xlat16_66 = u_xlat1 * 0.5;
    u_xlat16_68 = (-u_xlat1) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23 * u_xlat16_68 + u_xlat16_66;
    u_xlat16_68 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_3.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_3.x + u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat1;
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_66) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
vec3 u_xlat27;
float u_xlat28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat58;
mediump float u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
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
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat5.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat77 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat9.xyz = vec3(u_xlat77) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb72)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat72 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat72) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat72);
    u_xlat2.x = (-u_xlat72) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat72;
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
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _ShadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_79 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat25 = u_xlat16_79 * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_79 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_79 = u_xlat25 + -0.100000001;
    u_xlat16_11.x = u_xlat25 + u_xlat25;
    u_xlat25 = u_xlat16_11.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat25) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _UpChangEdgeColor.xyz;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat1.x + u_xlat1.x;
    u_xlat16_83 = u_xlat1.x + -0.100000001;
    u_xlat16_83 = u_xlat16_83 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_79 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_79 = (-u_xlat1.x) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _ChangEdgeColor.xyz;
    u_xlat16_79 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoChangColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat3.xyz = vec3(u_xlat73) * u_xlat3.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat73;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat74 = (-u_xlat16_84) * u_xlat73 + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat74);
    u_xlat4.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_37.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_37.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat74 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat74 = u_xlat74 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat76 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat76) + u_xlat8.xyz;
    u_xlat76 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat5.xyz = vec3(u_xlat76) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0078125);
    u_xlat75 = u_xlat16_84 * u_xlat16_37.x;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat76 = (-u_xlat16_84) + 1.0;
    u_xlat76 = u_xlat76 * u_xlat16_37.x;
    u_xlat76 = max(u_xlat76, 0.00100000005);
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat74 * u_xlat75;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat14.x = u_xlat76 * u_xlat16_84;
    u_xlat74 = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat76 * u_xlat75;
    u_xlat14.z = u_xlat74 * u_xlat78;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat78 / u_xlat80;
    u_xlat78 = u_xlat78 * 0.318309873;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.z = u_xlat76 * u_xlat80;
    u_xlat14.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.y = u_xlat75 * u_xlat16_61;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat14.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat81 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat76 * u_xlat81;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat10.y = u_xlat75 * u_xlat76;
    u_xlat75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat10.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat80 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat78 * u_xlat75;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat75);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_17.xyz;
    u_xlat16.xyz = u_xlat14.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16.xyz = u_xlat16_7.xyz * u_xlat16.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat73) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_79 + -1.0;
    u_xlat78 = u_xlat16_79 * u_xlat16_37.x;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat80 = (-u_xlat16_85) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_37.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat80;
    u_xlat14.y = u_xlat16_61 * u_xlat78;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat14.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat80 * u_xlat81;
    u_xlat10.y = u_xlat76 * u_xlat78;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat3.xyz);
    u_xlat3.y = u_xlat3.x * u_xlat78;
    u_xlat3.x = u_xlat16_84 * u_xlat80;
    u_xlat81 = u_xlat78 * u_xlat80;
    u_xlat3.z = u_xlat74 * u_xlat81;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat3.x = u_xlat81 * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat3.x;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat74 = u_xlat75 * u_xlat74;
    u_xlat27.xyz = u_xlat4.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_17.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat14.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_7.xyz + u_xlat16.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_20.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_19.xyz;
    u_xlat74 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat4.xyz = vec3(u_xlat74) * u_xlat4.xyz;
    u_xlat16_84 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat74;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat58 = (-u_xlat16_84) * u_xlat74 + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat38.xyz = u_xlat16_12.xyz * vec3(u_xlat58);
    u_xlat38.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat38.xyz;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat74 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat4.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat74 * u_xlat81;
    u_xlat16.x = u_xlat80 * u_xlat16_84;
    u_xlat74 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat3.x * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat4.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_19.xyz);
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat4.y = u_xlat78 * u_xlat16_84;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat4.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat76 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat74 = u_xlat74 * u_xlat28;
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat16_17.xyz * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat4.xxx * u_xlat38.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_20.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_61);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat38.xyz = u_xlat38.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat24.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat27.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat74 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat2.xyz = vec3(u_xlat74) * u_xlat2.xyz;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat74;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.x = (-u_xlat16_83) * u_xlat74 + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.xyz = u_xlat16_12.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_83) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat2.xyz);
    u_xlat74 = dot(u_xlat18.xyz, u_xlat16_21.xyz);
    u_xlat16.z = u_xlat74 * u_xlat80;
    u_xlat18.y = u_xlat1.x * u_xlat78;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat1.x * u_xlat81;
    u_xlat18.x = u_xlat80 * u_xlat16_83;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat81 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat16.y = u_xlat78 * u_xlat16_83;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat16.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat76 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat24.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat14.xxx + u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_79) + u_xlat16_83;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_83 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_79;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat73) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_37.x * 8.0;
    u_xlat16_35 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_35 = max(u_xlat16_35, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = u_xlat16_11.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_11.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_13.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_35;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_44.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_12.x = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_12.x = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
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
out mediump float vs_TEXCOORD5;
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
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
vec3 u_xlat27;
float u_xlat28;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
vec3 u_xlat38;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat58;
mediump float u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
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
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat5.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat10.x = u_xlat8.x;
    u_xlat10.y = u_xlat9.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat77 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat9.xyz = vec3(u_xlat77) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb72)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat72 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat72) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat72);
    u_xlat2.x = (-u_xlat72) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat72;
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
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _ShadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_79 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat25 = u_xlat16_79 * _UpChangColorShrink + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_79 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_79 = u_xlat25 + -0.100000001;
    u_xlat16_11.x = u_xlat25 + u_xlat25;
    u_xlat25 = u_xlat16_11.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat25) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _UpChangEdgeColor.xyz;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat1.x + u_xlat1.x;
    u_xlat16_83 = u_xlat1.x + -0.100000001;
    u_xlat16_83 = u_xlat16_83 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_79 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_79 = (-u_xlat1.x) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _ChangEdgeColor.xyz;
    u_xlat16_79 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoColor.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoChangColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat3.xyz = vec3(u_xlat73) * u_xlat3.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat73;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat74 = (-u_xlat16_84) * u_xlat73 + 1.0;
    u_xlat16_84 = u_xlat73 * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat74);
    u_xlat4.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_37.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_37.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat74 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat74 = u_xlat74 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat76 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat76) + u_xlat8.xyz;
    u_xlat76 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat5.xyz = vec3(u_xlat76) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat75) * u_xlat8.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_37.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0078125);
    u_xlat75 = u_xlat16_84 * u_xlat16_37.x;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat76 = (-u_xlat16_84) + 1.0;
    u_xlat76 = u_xlat76 * u_xlat16_37.x;
    u_xlat76 = max(u_xlat76, 0.00100000005);
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat74 * u_xlat75;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat14.x = u_xlat76 * u_xlat16_84;
    u_xlat74 = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat78 = u_xlat76 * u_xlat75;
    u_xlat14.z = u_xlat74 * u_xlat78;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = max(u_xlat80, 6.10351563e-05);
    u_xlat80 = u_xlat78 / u_xlat80;
    u_xlat78 = u_xlat78 * 0.318309873;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.z = u_xlat76 * u_xlat80;
    u_xlat14.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_61 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat14.y = u_xlat75 * u_xlat16_61;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat14.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat81 = dot(u_xlat10.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat76 * u_xlat81;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_15.xyz);
    u_xlat10.y = u_xlat75 * u_xlat76;
    u_xlat75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat10.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat75 * u_xlat80 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat78 * u_xlat75;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat75);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_17.xyz;
    u_xlat16.xyz = u_xlat14.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16.xyz = u_xlat16_7.xyz * u_xlat16.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat73) * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_79 + -1.0;
    u_xlat78 = u_xlat16_79 * u_xlat16_37.x;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat80 = (-u_xlat16_85) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_37.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat80;
    u_xlat14.y = u_xlat16_61 * u_xlat78;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat14.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat16_15.xyz);
    u_xlat10.z = u_xlat80 * u_xlat81;
    u_xlat10.y = u_xlat76 * u_xlat78;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat3.xyz);
    u_xlat3.y = u_xlat3.x * u_xlat78;
    u_xlat3.x = u_xlat16_84 * u_xlat80;
    u_xlat81 = u_xlat78 * u_xlat80;
    u_xlat3.z = u_xlat74 * u_xlat81;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat3.x = u_xlat81 * 0.318309873;
    u_xlat74 = u_xlat74 * u_xlat3.x;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat74 = u_xlat75 * u_xlat74;
    u_xlat27.xyz = u_xlat4.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat16_17.xyz * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat14.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_7.xyz + u_xlat16.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_20.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_19.xyz;
    u_xlat74 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat4.xyz = vec3(u_xlat74) * u_xlat4.xyz;
    u_xlat16_84 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat74;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat58 = (-u_xlat16_84) * u_xlat74 + 1.0;
    u_xlat16_84 = u_xlat74 * u_xlat16_84;
    u_xlat38.xyz = u_xlat16_12.xyz * vec3(u_xlat58);
    u_xlat38.xyz = u_xlat1.xxx * vec3(u_xlat16_84) + u_xlat38.xyz;
    u_xlat74 = dot(u_xlat18.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat74 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat4.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat74 * u_xlat81;
    u_xlat16.x = u_xlat80 * u_xlat16_84;
    u_xlat74 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat81 / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat3.x * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat4.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat16_19.xyz);
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat4.y = u_xlat78 * u_xlat16_84;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat4.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat76 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat74 = u_xlat74 * u_xlat28;
    u_xlat38.xyz = u_xlat38.xyz * vec3(u_xlat74);
#ifdef UNITY_ADRENO_ES3
    u_xlat38.xyz = min(max(u_xlat38.xyz, 0.0), 1.0);
#else
    u_xlat38.xyz = clamp(u_xlat38.xyz, 0.0, 1.0);
#endif
    u_xlat38.xyz = u_xlat16_17.xyz * u_xlat38.xyz;
    u_xlat38.xyz = u_xlat4.xxx * u_xlat38.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_20.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_61);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat38.xyz = u_xlat38.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat38.xyz * u_xlat24.xxx + u_xlat27.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat27.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb74 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat74 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat2.xyz = vec3(u_xlat74) * u_xlat2.xyz;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat74 = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat74;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.x = (-u_xlat16_83) * u_xlat74 + 1.0;
    u_xlat16_83 = u_xlat74 * u_xlat16_83;
    u_xlat27.xyz = u_xlat16_12.xyz * u_xlat27.xxx;
    u_xlat27.xyz = u_xlat1.xxx * vec3(u_xlat16_83) + u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat2.xyz);
    u_xlat74 = dot(u_xlat18.xyz, u_xlat16_21.xyz);
    u_xlat16.z = u_xlat74 * u_xlat80;
    u_xlat18.y = u_xlat1.x * u_xlat78;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat1.x * u_xlat81;
    u_xlat18.x = u_xlat80 * u_xlat16_83;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat81 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat3.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat16.y = u_xlat78 * u_xlat16_83;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat2.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat16.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat76 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * u_xlat24.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_11.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat14.xxx + u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_79) + u_xlat16_83;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_83 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_44.z * u_xlat16_79;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat73) * u_xlat16_11.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_15.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_15.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_37.x * 8.0;
    u_xlat16_35 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_35 = max(u_xlat16_35, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = u_xlat16_11.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_35) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_11.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_13.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_35 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_35;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_37.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_37.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_44.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_79 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_12.x = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_12.x = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_12.x + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
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
  GpuProgramID 121479
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_HairColorChang_AnisotropicGUI"
}