//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_Paillette" {
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

_MaskTex ("亮片、闪点遮罩贴图", 2D) = "white" { }

[Tex] _PailletteNormalMap ("亮片法线贴图", 2D) = "bump" { }

_PailletteNormalStrength ("亮片法线强度", Range(0, 5)) = 1.0

[Tex] _PailletteRoughnessMap ("亮片控制贴图", 2D) = "white" { }

_PailletteRoughnessStrength ("亮片强度", Range(0, 1)) = 1.0

_PailletteTilling ("亮片密度", Vector) = (1,1,1,1)

_FresnelPower ("亮片边缘遮罩", Range(0.01, 10)) = 1.0

_FresnelScale ("亮片边缘遮罩交界过度", Range(0.01, 1)) = 1.0

_GlitterTex ("闪点贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 20)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

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
 Name "PBR_FlowGlitter"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 30984
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec3 u_xlat16_29;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_58 = texture(_PailletteRoughnessMap, u_xlat16_21.xy).x;
    u_xlat16_5.xyz = texture(_PailletteNormalMap, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat58 = u_xlat16_58 * _PailletteRoughnessStrength;
    u_xlat16_56 = max(_FresnelScale, 0.00999999978);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_6.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat16_60 = log2(u_xlat5.x);
    u_xlat16_60 = u_xlat16_60 * _FresnelPower;
    u_xlat16_60 = exp2(u_xlat16_60);
    u_xlat16_56 = u_xlat16_60 / u_xlat16_56;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_5.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_5.x);
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat58 = u_xlat16_56 * u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = u_xlat16_7.y * _MetallicMultiplier + u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_8 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz;
    u_xlat16_10.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_10.xyz;
    u_xlat54 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xzw;
    u_xlat16_56 = u_xlat58 * _PailletteNormalStrength;
    u_xlat16_29.x = u_xlat16_7.x * _RoughnessMultiplier + (-u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = vec2(u_xlat16_56) * u_xlat16_21.xy;
    u_xlat16_7.xyw = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.z = -1.0;
    u_xlat16_3.xyz = u_xlat16_7.xyw * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat8.z = u_xlat16_21.z * u_xlat16_3.z;
    u_xlat8.xy = u_xlat16_3.xy + vec2(-1.0, -1.0);
    u_xlat58 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyw = vec3(u_xlat58) * u_xlat8.xyz;
    u_xlat16_56 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_3.xyz = vec3(u_xlat16_56) * vs_TEXCOORD1.zxy;
    u_xlat16_56 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_12.xyz = (-u_xlat16_3.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.xyz;
    u_xlat58 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat8.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat8.yzx;
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat8.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vs_TEXCOORD2.www;
    u_xlat13.y = u_xlat16_12.x;
    u_xlat13.x = u_xlat8.x;
    u_xlat13.z = u_xlat16_3.y;
    u_xlat13.x = dot(u_xlat7.xyw, u_xlat13.xyz);
    u_xlat14.z = u_xlat16_3.z;
    u_xlat15.z = u_xlat16_3.x;
    u_xlat14.x = u_xlat8.y;
    u_xlat14.y = u_xlat16_12.y;
    u_xlat13.y = dot(u_xlat7.xyw, u_xlat14.xyz);
    u_xlat15.x = u_xlat8.z;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_6.xyz);
    u_xlat15.y = u_xlat16_12.z;
    u_xlat8.y = dot(u_xlat16_12.xyz, u_xlat16_6.xyz);
    u_xlat8.xy = u_xlat8.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat13.z = dot(u_xlat7.xyw, u_xlat15.xyz);
    u_xlat58 = dot(u_xlat13.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat7.x = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat7.x = u_xlat58 * u_xlat7.x + u_xlat16_19.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat58 + u_xlat7.x;
    u_xlat14.x = dot(u_xlat13.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat25 = u_xlat14.x * u_xlat25 + u_xlat16_19.x;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat7.y = u_xlat25 + u_xlat14.x;
    u_xlat7.xy = u_xlat7.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.y;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat5.xzw = u_xlat5.xzw * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _DirectSpecularColor.zxy;
    u_xlat5.xzw = vec3(u_xlat58) * u_xlat5.xzw;
    u_xlat5.xzw = u_xlat16_2.xyz * u_xlat5.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat4.xxx * u_xlat5.xzw;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat22.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_19.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat61 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat61 * u_xlat61;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_55 = u_xlat61 * u_xlat16_37;
    u_xlat61 = (-u_xlat16_37) * u_xlat61 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat61);
    u_xlat15.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat15.xyz;
    u_xlat61 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat61) * u_xlat16_19.x + u_xlat61;
    u_xlat44 = u_xlat61 * u_xlat44 + u_xlat16_19.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat8.z = u_xlat61 + u_xlat44;
    u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, 6.10351563e-05);
    u_xlat44 = u_xlat7.y * u_xlat8.z;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat44;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat61) * u_xlat15.xyz;
    u_xlat16_3.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xzw;
    u_xlat5.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_12.xyz = vec3(u_xlat16_37) * u_xlat5.xzw;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
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
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat13.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xzw = u_xlat16_10.xyz * vec3(u_xlat36);
    u_xlat5.xzw = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat5.xzw;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat7.y;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xzw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = vec3(u_xlat58) * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat61) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat13.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat13.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_29.z = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_16.y = u_xlat16_2.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_1.xzw;
    u_xlat16_60 = dot((-u_xlat16_6.xyz), u_xlat13.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat18.xyz = (-u_xlat13.xyz) * vec3(u_xlat16_60) + (-u_xlat16_6.xyz);
    u_xlat16_29.y = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-u_xlat18.xyz) + u_xlat13.xyz;
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_6.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_40;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat4.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_7.z);
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat16_2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat2.y = u_xlat18.y;
    u_xlat2.xz = u_xlat16_2.xz;
    u_xlat16_57 = u_xlat16_29.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_29.x);
    u_xlat14.y = u_xlat16_29.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_57);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat16_6.yzx * u_xlat16_9.yzx + u_xlat16_3.yzx;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_8.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_8.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat8.xy);
    u_xlat0.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat8.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_21.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_21.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_21.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(1.5, 1.5);
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_GlitterIntensity);
    u_xlat16_21.xyz = max(u_xlat16_21.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_21.xyz = log2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_21.xyz = exp2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _GlitterColor.zxy;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_5.yyy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec3 u_xlat16_29;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_58 = texture(_PailletteRoughnessMap, u_xlat16_21.xy).x;
    u_xlat16_5.xyz = texture(_PailletteNormalMap, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat58 = u_xlat16_58 * _PailletteRoughnessStrength;
    u_xlat16_56 = max(_FresnelScale, 0.00999999978);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_6.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat16_60 = log2(u_xlat5.x);
    u_xlat16_60 = u_xlat16_60 * _FresnelPower;
    u_xlat16_60 = exp2(u_xlat16_60);
    u_xlat16_56 = u_xlat16_60 / u_xlat16_56;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_5.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_5.x);
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat58 = u_xlat16_56 * u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = u_xlat16_7.y * _MetallicMultiplier + u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_8 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz;
    u_xlat16_10.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_10.xyz;
    u_xlat54 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xzw;
    u_xlat16_56 = u_xlat58 * _PailletteNormalStrength;
    u_xlat16_29.x = u_xlat16_7.x * _RoughnessMultiplier + (-u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = vec2(u_xlat16_56) * u_xlat16_21.xy;
    u_xlat16_7.xyw = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.z = -1.0;
    u_xlat16_3.xyz = u_xlat16_7.xyw * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat8.z = u_xlat16_21.z * u_xlat16_3.z;
    u_xlat8.xy = u_xlat16_3.xy + vec2(-1.0, -1.0);
    u_xlat58 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyw = vec3(u_xlat58) * u_xlat8.xyz;
    u_xlat16_56 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_3.xyz = vec3(u_xlat16_56) * vs_TEXCOORD1.zxy;
    u_xlat16_56 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_12.xyz = (-u_xlat16_3.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.xyz;
    u_xlat58 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat8.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat8.yzx;
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat8.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vs_TEXCOORD2.www;
    u_xlat13.y = u_xlat16_12.x;
    u_xlat13.x = u_xlat8.x;
    u_xlat13.z = u_xlat16_3.y;
    u_xlat13.x = dot(u_xlat7.xyw, u_xlat13.xyz);
    u_xlat14.z = u_xlat16_3.z;
    u_xlat15.z = u_xlat16_3.x;
    u_xlat14.x = u_xlat8.y;
    u_xlat14.y = u_xlat16_12.y;
    u_xlat13.y = dot(u_xlat7.xyw, u_xlat14.xyz);
    u_xlat15.x = u_xlat8.z;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_6.xyz);
    u_xlat15.y = u_xlat16_12.z;
    u_xlat8.y = dot(u_xlat16_12.xyz, u_xlat16_6.xyz);
    u_xlat8.xy = u_xlat8.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat13.z = dot(u_xlat7.xyw, u_xlat15.xyz);
    u_xlat58 = dot(u_xlat13.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat7.x = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat7.x = u_xlat58 * u_xlat7.x + u_xlat16_19.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat58 + u_xlat7.x;
    u_xlat14.x = dot(u_xlat13.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat25 = u_xlat14.x * u_xlat25 + u_xlat16_19.x;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat7.y = u_xlat25 + u_xlat14.x;
    u_xlat7.xy = u_xlat7.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.y;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat5.xzw = u_xlat5.xzw * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _DirectSpecularColor.zxy;
    u_xlat5.xzw = vec3(u_xlat58) * u_xlat5.xzw;
    u_xlat5.xzw = u_xlat16_2.xyz * u_xlat5.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat4.xxx * u_xlat5.xzw;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat22.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_19.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat61 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat61 * u_xlat61;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_55 = u_xlat61 * u_xlat16_37;
    u_xlat61 = (-u_xlat16_37) * u_xlat61 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat61);
    u_xlat15.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat15.xyz;
    u_xlat61 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat61) * u_xlat16_19.x + u_xlat61;
    u_xlat44 = u_xlat61 * u_xlat44 + u_xlat16_19.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat8.z = u_xlat61 + u_xlat44;
    u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, 6.10351563e-05);
    u_xlat44 = u_xlat7.y * u_xlat8.z;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat44;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat61) * u_xlat15.xyz;
    u_xlat16_3.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xzw;
    u_xlat5.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_12.xyz = vec3(u_xlat16_37) * u_xlat5.xzw;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
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
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat13.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xzw = u_xlat16_10.xyz * vec3(u_xlat36);
    u_xlat5.xzw = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat5.xzw;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat7.y;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xzw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = vec3(u_xlat58) * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat61) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat13.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat13.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_29.z = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_16.y = u_xlat16_2.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_1.xzw;
    u_xlat16_60 = dot((-u_xlat16_6.xyz), u_xlat13.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat18.xyz = (-u_xlat13.xyz) * vec3(u_xlat16_60) + (-u_xlat16_6.xyz);
    u_xlat16_29.y = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-u_xlat18.xyz) + u_xlat13.xyz;
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_6.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_40;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat4.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_7.z);
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat16_2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat2.y = u_xlat18.y;
    u_xlat2.xz = u_xlat16_2.xz;
    u_xlat16_57 = u_xlat16_29.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_29.x);
    u_xlat14.y = u_xlat16_29.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_57);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat16_6.yzx * u_xlat16_9.yzx + u_xlat16_3.yzx;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_8.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_8.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat8.xy);
    u_xlat0.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat8.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_21.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_21.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_21.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(1.5, 1.5);
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_GlitterIntensity);
    u_xlat16_21.xyz = max(u_xlat16_21.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_21.xyz = log2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_21.xyz = exp2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _GlitterColor.zxy;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_5.yyy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat23;
mediump float u_xlat16_23;
float u_xlat26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_36;
int u_xlati43;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
float u_xlat47;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
float u_xlat65;
float u_xlat69;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb64 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_9.xyz = texture(_PailletteNormalMap, u_xlat16_8.xy).xyz;
    u_xlat16_69 = texture(_PailletteRoughnessMap, u_xlat16_8.xy).x;
    u_xlat69 = u_xlat16_69 * _PailletteRoughnessStrength;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = max(_FresnelScale, 0.00999999978);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_10.xyz = vec3(u_xlat16_70) * u_xlat9.xyz;
    u_xlat72 = dot(vs_TEXCOORD1.xyz, u_xlat16_10.xyz);
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat16_71 = log2(u_xlat72);
    u_xlat16_71 = u_xlat16_71 * _FresnelPower;
    u_xlat16_71 = exp2(u_xlat16_71);
    u_xlat16_63 = u_xlat16_71 / u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_11.x);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat69 = u_xlat16_63 * u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat69 * _PailletteNormalStrength;
    u_xlat16_7.xy = vec2(u_xlat16_63) * u_xlat16_8.xy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat6.z = u_xlat16_8.z * u_xlat16_7.z;
    u_xlat6.xy = u_xlat16_7.xy + vec2(-1.0, -1.0);
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat16_63 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * vs_TEXCOORD1.zxy;
    u_xlat16_63 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.xyz;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat11.xzw = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat11.zwx;
    u_xlat16_8.xyz = u_xlat16_7.zxy * u_xlat11.wxz + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat16_8.x;
    u_xlat12.x = u_xlat11.x;
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat14.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat11.z;
    u_xlat13.y = u_xlat16_8.y;
    u_xlat12.y = dot(u_xlat6.xyz, u_xlat13.xyz);
    u_xlat14.x = u_xlat11.w;
    u_xlat13.x = dot(u_xlat11.xzw, u_xlat16_10.xyz);
    u_xlat14.y = u_xlat16_8.z;
    u_xlat13.y = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
    u_xlat11.xz = u_xlat13.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat11.xz = u_xlat11.xz + vec2(-0.5, -0.5);
    u_xlat12.z = dot(u_xlat6.xyz, u_xlat14.xyz);
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb64)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat64 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat64) + u_xlat2.z;
    u_xlat3.x = max((-u_xlat2.w), u_xlat64);
    u_xlat3.x = (-u_xlat64) + u_xlat3.x;
    u_xlat2.z = _ShadowBias.y * u_xlat3.x + u_xlat64;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat2.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_63 = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_63) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_63;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_63 = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_63 + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_0.xyz = u_xlat1.xxx * u_xlat16_0.xyz + _ShadowColor.zxy;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat2.xyz;
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_7.x);
    u_xlat16_15.xyz = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_15.xyz;
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_29.x, u_xlat16_8.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat2.xyz = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_7.xyz;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat23.x * u_xlat23.x;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_7.x = u_xlat23.x * u_xlat16_63;
    u_xlat23.x = (-u_xlat16_63) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_63 = u_xlat16_3.y * _MetallicMultiplier + u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_3.x * _RoughnessMultiplier + (-u_xlat69);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_4.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_4.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_17.xyz;
    u_xlat23.x = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_7.xxx + u_xlat3.xyw;
    u_xlat16_63 = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat44 = (-u_xlat65) * u_xlat16_63 + u_xlat65;
    u_xlat44 = u_xlat65 * u_xlat44 + u_xlat16_63;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat65;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_63 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_63;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat4.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat46;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat5.x = u_xlat16_63 + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat5.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_63 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat65) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_8.xyz * u_xlat3.xyw;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xyz = u_xlat22.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat65) * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat9.xyz * vec3(u_xlat16_70) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat16_8.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat3.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat3.x = (-u_xlat16_8.x) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_29.xxx + u_xlat3.xyw;
    u_xlat26 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat47 = u_xlat26 * u_xlat47 + u_xlat16_63;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat26;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat46 * u_xlat47;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat47;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat26) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat3.xyw * u_xlat16_0.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_15.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_15.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat22.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat2.xzw = u_xlat22.xxx * u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat44 * u_xlat44;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_71 = u_xlat44 * u_xlat16_70;
    u_xlat44 = (-u_xlat16_70) * u_xlat44 + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * vec3(u_xlat44);
    u_xlat23.xyz = u_xlat23.xxx * vec3(u_xlat16_71) + u_xlat3.xyw;
    u_xlat3.x = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat3.x = u_xlat2.x * u_xlat3.x + u_xlat16_63;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat2.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat46;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.zxy;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_19.xyz * u_xlat23.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat22.yyy * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat23.xyz * u_xlat22.yyy + u_xlat16_8.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat26) + u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz + u_xlat16_0.xyz;
    u_xlat16_7.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_71 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_70;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_70));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_19.y = u_xlat16_7.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_20.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati43 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_0.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat12.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat1.xzw = (-u_xlat12.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat16_36.y = dot(u_xlat16_7.xyz, u_xlat1.xzw);
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = (-u_xlat1.xzw) + u_xlat12.xyz;
    u_xlat1.xzw = vec3(u_xlat16_63) * u_xlat23.xyz + u_xlat1.xzw;
    u_xlat16_7.xyz = u_xlat16_36.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_5.w);
    u_xlat16_7.x = u_xlat16_63 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_5.x = u_xlat16_7.x * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_5.x = u_xlat16_63 * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_63 = u_xlat16_7.z * 15.0 + (-u_xlat16_63);
    u_xlat16_7.x = (-u_xlat16_44) + u_xlat16_23;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_7.x + u_xlat16_44;
    u_xlat16_63 = u_xlat16_71 * u_xlat16_63;
    u_xlat2.x = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat1.y * 0.5;
    u_xlat16_7.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat16_7.x + u_xlat16_63;
    u_xlat16_7.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_28 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28 + u_xlat16_7.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat1.y;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat7.y = u_xlat1.z;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_71 = u_xlat16_36.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_36.x);
    u_xlat4.y = u_xlat16_36.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.yzx * u_xlat16_15.yzx + u_xlat16_8.yzx;
    u_xlat16_63 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_4.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.zxy * _EmissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + u_xlat16_0.xyz;
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat11.xz);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat11.xz);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_29.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat1.xy).xyz;
    u_xlat16_29.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(1.5, 1.5);
    u_xlat16_2.xyz = texture(_GlitterTex, u_xlat16_29.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.zxy * u_xlat16_2.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_GlitterIntensity);
    u_xlat16_29.xyz = max(u_xlat16_29.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_29.xyz = log2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_29.xyz = exp2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_11.yyy + u_xlat16_0.xyz;
    u_xlat16_29.xyz = (-u_xlat16_0.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat64 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat64);
    u_xlat2.x = u_xlat64 * 0.0625 + u_xlat2.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_22.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_8.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat23;
mediump float u_xlat16_23;
float u_xlat26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_36;
int u_xlati43;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
float u_xlat47;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
float u_xlat65;
float u_xlat69;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb64 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_9.xyz = texture(_PailletteNormalMap, u_xlat16_8.xy).xyz;
    u_xlat16_69 = texture(_PailletteRoughnessMap, u_xlat16_8.xy).x;
    u_xlat69 = u_xlat16_69 * _PailletteRoughnessStrength;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = max(_FresnelScale, 0.00999999978);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_10.xyz = vec3(u_xlat16_70) * u_xlat9.xyz;
    u_xlat72 = dot(vs_TEXCOORD1.xyz, u_xlat16_10.xyz);
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat16_71 = log2(u_xlat72);
    u_xlat16_71 = u_xlat16_71 * _FresnelPower;
    u_xlat16_71 = exp2(u_xlat16_71);
    u_xlat16_63 = u_xlat16_71 / u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_11.x);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat69 = u_xlat16_63 * u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat69 * _PailletteNormalStrength;
    u_xlat16_7.xy = vec2(u_xlat16_63) * u_xlat16_8.xy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat6.z = u_xlat16_8.z * u_xlat16_7.z;
    u_xlat6.xy = u_xlat16_7.xy + vec2(-1.0, -1.0);
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat16_63 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * vs_TEXCOORD1.zxy;
    u_xlat16_63 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.xyz;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat11.xzw = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat11.zwx;
    u_xlat16_8.xyz = u_xlat16_7.zxy * u_xlat11.wxz + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat16_8.x;
    u_xlat12.x = u_xlat11.x;
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat14.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat11.z;
    u_xlat13.y = u_xlat16_8.y;
    u_xlat12.y = dot(u_xlat6.xyz, u_xlat13.xyz);
    u_xlat14.x = u_xlat11.w;
    u_xlat13.x = dot(u_xlat11.xzw, u_xlat16_10.xyz);
    u_xlat14.y = u_xlat16_8.z;
    u_xlat13.y = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
    u_xlat11.xz = u_xlat13.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat11.xz = u_xlat11.xz + vec2(-0.5, -0.5);
    u_xlat12.z = dot(u_xlat6.xyz, u_xlat14.xyz);
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb64)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat64 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat64) + u_xlat2.z;
    u_xlat3.x = max((-u_xlat2.w), u_xlat64);
    u_xlat3.x = (-u_xlat64) + u_xlat3.x;
    u_xlat2.z = _ShadowBias.y * u_xlat3.x + u_xlat64;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat2.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_63 = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_63) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_63;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_63 = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_63 + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_0.xyz = u_xlat1.xxx * u_xlat16_0.xyz + _ShadowColor.zxy;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat2.xyz;
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_7.x);
    u_xlat16_15.xyz = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_15.xyz;
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_29.x, u_xlat16_8.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat2.xyz = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_7.xyz;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat23.x * u_xlat23.x;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_7.x = u_xlat23.x * u_xlat16_63;
    u_xlat23.x = (-u_xlat16_63) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_63 = u_xlat16_3.y * _MetallicMultiplier + u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_3.x * _RoughnessMultiplier + (-u_xlat69);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_4.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_4.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_17.xyz;
    u_xlat23.x = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_7.xxx + u_xlat3.xyw;
    u_xlat16_63 = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat44 = (-u_xlat65) * u_xlat16_63 + u_xlat65;
    u_xlat44 = u_xlat65 * u_xlat44 + u_xlat16_63;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat65;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_63 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_63;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat4.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat46;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat5.x = u_xlat16_63 + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat5.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_63 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat65) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_8.xyz * u_xlat3.xyw;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xyz = u_xlat22.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat65) * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat9.xyz * vec3(u_xlat16_70) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat16_8.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat3.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat3.x = (-u_xlat16_8.x) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_29.xxx + u_xlat3.xyw;
    u_xlat26 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat47 = u_xlat26 * u_xlat47 + u_xlat16_63;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat26;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat46 * u_xlat47;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat47;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat26) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat3.xyw * u_xlat16_0.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_15.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_15.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xzw = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat22.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat2.xzw = u_xlat22.xxx * u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat44 * u_xlat44;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_71 = u_xlat44 * u_xlat16_70;
    u_xlat44 = (-u_xlat16_70) * u_xlat44 + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * vec3(u_xlat44);
    u_xlat23.xyz = u_xlat23.xxx * vec3(u_xlat16_71) + u_xlat3.xyw;
    u_xlat3.x = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat3.x = u_xlat2.x * u_xlat3.x + u_xlat16_63;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat2.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat46;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.zxy;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_19.xyz * u_xlat23.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat22.yyy * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat23.xyz * u_xlat22.yyy + u_xlat16_8.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat26) + u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz + u_xlat16_0.xyz;
    u_xlat16_7.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_71 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_70;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_70));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_19.y = u_xlat16_7.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_20.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati43 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_0.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat12.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat1.xzw = (-u_xlat12.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat16_36.y = dot(u_xlat16_7.xyz, u_xlat1.xzw);
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = (-u_xlat1.xzw) + u_xlat12.xyz;
    u_xlat1.xzw = vec3(u_xlat16_63) * u_xlat23.xyz + u_xlat1.xzw;
    u_xlat16_7.xyz = u_xlat16_36.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_5.w);
    u_xlat16_7.x = u_xlat16_63 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_5.x = u_xlat16_7.x * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_5.x = u_xlat16_63 * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_63 = u_xlat16_7.z * 15.0 + (-u_xlat16_63);
    u_xlat16_7.x = (-u_xlat16_44) + u_xlat16_23;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_7.x + u_xlat16_44;
    u_xlat16_63 = u_xlat16_71 * u_xlat16_63;
    u_xlat2.x = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat1.y * 0.5;
    u_xlat16_7.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat16_7.x + u_xlat16_63;
    u_xlat16_7.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_28 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28 + u_xlat16_7.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat1.y;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat7.y = u_xlat1.z;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_71 = u_xlat16_36.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_36.x);
    u_xlat4.y = u_xlat16_36.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.yzx * u_xlat16_15.yzx + u_xlat16_8.yzx;
    u_xlat16_63 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_4.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.zxy * _EmissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + u_xlat16_0.xyz;
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat11.xz);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat11.xz);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_29.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat1.xy).xyz;
    u_xlat16_29.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(1.5, 1.5);
    u_xlat16_2.xyz = texture(_GlitterTex, u_xlat16_29.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.zxy * u_xlat16_2.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_GlitterIntensity);
    u_xlat16_29.xyz = max(u_xlat16_29.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_29.xyz = log2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_29.xyz = exp2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_11.yyy + u_xlat16_0.xyz;
    u_xlat16_29.xyz = (-u_xlat16_0.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat64 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat64);
    u_xlat2.x = u_xlat64 * 0.0625 + u_xlat2.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_22.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_8.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec3 u_xlat16_29;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_58 = texture(_PailletteRoughnessMap, u_xlat16_21.xy).x;
    u_xlat16_5.xyz = texture(_PailletteNormalMap, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat58 = u_xlat16_58 * _PailletteRoughnessStrength;
    u_xlat16_56 = max(_FresnelScale, 0.00999999978);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_6.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat16_60 = log2(u_xlat5.x);
    u_xlat16_60 = u_xlat16_60 * _FresnelPower;
    u_xlat16_60 = exp2(u_xlat16_60);
    u_xlat16_56 = u_xlat16_60 / u_xlat16_56;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_5.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_5.x);
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat58 = u_xlat16_56 * u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = u_xlat16_7.y * _MetallicMultiplier + u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_8 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_10.xyz;
    u_xlat54 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xzw;
    u_xlat16_56 = u_xlat58 * _PailletteNormalStrength;
    u_xlat16_29.x = u_xlat16_7.x * _RoughnessMultiplier + (-u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = vec2(u_xlat16_56) * u_xlat16_21.xy;
    u_xlat16_7.xyw = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.z = -1.0;
    u_xlat16_3.xyz = u_xlat16_7.xyw * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat8.z = u_xlat16_21.z * u_xlat16_3.z;
    u_xlat8.xy = u_xlat16_3.xy + vec2(-1.0, -1.0);
    u_xlat58 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyw = vec3(u_xlat58) * u_xlat8.xyz;
    u_xlat16_56 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_3.xyz = vec3(u_xlat16_56) * vs_TEXCOORD1.zxy;
    u_xlat16_56 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_12.xyz = (-u_xlat16_3.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.xyz;
    u_xlat58 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat8.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat8.yzx;
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat8.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vs_TEXCOORD2.www;
    u_xlat13.y = u_xlat16_12.x;
    u_xlat13.x = u_xlat8.x;
    u_xlat13.z = u_xlat16_3.y;
    u_xlat13.x = dot(u_xlat7.xyw, u_xlat13.xyz);
    u_xlat14.z = u_xlat16_3.z;
    u_xlat15.z = u_xlat16_3.x;
    u_xlat14.x = u_xlat8.y;
    u_xlat14.y = u_xlat16_12.y;
    u_xlat13.y = dot(u_xlat7.xyw, u_xlat14.xyz);
    u_xlat15.x = u_xlat8.z;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_6.xyz);
    u_xlat15.y = u_xlat16_12.z;
    u_xlat8.y = dot(u_xlat16_12.xyz, u_xlat16_6.xyz);
    u_xlat8.xy = u_xlat8.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat13.z = dot(u_xlat7.xyw, u_xlat15.xyz);
    u_xlat58 = dot(u_xlat13.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat7.x = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat7.x = u_xlat58 * u_xlat7.x + u_xlat16_19.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat58 + u_xlat7.x;
    u_xlat14.x = dot(u_xlat13.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat25 = u_xlat14.x * u_xlat25 + u_xlat16_19.x;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat7.y = u_xlat25 + u_xlat14.x;
    u_xlat7.xy = u_xlat7.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.y;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat5.xzw = u_xlat5.xzw * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _DirectSpecularColor.xyz;
    u_xlat5.xzw = vec3(u_xlat58) * u_xlat5.xzw;
    u_xlat5.xzw = u_xlat16_2.xyz * u_xlat5.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat4.xxx * u_xlat5.xzw;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat22.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_19.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat61 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat61 * u_xlat61;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_55 = u_xlat61 * u_xlat16_37;
    u_xlat61 = (-u_xlat16_37) * u_xlat61 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat61);
    u_xlat15.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat15.xyz;
    u_xlat61 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat61) * u_xlat16_19.x + u_xlat61;
    u_xlat44 = u_xlat61 * u_xlat44 + u_xlat16_19.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat8.z = u_xlat61 + u_xlat44;
    u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, 6.10351563e-05);
    u_xlat44 = u_xlat7.y * u_xlat8.z;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat44;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat61) * u_xlat15.xyz;
    u_xlat16_3.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xzw;
    u_xlat5.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_12.xyz = vec3(u_xlat16_37) * u_xlat5.xzw;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
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
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat13.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xzw = u_xlat16_10.xyz * vec3(u_xlat36);
    u_xlat5.xzw = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat5.xzw;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat7.y;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xzw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = vec3(u_xlat58) * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat61) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat13.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat13.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_29.z = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_16.y = u_xlat16_2.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_1.xzw;
    u_xlat16_60 = dot((-u_xlat16_6.xyz), u_xlat13.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat18.xyz = (-u_xlat13.xyz) * vec3(u_xlat16_60) + (-u_xlat16_6.xyz);
    u_xlat16_29.y = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-u_xlat18.xyz) + u_xlat13.xyz;
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_6.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_40;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat4.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_7.z);
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat16_2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat2.y = u_xlat18.y;
    u_xlat2.xz = u_xlat16_2.xz;
    u_xlat16_57 = u_xlat16_29.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_29.x);
    u_xlat14.y = u_xlat16_29.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_57);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_3.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_8.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_8.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat8.xy);
    u_xlat0.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat8.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_21.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_21.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_21.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(1.5, 1.5);
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_GlitterIntensity);
    u_xlat16_21.xyz = max(u_xlat16_21.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_21.xyz = log2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_21.xyz = exp2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_5.yyy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
float u_xlat25;
mediump vec3 u_xlat16_29;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_40;
float u_xlat44;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_58 = texture(_PailletteRoughnessMap, u_xlat16_21.xy).x;
    u_xlat16_5.xyz = texture(_PailletteNormalMap, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat58 = u_xlat16_58 * _PailletteRoughnessStrength;
    u_xlat16_56 = max(_FresnelScale, 0.00999999978);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat5.x = dot(vs_TEXCOORD1.xyz, u_xlat16_6.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat16_60 = log2(u_xlat5.x);
    u_xlat16_60 = u_xlat16_60 * _FresnelPower;
    u_xlat16_60 = exp2(u_xlat16_60);
    u_xlat16_56 = u_xlat16_60 / u_xlat16_56;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_5.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = min(u_xlat16_56, u_xlat16_5.x);
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat58 = u_xlat16_56 * u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = u_xlat16_7.y * _MetallicMultiplier + u_xlat58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_8 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_9.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_10.xyz;
    u_xlat54 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xzw = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xzw;
    u_xlat16_56 = u_xlat58 * _PailletteNormalStrength;
    u_xlat16_29.x = u_xlat16_7.x * _RoughnessMultiplier + (-u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = vec2(u_xlat16_56) * u_xlat16_21.xy;
    u_xlat16_7.xyw = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.z = -1.0;
    u_xlat16_3.xyz = u_xlat16_7.xyw * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat8.z = u_xlat16_21.z * u_xlat16_3.z;
    u_xlat8.xy = u_xlat16_3.xy + vec2(-1.0, -1.0);
    u_xlat58 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat7.xyw = vec3(u_xlat58) * u_xlat8.xyz;
    u_xlat16_56 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_3.xyz = vec3(u_xlat16_56) * vs_TEXCOORD1.zxy;
    u_xlat16_56 = dot(vs_TEXCOORD2.zxy, u_xlat16_3.xyz);
    u_xlat16_12.xyz = (-u_xlat16_3.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.xyz;
    u_xlat58 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat8.xyz = vec3(u_xlat58) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat8.yzx;
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat8.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vs_TEXCOORD2.www;
    u_xlat13.y = u_xlat16_12.x;
    u_xlat13.x = u_xlat8.x;
    u_xlat13.z = u_xlat16_3.y;
    u_xlat13.x = dot(u_xlat7.xyw, u_xlat13.xyz);
    u_xlat14.z = u_xlat16_3.z;
    u_xlat15.z = u_xlat16_3.x;
    u_xlat14.x = u_xlat8.y;
    u_xlat14.y = u_xlat16_12.y;
    u_xlat13.y = dot(u_xlat7.xyw, u_xlat14.xyz);
    u_xlat15.x = u_xlat8.z;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_6.xyz);
    u_xlat15.y = u_xlat16_12.z;
    u_xlat8.y = dot(u_xlat16_12.xyz, u_xlat16_6.xyz);
    u_xlat8.xy = u_xlat8.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat13.z = dot(u_xlat7.xyw, u_xlat15.xyz);
    u_xlat58 = dot(u_xlat13.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat7.x = (-u_xlat58) * u_xlat16_19.x + u_xlat58;
    u_xlat7.x = u_xlat58 * u_xlat7.x + u_xlat16_19.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat58 + u_xlat7.x;
    u_xlat14.x = dot(u_xlat13.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat14.x) * u_xlat16_19.x + u_xlat14.x;
    u_xlat25 = u_xlat14.x * u_xlat25 + u_xlat16_19.x;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat7.y = u_xlat25 + u_xlat14.x;
    u_xlat7.xy = u_xlat7.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat7.x = u_xlat7.x * u_xlat7.y;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat7.x * u_xlat4.x;
    u_xlat5.xzw = u_xlat5.xzw * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _DirectSpecularColor.xyz;
    u_xlat5.xzw = vec3(u_xlat58) * u_xlat5.xzw;
    u_xlat5.xzw = u_xlat16_2.xyz * u_xlat5.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat4.xxx * u_xlat5.xzw;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat7.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat13.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat22.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_19.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat61 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat61 * u_xlat61;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_37 = u_xlat61 * u_xlat16_37;
    u_xlat16_55 = u_xlat61 * u_xlat16_37;
    u_xlat61 = (-u_xlat16_37) * u_xlat61 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat61);
    u_xlat15.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat15.xyz;
    u_xlat61 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat61) * u_xlat16_19.x + u_xlat61;
    u_xlat44 = u_xlat61 * u_xlat44 + u_xlat16_19.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat8.z = u_xlat61 + u_xlat44;
    u_xlat8.xyz = u_xlat8.xyz + vec3(-0.5, -0.5, 6.10351563e-05);
    u_xlat44 = u_xlat7.y * u_xlat8.z;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat7.x = u_xlat7.x * u_xlat44;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat61) * u_xlat15.xyz;
    u_xlat16_3.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xzw;
    u_xlat5.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_12.xyz = vec3(u_xlat16_37) * u_xlat5.xzw;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
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
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat13.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xzw = u_xlat16_10.xyz * vec3(u_xlat36);
    u_xlat5.xzw = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat5.xzw;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat7.y;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xzw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat4.xxx;
    u_xlat16_2.xyz = vec3(u_xlat58) * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat61) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat13.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat13.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_60 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_29.z = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_29.z * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_16.y = u_xlat16_2.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_1.xzw;
    u_xlat16_60 = dot((-u_xlat16_6.xyz), u_xlat13.xyz);
    u_xlat16_60 = u_xlat16_60 + u_xlat16_60;
    u_xlat18.xyz = (-u_xlat13.xyz) * vec3(u_xlat16_60) + (-u_xlat16_6.xyz);
    u_xlat16_29.y = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-u_xlat18.xyz) + u_xlat13.xyz;
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_6.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * 16.0 + u_xlat16_6.z;
    u_xlat16_2.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_40;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat4.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20 = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_7.z);
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat16_2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat2.y = u_xlat18.y;
    u_xlat2.xz = u_xlat16_2.xz;
    u_xlat16_57 = u_xlat16_29.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_29.x);
    u_xlat14.y = u_xlat16_29.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_57);
    u_xlat16_9.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_9.xyz = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_1.xzw;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz + u_xlat16_3.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_8.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_8.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat8.xy);
    u_xlat0.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat8.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_21.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_21.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_21.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(1.5, 1.5);
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat16_21.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(_GlitterIntensity);
    u_xlat16_21.xyz = max(u_xlat16_21.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_21.xyz = log2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_21.xyz = exp2(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_5.yyy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat23;
mediump float u_xlat16_23;
float u_xlat26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_36;
int u_xlati43;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
float u_xlat47;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
float u_xlat65;
float u_xlat69;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb64 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_9.xyz = texture(_PailletteNormalMap, u_xlat16_8.xy).xyz;
    u_xlat16_69 = texture(_PailletteRoughnessMap, u_xlat16_8.xy).x;
    u_xlat69 = u_xlat16_69 * _PailletteRoughnessStrength;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = max(_FresnelScale, 0.00999999978);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_10.xyz = vec3(u_xlat16_70) * u_xlat9.xyz;
    u_xlat72 = dot(vs_TEXCOORD1.xyz, u_xlat16_10.xyz);
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat16_71 = log2(u_xlat72);
    u_xlat16_71 = u_xlat16_71 * _FresnelPower;
    u_xlat16_71 = exp2(u_xlat16_71);
    u_xlat16_63 = u_xlat16_71 / u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_11.x);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat69 = u_xlat16_63 * u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat69 * _PailletteNormalStrength;
    u_xlat16_7.xy = vec2(u_xlat16_63) * u_xlat16_8.xy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat6.z = u_xlat16_8.z * u_xlat16_7.z;
    u_xlat6.xy = u_xlat16_7.xy + vec2(-1.0, -1.0);
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat16_63 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * vs_TEXCOORD1.zxy;
    u_xlat16_63 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.xyz;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat11.xzw = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat11.zwx;
    u_xlat16_8.xyz = u_xlat16_7.zxy * u_xlat11.wxz + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat16_8.x;
    u_xlat12.x = u_xlat11.x;
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat14.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat11.z;
    u_xlat13.y = u_xlat16_8.y;
    u_xlat12.y = dot(u_xlat6.xyz, u_xlat13.xyz);
    u_xlat14.x = u_xlat11.w;
    u_xlat13.x = dot(u_xlat11.xzw, u_xlat16_10.xyz);
    u_xlat14.y = u_xlat16_8.z;
    u_xlat13.y = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
    u_xlat11.xz = u_xlat13.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat11.xz = u_xlat11.xz + vec2(-0.5, -0.5);
    u_xlat12.z = dot(u_xlat6.xyz, u_xlat14.xyz);
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb64)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat64 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat64) + u_xlat2.z;
    u_xlat3.x = max((-u_xlat2.w), u_xlat64);
    u_xlat3.x = (-u_xlat64) + u_xlat3.x;
    u_xlat2.z = _ShadowBias.y * u_xlat3.x + u_xlat64;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat2.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_63 = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_63) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_63;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_63 = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_63 + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_0.xyz = u_xlat1.xxx * u_xlat16_0.xyz + _ShadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat2.xyz;
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_7.x);
    u_xlat16_15.xyz = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_15.xyz;
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_29.x, u_xlat16_8.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_7.xyz;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat23.x * u_xlat23.x;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_7.x = u_xlat23.x * u_xlat16_63;
    u_xlat23.x = (-u_xlat16_63) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_63 = u_xlat16_3.y * _MetallicMultiplier + u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_3.x * _RoughnessMultiplier + (-u_xlat69);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_17.xyz;
    u_xlat23.x = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_7.xxx + u_xlat3.xyw;
    u_xlat16_63 = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat44 = (-u_xlat65) * u_xlat16_63 + u_xlat65;
    u_xlat44 = u_xlat65 * u_xlat44 + u_xlat16_63;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat65;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_63 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_63;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat4.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat46;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat5.x = u_xlat16_63 + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat5.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_63 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat65) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_8.xyz * u_xlat3.xyw;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xyz = u_xlat22.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat65) * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat9.xyz * vec3(u_xlat16_70) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat16_8.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat3.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat3.x = (-u_xlat16_8.x) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_29.xxx + u_xlat3.xyw;
    u_xlat26 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat47 = u_xlat26 * u_xlat47 + u_xlat16_63;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat26;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat46 * u_xlat47;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat47;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat26) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat3.xyw * u_xlat16_0.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_15.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_15.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xzw = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat22.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat2.xzw = u_xlat22.xxx * u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat44 * u_xlat44;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_71 = u_xlat44 * u_xlat16_70;
    u_xlat44 = (-u_xlat16_70) * u_xlat44 + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * vec3(u_xlat44);
    u_xlat23.xyz = u_xlat23.xxx * vec3(u_xlat16_71) + u_xlat3.xyw;
    u_xlat3.x = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat3.x = u_xlat2.x * u_xlat3.x + u_xlat16_63;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat2.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat46;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.xyz;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_19.xyz * u_xlat23.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat22.yyy * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat23.xyz * u_xlat22.yyy + u_xlat16_8.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat26) + u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz + u_xlat16_0.xyz;
    u_xlat16_7.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_71 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_70;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_70));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_19.y = u_xlat16_7.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_20.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati43 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_0.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat12.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat1.xzw = (-u_xlat12.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat16_36.y = dot(u_xlat16_7.xyz, u_xlat1.xzw);
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = (-u_xlat1.xzw) + u_xlat12.xyz;
    u_xlat1.xzw = vec3(u_xlat16_63) * u_xlat23.xyz + u_xlat1.xzw;
    u_xlat16_7.xyz = u_xlat16_36.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_5.w);
    u_xlat16_7.x = u_xlat16_63 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_5.x = u_xlat16_7.x * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_5.x = u_xlat16_63 * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_63 = u_xlat16_7.z * 15.0 + (-u_xlat16_63);
    u_xlat16_7.x = (-u_xlat16_44) + u_xlat16_23;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_7.x + u_xlat16_44;
    u_xlat16_63 = u_xlat16_71 * u_xlat16_63;
    u_xlat2.x = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat1.y * 0.5;
    u_xlat16_7.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat16_7.x + u_xlat16_63;
    u_xlat16_7.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_28 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28 + u_xlat16_7.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat1.y;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat7.y = u_xlat1.z;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_71 = u_xlat16_36.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_36.x);
    u_xlat4.y = u_xlat16_36.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_63 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_4.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + u_xlat16_0.xyz;
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat11.xz);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat11.xz);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_29.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat1.xy).xyz;
    u_xlat16_29.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(1.5, 1.5);
    u_xlat16_2.xyz = texture(_GlitterTex, u_xlat16_29.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_GlitterIntensity);
    u_xlat16_29.xyz = max(u_xlat16_29.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_29.xyz = log2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_29.xyz = exp2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_11.yyy + u_xlat16_0.xyz;
    u_xlat16_29.xyz = (-u_xlat16_0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_8.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _PailletteNormalStrength;
uniform 	mediump float _PailletteRoughnessStrength;
uniform 	mediump vec4 _PailletteTilling;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
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
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _PailletteNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _PailletteRoughnessMap;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec3 u_xlat23;
mediump float u_xlat16_23;
float u_xlat26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_36;
int u_xlati43;
float u_xlat44;
mediump float u_xlat16_44;
float u_xlat46;
float u_xlat47;
mediump float u_xlat16_63;
float u_xlat64;
bool u_xlatb64;
float u_xlat65;
float u_xlat69;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb64 = _ShadowBias.z!=0.0;
#endif
    u_xlat16_6.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.z = -1.0;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _PailletteTilling.xy;
    u_xlat16_9.xyz = texture(_PailletteNormalMap, u_xlat16_8.xy).xyz;
    u_xlat16_69 = texture(_PailletteRoughnessMap, u_xlat16_8.xy).x;
    u_xlat69 = u_xlat16_69 * _PailletteRoughnessStrength;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = max(_FresnelScale, 0.00999999978);
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_10.xyz = vec3(u_xlat16_70) * u_xlat9.xyz;
    u_xlat72 = dot(vs_TEXCOORD1.xyz, u_xlat16_10.xyz);
    u_xlat72 = max(u_xlat72, 0.0);
    u_xlat16_71 = log2(u_xlat72);
    u_xlat16_71 = u_xlat16_71 * _FresnelPower;
    u_xlat16_71 = exp2(u_xlat16_71);
    u_xlat16_63 = u_xlat16_71 / u_xlat16_63;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_11.x);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat69 = u_xlat16_63 * u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat69 * _PailletteNormalStrength;
    u_xlat16_7.xy = vec2(u_xlat16_63) * u_xlat16_8.xy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_7.xyz;
    u_xlat6.z = u_xlat16_8.z * u_xlat16_7.z;
    u_xlat6.xy = u_xlat16_7.xy + vec2(-1.0, -1.0);
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat16_63 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * vs_TEXCOORD1.zxy;
    u_xlat16_63 = dot(vs_TEXCOORD2.zxy, u_xlat16_7.xyz);
    u_xlat16_8.xyz = (-u_xlat16_7.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.xyz;
    u_xlat72 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat11.xzw = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat11.zwx;
    u_xlat16_8.xyz = u_xlat16_7.zxy * u_xlat11.wxz + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat16_8.x;
    u_xlat12.x = u_xlat11.x;
    u_xlat12.z = u_xlat16_7.y;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat12.xyz);
    u_xlat13.z = u_xlat16_7.z;
    u_xlat14.z = u_xlat16_7.x;
    u_xlat13.x = u_xlat11.z;
    u_xlat13.y = u_xlat16_8.y;
    u_xlat12.y = dot(u_xlat6.xyz, u_xlat13.xyz);
    u_xlat14.x = u_xlat11.w;
    u_xlat13.x = dot(u_xlat11.xzw, u_xlat16_10.xyz);
    u_xlat14.y = u_xlat16_8.z;
    u_xlat13.y = dot(u_xlat16_8.xyz, u_xlat16_10.xyz);
    u_xlat11.xz = u_xlat13.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat11.xz = u_xlat11.xz + vec2(-0.5, -0.5);
    u_xlat12.z = dot(u_xlat6.xyz, u_xlat14.xyz);
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat72);
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat6.xyz);
    u_xlat6.x = (-u_xlat6.x) * u_xlat6.x + 1.0;
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _ShadowBias.z;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat6.xxx + vs_TEXCOORD0.xyz;
    u_xlat6.xyz = (bool(u_xlatb64)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
    u_xlat5 = u_xlat5 * u_xlat6.yyyy;
    u_xlat4 = u_xlat4 * u_xlat6.xxxx + u_xlat5;
    u_xlat3 = u_xlat3 * u_xlat6.zzzz + u_xlat4;
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat64 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat64) + u_xlat2.z;
    u_xlat3.x = max((-u_xlat2.w), u_xlat64);
    u_xlat3.x = (-u_xlat64) + u_xlat3.x;
    u_xlat2.z = _ShadowBias.y * u_xlat3.x + u_xlat64;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat2.xyz = u_xlat2.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_63 = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_63) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat22.x + u_xlat16_63;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_63 = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_63 + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_0.xyz = u_xlat1.xxx * u_xlat16_0.xyz + _ShadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat2.xyz;
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_7.x);
    u_xlat16_15.xyz = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_15.xyz;
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_29.x, u_xlat16_8.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_7.xyz;
    u_xlat65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat2.xyz = vec3(u_xlat65) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat12.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat23.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat23.x * u_xlat23.x;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_63 = u_xlat23.x * u_xlat16_63;
    u_xlat16_7.x = u_xlat23.x * u_xlat16_63;
    u_xlat23.x = (-u_xlat16_63) * u_xlat23.x + 1.0;
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_63 = u_xlat16_3.y * _MetallicMultiplier + u_xlat69;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_3.x * _RoughnessMultiplier + (-u_xlat69);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_17.xyz;
    u_xlat23.x = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_7.xxx + u_xlat3.xyw;
    u_xlat16_63 = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat44 = (-u_xlat65) * u_xlat16_63 + u_xlat65;
    u_xlat44 = u_xlat65 * u_xlat44 + u_xlat16_63;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat65;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_63 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_63;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat4.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat46;
    u_xlat2.z = float(1.0) / u_xlat44;
    u_xlat5.x = u_xlat16_63 + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat5.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_63 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat65) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_8.xyz * u_xlat3.xyw;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_7.xyz = u_xlat22.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = vec3(u_xlat65) * u_xlat16_7.xyz;
    u_xlat2.xzw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat9.xyz * vec3(u_xlat16_70) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyw = u_xlat22.xxx * u_xlat3.xyw;
    u_xlat16_8.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat3.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat16_29.x = u_xlat3.x * u_xlat16_8.x;
    u_xlat3.x = (-u_xlat16_8.x) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * u_xlat3.xxx;
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_29.xxx + u_xlat3.xyw;
    u_xlat26 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat47 = u_xlat26 * u_xlat47 + u_xlat16_63;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat26;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat46 * u_xlat47;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat47;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _DirectSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat26) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat3.xyw * u_xlat16_0.xyz + u_xlat2.xzw;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_15.x = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat2.xzw * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_73 * u_xlat16_15.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_19.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_15.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xzw = u_xlat9.xyz * vec3(u_xlat16_70) + u_xlat16_18.xyz;
    u_xlat22.x = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat2.xzw = u_xlat22.xxx * u_xlat2.xzw;
    u_xlat16_70 = dot(u_xlat16_18.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat12.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat5.x + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat16_63 / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * 0.318309873;
    u_xlat22.x = min(u_xlat22.x, 16.0);
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat44 * u_xlat44;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_70 = u_xlat44 * u_xlat16_70;
    u_xlat16_71 = u_xlat44 * u_xlat16_70;
    u_xlat44 = (-u_xlat16_70) * u_xlat44 + 1.0;
    u_xlat3.xyw = u_xlat16_17.xyz * vec3(u_xlat44);
    u_xlat23.xyz = u_xlat23.xxx * vec3(u_xlat16_71) + u_xlat3.xyw;
    u_xlat3.x = (-u_xlat2.x) * u_xlat16_63 + u_xlat2.x;
    u_xlat3.x = u_xlat2.x * u_xlat3.x + u_xlat16_63;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat2.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat3.x * u_xlat46;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat22.x = u_xlat22.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat22.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat23.xyz * _DirectSpecularColor.xyz;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_19.xyz * u_xlat23.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat22.yyy * u_xlat16_18.xyz;
    u_xlat16_8.xyz = u_xlat23.xyz * u_xlat22.yyy + u_xlat16_8.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_19.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat26) + u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz + u_xlat16_0.xyz;
    u_xlat16_7.xyz = (-u_xlat12.xyz) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_7.xyz + u_xlat12.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_70) + u_xlat16_71;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_36.z = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_71 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_36.z * u_xlat16_70;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_70));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_19.y = u_xlat16_7.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_20.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati43 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_0.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + u_xlat16_0.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat12.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat1.xzw = (-u_xlat12.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat16_36.y = dot(u_xlat16_7.xyz, u_xlat1.xzw);
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = (-u_xlat1.xzw) + u_xlat12.xyz;
    u_xlat1.xzw = vec3(u_xlat16_63) * u_xlat23.xyz + u_xlat1.xzw;
    u_xlat16_7.xyz = u_xlat16_36.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_63 = floor(u_xlat16_5.w);
    u_xlat16_7.x = u_xlat16_63 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_5.x = u_xlat16_7.x * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_5.x = u_xlat16_63 * 16.0 + u_xlat16_5.z;
    u_xlat16_7.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_63 = u_xlat16_7.z * 15.0 + (-u_xlat16_63);
    u_xlat16_7.x = (-u_xlat16_44) + u_xlat16_23;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_7.x + u_xlat16_44;
    u_xlat16_63 = u_xlat16_71 * u_xlat16_63;
    u_xlat2.x = u_xlat2.x * u_xlat16_63;
    u_xlat16_63 = u_xlat1.y * 0.5;
    u_xlat16_7.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_63 = u_xlat2.x * u_xlat16_7.x + u_xlat16_63;
    u_xlat16_7.x = u_xlat16_63 + u_xlat16_63;
    u_xlat16_28 = (-u_xlat16_63) * 2.0 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_28 + u_xlat16_7.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat1.y;
    u_xlat16_63 = min(u_xlat16_63, u_xlat16_3.z);
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat7.y = u_xlat1.z;
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_71 = u_xlat16_36.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_36.x);
    u_xlat4.y = u_xlat16_36.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_17.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_70) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_63 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_4.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_10.xyz + u_xlat16_0.xyz;
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat11.xz);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat11.xz);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_29.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat1.xy).xyz;
    u_xlat16_29.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(1.5, 1.5);
    u_xlat16_2.xyz = texture(_GlitterTex, u_xlat16_29.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(_GlitterIntensity);
    u_xlat16_29.xyz = max(u_xlat16_29.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_29.xyz = log2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_29.xyz = exp2(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = u_xlat16_29.xyz * u_xlat16_11.yyy + u_xlat16_0.xyz;
    u_xlat16_29.xyz = (-u_xlat16_0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_8.x;
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
  GpuProgramID 113235
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_PailletteGUI"
}